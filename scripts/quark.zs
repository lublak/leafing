for vertical_slab_definition in <tag:items:quark:vertical_slab>.getElements() {
	var vertical_slab = vertical_slab_definition.defaultInstance;
	removeAndHideItem(vertical_slab);
}

TODO:

removeAndHideMultipleItems([
	<item:quark:frog_spawn_egg>,
	//<item:quark:frog_leg>,
	//<item:quark:cooked_frog_leg>,
	//<item:quark:golden_frog_leg>,
]);