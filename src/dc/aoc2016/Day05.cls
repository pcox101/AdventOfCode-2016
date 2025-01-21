Class dc.aoc2016.Day05 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s input = "ffykfhsq"

    s output = ""
    s done = 0
    f i=1:1 d  q:done
    . s val = ##class(%xsd.hexBinary).LogicalToXSD(##class(%SYSTEM.Encryption).MD5Hash(input _ i))
    . i $e(val,1,5) = "00000" d
    .. s output = output _ $e(val,6)
    .. if $l(output) = 8 s done = 1

    w "Part 1: ",output,!

    return
}

ClassMethod Run2(verbose = 0)
{
    s input = "ffykfhsq"

    s output(0) = ""
    s output(1) = ""
    s output(2) = ""
    s output(3) = ""
    s output(4) = ""
    s output(5) = ""
    s output(6) = ""
    s output(7) = ""


    s finalString = ""

    s done = 0
    f i=1:1 d  q:done
    . s val = ##class(%xsd.hexBinary).LogicalToXSD(##class(%SYSTEM.Encryption).MD5Hash(input _ i))
    . i $e(val,1,5) = "00000" d
    .. s pos = $e(val,6)
    .. if ($a(pos) > 47) & ($a(pos) < 56) d
    ... s:(output(pos) = "") output(pos) = $e(val,7)
    .. s finalString = output(0) _ output(1) _ output(2)_ output(3)_ output(4)_ output(5)_ output(6)_ output(7)
    .. if $l(finalString) = 8 s done = 1

    w "Part 1: ",finalString,!

    return
}

}
