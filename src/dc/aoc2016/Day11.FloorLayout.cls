Class dc.aoc2016.Day11.FloorLayout Extends %RegisteredObject
{

Property Floors As list Of Floor;

Method Write()
{
    f i=1:1:..Floors.Count() {
        d ..Floors.GetAt(i).Write()
    }
    w !
}

Method IsValid()
{
    s isValid = 1
    f i=1:1:..Floors.Count() {
        i '..Floors.GetAt(i).IsValid() s isValid = 0
    }
    return isValid
}

Method getHash(myFloor)
{
    s hash = ""
    f i=1:1:..Floors.Count() {
        s hash=hash_i_" "
        if i = myFloor s hash=hash_"(E) ["
        e  s hash=hash_"( ) ["
        s floor = ..Floors.GetAt(i)
        s generators = 0, microchips = 0
        f j=1:1:floor.Contents.Count() {
            s item = floor.Contents.GetAt(j)
            i item.ItemType = "G" s generators = generators + 1
            e  s microchips=microchips + 1
        }
        s hash = hash _ microchips _ "." _ generators _ "] "
    }
    return hash
}

Method Clone()
{
    s newLayout = ##class(dc.aoc2016.Day11.FloorLayout).%New()
    f i=1:1:..Floors.Count() {
        s newFloor = ..Floors.GetAt(i).Clone()
        d newLayout.Floors.Insert(newFloor)
    }
    return newLayout
}

}
