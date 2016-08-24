import random
import re

lines = open("names.txt").readlines()
strategies = ["R", "P", "S"]

enterants = []
for line in lines:
	enterant = []
	line = re.sub(r'\xc2\xa0\n', "", line)
	strategy = random.choice(strategies)
	enterant.append(line)
	enterant.append(strategy)
	enterants.append(enterant)

tournament = []
for item in range(0, len(enterants), 2):
	team = []
	team.append(enterants[item])
	team.append(enterants[item+1])
	tournament.append(team)

print tournament


