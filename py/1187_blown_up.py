from astropy.io import fits
import matplotlib.pyplot as plt
import numpy as np


hdulist = fits.open('../data/thousand.fits')
hdulist.info()
data = hdulist[1].data
x=0
#print(data)
#mg = data[:,0]
#bp = data[:,1]
mg=[]
bp=[]
while (x<1187):    ##1187
    z = data[x]
    mg.append(z[0])
    bp.append(z[1])
    x=x+1
plt.scatter(bp,mg, c='k', s=(0.4), alpha=1, marker=".")
#plt.xlim([0.5,1.2])
#plt.ylim([4,6.6])
plt.xticks(np.arange(0, 5, .10))
plt.axes().set_aspect(0.3)
plt.axis([0.6,1.2,4,6.6])
plt.xlabel('G_BP - G_RP')
plt.ylabel('M_G')
plt.plot(1,6.3, 'bo')
plt.plot(.9,5.8, 'bo')
plt.plot(.85, 5.5, 'bo')
plt.plot(.8 ,5.25, 'bo')
plt.plot(.75 ,4.9, 'bo')
plt.plot(.725 ,4.6, 'bo')
#plt.savefig('45000.png')