Class dc.aoc2016.Day02 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input02.txt")
    
    s x = 0, y = 0

    s d("U") = "0,1"
    s d("R") = "1,0"
    s d("D") = "0,-1"
    s d("L") = "-1,0"

    s k(1,1) = 7
    s k(2,1) = 8
    s k(3,1) = 9
    s k(1,2) = 4
    s k(2,2) = 5
    s k(3,2) = 6
    s k(1,3) = 1
    s k(2,3) = 2
    s k(3,3) = 3
    
    s x = 2, y = 2
    
    s output = ""
    while 'stream.AtEnd {
	  set line=stream.ReadLine()
      
      f i = 1:1:$l(line) - 1 {
        s c = $e(line,i)
        s nx = x + $p(d(c),",",1)
        s ny = y + $p(d(c),",",2)
        if $d(k(nx,ny)) > 0 {
            s x = nx, y = ny
        }
        ; w " ",x,",",y,!
      }
      s output = output _ k(x,y)
      ;w output,!
    }

    w "Part 1: ",output,!

    return
}

ClassMethod Run2(verbose = 0)
{
    s stream=..GetInput("input02.txt")
    
    s x = 0, y = 0

    s d("U") = "0,1"
    s d("R") = "1,0"
    s d("D") = "0,-1"
    s d("L") = "-1,0"

    s k(1,3) = "5"
    s k(2,2) = "A"
    s k(2,3) = "6"
    s k(2,4) = "2"
    s k(3,1) = "D"
    s k(3,2) = "B"
    s k(3,3) = "7"
    s k(3,4) = "3"
    s k(3,5) = "1"
    s k(4,2) = "C"
    s k(4,3) = "8"
    s k(4,4) = "4"
    s k(5,3) = "9"
    s x = 1, y = 3
    
    s output = ""
    while 'stream.AtEnd {
	  set line=stream.ReadLine()
      
      f i = 1:1:$l(line) - 1 {
        s c = $e(line,i)
        s nx = x + $p(d(c),",",1)
        s ny = y + $p(d(c),",",2)
        if $d(k(nx,ny)) > 0 {
            s x = nx, y = ny
        }
        ; w " ",x,",",y,!
      }
      s output = output _ k(x,y)
      ;w output,!
    }

    w "Part 2: ",output,!

    return
}

}
