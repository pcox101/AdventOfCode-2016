Class dc.aoc2016.Base
{

Parameter Folder = "/irisdev/app/data/";

ClassMethod GetInput(fn) As %Stream.Object
{
   
    set fn=..#Folder_fn
    set stream = ##Class(%Stream.FileCharacter).%New()
    set sc=stream.LinkToFile(fn)
    return stream
}

}
