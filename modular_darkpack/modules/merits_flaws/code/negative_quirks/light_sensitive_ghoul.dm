// VTM Ghouls and Revenants pg. 135-136
/datum/quirk/darkpack/light_sensitive_ghoul
	name = "Light Sensitive (Ghoul)"
	desc = {"You find yourself more sensitive to bright lights than other ghouls.
At 2 points, you become sensitive to bright lights. During daylight hours, you may need strong, prescription sunglasses.
At 4 points, you develop rashes or sunburns in daylight, and are increasingly sensitive to bright lights.
At 6 points, you develop harsh sunburns in even a small amount of sunlight, and can find bright lights incapacitating.
Among ghouls feeding from certain clans and bloodlines, this flaw can worsen over time."}
	icon = FA_ICON_LIGHTBULB
	gain_text = span_notice("Light begins to sting your eyes!")
	lose_text = span_notice("You feel a bit more comfortable in light.")
	allowed_splats = list(SPLAT_GHOUL, SPLAT_KINDRED)


/datum/quirk/darkpack/light_severity/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique, announce)
	var/quirk_value
	value = quirk_value
	var/light_severity = client_source?.prefs.read_preference(/datum/preference/choiced/light_severity)
	var/obj/item/organ/eyes/target_eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
	if(!light_severity)
		light_severity = client_source?.prefs.read_preference(/datum/preference/choiced/light_severity)
	switch(light_severity)
		if("weak")
			quirk_value = -2 // For our points for this flaw
			target_eyes.flash_protect = max(target_eyes.flash_protect - 1, FLASH_PROTECTION_SENSITIVE) // Bad with light

		if("mild")
			quirk_value = -4 // Flaw points
			mob_trait = TRAIT_LIGHT_WEAKNESS_WEAK
			target_eyes.flash_protect = max(target_eyes.flash_protect - 1, FLASH_PROTECTION_HYPER_SENSITIVE) // Worse with light

		if("severe")
			quirk_value = -6 // For our points for this flaw
			mob_trait = TRAIT_LIGHT_WEAKNESS
			target_eyes.flash_protect = max(target_eyes.flash_protect - 2, FLASH_PROTECTION_HYPER_SENSITIVE) // Even worse with light

/datum/quirk/darkpack/light_severity/remove_from_current_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique, announce)
	var/obj/item/organ/eyes/target_eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
	if(istype(target_eyes))
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
