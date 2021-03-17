function remove_mystical_ore_stuff(name as string, remove_items as bool, ingot as bool) as void {
	if(remove_items) {
		removeAndHideMultipleItems([
			<item:mysticalworld:${name}_axe>,
			<item:mysticalworld:${name}_hoe>,
			<item:mysticalworld:${name}_knife>,
			<item:mysticalworld:${name}_pickaxe>,
			<item:mysticalworld:${name}_shovel>,
			<item:mysticalworld:${name}_sword>,
			<item:mysticalworld:${name}_spear>,
			<item:mysticalworld:${name}_helmet>,
			<item:mysticalworld:${name}_chestplate>,
			<item:mysticalworld:${name}_leggings>,
			<item:mysticalworld:${name}_boots>,	
		]);
	}
	
	removeAndHideItem(<item:mysticalworld:${name}_ore>);
	
	removeAndHideMultipleItems([
		<item:mysticalworld:${name}_block>,
		<item:mysticalworld:${name}_stairs>,
		<item:mysticalworld:${name}_slab>,
		<item:mysticalworld:${name}_wall>,
		<item:mysticalworld:${name}_wide_post>,
		<item:mysticalworld:${name}_small_post>,
		
	]);
	if(ingot) {
		removeAndHideMultipleItems([
			<item:mysticalworld:${name}_ingot>,
			<item:mysticalworld:${name}_nugget>,
			<item:mysticalworld:${name}_dust>,
		]);
	} else {
		removeAndHideItem(<item:mysticalworld:${name}>);
	}
}

remove_mystical_ore_stuff("quicksilver", true, true);
remove_mystical_ore_stuff("lead", true, true);
remove_mystical_ore_stuff("tin", true, true);
remove_mystical_ore_stuff("silver", true, true);
remove_mystical_ore_stuff("amethyst", true, false);
remove_mystical_ore_stuff("copper", false, true);

removeAndHideItem(<item:mysticalworld:granite_quartz_ore>);
//mods.jei.JEI.hideFluid(<fluid:mysticalworld:serendipity>);
removeAndHideMultipleItems([
	<item:minecraft:potion>.withTag({Potion: "mysticalworld:serendipity" as string}),
	<item:minecraft:splash_potion>.withTag({Potion: "mysticalworld:serendipity" as string}),
	<item:minecraft:tipped_arrow>.withTag({Potion: "mysticalworld:serendipity" as string}),
	<item:minecraft:lingering_potion>.withTag({Potion: "mysticalworld:serendipity" as string}),
	<item:supplementaries:bamboo_spikes_tipped>.withTag({Potion: "mysticalworld:serendipity" as string}),
]);

removeAndHideMultipleItems([
	<item:create:crushed_tin_ore>,
	<item:create:crushed_lead_ore>,
	<item:create:crushed_quicksilver_ore>,
	<item:create:crushed_silver_ore>,
	<item:mysticalworld:iron_dust>,
	<item:mysticalworld:gold_dust>,
]);
// Glisterin horn? Silver?
// Epic Squid? Amethyst?

removeAndHideMultipleItems([
	<item:mysticalworld:nautilus_horn>,
	<item:mysticalworld:glistering_horn>,
	<item:mysticalworld:encyclopedia>,
	<item:mysticalworld:silk_cocoon>,
	<item:mysticalworld:silk_thread>,
	<item:mysticalworld:spindle>,
	<item:mysticalworld:silkworm_egg>,
]);

removeAndHideMultipleItems([
	<item:mysticalworld:cactus_axe>,
	<item:mysticalworld:cactus_hoe>,
	<item:mysticalworld:cactus_knife>,
	<item:mysticalworld:cactus_pickaxe>,
	<item:mysticalworld:cactus_shovel>,
	<item:mysticalworld:cactus_sword>,
	<item:mysticalworld:cactus_spear>,
]);

// TODO:

removeAndHideMultipleItems([
	//<item:mysticalworld:iron_knife>,
	//<item:mysticalworld:diamond_knife>,
	//<item:mysticalworld:gold_knife>,
]);

//<entitytype:mysticalworld:frog>