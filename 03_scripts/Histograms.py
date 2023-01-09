#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 18 15:05:52 2021

"""

import matplotlib.pyplot as plt
plt.plot([0,1,4,9,16])

import numpy as np
x = np.linspace(0, 10, 20)
y = np.linspace(0, 10, 20)
y1 = x**2.0
y2 = x**1.5

plt.plot(x,y1,"bo-", linewidth=2, markersize=12)
plt.plot(x,y1,"gs-", linewidth=2, markersize=12)


#customizing plots
x = np.linspace(0, 10, 20)
y1 = x**2.0
y2 = x**1.5
plt.plot(x,y1,"bo-", linewidth=2, markersize=12, label="First")
plt.plot(x,y2,"gs-", linewidth=2, markersize=12, label="Second")
plt.xlabel("$X$")
plt.ylabel("$Y$")
plt.axis([-0.5, 10.5, -5, 105])
plt.legend(loc="upper left")
plt.savefig("myplot.pdf")



#plotting using logarithmic axes
x = np.logspace(-1, 1, 40)
y1 = x**2.0
y2 = x**1.5
plt.loglog(x,y1,"bo-", linewidth=2, markersize=12, label="First")
plt.loglog(x,y2,"gs-", linewidth=2, markersize=12, label="Second")
plt.xlabel("$X$")
plt.ylabel("$Y$")
plt.axis([-0.5, 10.5, -5, 105])
plt.legend(loc="upper left")
plt.savefig("myplot.pdf")


#test
x = np.logspace(0,1,10)
y = x**2
plt.loglog(x,y,"bo-")



#generating histograms
import matplotlib.pyplot as plt
import numpy as np

x = np.random.normal(size=1000)
plt.hist(x)



#subplots
x = np.random.gamma(2, 3, 100000)
plt.figure()
plt.subplot(221)
plt.hist(x, bins = 30)
plt.subplot(222)
plt.hist(x, bins = 30)
plt.subplot(223)
plt.hist(x, bins = 30, cumulative = 30)
plt.subplot(224)
plt.hist(x, bins = 30, cumulative = 30, histtype = "step")





