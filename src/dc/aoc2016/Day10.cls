Class dc.aoc2016.Day10 Extends dc.aoc2016.Base
{

// w ##class(dc.aoc2016.Day1).Run()

ClassMethod Run(verbose = 0)
{
    s stream=..GetInput("input10.txt")
    Try {

    ; bot structure:
    ; <input_value_1>!<input_value_2>!<low_output_bin>!<low_output_bot>!<high_output_bin>!<high_output_bot>!<processed_flag>

    while 'stream.AtEnd {
	    set line=stream.ReadLine()
        i $a(line,$l(line)) = 13 s line=$e(line,1,$l(line) - 1)
        if $p(line," ",1) = "value" d
        . s b = $p(line," ",6) + 1
        . s v = $p(line," ",2)
        . i '$d(bot(b)) s bot(b) = v_"!!!!!!0" q
        . i $p(bot(b),"!",1) = "" s $p(bot(b),"!",1) = v q
        . s $p(bot(b),"!",2) = v
        if $p(line," ",1) = "bot" d
        . s b = $p(line, " ",2) + 1
        . s lo="",lb="",ho="",hb=""
        . s lv = $p(line," ",7), hv = $p(line," ",12)
        . if $p(line," ",6) = "bot" s lb = lv + 1
        . if $p(line," ",6) = "output" s lo = lv + 1
        . if $p(line," ",11) = "bot" s hb = hv + 1
        . if $p(line," ",11) = "output" s ho = hv + 1
        . i '$d(bot(b)) s bot(b) = "!!"_lo_"!"_lb_"!"_ho_"!"_hb_"!0" q
        . s $p(bot(b),"!",3) = lo, $p(bot(b),"!",4) = lb, $p(bot(b),"!",5) = ho, $p(bot(b),"!",6) = hb
    }

    ; Now loop through the bots, processing any that haven't been processed yet until we
    ; have processed everything

    s done = 0
    f  d  q:done
    . s x=""
    . s done=1
    . f n=1:1 s x=$o(bot(x)) q:x=""  d
    .. q:$p(bot(x),"!",7)
    .. ; Are both inputs populated?
    .. s i1 = $p(bot(x),"!",1), i2 = $p(bot(x),"!",2)
    .. s b1 = $p(bot(x),"!",4), b2 = $p(bot(x),"!",6)
    .. s o1 = $p(bot(x),"!",3), o2 = $p(bot(x),"!",5)
    .. i i1 & i2 d
    ... s done=0
    ... s lower = i2, higher = i1
    ... i i1 < i2 s lower = i1, higher = i2
    ... if b1 d
    .... i $p(bot(b1),"!",1) = "" s $p(bot(b1),"!",1) = lower
    .... e  s $p(bot(b1),"!",2) = lower
    ... if b2 d
    .... i $p(bot(b2),"!",1) = "" s $p(bot(b2),"!",1) = higher
    .... e  s $p(bot(b2),"!",2) = higher
    ... s $p(bot(x),"!",7) = 1
    ... if o1 s output(o1 - 1) = lower
    ... if o2 s output(o2 - 1) = higher
    
    s b = 0
    f n=1:1 s x=$o(bot(x)) q:x=""  d
    . ; w x," - ",bot(x),!
    . i (($p(bot(x),"!",1) = 61) & ($p(bot(x),"!",2) = 17)) ! (($p(bot(x),"!",1) = 17) & ($p(bot(x),"!",2) = 61)) s b = x - 1

    w "Part 1: ",b,!
    w "Part 2: ", output(0) * output(1) * output(2),!

    } Catch ex {
        W "Exception! ", ex, " @ ", ex.Location, " - ", ex.Data,!
    } 

    return
}

ClassMethod Run2(verbose = 0)
{

    w "Part 2: ",0,!

    return
}

}
