import pandas as pd
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

df.to_csv('pokedex-clean.csv', index=False)
