Class dc.aoc2016.Day11 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input11.txt")
    Try {

    ; Note that I heard about this day while doing 2024 AOC and decided to have a go at it, so I have
    ; an implementation in Kotlin that I just converted to M for this task, even though I already
    ; had the stars...
    ; For most days so far I have (intentionally) kept to standard M but this one does tend to be
    ; a good fit for trying an OO approach

    s matcher=##class(%Regex.Matcher).%New("(polonium|hydrogen|thulium|lithium|promethium|ruthenium|cobalt|dilithium|elerium)(-compatible microchip| generator)")

    s totalItems = 0, initialLayout = ##class(dc.aoc2016.Day11.FloorLayout).%New()
    while 'stream.AtEnd {
	    set line=stream.ReadLine()
        s matcher.Text = line
        s floor = ##class(dc.aoc2016.Day11.Floor).%New()
        while matcher.Locate() {
            s item = ##class(dc.aoc2016.Day11.Item).%New()
            i matcher.Group(2) = "-compatible microchip" s item.ItemType = "M"
            i matcher.Group(2) = " generator" s item.ItemType = "G"
            s item.Element = matcher.Group(1)
            d floor.Contents.Insert(item)
            s totalItems = totalItems + 1
        }
        d initialLayout.Floors.Insert(floor)
    }
    
    ; w "Valid: ",initialLayout.IsValid(),!
    ; w "Hash: ", initialLayout.getHash(1),!
    d initialLayout.Write()

    ; Queue construct. We will use a subscripted variable and use $O to get the head
    ; and the tail.
    
    s queueEntry = ##class(dc.aoc2016.Day11.QueueEntry).%New()
    s queueEntry.CurrentFloor = 1
    s queueEntry.NumberOfSteps = 0
    s queueEntry.Layout = initialLayout

    s q(1) = queueEntry
    s visited(queueEntry.Layout.getHash(1)) = 1

    s finalNumberOfSteps = 0

    while $o(q("")) > 0 {
        ; pop
        s key = $o(q(""))
        s queueEntry = q(key)
        k q(key)

        ;w "Processing: ",key,!
        
        if queueEntry.Layout.Floors.GetAt(4).Contents.Count() = totalItems {
            s finalNumberOfSteps = queueEntry.NumberOfSteps
            quit
        }

        // Now we can move up/down a floor taking one or two of the items
        // with us
        
        for nextFloor = (queueEntry.CurrentFloor - 1):2:(queueEntry.CurrentFloor+1) {
            ; One item
            if nextFloor < 5 & nextFloor > 0 { 
                f item = 1:1:queueEntry.Layout.Floors.GetAt(queueEntry.CurrentFloor).Contents.Count() {
                    s newLayout = queueEntry.Layout.Clone()
                    s itemValue = newLayout.Floors.GetAt(queueEntry.CurrentFloor).Contents.GetAt(item)
                    d newLayout.Floors.GetAt(queueEntry.CurrentFloor).Contents.RemoveAt(item)
                    d newLayout.Floors.GetAt(nextFloor).Contents.Insert(itemValue)
                    s hash = newLayout.getHash(nextFloor)
                    i newLayout.IsValid() & '$d(visited(hash)) {
                        s visited(hash) = 1
                        ; push
                        s key = $o(q(""),-1) + 1
                        s newQE = ##class(dc.aoc2016.Day11.QueueEntry).%New()
                        s newQE.CurrentFloor = nextFloor
                        s newQE.NumberOfSteps = queueEntry.NumberOfSteps + 1
                        s newQE.Layout = newLayout
                        s q(key) = newQE
                    }
                }

                ; Two items
                f item1 = 1:1:(queueEntry.Layout.Floors.GetAt(queueEntry.CurrentFloor).Contents.Count() - 1) {
                  f item2 = item1+1:1:queueEntry.Layout.Floors.GetAt(queueEntry.CurrentFloor).Contents.Count() {
                    s newLayout = queueEntry.Layout.Clone()
                    s itemValue2 = newLayout.Floors.GetAt(queueEntry.CurrentFloor).Contents.GetAt(item2)
                    s itemValue1 = newLayout.Floors.GetAt(queueEntry.CurrentFloor).Contents.GetAt(item1)
                    D newLayout.Floors.GetAt(queueEntry.CurrentFloor).Contents.RemoveAt(item2)
                    D newLayout.Floors.GetAt(queueEntry.CurrentFloor).Contents.RemoveAt(item1)
                    d newLayout.Floors.GetAt(nextFloor).Contents.Insert(itemValue1)
                    d newLayout.Floors.GetAt(nextFloor).Contents.Insert(itemValue2)
                    s hash = newLayout.getHash(nextFloor)
                    i newLayout.IsValid() & '$d(visited(hash)) {
                        s visited(hash) = 1
                        ; push
                        s key = $o(q(""),-1) + 1
                        s newQE = ##class(dc.aoc2016.Day11.QueueEntry).%New()
                        s newQE.CurrentFloor = nextFloor
                        s newQE.NumberOfSteps = queueEntry.NumberOfSteps + 1
                        s newQE.Layout = newLayout
                        s q(key) = newQE
                    }
                }
                }
            }
            
        }



    }

    w "Part 1: ",finalNumberOfSteps,!


    } Catch ex {
        W "Exception! ", ex.Name, " @ ", ex.Location, " - ", ex.Data,!
    } 

    return
}

ClassMethod Run2(verbose = 0)
{

    w "Part 2: ",0,!

    return
}

}
