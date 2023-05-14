import pandas as pd
import os

source = "merged_mw/tsunami/"

for file in os.listdir(source):
    df = pd.read_csv(source+file)
    print(df['instructions1'],df['branch-instructions'])
    # c = df.shape[1]

    df[['branch-instructions','branch-misses','bus-cycles']] = df[['branch-instructions','branch-misses','bus-cycles']].div(df['instructions1'],axis=0)
    # df[['cache-references','cpu-cycles','ref-cycles']] = df[['cache-references','cpu-cycles','ref-cycles']].div(df['instructions2'],axis=0)
    df[['L1-dcache-load-misses','L1-dcache-loads','L1-dcache-stores']] = df[['L1-dcache-load-misses','L1-dcache-loads','L1-dcache-stores']].div(df['instructions3'],axis=0)
    df[['LLC-load-misses','LLC-loads','LLC-store-misses']] = df[['LLC-load-misses','LLC-loads','LLC-store-misses']].div(df['instructions4'],axis=0)
    df[['branch-load-misses','branch-loads','dTLB-load-misses']] = df[['branch-load-misses','branch-loads','dTLB-load-misses']].div(df['instructions5'],axis=0)
    df[['dTLB-store-misses','dTLB-stores','iTLB-load-misses']] = df[['dTLB-store-misses','dTLB-stores','iTLB-load-misses']].div(df['instructions6'],axis=0)
    df[['node-load-misses','node-loads','node-store-misses']] = df[['node-load-misses','node-loads','node-store-misses']].div(df['instructions7'],axis=0)
    df[['mem-loads','mem-stores']] = df[['mem-loads','mem-stores']].div(df['instructions8'],axis=0)
    df[['cache-misses','L1-icache-load-misses','LLC-stores']] = df[['cache-misses','L1-icache-load-misses','LLC-stores']].div(df['instructions9'],axis=0)
    df[['dTLB-loads','iTLB-loads','node-stores']] = df[['dTLB-loads','iTLB-loads','node-stores']].div(df['instructions10'],axis=0)
    print(df)
    # for i in range(4, c, 4):
    #     cols = [i-3, i-2, i-1]
    #     print(df[cols])
        # df[cols] = df[cols].div(df.iloc[:, i], axis=0)

print(df)

df = df.drop(['instructions1','instructions2','instructions3','instructions4','instructions6','instructions7','instructions8','instructions9','instructions10'])

# for i in range(1, 11):
#     filename = f"file_{i}.csv"
#     if filename.endswith("_i.csv"):  # Check if the file name ends with "_i.csv"
#         df = pd.read_csv(filename)
#         # Do whatever you want to do with the DataFrame here


