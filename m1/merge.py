import pandas as pd 

print("Enter name : ")
name = str(input())
src = "benign/"
dest = "merged_benign/"
dic = {}
for i in range(1,11):
	file_name = name+str(i)
	print(file_name)
	file_name = src+file_name
	f = pd.read_csv(file_name,sep=',',names=['time','count','N','counters','A','B','E','F'])
	print(f.size)
	# f = f[f['counters'] != NaN	]
	f = f[f['counters'].notna()]
	f = f[f['count'] != '<not counted>']
	repl = 'instructions'+str(i)
	f['counters'] = f['counters'].replace({'instructions':repl})
	l = f.counters.unique()
	for i in l:	
		v = f.loc[f['counters'] == i]
		dic[i] = v['count'].tolist()
	# print(dic.keys())
	
new = pd.DataFrame.from_dict(dic,orient='index')
new = new.transpose()
dest = dest+name
new.to_csv(dest)
# print(new)
print('done')