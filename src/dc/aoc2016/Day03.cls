Class dc.aoc2016.Day03 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input03.txt")
    
    s counter = 0
    while 'stream.AtEnd {
	    set line=stream.ReadLine()
      s pos = 1
      f i = 1:1:3 {
        S val=""
        s x = $LOCATE(line, "\d{1,3}", pos, pos, val)
        s s(i) = val
      }
      
      s v1 = (s(1) + s(2)) > s(3)
      s v2 = (s(1) + s(3)) > s(2)
      s v3 = (s(2) + s(3)) > s(1)

      if v1 & v2 & v3 s counter = counter + 1
    }

    w "Part 1: ",counter,!

    return
}

ClassMethod Run2(verbose = 0)
{
    s stream=..GetInput("input03.txt")
    
    s counter = 0
    while 'stream.AtEnd {
      f j = 1:1:3 {
        set line=stream.ReadLine()
        s pos = 1
        f i = 1:1:3 {
          S val=""
          s x = $LOCATE(line, "\d{1,3}", pos, pos, val)
          s s(j,i) = val
        }
      }
      
      f j = 1:1:3 {
        w "Comparing ",s(1,j),"-",s(2,j),"-",s(3,j),!
        s v1 = (s(1,j) + s(2,j)) > s(3,j)
        s v2 = (s(1,j) + s(3,j)) > s(2,j)
        s v3 = (s(2,j) + s(3,j)) > s(1,j)

        if v1 & v2 & v3 s counter = counter + 1
      }
    }

    w "Part 2: ",counter,!

    return
}

}
