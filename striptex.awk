#striptex - a simple filter to strip TeX formatting from a file
#by Piotr Michalak, 2026, MIT license

{lines[NR]=$0; linecount++}
END {
  print_blank=1
	for (i=1; i<linecount; i++){
    if ((lines[i] ~ /\\begin\{document\}/) || (lines[i] ~ /\\end\{equation(.)*\}/) ) print_blank=0
    if ((lines[i] ~ /\\begin\{equation(.)*\}/) ) print_blank=1
		if (print_blank == 1){
			print " "
		}else{
      gsub(/(\\it)|(\\bf)/,"", lines[i])
      gsub(/\[[a-zA-Z0-9!=\\\.]+\]/,"", lines[i])
	  	gsub(/\\cite(.)*\}/," ",lines[i])          #\cite.[]{xyz} -> " "
      gsub(/{[a-z0-9_\/\.:]+(\*)*}/,"{}",lines[i])     #\begin{equation} -> \begin{}
	  	gsub(/\\[a-z]+(\*)*\{/,"",lines[i])  #\begin{} -> }
	  	gsub(/^( )*\\[a-z]+$/," ",lines[i])  #\newline -> " "
	  	gsub(/\\[a-z]\\\\/," ",lines[i]) #\smallskip\\ -> " "
	  	gsub(/[\{\}\~]/," ",lines[i])          #} -> " "
	  	gsub(/[_\$\\]/, "", lines[i])
	  	gsub(/^( )*/, "", lines[i])
	  	gsub(/( )+\./, ".", lines[i])
      gsub(/( )+,/, ",", lines[i])
	  	gsub(/ ( )+/, " ", lines[i])
      print lines[i]
		}
	}
}
