// V20 p. 493
/datum/quirk/darkpack/acute_sense
	name = "Acute Sense"
	desc = {"One of your senses is exceptionally sharp.
	The difficulties for all tasks using this sense are reduced by two.
	This can be combined with Auspex to produce superhuman sensory acuity."}
	value = 1
	icon = FA_ICON_EXCLAMATION
	allowed_splats = list(SPLAT_KINDRED)

/*One of your senses is exceptionally sharp, be it sight,
hearing, smell, touch, or taste. The difficulties for all
tasks involving the use of this particular sense are re
duced by two. This Merit can be combined with the
Discipline of Auspex to produce superhuman sensory
acuity.*/

/datum/preference/choiced/acute_sense
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "acute_sense"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/acute_sense/init_possible_values()
	return list("Hearing", "Smell", "Sight", "Taste", "Touch")

/datum/preference/choiced/acute_sense/create_default_value()
	return "Hearing"

/datum/preference/choiced/acute_sense/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/quirk/darkpack/acute_sense/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique, announce)
	var/sense = client_source?.prefs.read_preference(/datum/preference/choiced/acute_sense)
	if(!sense)
		sense = client_source?.prefs.read_preference(/datum/preference/choiced/acute_sense)
	switch(sense)
		if ("Hearing")
			ADD_TRAIT(quirk_holder, TRAIT_GOOD_HEARING, QUIRK_TRAIT)
			var/obj/item/organ/ears/sensitive_ears = quirk_holder.get_organ_slot(ORGAN_SLOT_EARS)
			sensitive_ears.damage_multiplier = sensitive_ears.damage_multiplier + 1 // We hear better, and there are consequences.
		if ("Smell")
			ADD_TRAIT(quirk_holder, TRAIT_KEEN_NOSE, QUIRK_TRAIT)
		if ("Sight")
			quirk_holder.client?.view_size?.setTo(1) // Check compatibility with auspex
			var/obj/item/organ/eyes/target_eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
			if(target_eyes)
				target_eyes.flash_protect = max(target_eyes.flash_protect += -1, FLASH_PROTECTION_SENSITIVE)
		if ("Taste")
			ADD_TRAIT(quirk_holder, TRAIT_DETECTIVES_TASTE, QUIRK_TRAIT)
		if ("Touch")
			ADD_TRAIT(quirk_holder, TRAIT_SELF_AWARE, QUIRK_TRAIT) // Does this seem fitting? It shouldn't be as strong as auspex is.

/datum/quirk/darkpack/acute_sense/remove_from_current_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique, announce)
	var/sense = client_source?.prefs.read_preference(/datum/preference/choiced/acute_sense)
	if(!sense)
		sense = client_source?.prefs.read_preference(/datum/preference/choiced/acute_sense)
	switch(sense)
		if ("Hearing")
			REMOVE_TRAIT(quirk_holder, TRAIT_GOOD_HEARING, QUIRK_TRAIT)// Remove our good hearing
			var/obj/item/organ/ears/sensitive_ears = quirk_holder.get_organ_slot(ORGAN_SLOT_EARS)
			sensitive_ears.damage_multiplier = sensitive_ears.damage_multiplier - 1 // Remove our extra damage
		if ("Smell")
			REMOVE_TRAIT(quirk_holder, TRAIT_KEEN_NOSE, QUIRK_TRAIT)
		if ("Sight")
			quirk_holder.client?.view_size?.setTo(-1) // Check compatibility with auspex AND that this works correctly
			var/obj/item/organ/eyes/target_eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
			if(target_eyes)
				target_eyes.flash_protect = max(target_eyes.flash_protect += 1, FLASH_PROTECTION_NONE)// TEST
		if ("Taste")
			REMOVE_TRAIT(quirk_holder, TRAIT_DETECTIVES_TASTE, QUIRK_TRAIT)
		if ("Touch")
			REMOVE_TRAIT(quirk_holder, TRAIT_SELF_AWARE, QUIRK_TRAIT)
