/obj/item/stock_parts/circuitboard/atmoscontrol
	name = "\improper Central Atmospherics Computer Circuitboard"
	build_path = /obj/machinery/computer/atmoscontrol

/obj/machinery/computer/atmoscontrol
	name = "\improper Central Atmospherics Computer"
	icon = 'icons/obj/computer.dmi'
	icon_keyboard = "generic_key"
	icon_screen = "comm_logs"
	light_color = "#00b000"
	density = TRUE
	anchored = TRUE
	req_access = list(ACCESS_CE)
	var/list/monitored_alarm_ids = null
	var/datum/nano_module/atmos_control/atmos_control
	base_type = /obj/machinery/computer/atmoscontrol

/obj/machinery/computer/atmoscontrol/laptop
	name = "Atmospherics Laptop"
	desc = "A cheap laptop."
	icon_state = "laptop"
	icon_keyboard = "laptop_key"
	icon_screen = "atmoslaptop"
	density = FALSE

/obj/machinery/computer/atmoscontrol/interface_interact(user)
	ui_interact(user)
	return TRUE

/obj/machinery/computer/atmoscontrol/emag_act(var/remaining_carges, var/mob/user)
	if(!emagged)
		user.visible_message("<span class='warning'>\The [user] does something \the [src], causing the screen to flash!</span>",\
			"<span class='warning'>You cause the screen to flash as you gain full control.</span>",\
			"You hear an electronic warble.")
		atmos_control.emagged = TRUE
		return 1

/obj/machinery/computer/atmoscontrol/ui_interact(var/mob/user)
	if(!atmos_control)
		atmos_control = new(src, req_access, monitored_alarm_ids)
	atmos_control.ui_interact(user)
