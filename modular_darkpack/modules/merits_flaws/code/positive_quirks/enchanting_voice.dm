// VTM pg. 480
/datum/quirk/darkpack/enchanting_voice
	name = "Enchanting Voice"
	desc = {"A hideous disfigurement makes your appearance disturbing and memorable.
	The difficulties of all die rolls relating to social interaction are increased by two.
	You may not have an Appearance rating greater than 2."}
	icon = FA_ICON_FACE_GRIN_HEARTS
	value = 2
	gain_text = span_notice("Your voice sounds especially charming.")
	lose_text = span_notice("You feel your voice hitch.")
	failure_message = span_notice("You don't sound as good as you thought.")
	mob_trait = TRAIT_ENCHANTING_VOICE
