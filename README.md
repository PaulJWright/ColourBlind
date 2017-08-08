# Colour"Blind"
A collection of colour blind friendly colour tables for both discrete and continuous data, provided for use with the Interactive Data Language (IDL).

This repository was inspired after many people approached me to judge the colour blind friendliness of their plots. The final aim of this repository is to collate colours tables from many sources (see "code descriptions and their origins") and provide them in an easy-to-use format. 

If you wish to acknowledge use of this repository, I recommend text as follows:

> Some/all of the figures within this paper were produced using IDL colour blind friendly colour tables \citep[see][]{pjwright}.

where the BibTeX entry is as follows ([In accordance with advice outlined by the AAS](http://journals.aas.org/authors/references.html)):

>@misc{pjwright,   
author = {Paul J. Wright},  
title = {{Colour"Blind": A Collection of IDL Colour Blind Friendly Colour Tables}},  
month = Aug,  
year = 2017,  
doi = {10.5281/zenodo.840393},  
version = {1.0},  
publisher = {Zenodo},  
url = {[https://github.com/PaulJWright/ColourBlind](https://github.com/PaulJWright/ColourBlind)}    
}

<a href="https://doi.org/10.5281/zenodo.840393"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.840393.svg" alt="DOI"></a>

#### Publications using Colour"Blind":

1. [Wright, P. J., Hannah, I. G., Grefenstette, B. W., et al. 2017, ApJ,
844, 132](http://iopscience.iop.org/article/10.3847/1538-4357/aa7a59/meta) \[Open Access]



---------------------

## Code descriptions and their origins:

**colorblind.pro:**

  A set of 7 colorblind friendly colors based on the notes of Paul Tol (https://personal.sron.nl/~pault/):
    
> For 5 or more colors, I use them in clockwise order from bottom left (https://personal.sron.nl/~pault/images/betterdistinct.png): blue, cyan, green, yellow, red, pink, grey (and black). For 4 or fewer colors, I switch cyan and red: blue, red, green, yellow. But I deviate when plot lines have a logical color association, e.g. cloud fraction above oceans blue and above desert yellow.

```IDL
.compile colorblind
colorblind, n_colors=7, /ploteps
; the code loads in a 7 colour colour table and outputs an 
; EPS indicating the color indexes for the range of n_colors (SolarSoftWare required)
xpalette ;xpalette will display the colour table 
; plot as normal, i.e.:
plot,x,y,color=0 ;color = 0 through 7
```
![colorblind.pro xpalette](https://github.com/PaulJWright/ColourBlind/blob/master/images/colorblind.png)


**.pro:**
> ...

---------------------

### Further Reading:

 * [Paul Tol's Personal Website](https://personal.sron.nl/~pault/): An excellent selection of existing IDL routines for discrete and continuous colour tables: **distinct_colors.pro**; **sunset_colors.pro**; **burd_colors.pro**; **rainbow_colors.pro**

 * [Wong, B. Nat. Methods 8, 441 (2011)](https://www.nature.com/nmeth/journal/v8/n6/full/nmeth.1618.html): A short piece on colour blindness in Nature Methods.
 * [http://blog.usabilla.com/how-to-design-for-color-blindness/](http://blog.usabilla.com/how-to-design-for-color-blindness/)
 * [http://mkweb.bcgsc.ca/colorblind/](http://mkweb.bcgsc.ca/colorblind/)
 * [http://jfly.iam.u-tokyo.ac.jp/color/](http://jfly.iam.u-tokyo.ac.jp/color/)
 
### Useful Links:

* [Color Oracle](http://colororacle.org/) is a free colour blindness simulator for Linux/Mac/Windows. In their own words: "it takes the guesswork out of designing for color blindness by showing you in real time what people with common color vision impairments will see."

