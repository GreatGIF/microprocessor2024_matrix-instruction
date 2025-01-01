#####################################################
#test for ld.tile

#initialize M[0] with 0x55555555 in RTL
#initialize M[1] with 0xaaaaaaaa in RTL
#initialize M[2] with 0x33333333 in RTL
#initialize M[3] with 0xccccccccc in RTL
#x2:base address for data access
#x12:exit address 0x13000000
#x3:golden value

#####################################################

.section .text
.global _start
_start:

   # set base address for data access
   la x2, data_seg #load data_seg #unused in this test

main:

   li x5, 0x01010101 #rs1 and rs2 for mopa
   .word 0x0052c00b #mopa x5, x5

   # check M[0] with golden value
   li x3, 0x56565656 #set golden value
   .word 0x0000328b #mov.tile x5, M[0]
   bne x3, x5, fail 

   # check M[1] with golden value
   li x3, 0xabababab #set golden value
   .word 0x0010328b #mov.tile x5, M[1]
   bne x3, x5, fail 

   # check M[2] with golden value
   li x3, 0x34343434 #set golden value 
   .word 0x0020328b #mov.tile x5, M[2]
   bne x3, x5, fail

   # check M[3] with golden value
   li x3, 0xcdcdcdcd #set golden value
   .word 0x0030328b #mov.tile x5, M[3]
   bne x3, x5, fail
   
   j  pass

fail:
   beq x0, x0, fail

pass:
   beq x0, x0, pass



.data
data_seg:
.word 0xaaaaaaaa
.word 0x55555555
.word 0xcccccccc
.word 0x33333333
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000

