Class dc.aoc2016.Day06 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input06.txt")
    
    s counter = 0
    while 'stream.AtEnd {
	    set line=stream.ReadLine()
        for i = 1:1:$l(line) d
        . s c = $e(line,i)
        . if $d(total(i,c)) s total(i,c) = total(i,c) + 1
        . e  s total(i,c) = 1
    }

    s output1 = ""
    s output2 = ""
    s c = $o(total(""))
    for i=1:1 d  q:c=""
    . s n = $o(total(c,""))
    . s max = 0, maxchar = ""
    . s min = 99999, minchar = ""
    . for j=1:1 d  q:n=""
    .. if total(c,n) > max s max = total(c,n), maxchar = n
    .. if total(c,n) < min s min = total(c,n), minchar = n
    .. s n = $o(total(c,n))
    . s output1 = output1 _ maxchar
    . s output2 = output2 _ minchar
    . s c = $o(total(c))

    w "Part 1: ",output1,!
    w "Part 2: ",output2,!

    return
}

}
