// VTM pg. 495
/datum/quirk/darkpack/light_sensitive
	name = "Light Sensitive"
	desc = {"You are even more sensitive to sunlight than other vampires are.
Sunlight causes double normal damage.
Even bright lights hurt your eyes, requiring the use of sunglasses.
Followers of Set and related bloodlines cannot take this Flaw."}
	icon = FA_ICON_LIGHTBULB
	value = -5
	gain_text = span_notice("Light begins to sting your eyes!")
	lose_text = span_notice("You feel a bit more comfortable in light.")
	allowed_splats = list(SPLAT_KINDRED)
	mob_trait = TRAIT_LIGHT_WEAKNESS

/datum/quirk/darkpack/light_severity/add(client/client_source)
	var/obj/item/organ/eyes/target_eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
	if(!istype(target_eyes)) // if you don't have eyes, we don't care actually.
		return
	target_eyes.flash_protect = max(target_eyes.flash_protect - 1, FLASH_PROTECTION_HYPER_SENSITIVE)
