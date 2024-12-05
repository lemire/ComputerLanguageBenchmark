/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org

   Contributed by Gavin Harrison */

n := args at(1) asNumber
meetings := 0
first := second := Nil

Creature := Object clone do(
    setColor  := method(n, self color := n; self)
    setRed    := method( setColor(1) )
    setYellow := method( setColor(2) )
    setBlue   := method( setColor(3) )

    complement := method(other,
        if (color == other, color, 6 - color - other)
    )
    meet := method(
        yield; while(Lobby second, yield)
        if (Lobby first) then (
            Lobby second = self
            other := Lobby first color
            Lobby first = Nil
        ) else (
            if (n==0, return Nil, Lobby n=n-1)
            Lobby first = self
            yield; while(Lobby second isNil, yield)
            other := Lobby second color
            Lobby second = Nil
        )
        other
    )
    run := method(
        while (other := meet,
            color = complement(other)
            Lobby meetings = Lobby meetings + 1
        )
    )
)

Creature clone setBlue   @@run
Creature clone setRed    @@run
Creature clone setYellow @@run
Creature clone setBlue   @@run

while(Coroutine yieldingCoros size > 1, yield)

meetings println
