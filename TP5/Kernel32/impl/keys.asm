
GLOBAL key_pressed
GLOBAL get_key

get_key:
    in al, 60h
    movzx eax, al
    ret
