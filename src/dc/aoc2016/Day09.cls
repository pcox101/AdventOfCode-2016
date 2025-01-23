Class dc.aoc2016.Day09 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod CountCharacters(line = "", recurse = 0)
{
    s counter = 0
    s inBracket = 0
    for i=1:1:$l(line) d
    . ; w $e(line,i,i)
    . i $e(line,i,i) = "(" d
    .. s inBracket = i
    . i $e(line,i,i) = ")" d
    .. s p = $e(line,inBracket+1,i-1)
    .. s chars = $p(p,"x",1)
    .. s reps = $p(p,"x",2)
    .. i 'recurse s counter = counter + (reps * chars) - 1
    .. i recurse s counter = counter + (reps * ..CountCharacters($e(line, i + 1, i + chars),1)) - 1
    .. s i = i + chars
    .. s inBracket = 0
    . i 'inBracket s counter = counter + 1
    return counter
}

ClassMethod Run(verbose = 0)
{
    Try {
        s stream=..GetInput("input09.txt")
        
        set l=stream.ReadLine()
        
        s c = ..CountCharacters(l)
        w "Part 1: ",c,!

        s c = ..CountCharacters(l, 1)
        w "Part 2: ",c,!
    } Catch ex {
        W "Exception! ", ex, " @ ", ex.Location, " - ", ex.Data,!
    } 

    return
}

}
