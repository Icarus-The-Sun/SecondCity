// VTM pg. 481
/datum/quirk/darkpack/glowing_eyes
	name = "Glowing Eyes"
	desc = {"You have the stereotypical glowing eyes of vampire legend, which gives you a -1 difficulty on Intimidation rolls when you're dealing with mortals.
		However, the tradeoffs are many; you MUST constantly disguise your condition;
		the glow impairs your vision and puts you at +1 difficulty on all sightbased rolls (including the use of ranged weapons);
		and the radiance emanating from your eye sockets makes it difficult to hide (+2 difficulty to Stealth rolls)."}
	icon = FA_ICON_EYE
	value = -3
	gain_text = span_notice("Your eyes have an unnatural glow!")
	lose_text = span_notice("Your eyes look much less striking.")
	allowed_splats = list(SPLAT_KINDRED)
	excluded_clans = list(VAMPIRE_CLAN_KIASYD, VAMPIRE_CLAN_GARGOYLE, VAMPIRE_CLAN_NOSFERATU, VAMPIRE_CLAN_CAPPADOCIAN, VAMPIRE_CLAN_SAMEDI, VAMPIRE_CLAN_HARBINGER)// if you have masq violating faces/eyes already, no flaw for you.
	failure_message = span_notice("Your eyes aren't as bright as you thought.")
	mob_trait = TRAIT_GLOWING_EYES

/*You have the stereotypical glowing eyes of vampire
legend, which gives you a -1 difficulty on Intimidation
rolls when you’re dealing with mortals. However, the
tradeoffs are many; you must constantly disguise your
condition (no, contacts don’t cut it); the glow impairs
your vision and puts you at +1 difficulty on all sight
based rolls (including the use of ranged weapons); and
the radiance emanating from your eye sockets makes
it difficult to hide (+2 difficulty to Stealth rolls) in the
dark.*/

/datum/quirk/darkpack/glowing_eyes/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique, announce)
	ADD_TRAIT(quirk_holder, TRAIT_MASQUERADE_VIOLATING_EYES, QUIRK_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_LUMINESCENT_EYES, QUIRK_TRAIT)

/datum/quirk/darkpack/glowing_eyes/remove_from_current_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique, announce)
	REMOVE_TRAIT(quirk_holder, TRAIT_MASQUERADE_VIOLATING_EYES, QUIRK_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_LUMINESCENT_EYES, QUIRK_TRAIT)
