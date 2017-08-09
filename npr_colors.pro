PRO npr_colors
  ; =========================================================================
  ;+
  ;
  ; NAME:
  ; npr_colors
  ;
  ; PURPOSE:
  ; A set of 5 colours inspired by an NPR graphic
  ;   http://www.npr.org/2016/04/18/474256366/why-americas-schools-have-a-money-problem
  ;   Credit: Katie Park, Alyson Hurt, Tyler Fisher and Lisa Charlotte Rost/NPR
  ;
  ; CALLING SEQUENCE:
  ;     npr_colors
  ;
  ; INPUTS:
  ; N_colors   - [Mandatory] number of colors required (1-7)
  ;
  ; OUTPUTS:
  ;
  ;
  ; OPTIONAL INPUT KEYWORD PARAMETERS:
  ;       /PLOTEPS     - (Boolean) Set if you want to
  ;                     return eps file containing all colors
  ;
  ; EXAMPLE:
  ;       npr_colors
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
  ;       Credit: Katie Park, Alyson Hurt, Tyler Fisher and Lisa Charlotte Rost/NPR
  ;
  ; MODIFICATION HISTORY:
  ;
  ;2017.08.09 ;--- (Paul J. Wright, Glasgow) Written.
  ;
  ;-
  ; =========================================================================

 
  ; Original colours
  red   = [224,240,231,82,0]
  green = [70,159,223,192,98]
  blue  = [6,82,190,173,100]
  
  ; Adding a background grey
  red   = [red,237]
  green = [green,237]
  blue  = [blue,237]
  
  scrclr = [[0,0,0],[255,255,255]]
  R = [scrclr[0,0], red, INTARR(255 - N_ELEMENTS(x)) + scrclr[0,1]]
  G = [scrclr[1,0], green, INTARR(255 - N_ELEMENTS(x)) + scrclr[1,1]]
  B = [scrclr[2,0], blue, INTARR(255 - N_ELEMENTS(x)) + scrclr[2,1]]
  
  TVLCT, R, G, B

  print, 'To spread the word, please cite work as Wright (2017). Details can be found at https://github.com/PaulJWright/ColourBlind'
  
END