removeAndHideItem(<item:appliedenergistics2:molecular_assembler>);
<item:appliedenergistics2:speed_card>.removeTooltip("Molecular Assembler \\([0-9]+\\)");
<recipetype:create:crushing>.addRecipe("hopes_and_dreams", [<item:appliedenergistics2:fluix_dust>], <item:appliedenergistics2:fluix_crystal>);
<recipetype:create:milling>.addRecipe("milling_test", [<item:appliedenergistics2:fluix_dust>], <item:appliedenergistics2:fluix_crystal>);
removeAndHideMultipleItems([
	<item:appliedenergistics2:iron_dust>,
	<item:appliedenergistics2:gold_dust>,
]);
removeAndHideMultipleItems([
	<item:appliedenergistics2:creative_energy_cell>,
	<item:appliedenergistics2:creative_storage_cell>,
]);