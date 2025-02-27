import time
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

n = 50000
a = []

for i in range(n):
    a.append(time.time_ns())

a = np.array(a) * 1e-9
a = a - a[0]
x = np.arange(n)

df = pd.DataFrame({'iters': x, 'time': a})
df.to_csv('./data/data_tmp.csv', index=False)