for helmet_definition in <tag:items:forge:helmets>.getElements() {
	var helmet = helmet_definition.defaultInstance;
  craftingTable.addShapeless(
		"leafing_probe_helm_" + helmet.registryName.namespace + "_" + helmet.registryName.path,
		helmet.withTag({theoneprobe:1}).setDisplayName(helmet.displayName + " with Probe"),
		[helmet, <item:theoneprobe:probe>]
	);
}

removeAndHideItem(<item:theoneprobe:probenote>);
removeAndHideItem(<item:theoneprobe:diamond_helmet_probe>);
removeAndHideItem(<item:theoneprobe:gold_helmet_probe>);
removeAndHideItem(<item:theoneprobe:iron_helmet_probe>);

<item:theoneprobe:probe>.addShiftTooltip("Right-Click anywhere with the item to configure the view.", "[shift] for more info.");
mods.jei.JEI.addInfo(<item:theoneprobe:probe>, ["Can combined with any helmet in the crafting grid."]);
mods.jei.JEI.hideItem(<item:theoneprobe:creativeprobe>);