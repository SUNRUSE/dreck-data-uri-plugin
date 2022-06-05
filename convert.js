const fs = require(`fs`);
const childProcess = require(`child_process`);

const input = process.argv[2];
const output = process.argv[3];

const value = fs.readFileSync(input);

const mimeType = childProcess.execSync(`file --brief --no-pad --mime ${input}`, { encoding: `utf8` });

const dataUri = `\`data:${mimeType.replace(` `, ``).replace(`;charset=binary`, ``).replace(`;charset=us-ascii`, ``)};base64,${value.toString(`base64`)}\``;

fs.writeFileSync(
  output,
  `const dataUri${input.split(/[^\da-zA-Z]+/g).filter(segment => segment).map(segment => `${segment.slice(0, 1).toUpperCase()}${segment.slice(1)}`).join(``)}: ${dataUri} = ${dataUri};
`
);
