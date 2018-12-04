#!/usr/bin/python

from __future__ import division
import numpy as np
from itertools import count, tee, islice
import math


#window_size = 100
#stride = 20

fOut = open("result.txt", "w")
x = raw_input("Enter your file name: ")
file = open(x,"r")

tmin = float(7)
tmax = float(15)
data = []
for line in file:

        count = 0
        line = line.split("\t")
        line1 = float(line[0])
        line2 = float(line[1])
#       print (line1), line2
#       data.append(line)
#       print data
        for num in range(0,24):
                if num < tmin:
                        f1 = (math.cos(math.pi*(tmin-num)/(24+tmin-tmax))+1)/2
                        f2 = 1 - f1
                        T =  (f1 * (line1)) + (f2 * (line2))
                        fOut.write(str(num) +"\t" + str(T) + "\n")
                elif tmin <= num <= tmax:
                        f1 = (math.cos(math.pi*(num-tmin)/(tmax-tmin))+1)/2
                        f2 = 1 - f1
                        T =  (f1 * line1) + (f2 * line2)
                        fOut.write(str(num)+"\t" + str(T) + "\n")
                elif tmax < num:
                        f1 = (math.cos(math.pi*(24+tmin-num)/(24+tmin-tmax))+1)/2
                        f2 = 1 - f1
                        T =  (f1 * line1) + (f2 * line2)
                        fOut.write(str(num) +"\t" + str(T) + "\n")




#window_avg = [ np.mean(data[i:i+window_size]) for i in range(0, len(data), stride)
#       if i+window_size <= len(data) ]
#x = window_avg
#for ele in x:
#       ele = str(ele)
#       fOut.write(ele + "\n")
fOut.close()
