#####################################################
#test for mov.tile-from integer register

#initialize M[0] with 0x55555555 in RTL
#initialize M[1] with 0xaaaaaaaa in RTL
#initialize M[2] with 0x33333333 in RTL
#initialize M[3] with 0xccccccccc in RTL
#x2:base address for data access
#x4:exit address 0x13000000
#x3:golden value
#x10:indication for success or fail, 1: success, 2: fail 

#####################################################

.section .text
.global _start
_start:

   # set base address for data access
   la x2, data_seg #load data_seg  #unused in this test

main:

   #move from integer regsiter to M[0] 
   li x3, 0xaaaaaaaa #set golden value
   .word 0x0001a00b #mov.tile M[0], x3

   #move from integer regsiter to M[1] 
   li x3, 0x55555555 #set golden value
   .word 0x0001a08b #mov.tile M[1], x3

   #move from integer regsiter to M[2] 
   li x3, 0xcccccccc #set golden value
   .word 0x0001a10b #mov.tile M[2], x3

   #move from integer regsiter to M[3] 
   li x3, 0x33333333 #set golden value
   .word 0x0001a18b #mov.tile M[3], x3

   # read M using mov.tile-to integer register to test mov.tile-from integer register 
   
   li x3, 0xaaaaaaaa #set golden value
   .word 0x0000328b #mov.tile x5, M[0]
   bne x3, x5, fail

   li x3, 0x55555555 #set golden value
   .word 0x0010328b #mov.tile x5, M[1]
   bne x3, x5, fail

   #test for mov.tile, from M[2] to integer regsiter
   li x3, 0xcccccccc #set golden value
   .word 0x0020328b #mov.tile x5, M[2]
   bne x3, x5, fail

   #test for mov.tile, from M[3] to integer regsiter
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
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000

