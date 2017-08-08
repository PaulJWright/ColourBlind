PRO colorblind2, N_colors = colnum, PLOTEPS = ploteps
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
  ; 2017.08.08 ;--- (Paul J. Wright, Glasgow) Written
  ;
  ;-
  ; =========================================================================

  
  IF KEYWORD_SET(colnum) THEN BEGIN
    colnum = ROUND(colnum)
    IF (colnum LT 1 OR colnum GT 7) THEN BEGIN
      MESSAGE, 'Number of colors is 1-7, set to 7.', /INFORMATIONAL
      colnum = 7
    ENDIF
  ENDIF

  ; color coordinates
  xarr = [[0, 0, 0, 0, 0, 0, 0], $ ;For 4 or fewer colors, I switch cyan and red: blue, red, green, yellow.
          [0, 4, 0, 0, 0, 0, 0], $ ;
          [0, 4, 2, 0, 0, 0, 0], $ ;
          [0, 4, 2, 3, 0, 0, 0], $ ;
          [0, 1, 2, 3, 4, 0, 0], $
          [0, 1, 2, 3, 4, 5, 0], $
          [0, 1, 2, 3, 4, 5, 6]]
  x = xarr[0:colnum-1,colnum-1]
  red_original   = [0,86,0,240,230,213,204]
  green_original = [114,180,158,228,159,94,121]
  blue_original  = [178,233,115,66,0,0,167]
  
  red = red_original[[x]]
  green = green_original[[x]]
  blue = blue_original[[x]]
  
  scrclr = [[0,0,0],[255,255,255]]
  R = [scrclr[0,0], red, INTARR(255 - N_ELEMENTS(x)) + scrclr[0,1]]
  G = [scrclr[1,0], green, INTARR(255 - N_ELEMENTS(x)) + scrclr[1,1]]
  B = [scrclr[2,0], blue, INTARR(255 - N_ELEMENTS(x)) + scrclr[2,1]]
  
  TVLCT, R, G, B
  IF KEYWORD_SET(ploteps) THEN BEGIN
    font='Helvetica'   
    fontsz=12
    !p.charsize=1.
    !p.font=1
    !p.multi=0
    setplot,'ps'
    device, filename='colorblind.eps', /color,BITS_PER_PIXEL=8,xsize=12.5,ysize=12.5,/encapsulated,set_font=font,font_size=fontsz,/tt_font
    arrp=make_array(9,9) ;includes white and black at ends
    xarr2=xarr
    xarr2[where(xarr gt 0.)]=xarr2[where(xarr gt 0.)]+1
    xarr2[0,*]=1.
    arrp[1:-2,1:-2]=xarr2
    arrp[where(arrp eq 0.)]=8
    arrp[0,1:-2]=0.
    arrp[*,0]=8.
    arrp[*,-1]=8.
    scrclr = [[0,0,0],[255,255,255]]
    R_plot = [scrclr[0,0], red_original, INTARR(255 - 8) + scrclr[0,1]]
    G_plot = [scrclr[1,0], green_original, INTARR(255 - 8) + scrclr[1,1]]
    B_plot = [scrclr[2,0], blue_original, INTARR(255 - 8) + scrclr[2,1]]
    TVLCT, R_plot, G_plot, B_plot
    map=make_map(arrp)
    plot_image,map.data,min=0,max=255,xtitle='color Index',ytitle='Number of colors (N_color)',xr=[-1,9],yr=[-1.,9],PIXEL_ASPECT_RATIO=1.,/NOSQUARE,POSITION=[0.15,0.15-0.05,0.9,0.9-0.05];,xthick=4,ythick=4
    for i=0,8 do xyouts,i,9.25,'['+strcompress(r_plot[i],/rem)+','+strcompress(g_plot[i],/rem)+','+strcompress(b_plot[i],/rem)+']',orientation=45,color=i
    for i=0,7 do begin
      oplot,[-0.5,8.5],[i+0.5,i+0.5],color=8
      oplot,[i-0.5,i-0.5],[0.5,7.5],color=8
    endfor
    device,/close
    setplot,'x'
  ENDIF
  
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