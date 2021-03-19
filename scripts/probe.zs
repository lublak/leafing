import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IntData;
import crafttweaker.api.data.IData;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;

for helmet_definition in <tag:items:forge:helmets>.getElements() {
  var helmet = helmet_definition.defaultInstance;
	var helmet_with_probe = helmet.withTag({theoneprobe: 1});
  craftingTable.addShapeless(
    "leafing_probe_helm_" + helmet.registryName.namespace + "_" + helmet.registryName.path,
    helmet,
    [helmet.anyDamage(), <item:theoneprobe:probe>],
    (usualOut as IItemStack, inputs as IItemStack[]) => {
      var out = inputs[0];
      var tag = new MapData(out.tag.asMap());
      if(!tag.contains("theoneprobe") || tag.getAt("theoneprobe").asNumber().getInt() != 1) {
        tag.put("theoneprobe", 1);
        return out.withTag(tag);
      }
      return <item:minecraft:air>;
    }
  );
  
  craftingTable.addShapeless(
    "leafing_probe_helm_remove_" + helmet.registryName.namespace + "_" + helmet.registryName.path,
    helmet,
    [helmet_with_probe.anyDamage()],
    (usualOut as IItemStack, inputs as IItemStack[]) => {
      var out = inputs[0];
      var tag = new MapData(out.tag.asMap());
      tag.remove("theoneprobe");
      return out.withTag(tag);
    }
  );
	
	helmet_with_probe.addTooltip(("with Probe" as MCTextComponent).setStyle(new MCStyle().setItalic(true).setColor(<formatting:aqua>)));
}

removeAndHideItem(<item:theoneprobe:probenote>);
removeAndHideItem(<item:theoneprobe:diamond_helmet_probe>);
removeAndHideItem(<item:theoneprobe:gold_helmet_probe>);
removeAndHideItem(<item:theoneprobe:iron_helmet_probe>);

removeAndHideItem(<item:theoneprobe:creativeprobe>);

<item:theoneprobe:probe>.addShiftTooltip("Right-Click anywhere with the item to configure the view.", "[shift] for more info.");
mods.jei.JEI.addInfo(<item:theoneprobe:probe>, ["Can combined with any helmet in the crafting grid.", "Can be removed again in the same way. Just put it as a single element in the crafting grid. The probe is destroyed in the process."]);