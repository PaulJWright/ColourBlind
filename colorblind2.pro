  ; =========================================================================
  ;+
  ;
  ; NAME:
  ; colorblind2
  ;
  ; PURPOSE:
  ; Provide a set of colorblind friendly colors based on
  ; 
  ;   Points of view: Color blindness
  ;   Nature Methods 8, 441 (2011) doi:10.1038/nmeth.1618
  ; 
  ;
  ; CALLING SEQUENCE:
  ;     colorblind2
  ;
  ; INPUTS:
  ; 
  ;
  ; OUTPUTS:
  ;
  ;
  ; OPTIONAL INPUT KEYWORD PARAMETERS:
  ;       
  ;
  ;
  ; EXAMPLE:
  ;       colorblind 
  ;
  ; COMMON BLOCKS:
  ;       None.
  ;
  ; CONTACT:
  ;
  ;       Comments, feedback, and bug reports regarding this routine may be
  ;       directed to this email address: ; paul@pauljwright.co.uk
  ;       
  ;                https://github.com/PaulJWright/ColourBlind
  ;
  ; MODIFICATION HISTORY:
  ;
  ;2017.08.08 ;--- (Paul J. Wright, Glasgow) Written
  ;
  ;-
  ; =========================================================================

  
  red   = [230,86,0,240,0,213,204]
  green = [159,180,158,228,114,94,121]
  blue  = [0,233,115,66,178,0,167]
  
  scrclr = [[0,0,0],[255,255,255]]
  R = [scrclr[0,0], red, INTARR(255 - N_ELEMENTS(x)) + scrclr[0,1]]
  G = [scrclr[1,0], green, INTARR(255 - N_ELEMENTS(x)) + scrclr[1,1]]
  B = [scrclr[2,0], blue, INTARR(255 - N_ELEMENTS(x)) + scrclr[2,1]]
  
  TVLCT, R, G, B
  
  print, 'To spread the word, please cite work as follows: '
  print, ''
  print, '@misc{pjwright, author = {Paul J. Wright},'
  print, 'title = {{A Collection of Colour Blind Friendly Colour Tables}},'
  print, 'month = Aug,'
  print, 'year = 2017,'
  print, 'doi = {10.5281/zenodo.840393},'
  print, 'version = {1.0},'
  print, 'publisher = {Zenodo},'
  print, 'url = {doi.org/10.5281/zenodo.840393}'
  print, '}'
  
  
END