import pandas as pd
import random

df = pd.read_csv("pokeDex.csv")
df = df.sort_values('pokeDexId')
print(df)

# sort by name to keep the shortest name
df = df.sort_values('name')
print(df.size)

# drop all duplicated pokemons with same id and keep the
df = df.drop_duplicates(subset='pokeDexId', keep='first')
df = df.sort_values('pokeDexId')
print(df)

# add random types to attractedTypes and nogoTypes (without conflicts!)
types1 = df.type1.unique().tolist()
types2 = df.type2.dropna().unique().tolist()
types = list(set(types1 + types2))

attracted_types_column = []
nogo_types_column = []

for i in range(len(df)):
    amount = random.randint(1, 5)
    attracted_types = random.sample(types, k=amount)
    amount = random.randint(3, 6)
    nogo_types = random.sample(types, k=amount)

    # filter conflicting types
    filtered_nogos = filter(lambda x: x not in attracted_types, nogo_types)

    # append to columns
    attracted_types_column.append(attracted_types)
    nogo_types_column.append(nogo_types)

df = df.assign(attractedTypes=attracted_types_column)
df = df.assign(nogosTypes=nogo_types_column)

df.to_csv('pokedex-clean.csv', index=False)
