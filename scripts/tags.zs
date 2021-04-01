#priority 100
import crafttweaker.api.BracketHandlers;
<tag:blocks:forge:conduit_base_block>.add([
	<block:minecraft:prismarine>,
	<block:minecraft:dark_prismarine>,
	<block:minecraft:prismarine_bricks>,
	<block:minecraft:sea_lantern>,
	<block:quark:elder_prismarine_bricks>,
	<block:quark:elder_prismarine>,
	<block:quark:dark_elder_prismarine>,
]);

<tag:items:forge:helmets>.add([
	<item:minecraft:diamond_helmet>,
	<item:minecraft:golden_helmet>,
	<item:minecraft:iron_helmet>,
	<item:minecraft:chainmail_helmet>,
	<item:minecraft:netherite_helmet>,
	<item:ceramics:clay_helmet>,
	<item:byg:ametrine_helmet>,
	<item:minecraft:turtle_helmet>,
]);

for candle_item_definition in <tag:items:buzzier_bees:candles>.getElements() {
	<tag:blocks:buzzier_bees:candles>.add(BracketHandlers.getBlock(candle_item_definition.defaultInstance.registryName));
}

<tag:blocks:forge:golem_head>.add([
	<block:minecraft:carved_pumpkin>,
	<block:minecraft:jack_o_lantern>,
]);

for candle_item_definition in <tag:items:forge:tools/knife>.getElements() {
	<tag:items:forge:tools/knives>.add(candle_item_definition.defaultInstance);
}