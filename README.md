# cx16-lib
miscellaneous code to support Commander X16 assembly language development

## Linear Feedback Shift Register

https://en.wikipedia.org/wiki/Linear-feedback_shift_register#Galois_LFSRs

This code implements a maximal period 16-bit linear feedback shift register. In other words, starting with any value (except zero), the register will visit every other non-zero value before returning to the start.

Yes, you could do that with a simple counter, but this looks more random. Maybe it could be turned into a PRNG or hash function.

## tools

* cc65 toolchain
* make (optional)
