const biomesFile = '../config/byg/byg-biomes.json';
const langFile = './BYG/src/main/resources/assets/byg/lang/en_us.json';
const blockAssetsFolder = './BYG/src/main/resources/assets/byg/textures/block';
const itemAssetsFolder = './BYG/src/main/resources/assets/byg/textures/item';

const fs = require('fs/promises');
const colorthief = require('colorthief');
const mappings = {
  1: { // rare
    level: 5,
    min: 36,
    max: 44,
  },
  2: { // uncommon
    level: 5,
    min: 26,
    max: 32,
  },
  3: { // uncommon
    level: 4,
    min: 22,
    max: 28,
  },
  4: { //common
    level: 4,
    min: 12,
    max: 18,
  }
  // 5,6
};

(async () => {
	const lang = JSON.parse(await fs.readFile(langFile, 'utf8'));
  const biomes = JSON.parse(await fs.readFile(biomesFile, 'utf8')).biomes;
  const blockAssetsFiles = await fs.readdir(blockAssetsFolder);
  const itemAssetsFiles = await fs.readdir(itemAssetsFolder);
  const bothFiles = blockAssetsFiles.concat(itemAssetsFiles);
  const default_rgb_color = (await colorthief.getColor(itemAssetsFolder + '/' + 'byg_logo.png'));
  const default_hex_color = (default_rgb_color[0].toString(16).padStart(2, '0')
    + default_rgb_color[1].toString(16).padStart(2, '0')
    + default_rgb_color[2].toString(16).padStart(2, '0')).toUpperCase();
  function getAsset(name) {
    let asset_file;
    for (const file of blockAssetsFiles) {
      if(file.includes(name)) {
        if(asset_file) {
          if(file.length < asset_file.length) asset_file = file;
        } else {
          asset_file = file;
        }
      }
    }
    if(!asset_file) {
      for (const file of itemAssetsFiles) {
        if(file.includes(name)) {
          if(asset_file) {
            if(file.length < asset_file.length) asset_file = file;
          } else {
            asset_file = file;
          }
        }
      }
    }
    return asset_file;
  }
  for (const biomeID in biomes) {
    const biomeData = biomes[biomeID];
    const weight = biomeData.weight;
    const weight_mappings = mappings[weight];
    if(weight_mappings == null) continue;
    const name = lang['biome.' + biomeID.replace(/:/g, '.')];
    let asset_file = getAsset(biomeID.replace(/(byg:|_[^_]*$)/g, ''));
    if(!asset_file) {
      if(biomeData.river != 'minecraft:river') {
        asset_file = getAsset(biomeData.river.replace(/(byg:|_[^_]*$)/g, ''));
      }
      if(!asset_file) {
        if(biomeData.beach != 'minecraft:beach') {
          asset_file = getAsset(biomeData.beach.replace(/(byg:|_[^_]*$)/g, ''));
        }
        
        if(!asset_file) {
          for (const hill of biomeData.hills) {
            asset_file = getAsset(hill.name.replace(/(byg:|_[^_]*$)/g, ''));
            if(asset_file) break;
          }
        }
      }
    }
    
    let hex_color;
    if(asset_file) {
      const rgb_color = (await colorthief.getColor(blockAssetsFolder + '/' + asset_file));
      hex_color = (rgb_color[0].toString(16).padStart(2, '0')
      + rgb_color[1].toString(16).padStart(2, '0')
      + rgb_color[2].toString(16).padStart(2, '0')).toUpperCase();
    } else {
      hex_color = default_hex_color;
    }
    
    /*
    #<id>,<level>,<min_price>,<max_price>,<color>,<name>
    #
    #With the following descriptions:
    # - <id> being the biome's ID NAME. You can find vanilla names here - https://minecraft.gamepedia.com/Biome#Biome_IDs
    # - <level> being the Cartographer villager level required for the map to be unlockable
    # - <min_price> being the cheapest (in Emeralds) the map can be
    # - <max_price> being the most expensive (in Emeralds) the map can be
    # - <color> being a hex color (without the #) for the map to display. You can generate one here - http://htmlcolorcodes.com/
    # - <name> being the display name of the map
    */
    console.log(`${biomeID},${weight_mappings.level},${weight_mappings.min},${weight_mappings.max},${hex_color},${name} Pathfinder Map`);
  }
})();