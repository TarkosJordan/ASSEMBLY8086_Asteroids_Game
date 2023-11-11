.model small     
      
.stack 100H

.data  

   main_logo_in db '   _       _                 _     _  ',13,10             
                db '   /_\  ___| |_ ___ _ __ ___ (_) __| |',13,10
                db '  //_\\/ __| __/ _ | |__/ _ \| |/ _| |',13,10
                db ' /  _  \__ | ||  __| | | (_) | | (_| |',13,10
                db ' \_/ \_____/___\___|_|  \___/|_|\____|',13,10
                db '    / / /\ \ \____ _   _              ',13,10
                db '    \ \/  \/ / _  | | | |             ',13,10
                db '     \  /\  | (_| | |_| |             ',13,10
                db '      \/  \/ \____|\___ |             ',13,10
                db '                   |___/              ',13,10
                db '                                      ',13,10

    main_logo_in_length EQU $-main_logo_in

    menu_inicial1    db '               [ Jogar ]              ',13,10
                     db '                  Sair               ',13,10           
    menu_inicial1_length EQU $-menu_inicial1

    menu_inicial2   db '                Jogar               ',13,10
                    db '               [ Sair ]             ',13,10 
    menu_inicial2_length EQU $-menu_inicial2

    ;nave_game   

    estado_programa    db  0    ; 0 - Menu Inicial, 1 - Game, 2 - Fim do Game
    opcao_menu_inicial db  0    ; 0 - Jogar, 1 - Sair'          

.code
    print_logo_inicial PROC
        push AX
        push SI
        push CX
        push DI

        mov bp, OFFSET main_logo_in  ; ES:BP points to message
        mov ah, 13h      ; function 13 - write string
        mov al, 01h      ; attrib in bl,move cursor
        xor bh, bh       ; video page 0
        mov bl, 2        ; attribute 
        mov cx, main_logo_in_length      ; length of string
        mov dh, 1        ; row to put string
        mov dl, 1        ; column to put string
        int 10h         ; call BIOS service

        pop DI
        pop CX
        pop SI
        pop AX

        ret

    print_logo_inicial ENDP

    print_opcoes_menu_inicial PROC
        push AX
        push SI
        push CX
        push DI
                ; Verifica o estado da variável manipulada pelas teclas
        cmp opcao_menu_inicial, 0
        je opcao_selecionada_1
        ; Se a variável é diferente de 0, assume que está opcao_menu_inicial == 1
        mov SI, OFFSET menu_inicial2
        mov DI, menu_inicial2_length

        jmp continuar_atualizacao

        opcao_selecionada_1:
            mov SI, OFFSET menu_inicial1
            mov DI, menu_inicial2_length

        continuar_atualizacao:
            mov bp, SI  ; ES:BP points to message
            mov ah, 13h      ; function 13 - write string
            mov al, 01h      ; attrib in bl,move cursor
            xor bh, bh       ; video page 0
            mov bl, 2        ; attribute 
            mov cx, DI      ; length of string
            mov dh, 12        ; row to put string
            mov dl, 1        ; column to put string
            int 10h         ; call BIOS service

        pop DI
        pop CX
        pop SI
        pop AX

        ret
        
    print_opcoes_menu_inicial ENDP

    trata_display_init PROC

        CALL print_logo_inicial
        CALL print_opcoes_menu_inicial

        ret

    trata_display_init ENDP

    trata_teclado_menu_inicial PROC
        push AX 
        push SI
        push CX 
        push DI     
        
        ; verifica se alguma tecla foi pressionada

        mov     AH, 01h     
        int     16h         
        jz      nokey
        mov     AH, 00h     
        int     16h   
            
        cmp     AL, 0DH     ; botao do teclado enter
        je      center
        
        cmp     AH, 48H     ; seta do teclado para cima
        je      arrow_up
        
        cmp     AH, 50H     ;  seta do teclado para baixo
        je      arrow_down

        arrow_up: 
            ; Atualiza a seleção
            mov opcao_menu_inicial, 0
            jmp nokey

        arrow_down:
            ; Atualiza a seleção
            mov opcao_menu_inicial, 1
            jmp nokey
        center:
            cmp opcao_menu_inicial, 0
            je  set_start_game

            mov estado_programa, 2
            jmp nokey

            set_start_game:
                mov estado_programa, 1

        nokey:

        pop SI ; Recupera o dado do topo da pilha para o registrador 
        pop DI ; Recupera o dado do topo da pilha para o registrador 
        pop AX ; Recupera o dado do topo da pilha para o registrador 
        pop CX ; Recupera o dado do topo da pilha para o registrador 
        
        ret
    trata_teclado_menu_inicial ENDP

    ; Rotina para atualizar a posicao da nave e asteroides...
    trata_display_game PROC

        ; implementar

        ret

    trata_display_game ENDP

    trata_teclado_game PROC

        push AX 
        push SI
        push CX 
        push DI     
        
        ; verifica se alguma tecla foi pressionada

        mov     AH, 01h     
        int     16h         
        jz      nokey_game
        mov     AH, 00h     
        int     16h   
            
        cmp     AL, 0DH     ; botao do teclado enter
        je      center_game
        
        cmp     AH, 48H     ; seta do teclado para cima
        je      arrow_up_game
        
        cmp     AH, 50H     ;  seta do teclado para baixo
        je      arrow_down_game

        arrow_up_game: 
            ; movimenta nave para cima
            jmp nokey_game

        arrow_down_game:
            ; movimenta nave para baixo
            jmp nokey_game
        center_game:
            ; atira um projetil
            jmp nokey_game

        nokey_game:

        pop SI ; Recupera o dado do topo da pilha para o registrador 
        pop DI ; Recupera o dado do topo da pilha para o registrador 
        pop AX ; Recupera o dado do topo da pilha para o registrador 
        pop CX ; Recupera o dado do topo da pilha para o registrador 
        
        ret

    trata_teclado_game ENDP

    ; Rotina para variaveis e parametros de controle do game, exemplo vidas, colisoes, 
    ; temporizacao dos asteroides, etc... 
    trata_controle_game PROC

        ; implementar

        ret

    trata_controle_game ENDP

    inicio:       

        mov AX, @DATA 
        mov ES, AX  
        
        mov AX, @DATA 
        mov DS, AX  
            
        mov AX, 13h    ; Programa o modo de video 13h
        int 10h        ; Interrup??o para chama de servi?o da BIOS

        laco_principal:
            cmp estado_programa, 2
            je end_game

            cmp estado_programa, 1
            je laco_game

            ; Laco de controle do menu inicial
            CALL trata_display_init
            CALL trata_teclado_menu_inicial

            jmp laco_principal 

            laco_game:
                CALL trata_display_game
                CALL trata_teclado_game
                CALL trata_controle_game

            jmp laco_principal  
        
        ; Rotulo para finalizar o programa
        end_game:
            mov AX, 4C00h     ; sair para o DOS
            int 21h           ; chamar fun??o DOS
            
    end inicio