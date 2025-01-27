Class dc.aoc2016.Day11.Floor Extends %RegisteredObject
{

Property Contents As list Of Item;

Method Write()
{
    w "["
    f i=1:1:..Contents.Count() {
        d ..Contents.GetAt(i).Write()
    }
    w "] "
}

Method IsValid()
{
    ; It's not valid if...
    ; . There is a generator
    ; . There is an unpowered microchip
    ; on the same floor
    s hasGenerator = 0
    f i=1:1:..Contents.Count() {
        i ..Contents.GetAt(i).ItemType = "G" s hasGenerator = 1
    }

    i hasGenerator {
        f i=1:1:..Contents.Count() {
            s microchip = ..Contents.GetAt(i)
            i microchip.ItemType = "M" {
               s isPowered = 0
               f j=1:1:..Contents.Count() {
                  s item = ..Contents.GetAt(j)
                  i (item.ItemType = "G") & (item.Element = microchip.Element) s isPowered = 1
               }
               if 'isPowered {
                  return 0
               }
            }
        }
    }
    return 1
}

Method Clone()
{
    s newFloor = ##class(dc.aoc2016.Day11.Floor).%New()
    s newFloor.Contents = ..Contents
    return newFloor
}

}
