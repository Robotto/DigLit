DigLit
======


A Digital Literacy project involving an Arduino Leonardo (makey-makey) based guitar-pedal-style stompbox with 3 buttons. The stompbox chooses the background which replaces the green in a processing sketch that feeds from a USB conected w$

Some images of the project are available at: http://mark.moore.dk/#post248

Consists of 2 major parts:

<dl>
<dt>1. - Controller (ARDUINO):</dt>
<dd>1.1 - Arduino Leonardo sketch which debounces 3 button inputs and presses a keyboard key after each change (because the buttons are toggle-style guitar-pedal buttons)</dd>
<dd>1.2 - An SVG for a tabbed box to be lasercut, fitted to the buttons.</dd>

<dt>2 - Greenscreen (PROCESSING):</dt>
<dd>2.1 - As the name suggests this processing sketch employs a pseoud-greenscreen filter, which basically just scans every pixel in every frame from a webcam and replaced the pixel with the background image if:
      green is more present than red and blue
'''replace if(red*redfactor<green & blue*bluefacotr<green)*'''
so it is quick and dirty but it works most of the time, if the lighting is right.
the user is able to change redfactor and bluefacotr by entering R/r and B/b.

The sketch also scans 3 folders (dragons, trees, rockets) for jpgs and allows the user to cycle through each of these collections with the '1','2' and '3' keys

-dragons = 1
-trees = 2
-rockets = 3

(I DO NOT OWN THE IMAGES IN THE 3 FOLDERS, I JUST BORROWED THEM OFF SOME GOOGLE IMAGE SEACHES)
Whichever currently chosen jpg is the one which is used to replace a 'green' webcam pixel in the greenscreen algo.</dd>
 </dl>
that is all :)
I hereby disclaim all rights to the code. feel free to use this code and edit, sell, buy, republish-taking-credit or print-out-and-eat it.
~Robotto

