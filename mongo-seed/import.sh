#! /bin/bash
mongoimport --host poke-mongo --db pokemate --collection pokeDex --type csv --file /mongo-seed/pokedex-clean.csv --headerline --drop
mongoimport --host poke-mongo --db pokemate --collection pokeUser --type csv --file /mongo-seed/pokeUsers.csv --headerline --drop
mongoimport --host poke-mongo --db pokemate --collection pokeFetish --type csv --file /mongo-seed/fetishes.csv --headerline --drop
mongoimport --host poke-mongo --db pokemate --collection pokeNogos --type csv --file /mongo-seed/nogos.csv --headerline --drop
mongo --host poke-mongo pokemate --eval 'db.pokeDex.find().forEach(function(poke) { fet=db.pokeFetish.find({fetishId: (Math.floor(Math.random()*(db.pokeFetish.count()-1))+1)}).limit(1)[0]; db.pokeDex.update( {_id:
poke._id}, {$addToSet: {fetisches: DBRef("pokeFetish", fet._id)}}); })'
mongo --host poke-mongo pokemate --eval 'db.pokeDex.find().forEach(function(poke) { nogo=db.pokeNogos.find({nogoId: (Math.floor(Math.random()*(db.pokeNogos.count()-1))+1)}).limit(1)[0]; db.pokeDex.update( {_id:
poke._id}, {$set: {nogos: [DBRef("pokeNogos", nogo._id)]}}); })'
mongo --host poke-mongo pokemate --eval 'types = ["Bug", "Dark", "Dragon", "Electric", "Fire", "Fairy","Fighting", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel","Water"];
db.pokeDex.find().forEach(function(poke) { type=types[(Math.floor(Math.random()*17)+1)]; db.pokeDex.update( {_id: poke._id}, {$set: {attractedTypes: [type]} } ) });
db.pokeDex.find().forEach(function(poke) { type=types[(Math.floor(Math.random()*17)+1)]; db.pokeDex.update( {_id: poke._id}, {$set: {nogoTypes: [type]} } ) });'
