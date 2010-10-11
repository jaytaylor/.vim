function! HtmlComment()
  "execute ":s/[^ ]/<!-- &/"
  "execute ":s/$/ -->/"
  :s/[^ ]/<!-- &/
  :s/$/ -->/
endfun
