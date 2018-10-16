#---------------------------------
# Lab 6: Pixel Conversion
#
# Name: YEO WEI TECK VICTOR
#
# --------------------------------
# Below is the expected output.
# 
# Converting pixels to grayscale:
# 0
# 1
# 2
# 34
# 5
# 67
# 89
# Finished.
# -- program is finished running --
#---------------------------------

.data 0x0
  startString:  .asciiz "Converting pixels to grayscale:\n"
  finishString: .asciiz "Finished.\n"
  newline:      .asciiz "\n"
  pixels:       .word   0x00010000, 0x010101, 0x6,      0x3333,
                        0x030c,     0x700853, 0x294999, -1

.text 0x3000

main:
  addi $v0, $0, 4       	# system call code 4 for printing a string
  la   $a0, startString      	# put address of startString in $a0
  syscall               	# print the string

  add $t1,$0, $0

loop:

  lw $11, pixels($t1)   #load pixels  into rgb
  beq $11, -1, exit
  andi  $a1, $11, 0x000000FF  #Blue value into $a1
  andi $a2, $11, 0x0000FF00   #Green into register $a2
  srl $a2, $a2, 8    
  andi $a3, $11,  0x00FF0000 #Red into $a3
  srl $a3, $a3, 16
  jal rgb_to_gray  #calling the rgb to gray function

  addi $v0, $0, 1  #System call code 4 for printing a number
  la $a0, ($10) #Load address of RGB
  syscall

  addi $v0, $0, 4 #printing out a newline statement
  la $a0, newline
  syscall
  addi $t1, $t1, 4 # incrementing i by 1

j loop

exit:

  addi $v0, $0, 4            	# system call code 4 for printing a string
  la   $a0, finishString   	# put address of finishString in $a0
  syscall               	# print the string

  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program



#----------------------------------------------------------#



#---- Procedure rgb_to_gray ----#
#
#
#-------------------------------#

rgb_to_gray:            # procedure to calculate gray = (red + green + blue) / 3
                        # red is in $a0, green is in $a1, blue is in $a2
                        # gray should be computed in $v0 (return value)
                        # there is no need to use a stack

#------- INSERT YOUR CODE HERE -------
#
# Simply add instructions here to calculate
#   gray = (red + green + blue) / 3
#
#   i.e., $v0 = ($a0 + $a1 + $a2) / 3
#
#  That's it!
#
#------------ END CODE ---------------
  add $10, $a1, $a2
  add $10, $10, $a3
  div $10, $10,3 
  
  jr $ra                # return to main