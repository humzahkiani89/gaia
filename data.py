from astropy.io import fits
import matplotlib.pyplot as plt

hdulist = fits.open('million.fits')
hdulist.info()
data = hdulist[1].data
x=0
mg=[]
bp=[]
while (x<100000):
    z = data[x]
    mg.append(z[0])
    bp.append(z[1])
    x=x+1
plt.scatter(bp,mg, c='k', alpha=0.1, marker=".")
plt.xlim([0,6])
plt.ylim([15,-5])
plt.xlabel('G_BP - G_RP')
plt.ylabel('M_G')
plt.show()