#####################################################
#test for st.tile

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

   #test for st.tile, from M[0] to data_seg (offset is 0)
   li x3, 0x55555555 #set golden value
   .word 0x0001100b #st.tile M[0], 0(x2)
   lw x5, 0(x2)
   bne x3, x5, fail 
  
   #test for st.tile, from M[1] to data_seg (offset is 4)
   li x3, 0xaaaaaaaa #set golden value
   .word 0x0011120b #st.tile M[1], 4(x2)
   lw x5, 4(x2)
   bne x3, x5, fail

   #test for st.tile, from M[2] to data_seg (offset is 8)
   li x3, 0x33333333 #set golden value
   .word 0x0021140b #st.tile M[2], 8(x2)
   lw x5, 8(x2)
   bne x3, x5, fail

   #test for st.tile, from M[3] to data_seg (offset is 12)
   li x3, 0xcccccccc #set golden value
   .word 0x0031160b #st.tile M[3], 12(x2)
   lw x5, 12(x2)
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

