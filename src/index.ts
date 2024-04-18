// This program is a quine (self-replicating program)
import { readFile } from 'node:fs/promises';

const data = await readFile('src/index.ts', 'utf-8');

console.log(data);
