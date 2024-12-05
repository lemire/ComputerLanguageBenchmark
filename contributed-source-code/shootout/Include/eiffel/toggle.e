-- -*- mode: eiffel -*-
-- $Id$
-- http://shootout.alioth.debian.org/
-- from Steve Thompson

class TOGGLE

creation make

feature -- Creation

   make(start_state: BOOLEAN) is
      do
	 state := start_state
      end
   
feature -- Queries
   
   state: BOOLEAN
   
   value: BOOLEAN is
      do
	 Result := state
      end -- value
   
   activate: like Current is
      do
	 state := state = False
	 Result := Current
      end -- activate
   
end -- class TOGGLE
