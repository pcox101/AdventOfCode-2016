Class dc.aoc2016.Day01 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    ; Going to try to use standard MUMPS as much as I can (as long as I can remember it and where objectscript supports it!)
    ; but open doesn't seem to work so just copying the sample here
    ; set line=stream.ReadLine()
    set stream=..GetInput("input01.txt")
    set line=stream.ReadLine()
    
    s x = 0, y = 0, dir = 1

    s d(1) = "0,1"
    s d(2) = "1,0"
    s d(3) = "0,-1"
    s d(4) = "-1,0"
    
    set p2done = 0

    for i = 1:1:$l(line,", ") do
    . s m = $p(line, ", ", i)
    . i $e(m,1,1) = "R" s dir = dir + 1
    . e  s dir = dir - 1
    . i dir > 4 s dir = 1
    . i dir < 1 s dir = 4
    . f j = 1:1:$e(m, 2, $l(m)) d
    .. s xoffset = $p(d(dir),",",1)
    .. s yoffset = $p(d(dir),",",2)
    .. s x = x + xoffset, y = y + yoffset
    .. s key = x _ "," _ y
    .. i ($D(cache(key)) > 0) & (p2done = 0) d
    ... w "Part 2: ",$SYSTEM.SQL.Functions.ABS(x) + $SYSTEM.SQL.Functions.ABS(y),!
    ... s p2done = 1
    .. s cache(key) = "1"
    ; . w m, " ", xoffset,",",yoffset," ", x,",",y," ",d(dir),!
      
    w "Part 1: ", $SYSTEM.SQL.Functions.ABS(x) + $SYSTEM.SQL.Functions.ABS(y)

    return
}

}
