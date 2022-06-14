import matplotlib.pyplot as plt
import numpy as np
fp = open("output.txt", "r")
data =  fp.read()
outarray = [int(i) for i in data.split()]
for i in range(1024):
	print(outarray[i])
index = np.array(range(0, 1024))
plt.plot(index, outarray)
plt.savefig("outplot.png")
plt.show()
fp.close()
