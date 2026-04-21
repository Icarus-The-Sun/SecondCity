// VTM pg. 495
/datum/quirk/darkpack/light_sensitive_ghoul
	name = "Light Sensitive (Ghoul)"
	desc = {"GHOUL TEXT INPUT - You are even more sensitive to sunlight than other vampires are.
Sunlight causes double normal damage.
Even bright lights hurt your eyes, requiring the use of sunglasses.
Followers of Set and related bloodlines cannot take this Flaw."} //rework
	icon = FA_ICON_LIGHTBULB
	gain_text = span_notice("Light begins to sting your eyes!")
	lose_text = span_notice("You feel a bit more comfortable in light.")
	allowed_splats = list(SPLAT_GHOUL, SPLAT_KINDRED)

var/obj/item/organ/eyes/target_eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)

/datum/quirk/darkpack/light_severity/add(client/client_source)
	var/quirk_value
	value = quirk_value
	var/light_severity = client_source?.prefs.read_preference(/datum/preference/choiced/light_severity)
	if(!light_severity)
		light_severity = client_source?.prefs.read_preference(/datum/preference/choiced/light_severity)
	switch(light_severity)
		if("weak")
			quirk_value = -2 // For our points for this flaw
			mob_trait = TRAIT_LIGHT_WEAKNESS_WEAK
			target_eyes.flash_protect = max(target_eyes.flash_protect - 1, FLASH_PROTECTION_SENSITIVE) // Bad with light

		if("mild")
			quirk_value = -4 // Flaw points
			mob_trait = TRAIT_LIGHT_WEAKNESS_WEAK
			target_eyes.flash_protect = max(target_eyes.flash_protect - 1, FLASH_PROTECTION_HYPER_SENSITIVE) // Worse with light

		if("severe")
			quirk_value = -6 // For our points for this flaw
			mob_trait = TRAIT_LIGHT_WEAKNESS
			target_eyes.flash_protect = max(target_eyes.flash_protect - 2, FLASH_PROTECTION_HYPER_SENSITIVE) // Even worse with light

/datum/quirk/darkpack/light_severity/remove(client/client_source)
	if(istype(target_eyes))
		var/obj/item/organ/eyes/target_eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
		target_eyes.flash_protect = initial(target_eyes.flash_protect)

/datum/quirk_constant_data/light_sensitive
	associated_typepath = /datum/quirk/darkpack/light_sensitive
	customization_options = list(/datum/preference/choiced/light_severity)

/datum/preference/choiced/light_severity
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "light_severity"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/light_severity/init_possible_values()
	return list("weak", "mild", "severe")

/datum/preference/choiced/light_severity/create_default_value()
	return "weak"

/datum/preference/choiced/light_severity/apply_to_human(mob/living/carbon/human/target, value)
	return
