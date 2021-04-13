const ctDumps = '../ct_dumps';
const ctRegex = /<(.+?):(.+?):(.+?)>/g;

const fs = require('fs/promises');
const path = require('path');
const {distance} = require('fastest-levenshtein');

function similarity(s1, s2) {
  return 1 - distance(s1, s2)/Math.max(s1.length, s2.length);
}

(async () => {
	const dumps = await fs.readdir(ctDumps);
  for (const dump of dumps) {
    if(dump == 'profession.txt' || dump == 'tag.txt') return;
    const data = [];
    const content = await fs.readFile(path.join(ctDumps, dump));
    let result;
    while ((result = ctRegex.exec(content)) !== null) {
      const type = result[1];
      const mod = result[2];
      if(mod == 'minecraft') continue;
      const item = result[3];
      const has = data.find(d => similarity(item, d.item) > 0.7 && d.mod != mod);
      if(has) {
        has.similar.push({
          type: type,
          mod: mod,
          item: item
        });
      } else {
        data.push({
          type: type,
          mod: mod,
          item: item,
          similar: []
        });
      }
    }
    let i = 0;
    if(data.length > 0) {
      console.log(data[0].type);
      for (const d of data) {
        if(d.similar.length > 0) {
          i += d.similar.length + 1;
          console.log([d.mod + ':' + d.item].concat(d.similar.map(x => x.mod + ':' + x.item)));
        }
      }
      console.log(i);
    }
    
  }
})();