const biomesFile = '../config/byg/byg-biomes.json';
const langFile = 'https://raw.githubusercontent.com/CorgiTaco/BYG/Forge-1.16.X/src/main/resources/assets/byg/lang/en_us.json';

const fs = require('fs/promises');
const got = require('got');
const colorthief = require('colorthief');

(async () => {
	const lang = await got.get(langFile).json();
  const biomes = JSON.parse(await fs.readFile(biomesFile, 'utf8')).biomes;
  for (const biomeID in biomes) {
    const biomeInfos = biomes[biomeID].weight;
    const name = lang['biome.' + biomeID.replace(/:/g, '.')];

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
    console.log(`${biomeID},2,8,14,7FE4FF,${name} Pathfinder Map`);
  }
})();