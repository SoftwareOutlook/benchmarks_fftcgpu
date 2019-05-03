import sys

if len(sys.argv)<=1:
  exit()

filename=sys.argv[1]

f=open(filename, "r")
lines=f.readlines();
f.close()

keys_list=[]
parameters_list=[]

for line in lines:
  if len(line)<1:
    continue
  if line[0]!="@":
    continue
  elements=line.split()
  key=elements[1]
  parameter=int(elements[2])
  keys_list.append(key)
  parameters_list.append(parameter)

keys_list_unique=sorted(set(keys_list))
parameters_list_unique=sorted(set(parameters_list))

print keys_list_unique
print parameters_list_unique

data={}
averages={}
for key in keys_list_unique:
  data[key]={}
  averages[key]={}
  for parameter in parameters_list_unique:
    data[key][parameter]=[];
    averages[key][parameter]=0

for line in lines:
  if len(line)<1:
    continue
  if line[0]!="@":
    continue
  elements=line.split()
  key=elements[1]
  parameter=int(elements[2])
  result=float(elements[3])
  data[key][parameter].append(result)
 
for key in data:
  for parameter in data[key]:
    n=0
    for result in data[key][parameter]:
      n=n+1
      averages[key][parameter]=averages[key][parameter]+result     
    averages[key][parameter]=averages[key][parameter]/n

print '# N',
for key in keys_list_unique:
  print key,
print ''

for parameter in parameters_list_unique:
  print parameter, 
  for key in keys_list_unique:
     print averages[key][parameter],    
  print ''

