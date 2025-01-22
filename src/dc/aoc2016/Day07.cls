Class dc.aoc2016.Day07 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input07.txt")
    
    s counter = 0
    while 'stream.AtEnd {
	    set line=stream.ReadLine()
        s line = $e(line,1,$l(line) - 1) ; Strip off the non-unix cr
        s pos = 1
        s inhypernet = 0
        s valid = 0
        s invalid = 0
        s match = $LOCATE(line,"([a-z])(?!\1)([a-z])\2\1|\[|\]",pos,pos,val)
        if match d
        . f  d  q:'match
        .. if val = "[" s inhypernet = 1
        .. if val = "]" s inhypernet = 0
        .. if (val '= "[") & (val '= "]") d
        ... i inhypernet s invalid = 1
        ... i 'inhypernet s valid = 1
        .. s match = $LOCATE(line,"([a-z])(?!\1)([a-z])\2\1|\[|\]",pos,pos,val)
        
        i valid & 'invalid s counter = counter + 1
    }

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
