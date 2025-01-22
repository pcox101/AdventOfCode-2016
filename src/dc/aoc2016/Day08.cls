Class dc.aoc2016.Day08 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input08.txt")
    
    s height = 6, width = 50
    for row = 0:1:(height-1) d
    . for col = 0:1:(width-1) d
    .. s grid(row,col) = "." 

    while 'stream.AtEnd {
	    set line=stream.ReadLine()
        if $p(line," ",1) = "rect" d
        . s w = $p($p(line, " ",2),"x",1)
        . s h = $p($p(line, " ",2),"x",2)
        . for row = 0:1:(h-1) d
        .. for col = 0:1:(w-1) d
        ... s grid(row,col) = "#" 
        if $p(line," ",1) = "rotate" d
        . if ($p(line," ",2) = "column") d
        .. s col=$p($p(line," ",3),"=",2)
        .. s by=$p(line," ",5)
        .. f row = 0:1:(height-1) d
        ... s newrow = (row + by) # height
        ... s nc(newrow) = grid(row,col)
        .. f row = 0:1:(height-1) d
        ... s grid(row,col) = nc(row)
        . if ($p(line," ",2) = "row") d
        .. s row=$p($p(line," ",3),"=",2)
        .. s by=$p(line," ",5)
        .. f col = 0:1:(width-1) d
        ... s newcol = (col + by) # width
        ... s nr(newcol) = grid(row,col)
        .. f col = 0:1:(width-1) d
        ... s grid(row,col) = nr(col)
    }

    s counter = 0
    for row = 0:1:(height-1) d
    . for col = 0:1:(width-1) d
    .. w grid(row,col)
    .. i grid(row,col) = "#" s counter=counter + 1
    . w !

    w "Part 1: ",counter,!

    return
}

ClassMethod Run2(verbose = 0)
{
    s stream=..GetInput("input07.txt")
    
    s counter = 0
    while 'stream.AtEnd {
	    set line=stream.ReadLine()
        k hypernetseqs, nonhypernetseqs
        s line = $e(line,1,$l(line) - 1) ; Strip off the non-unix cr
        s inhypernet = 0
        f pos=1:1:$l(line) d
        . s match = $LOCATE(line,"([a-z])(?!\1)([a-z])\1|\[|\]",pos,,val)
        . if val = "[" s inhypernet = 1
        . if val = "]" s inhypernet = 0
        . if (val '= "[") & (val '= "]") d
        .. i inhypernet s hypernetseqs(val) = 1
        .. i 'inhypernet s nonhypernetseqs(val) = 1
        
        ; Loop through non non-hypernet sequences seeing if the reverse
        ; is in the hypernet sequences
        s valid = 0
        s o = ""
        f  d  q:o=""
        . s o = $O(nonhypernetseqs(o))
        . q:o=""
        . s rev = $e(o,2,2) _ $e(o,1,1) _ $e(o,2,2)
        . if $d(hypernetseqs(rev)) s valid = 1

        i valid s counter = counter + 1

    }

    w "Part 2: ",counter,!

    return
}

}
