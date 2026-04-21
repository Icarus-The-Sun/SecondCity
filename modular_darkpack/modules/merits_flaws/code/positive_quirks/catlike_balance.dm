// VTM pg. 480
/datum/quirk/darkpack/catlike_balance
	name = "Catlike Balance"
	desc = {"You possess an innately perfect sense of balance.
Characters with this Merit reduce difficulties of all balance-related rolls
(e.g., Dexterity + Athletics to walk along a narrow ledge) by two."}
	icon = FA_ICON_PAW
	value = 1
	gain_text = span_notice("You feel well-balanced.")
	lose_text = span_notice("You feel like you might trip!")
	failure_message = span_notice("You don't think you're as graceful as you once thought.")
	mob_trait = TRAIT_CATLIKE_GRACE
