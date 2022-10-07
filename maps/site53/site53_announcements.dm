/datum/map/site53
	emergency_shuttle_docked_message = "Attention all personnel: The emergency train has arrived. You have %ETD% before the train departs."
	emergency_shuttle_leaving_dock = "Attention all personnel: The emergency train has left the facility, and will be arriving at off-site rendezvous point alpha in %ETA%."

	emergency_shuttle_called_message = "Attention all personnel: Code Gamma initiated, emergency evacuation procedures are now in effect. The emergency train will arrive in %ETA%"
	emergency_shuttle_called_sound = sound('sound/FIJ_Team/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "Attention all personnel: Emergency evacuation sequence aborted. Return to normal operating conditions."

	command_report_sound = sound('sound/AI/announcer/commandreport.ogg', volume = 45)

	grid_check_message = "Обнаружена аномальная активность в энергосистеме Комплекса. В качестве меры предосторожности, основное питание должно быть отключено на неопределенный срок."
	grid_check_sound = sound('sound/AI/announcer/poweroff.ogg', volume = 150)

	grid_restored_message = "В этот раз электропитание Комплекса будет восстановлено."
	grid_restored_sound = sound('sound/AI/announcer/poweron.ogg', volume = 150)

	meteor_detected_message = "Warning! The underground cave system is now under collapse,The facility may be hit by falling debris.."
	meteor_detected_sound = sound('sound/AI/announcer/rocks.ogg', volume = 45)

	radiation_detected_message = "Radioactive object class SAFE containment breach detected. Please report to the medical bay if you feel strange."
	radiation_detected_sound = sound('sound/AI/announcer/industrialalarm.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "Unknown persons have been detected near %STATION_NAME%, please stand-by."

	unidentified_lifesigns_message = "Unidentified lifesigns detected within fifteen miles of %STATION_NAME%, security please stand-by."
	unidentified_lifesigns_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

//	xenomorph_spawn_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	electrical_storm_moderate_sound = sound('sound/FIJ_Team/emoderate.ogg', volume = 45)
	electrical_storm_major_sound = sound('sound/FIJ_Team/emajor.ogg', volume = 45)
/*
/datum/map/torch/level_x_biohazard_sound(var/bio_level)
	switch(bio_level)
		if(7)
			return sound('sound/AI/torch/outbreak7.ogg', volume = 45)
		else
			return sound('sound/AI/torch/outbreak5.ogg', volume = 45)
*/
