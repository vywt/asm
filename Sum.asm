# Add the first five integers 

.text

main:
    addi $9, $0, -3
    xori $10, $9, -1

end:
     ori   $v0, $0, 10     # system call 10 for exit
     syscall               # we are out of here.
