import matplotlib.pyplot as plt
import csv
import pandas as pd
import os
import numpy as np
t='.csv'
l='user_list.csv'
k='date_list.csv'
df=pd.DataFrame(pd.read_csv(l,names=['user']))
df1=pd.DataFrame(pd.read_csv(k,names=['date']))
df0=pd.DataFrame(pd.read_csv('time_list.csv',names=['time']))
k=input()
if k not in df.values:
    with open(l,mode='a') as of:
        pw=csv.writer(of, delimiter=',')
        pw.writerow([k])
    
    





    

