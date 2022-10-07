/datum/map/site53 // setting the map to use this list
	security_state = /decl/security_state/default/site53

//Torch map alert levels. Refer to security_state.dm.
/decl/security_state/default/site53
	all_security_levels = list(/decl/security_level/default/site53/code_green, /decl/security_level/default/site53/code_yellow, /decl/security_level/default/site53/code_blue, /decl/security_level/default/site53/code_orange, /decl/security_level/default/site53/code_red, /decl/security_level/default/site53/code_black, /decl/security_level/default/site53/code_gray, /decl/security_level/default/code_delta)
	standard_security_levels = list(/decl/security_level/default/site53/code_green, /decl/security_level/default/site53/code_yellow, /decl/security_level/default/site53/code_blue, /decl/security_level/default/site53/code_orange, /decl/security_level/default/site53/code_red, /decl/security_level/default/site53/code_black, /decl/security_level/default/site53/code_gray)

/decl/security_level/default/site53
	icon = 'maps/site53/icons/security_state.dmi'

/decl/security_level/default/site53/code_green
	name = "code green"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.25
	light_inner_range = 0.1
	light_outer_range = 1
	light_color_alarm = COLOR_GREEN
	light_color_status_display = COLOR_GREEN

	overlay_alarm = "alarm_green"
	overlay_status_display = "status_display_green"

	var/static/datum/announcement/priority/security/security_announcement_green = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/AI/announcer/codegreen.ogg', volume = 150))

/decl/security_level/default/site53/code_green/switching_down_to()
	security_announcement_green.Announce("Ситуация урегулирована, весь персонал должен вернуться к выполнению своих стандартных обязанностей.", "Внимание! Уровень тревоги понижен до Зелёного.")
	notify_station()

/decl/security_level/default/site53/code_yellow
	name = "code yellow"
	icon = 'icons/misc/security_state.dmi'


	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_VIOLET
	light_color_status_display = COLOR_VIOLET
	overlay_alarm = "alarm_yellow"
	overlay_status_display = "status_display_yellow"

	up_description = "Запущены процедуры Жёлтого кода. В ближайшее время начнутся испытания на объектах класса Евклид. Охрана должна занять посты в наиболее важных зонах, а также на КПП. Гражданские лица и ученые никак не связанные с проведением испытаний, должны покинуть место их проведения и держаться от него в стороне, вплоть до их окончания. Нарушение данных процедур является основанием для немедленного устранения."
	down_description = "Запущены процедуры Жёлтого кода. Синий код был отменён, но остаётся необходимым осмотреть все зоны на наличие каких-либо угроз, а также проверить камеры объектов класса Евклид на наличие любых повреждений. Все объекты класса Евклид должны находиться в своих обычных условиях содержания."

/decl/security_level/default/site53/code_blue
	name = "code blue"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_BLUE
	light_color_status_display = COLOR_BLUE
	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"

	up_description = "Запущены процедуры Синего кода. В ближайшее время начнутся испытания на объектах класса Кетер. Все сотрудники Класса D, должны вернуться в свои камеры и ждать окончания испытаний. Охрана должна занять посты в наиболее важных зонах, а также на КПП. Инженерный и Медицинский персонал должен оставаться в своих отделах или других закреплённых за ним зонах. Гражданские лица и ученые никак не связанные с проведением испытаний, должны быть сопровождены в безопасную зону, и не покидать её вплоть до окончания проведения испытаний. Нарушение данных процедур является основанием для немедленного устранения."
	down_description = "Запущены процедуры Синего кода. Красный код был отменён, но остаётся необходимым осмотреть все зоны на наличие каких-либо угроз, а также проверить камеры объектов класса Кетер на наличие любых повреждений. Все объекты класса Кетер должны находиться в своих обычных условиях содержания."

/decl/security_level/default/site53/code_orange
	name = "code orange"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 2
	light_color_alarm = COLOR_ORANGE
	light_color_status_display = COLOR_ORANGE
	overlay_alarm = "alarm_orange"
	overlay_status_display = "status_display_orange"

//	crb = TRUE

	var/static/datum/announcement/priority/security/security_announcement_orange = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/AI/announcer/codered.ogg'))

/decl/security_level/default/site53/code_orange/switching_up_to()
	security_announcement_orange.Announce("Запущены процедуры Оранжевого кода. Объект класса Евклид нарушил условия содержания и его текущее местоположение неизвестно. Охрана должна немедленно начать поиски и сосредоточиться на восстановлении условий содержания, или запросить МОГ для урегулирования сиутации.", "Внимание! Были запущены процедуры Оранжевого кода!")
	notify_station()

/decl/security_level/default/site53/code_orange/switching_down_to()
	security_announcement_orange.Announce("Запущены процедуры Оранжевого кода. Все объекты класса Кетер были возвращены в свои условия содержания, но один или несколько объектов класса Евклид по прежнему остаются на свободе. Охрана должна как можно быстрее обнаружить эти объекты и восстановить их условия содержания.", "Внимание! Были запущены процедуры Оранжевого кода!")
	notify_station()

/decl/security_level/default/site53/code_red
	name = "code red"
	icon = 'icons/misc/security_state.dmi'

	light_max_bright = 0.75
	light_inner_range = 1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_RED
	overlay_alarm = "alarm_red"
	overlay_status_display = "status_display_red"

//	crb = TRUE

	var/static/datum/announcement/priority/security/security_announcement_red = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/AI/announcer/codered.ogg'))

/decl/security_level/default/site53/code_red/switching_up_to()
	security_announcement_red.Announce("Запущены процедуры Красного кода. Объект класса Кетер нарушил условия содержания и его текущее местоположение неизвестно. Охрана должна немедленно начать поиски и сосредоточиться на восстановлении условий содержания, или запросить МОГ для урегулирования сиутации.", "Внимание! Были запущены процедуры Красного кода!")
	notify_station()

/decl/security_level/default/site53/code_red/switching_down_to()
	security_announcement_red.Announce("Запущены процедуры Красного кода. Чёрный код был отменён, сделав большую часть комплекса снова доступной, но один или несколько объектов класса Кетер по прежнему остаются на свободе. Охрана должна как можно быстрее обнаружить эти объекты и восстановить их условия содержания. Эвакуационные процедуры Красного кода в настоящий момент активны, более подробную информацию можно узнать в соответствующем разделе СРП", "Внимание! Были запущены процедуры Красного кода!")
	notify_station()

/decl/security_level/default/site53/code_black
	name = "code black"

	light_max_bright = 0.75
	light_inner_range = 0.1
	light_outer_range = 3
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_NAVY_BLUE

	overlay_alarm = "black_alarm"
	overlay_status_display = "status_display_black"

//	crb = TRUE

	var/static/datum/announcement/priority/security/security_announcement_black = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/AI/announcer/codeblack.ogg'))

/decl/security_level/default/site53/code_black/switching_up_to()
	security_announcement_black.Announce("Комплекс в настоящий момент подвергся множественному нарушению условий содержания объектов класса Кетер и Евклид. Инициирована полная блокировка Зоны.", "Внимание! Были запущены процедуры Чёрного кода!")
	notify_station()

/decl/security_level/default/site53/code_black/switching_down_to()
	security_announcement_black.Announce("Комплекс был успешно защищён от подрывной деятельности враждебных групп. Охрана должна проверить весь комплекс и как можно быстрее восстановить условия содержания всех объектов, которые по прежнему остаются на свободе.", "Внимание! Были запущены процедуры Чёрного кода!")
	notify_station()

/decl/security_level/default/site53/code_gray
	name = "code gray"

	light_max_bright = 0.75
	light_inner_range = 0.1
	light_outer_range = 3
	light_color_alarm = COLOR_GRAY
	light_color_status_display = COLOR_GRAY

	overlay_alarm = "grey_alarm"
	overlay_status_display = "status_display_grey"

	var/static/datum/announcement/priority/security/security_announcement_gray = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/FIJ_Team/codegray.ogg'))

/decl/security_level/default/site53/code_gray/switching_up_to()
	security_announcement_gray.Announce("Были получены подтверждённые сообщения о проникновении на территорию Комплекса враждебных групп. Охране дозволяется использовать все необходимые средства для устранения возникших угроз." ,"Внимание! Были запущены процедуры Серого кода!")
	notify_station()

/decl/security_level/default/site53/code_gray/switching_down_to()
	security_announcement_gray.Announce("Детонация Ядерных боеголовок Комплекса была отменена, тем не менее, прежде чем вернуться к выполнению стандартных процедур, все враждебные группы проникшие на его территорию должны быть как можно быстрее устранены.", "Внимание! Были запущены процедуры Серого кода!")
	notify_station()
