// VTM pg. 481
/datum/quirk/darkpack/disfigured
	name = "Disfigured"
	desc = {"A hideous disfigurement makes your appearance disturbing and memorable.
	The difficulties of all die rolls relating to social interaction are increased by two.
	You may not have an Appearance rating greater than 2."}
	icon = FA_ICON_FACE_GRIMACE
	value = -2
	gain_text = span_notice("Your face is disfigured!")
	lose_text = span_notice("You feel like you look a lot better.")
	failure_message = span_notice("You don't look too bad.")
	mob_trait = TRAIT_DISFIGURED_APPEARANCE

/datum/quirk/darkpack/disfigured/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique, announce)
	. = ..()
	if(ishuman(new_holder))
		if(new_holder.st_get_stat(STAT_APPEARANCE) > 2)
			human_holder.st_add_stat_mod(STAT_APPEARANCE, -(STAT_APPEARANCE+2), "Disfigured")
			//human_holder.st_add_stat_mod(stat, -1, "Disfigured")//Test!!!! 4-(4+3)=1

					//owner.st_set_stat(STAT_TEMPORARY_WILLPOWER, owner.st_get_stat(STAT_TEMPORARY_WILLPOWER) - 1)
