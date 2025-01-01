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
   la x2, data_seg #load data_seg

main:

   #ld.tile, from data_seg (offset is 0) to M[0]
   .word 0x0001000b #ld.tile M[0], 0(x2)  #value in M[0] will be 0xaaaaaaaa
   li x3, 0xaaaaaaaa #set golden value
   .word 0x0000328b #mov.tile x5, M[0]
   bne x3, x5, fail 

   #ld.tile, from data_seg (offset is 4) to M[1]
   .word 0x0041008b #ld.tile M[1], 4(x2)  #value in M[1] will be 0x55555555
   li x3, 0x55555555 #set golden value
   .word 0x0010328b #mov.tile x5, M[1]
   bne x3, x5, fail 

   #ld.tile, from data_seg (offset is 8) to M[2]
   .word 0x0081010b #ld.tile M[2], 8(x2)  #value in M[2] will be 0xcccccccc
   li x3, 0xcccccccc #set golden value
   .word 0x0020328b #mov.tile x5, M[2]
   bne x3, x5, fail

   #ld.tile, from data_seg (offset is 12) to M[3]
   .word 0x00c1018b #ld.tile M[3], 12(x2)  #value in M[2] will be 0x33333333
   li x3, 0x33333333 #set golden value
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
