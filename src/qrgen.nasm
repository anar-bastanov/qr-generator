%include "anrc/all"
%include "qrgen.inc"
%include "cli_options.inc"

global program_entry

section .text

program_entry:
    call initialize_environment

    call parse_user_options

    xor eax, eax
    ret

initialize_environment:
    push r8
    push r9

    mov r8d, [rel cc_LC_ALL]
    lea r9, [rel str_utf8_locale]
    callclib 2, setlocale

    pop r9
    pop r8
    ret

section .rodata

str_utf8_locale:
    db ".UTF8", 0
