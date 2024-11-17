.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error   

    lw t0, 0(a0)  #max value

    li t1, 0      #max_index
    li t2, 0      #now position
loop_start:
    # TODO: Add your own implementation
    # Assume t3 is tmp
    addi a1, a1, -1          #i--
    blt a1, t6, loop_end     #if i < 1 (a1),exit loop
    
    addi a0, a0, 4           #a[i+1] = a[i] + offset
    lw   t3, 0(a0)           #load the number of a[i+1]
    addi t2, t2, 1            
    bgt  t0, t3, loop_start   #if max>a[i] , keep loop
    mv   t0, t3               # Else max=a[i]
    mv   t1, t2               # max_index = now_index 
    
    j   loop_start
    
loop_end:
   mv a0, t1
   jr ra

handle_error:
    li a0, 36
    j exit
