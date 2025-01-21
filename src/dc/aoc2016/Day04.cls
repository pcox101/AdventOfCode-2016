Class dc.aoc2016.Day04 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input04.txt")
    
    s counter = 0
    while 'stream.AtEnd {
	    set line=stream.ReadLine()
      k vals
      for i = 1:1:($l(line,"-") - 1) d
      . s section = $p(line,"-",i)
      . f j = 1:1:$l(section) d
      .. s char = $e(section,j)
      .. if $d(vals(char)) s vals(char) = vals(char) + 1
      .. e  s vals(char) = 1 

      k list

      ; Use the array construct to sort by number (reverse order) then character (alphabetically)
      s key = $O(vals(""))
      for i=1:1 d  q:key=""
      . s list((100 - vals(key))_"!"_key) = vals(key)_"!"_key
      . s key = $o(vals(key))

      s checksum=""
      s key = $o(list(""))
      for i=1:1:5 D  I key="" Q
      . s checksum = checksum _ $p(key,"!",2)
      . s key = $o(list(key))
      
      s summary = $p(line,"-",$l(line,"-"))
      s roomChecksum = $e(summary,5,9)
      s sectorId = $e(summary,1,3)
      ; w roomChecksum,",",sectorId,!
      i roomChecksum = checksum s counter = counter + sectorId

    }

    w "Part 1: ",counter,!

    return
}

ClassMethod Run2(verbose = 0)
{
    s stream=..GetInput("input04.txt")
    
    s counter = 0
    while 'stream.AtEnd {
	    set line=stream.ReadLine()
      
      s summary = $p(line,"-",$l(line,"-"))
      s sectorId = $e(summary,1,3)

      s rotate = sectorId # 26
      
      s decrypted = ""
      for i = 1:1:($l(line) - 11) D
      . i $e(line, i) = "-" s decrypted = decrypted _ " " q
      . s nc = $ASCII($e(line, i)) + rotate
      . i nc > 122 s nc = nc - 26
      . s decrypted = decrypted _ $CHAR(nc)

      w sectorId," - ",decrypted,!
      
    }

    w "Part 2: ",counter,!

    return
}

}
