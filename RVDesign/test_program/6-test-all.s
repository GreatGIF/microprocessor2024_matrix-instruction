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

   li x3, 0xfffefdfc
   li x5, 0xf7f6f5f4
   #ld.tile, from data_seg (offset is 0) to M[3]
   .word 0x0001018b #ld.tile M[3], 0(x2)  #value in M[3] will be 0xf3f2f1f0
   .word 0x0002a10b #mov.tile M[2], x5  #value in M[1] will be 0xf7f6f5f4
   #ld.tile, from data_seg (offset is 8) to M[1]
   .word 0x0081008b #ld.tile M[1], 8(x2)  #value in M[3] will be 0xfbfaf9f8
   .word 0x0001a00b #mov.tile M[0], x3  #value in M[0] will be 0xfffefdfc

   li x5, 0x04030201 #rs1 and rs2 for mopa
   .word 0x0052c00b #mopa x5, x5

  # store M to data_seg (offset begins with 0x10)
   add x2, x2, 0x10
   .word 0x0001100b #st.tile M[0], 0(x2)
   .word 0x0011120b #st.tile M[1], 4(x2)
   .word 0x0021140b #st.tile M[2], 8(x2)
   .word 0x0031160b #st.tile M[3], 12(x2)

   # check M[0] with golden value
   li x3, 0x0301fffd #set golden value
   lw x5, 0(x2)
   bne x3, x5, fail 
   .word 0x0000328b #mov.tile x5, M[0]
   bne x3, x5, fail 

   # check M[1] with golden value
   li x3, 0x0300fdfa #set golden value
   lw x5, 4(x2)
   bne x3, x5, fail 
   .word 0x0010328b #mov.tile x5, M[1]
   bne x3, x5, fail 

   # check M[2] with golden value
   li x3, 0x03fffbf7 #set golden value
   lw x5, 8(x2)
   bne x3, x5, fail 
   .word 0x0020328b #mov.tile x5, M[2]
   bne x3, x5, fail 

   # check M[3] with golden value
   li x3, 0x03fef9f4 #set golden value
   lw x5, 12(x2)
   bne x3, x5, fail 
   .word 0x0030328b #mov.tile x5, M[3]
   bne x3, x5, fail 
 
   j  pass

fail:
   beq x0, x0, fail

pass:
   beq x0, x0, pass

.data
data_seg:
.word 0xf3f2f1f0
.word 0xf7f6f5f4
.word 0xfbfaf9f8
.word 0xfffefdfc
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
