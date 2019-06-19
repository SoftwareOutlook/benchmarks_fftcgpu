import sys
import math 

if len(sys.argv)<=1:
  exit()

filename=sys.argv[1]

f=open(filename, "r")
lines=f.readlines();
f.close()

keys_list=[]
parameters_list=[]

for line in lines:
  line=line.strip()
  line=line.replace("@", "@ ")
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

data={}
averages={}
sigma={}
for key in keys_list_unique:
  data[key]={}
  averages[key]={}
  sigma[key]={}
  for parameter in parameters_list_unique:
    data[key][parameter]=[];
    averages[key][parameter]=0
    sigma[key][parameter]=0
for line in lines:
  line=line.strip()
  line=line.replace("@", "@ ")
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
    if n>0:     
      averages[key][parameter]=averages[key][parameter]/n
    else:
      averages[key][parameter]=0

for key in data:
  for parameter in data[key]:
    n=0
    for result in data[key][parameter]:
      n=n+1
      sigma[key][parameter]=sigma[key][parameter]+(result-averages[key][parameter])**2
    if n>1:     
      sigma[key][parameter]=math.sqrt(sigma[key][parameter]/(n-1))
    else:
      sigma[key][parameter]=0

print '# N',
for key in keys_list_unique:
  print key+'_AVG '+key+'_STD',
print ''

for parameter in parameters_list_unique:
  print parameter, 
  for key in keys_list_unique:
     print str(averages[key][parameter])+' '+str(sigma[key][parameter]),   
  print ''

