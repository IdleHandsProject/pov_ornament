import sys
from PIL import Image


img = sys.argv[1]
size = 60, 17

im = Image.open(img)
smallim = im.resize(size, Image.ANTIALIAS);
smallim = smallim.convert('RGB') 
pixels = list(smallim.getdata())

imgstr = str(pixels).strip('[]')
imgstr = imgstr.replace('(','{')
imgstr = imgstr.replace(')','}')

f = open(img + '.h', 'w')
f.write('byte imageArray[256][3] = {' + imgstr + '};')
f.close()
