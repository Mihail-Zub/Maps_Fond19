//STRIKE TEAMS
//Thanks to Kilakk for the admin-button portion of this code.

var/global/send_emergency_team = 0 // Used for automagic response teams
								   // 'admin_emergency_team' for admin-spawned response teams
var/ert_base_chance = 10 // Default base chance. Will be incremented by increment ERT chance.
var/can_call_ert

/client/proc/response_team()
	set name = "Dispatch MTF"
	set category = "Special Verbs"
	set desc = "Send an MTF"

	if(!holder)
		to_chat(usr, "<span class='danger'>Только администраторы могут использовать эту функцию.</span>")
		return
	if(GAME_STATE < RUNLEVEL_GAME)
		to_chat(usr, "<span class='danger'>Игра ещё не началась!</span>")
		return
	if(send_emergency_team)
		to_chat(usr, "<span class='danger'>МОГ уже отправлена!</span>")
		return
	if(alert("Вы хотите отправить МОГ?",,"Да","Нет") != "Да")
		return

	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
	if(security_state.current_security_level_is_lower_than(security_state.high_security_level)) // Allow admins to reconsider if the alert level is below High
		switch(alert("Текущий уровень тревоги ниже Чёрного. Вы уверены что хотите отправить МОГ?",,"Да","Нет"))
			if("Нет")
				return

	var/reason = input("Какова причина отправки МОГ?", "Отправка МОГ")

	if(!reason && alert("Вы не указали причину. Всё равно хотите продолжить?",,"Да", "Нет") != "Да")
		return

	if(send_emergency_team)
		to_chat(usr, SPAN_DANGER("Looks like someone beat you to it!"))
		return

	if(reason)
		message_admins("[key_name_admin(usr)] отправил МОГ, с причиной: [reason]", 1)
	else
		message_admins("[key_name_admin(usr)] отправил МОГ.", 1)

	log_admin("[key_name(usr)] used Dispatch Response Team.")
	trigger_armed_response_team(1, reason)

/client/verb/JoinResponseTeam()

	set name = "Join MTF"
	set category = "IC"

	if(!MayRespawn(1))
		to_chat(usr, "<span class='warning'>В данный момент вы не можете присоединиться к МОГ.</span>")
		return

	if(isghost(usr) || isnewplayer(usr))
		if(!send_emergency_team)
			to_chat(usr, "В данный момент отправленная группа МОГ отсутствует.")
			return
		if(jobban_isbanned(usr, MODE_ERT) || jobban_isbanned(usr, "Security Officer"))
			to_chat(usr, "<span class='danger'>Вы находитесь в банлисте на роль бойца МОГ!</span>")
			return
		if(GLOB.ert.current_antagonists.len >= GLOB.ert.hard_cap)
			to_chat(usr, "Количество бойцов МОГ достигло своего максимума!")
			return
		GLOB.ert.create_default(usr)
	else
		to_chat(usr, "Вам нужно быть призраком или новым игроком, чтобы сделать это.")

// returns a number of dead players in %
/proc/percentage_dead()
	var/total = 0
	var/deadcount = 0
	for(var/mob/living/carbon/human/H in SSmobs.mob_list)
		if(H.client) // Monkeys and mice don't have a client, amirite?
			if(H.stat == 2) deadcount++
			total++

	if(total == 0) return 0
	else return round(100 * deadcount / total)

// counts the number of antagonists in %
/proc/percentage_antagonists()
	var/total = 0
	var/antagonists = 0
	for(var/mob/living/carbon/human/H in SSmobs.mob_list)
		if(is_special_character(H) >= 1)
			antagonists++
		total++

	if(total == 0) return 0
	else return round(100 * antagonists / total)

// Increments the ERT chance automatically, so that the later it is in the round,
// the more likely an ERT is to be able to be called.
/proc/increment_ert_chance()
	while(send_emergency_team == 0) // There is no ERT at the time.
		var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
		var/index = list_find(security_state.all_security_levels, security_state.current_security_level)
		ert_base_chance += 2**index
		sleep(600 * 3) // Minute * Number of Minutes


/proc/trigger_armed_response_team(var/force = 0, var/reason = "")
	if(!can_call_ert && !force)
		return
	if(send_emergency_team)
		return

	var/send_team_chance = ert_base_chance // Is incremented by increment_ert_chance.
	send_team_chance += 2*percentage_dead() // the more people are dead, the higher the chance
	send_team_chance += percentage_antagonists() // the more antagonists, the higher the chance
	send_team_chance = min(send_team_chance, 100)

	if(force) send_team_chance = 100

	// there's only a certain chance a team will be sent
	if(!prob(send_team_chance))
		command_announcement.Announce("С территории Комплекса поступил запрос на отправку одной из Мобильно Оперативных Групп. К сожалению, в настоящий момент её отправка является невозможной.", "[GLOB.using_map.boss_name]")
		can_call_ert = 0 // Only one call per round, ladies.
		return

	command_announcement.Announce("С территории Комплекса поступил запрос на отправку одной из Мобильно Оперативных Групп. Она будет подготовлена и отправлена в кратчайшие сроки.", "[GLOB.using_map.boss_name]")

	GLOB.ert.reason = reason //Set it even if it's blank to clear a reason from a previous ERT

	can_call_ert = 0 // Only one call per round, gentleman.
	send_emergency_team = 1

	sleep(600 * 5)
	send_emergency_team = 0 // Can no longer join the ERT.
