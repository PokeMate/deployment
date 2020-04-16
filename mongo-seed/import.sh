#! /bin/bash
mongoimport --host poke-mongo --db pokemate --collection pokeDex --type csv --file /mongo-seed/pokeDex.csv --headerline
mongoimport --host poke-mongo --db pokemate --collection pokeUser --type csv --file /mongo-seed/pokeUsers.csv --headerline
