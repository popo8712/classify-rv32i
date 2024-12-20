.globl abs

.text
# =================================================================
# FUNCTION: Absolute Value Converter
#
# Transforms any integer into its absolute (non-negative) value by
# modifying the original value through pointer dereferencing.
# For example: -5 becomes 5, while 3 remains 3.
#
# Args:
#   a0 (int *): Memory address of the integer to be converted
#
# Returns:
#   None - The operation modifies the value at the pointer address
# =================================================================
abs:
    # Prologue
    ebreak
    # Load number from memory
    lw t0 0(a0)
    bge t0, zero, done

     # If t0 < 0, take the absolute value by calculating -t0
    li t1, 0          # Load 0 into t1
    sub t0, t1, t0    # t0 = 0 - t0 (negate t0)

    # Store the absolute value back into memory
    sw t0, 0(a0)

done:
    # Epilogue
    jr ra
