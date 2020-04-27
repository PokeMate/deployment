#! /bin/bash
mongoimport --host poke-mongo --db pokemate --collection pokeDex --type csv --file /mongo-seed/pokeDex.csv --headerline --drop
mongoimport --host poke-mongo --db pokemate --collection pokeUser --type csv --file /mongo-seed/pokeUsers.csv --headerline --drop
mongoimport --host poke-mongo --db pokemate --collection pokeFetish --type csv --file /mongo-seed/fetishes.csv --headerline --drop
mongoimport --host poke-mongo --db pokemate --collection pokeNogos --type csv --file /mongo-seed/nogos.csv --headerline --drop
