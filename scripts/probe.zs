import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IntData;
import crafttweaker.api.data.IData;

for helmet_definition in <tag:items:forge:helmets>.getElements() {
  var helmet = helmet_definition.defaultInstance;
  craftingTable.addShapeless(
    "leafing_probe_helm_" + helmet.registryName.namespace + "_" + helmet.registryName.path,
    helmet,
    [helmet.anyDamage(), <item:theoneprobe:probe>],
    (usualOut as IItemStack, inputs as IItemStack[]) => {
      var out = inputs[0];
      var tag = new MapData(out.tag.asMap());
      if(!tag.contains("theoneprobe") || tag.getAt("theoneprobe").asNumber().getInt() != 1) {
        tag.put("theoneprobe", 1);
        if(tag.contains("display")) {
          val display = new MapData(tag.getAt("display").asMap());
          display.put("Lore", [ "{\"text\": \"with Probe\"}" ]);
          tag.put("display", display);
        } else {
          tag.put("display", {"Lore": [ "{\"text\": \"with Probe\"}" ]});
        }
        return out.withTag(tag);
      }
      return <item:minecraft:air>;
    }
  );
  
  craftingTable.addShapeless(
    "leafing_probe_helm_remove_" + helmet.registryName.namespace + "_" + helmet.registryName.path,
    helmet,
    [helmet.withTag({theoneprobe: 1}).anyDamage()],
    (usualOut as IItemStack, inputs as IItemStack[]) => {
      var out = inputs[0];
      var tag = new MapData(out.tag.asMap());
      tag.remove("theoneprobe");
      val display = new MapData(tag.getAt("display").asMap());
      display.remove("Lore");
      tag.put("display", display);
      return out.withTag(tag);
    }
  );
}

removeAndHideItem(<item:theoneprobe:probenote>);
removeAndHideItem(<item:theoneprobe:diamond_helmet_probe>);
removeAndHideItem(<item:theoneprobe:gold_helmet_probe>);
removeAndHideItem(<item:theoneprobe:iron_helmet_probe>);

removeAndHideItem(<item:theoneprobe:creativeprobe>);

<item:theoneprobe:probe>.addShiftTooltip("Right-Click anywhere with the item to configure the view.", "[shift] for more info.");
mods.jei.JEI.addInfo(<item:theoneprobe:probe>, ["Can combined with any helmet in the crafting grid.", "Can be removed again in the same way. Just put it as a single element in the crafting grid. The probe is destroyed in the process."]);