# Colour"Blind"
A collection of colour blind friendly colour tables for both discrete and continuous data, provided for use with the Interactive Data Language (IDL).

This repository was inspired after many people approached me to judge the colour blind friendliness of their plots. The final aim of this repository is to collate colours tables from many sources (see "code descriptions and their origins") and provide them in an easy-to-use format. 

If you wish to acknowledge use of this repository, I recommend text such as the following:

* > Some/all of the figures within this paper were produced using IDL colour blind friendly colour tables \citep[see][]{pjwright}.
* > This research made use of IDL colour blind friendly colour tables \citep[see][]{pjwright}.

where the BibTeX entry is as follows ([In accordance with advice outlined by the AAS](http://journals.aas.org/authors/references.html)):

>@misc{pjwright,   
author = {Paul J. Wright},  
title = {{Colour"Blind": A Collection of IDL Colour Blind Friendly Colour Tables}},  
month = Aug,  
year = 2017,  
doi = {10.5281/zenodo.840393},  
publisher = {Zenodo},  
url = {[https://github.com/PaulJWright/ColourBlind](https://github.com/PaulJWright/ColourBlind)}    
}

<a href="https://doi.org/10.5281/zenodo.840393"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.840393.svg" alt="DOI"></a>

#### Publications using Colour"Blind":

1. [Wright, P. J., Hannah, I. G., Grefenstette, B. W., et al. 2017, ApJ,
844, 132](http://iopscience.iop.org/article/10.3847/1538-4357/aa7a59/meta) \[Open Access]

------------
## Colour Blindness

Colour blindness is really a misnomer. Those who are colour blind are generally colour vision deficient, which is the inability to distinguish certain colours rather than not being able to see them at all. 

<a title="By Nanobot (Own work) [Public domain], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File%3AColor_blindness.png"><img width="480" alt="Color blindness" src="https://upload.wikimedia.org/wikipedia/commons/a/af/Color_blindness.png"/></a>

One method for detecting someone's ability to perceive colour, is the Ishihara test:

### [Ishihara colour perception test](https://en.wikipedia.org/wiki/Ishihara_test)

Two example Ishihara colour test plates ([Source: Wikipedia](https://en.wikipedia.org/wiki/Ishihara_test))

![Ishihara Test Plate](https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Ishihara_1.svg/240px-Ishihara_1.png) ![Ishihara Test Plate](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Ishihara_9.png/240px-Ishihara_9.png)

> (Left) Demonstration plate designed to be visible by all persons, whether normal or colour vision deficient. (Right) The number "74" should be clearly visible to viewers with normal colour vision. Viewers with [dichromacy](https://en.wikipedia.org/wiki/Dichromacy) or anomalous [trichromacy](https://en.wikipedia.org/wiki/Trichromacy) may read it as "21", and viewers with [monochromacy](https://en.wikipedia.org/wiki/Monochromacy) may see nothing.

### A Comment on loadct,4

[9th August 2016]

I am currently investigating a replacement for <b>loadct,4</b> (a notoriously bad colour table for those with colour blindness) where the middle of the colour table is centered on 0.

<a><img width="240" alt="loadct, 4" src="https://github.com/PaulJWright/ColourBlind/blob/master/images/loadct4.png"/>
<img width="240" alt="loadct, 4_new" src="https://github.com/PaulJWright/ColourBlind/blob/master/images/loadct4a.png"/>
<img width="360" alt="loadct, 4_new test plot" src="https://github.com/PaulJWright/ColourBlind/blob/master/images/CT_Test.png"/>
</a>

> (Left) loadct,4. (Right) a work in progress that aims to replace loadct,4 in situations where the middle of the colour table is located at 0.
---------------------

## Code descriptions and their origins:

**colorblind.pro:**

  A set of 7 (+ black and white) colour blind friendly colours based on the notes of Paul Tol (https://personal.sron.nl/~pault/):
    
> For 5 or more colours, I use them in clockwise order from bottom left (https://personal.sron.nl/~pault/images/betterdistinct.png): blue, cyan, green, yellow, red, pink, grey (and black). For 4 or fewer colours, I switch cyan and red: blue, red, green, yellow. But I deviate when plot lines have a logical colour association, e.g. cloud fraction above oceans blue and above desert yellow.

```IDL
.compile colorblind.pro
colorblind, n_colors=7, /ploteps
; the code loads in a 7 colour colour table and outputs an 
; EPS indicating the color indexes for the range of n_colors (SolarSoftWare required)
xpalette ;xpalette will display the colour table 
; plot as normal, i.e.:
plot,x,y,color=0 ;color = 0 through 8
```
![colorblind.pro xpalette](https://github.com/PaulJWright/ColourBlind/blob/master/images/colorblind.png)


**colorblind2.pro:**

A set of 7 (+ black and white) colour blind friendly colours. These colours are more vibrant than **colorblind.pro**. Inspired in some part by [Wong, B. Nat. Methods 8, 441 (2011)](https://www.nature.com/nmeth/journal/v8/n6/full/nmeth.1618.html).


```IDL
.compile colorblind2.pro
colorblind2, n_colors=7, /ploteps
; the code loads in a 7 colour colour table and outputs an 
; EPS indicating the color indexes for the range of n_colors (SolarSoftWare required)
xpalette ;xpalette will display the colour table 
; plot as normal, i.e.:
plot,x,y,color=0 ;color = 0 through 8
```
![colorblind2.pro xpalette](https://github.com/PaulJWright/ColourBlind/blob/master/images/cb2.png)


**npr_colors.pro:**

A set of 6 (+ black and white) colour blind friendly colours based on those used by [NPR (Credit: Katie Park, Alyson Hurt, Tyler Fisher and Lisa Charlotte Rost/NPR)
](http://www.npr.org/2016/04/18/474256366/why-americas-schools-have-a-money-problem).


```IDL
.compile npr_colors.pro
npr_colors
; the code loads in all colours
xpalette ;xpalette will display the colour table 
; plot as normal, i.e.:
plot,x,y,color=0 ;color = 0 through 8
```

![NPR Colours](https://github.com/PaulJWright/ColourBlind/blob/master/images/npr_colorblind3.png)
---------------------

### Further Reading:

 * [Paul Tol's Personal Website](https://personal.sron.nl/~pault/): An excellent selection of existing IDL routines for discrete and continuous colour tables: **distinct_colors.pro**; **sunset_colors.pro**; **burd_colors.pro**; **rainbow_colors.pro**

 * [Wong, B. Nat. Methods 8, 441 (2011)](https://www.nature.com/nmeth/journal/v8/n6/full/nmeth.1618.html): A short piece on colour blindness in Nature Methods.
 * [http://blog.usabilla.com/how-to-design-for-color-blindness/](http://blog.usabilla.com/how-to-design-for-color-blindness/)
 * [http://mkweb.bcgsc.ca/colorblind/](http://mkweb.bcgsc.ca/colorblind/)
 * [http://jfly.iam.u-tokyo.ac.jp/color/](http://jfly.iam.u-tokyo.ac.jp/color/)
 * [https://knightlab.northwestern.edu/2016/07/18/three-tools-to-help-you-make-colorblind-friendly-graphics/](https://knightlab.northwestern.edu/2016/07/18/three-tools-to-help-you-make-colorblind-friendly-graphics/)
 
### Useful Links:

* [Color Oracle](http://colororacle.org/) is a free colour blindness simulator for Linux/Mac/Windows. In their own words: "it takes the guesswork out of designing for colour blindness by showing you in real time what people with common colour vision impairments will see."
* [coolors.co](https://coolors.co/) is a free colour scheme generator.
* [Gregor Aisch’s chroma tool](http://gka.github.io/palettes) is useful for optimizing your diverging colour palettes. It can help you take two or more colors and generate a full scale of in-between values.
* [ColorBrewer](http://colorbrewer2.org/) has a range of palettes that are colorblind safe.
* [Multi-hued Color Scales](https://www.vis4.net/blog/posts/mastering-multi-hued-color-scales/) A blog post on multi-hued colour scales.
* [COLOURLovers](www.colourlovers.com/) Pre-made colour palettes, and trends.
