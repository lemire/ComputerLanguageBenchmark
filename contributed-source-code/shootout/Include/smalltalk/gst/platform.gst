


Object subclass: #Tests

!Tests class methodsFor: 'platform'!

!Tests class methodsFor: 'platform'!

!Tests class methodsFor: 'platform'!
   ^self stdout bufferSize: 4096! ! 

!Stream methodsFor: 'platform'!
   | n s |
   n := 0.5d0 * (10 raisedToInteger: decimalPlaces negated).
   s := ((number sign < 0) ifTrue: [number - n] ifFalse: [number + n]) printString.

!Stream methodsFor: 'platform'!
   | s |
   s := number printString.