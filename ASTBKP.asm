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

    menu_inicial1    db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db '                [ Jogar ]           ',13,10
                     db '                  Sair              ',13,10           
    menu_inicial1_length EQU $-menu_inicial1

    menu_inicial2    db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db ' ',13,10
                     db '                  Jogar             ',13,10
                     db '                [ Sair  ]           ',13,10 
    menu_inicial2_length EQU $-menu_inicial2

    estado_programa    db  0    ; 0 - Menu Inicial, 1 - Game, 2 - Fim do Game
    opcao_menu_inicial db  0    ; 0 - Jogar, 1 - Sair'          
    
    
    
    
    nave      db 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Ch,0Ch,00h,00h
              db 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h,00h,00h
              db 00h,0Fh,0Fh,0Fh,0Fh,00h,00h,00h,00h,00h
              db 00h,0Ch,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h
              db 00h,00h,0Ch,0Fh,0Eh,0Eh,0Fh,0Fh,0Fh,0Fh
              db 00h,00h,0Ch,0Fh,0Eh,0Eh,0Fh,0Fh,0Fh,0Fh
              db 00h,0Ch,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h
              db 00h,0Fh,0Fh,0Fh,0Fh,00h,00h,00h,00h,00h
              db 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h,00h,00h
              db 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Ch,0Ch,00h,00h          
              
    asteroide db 00h,00h,00h,07h,07h,07h,00h,00h,00h,00h
              db 00h,00h,00h,07h,07h,07h,00h,00h,00h,00h
              db 00h,00h,00h,07h,07h,07h,00h,00h,00h,00h
              db 07h,07h,07h,08h,08h,08h,07h,07h,07h,00h
              db 07h,07h,07h,08h,08h,08h,07h,07h,07h,00h
              db 07h,07h,07h,08h,08h,08h,07h,07h,07h,00h
              db 00h,00h,00h,07h,07h,07h,00h,00h,00h,00h
              db 00h,00h,00h,07h,07h,07h,00h,00h,00h,00h
              db 00h,00h,00h,07h,07h,07h,00h,00h,00h,00h
              db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h              
              
    escudo    db 00h,00h,00h,04h,04h,04h,00h,00h,00h,00h
              db 00h,00h,00h,04h,04h,04h,00h,00h,00h,00h
              db 00h,00h,00h,04h,04h,04h,00h,00h,00h,00h
              db 04h,04h,04h,0Ch,0Ch,0Ch,04h,04h,04h,00h
              db 04h,04h,04h,0Ch,0Ch,0Ch,04h,04h,04h,00h
              db 04h,04h,04h,0Ch,0Ch,0Ch,04h,04h,04h,00h
              db 00h,00h,00h,04h,04h,04h,00h,00h,00h,00h
              db 00h,00h,00h,04h,04h,04h,00h,00h,00h,00h
              db 00h,00h,00h,04h,04h,04h,00h,00h,00h,00h
              db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h    

    saude     db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,0Ah,00h
              db 0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,0Ah,00h
              db 0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,0Ah,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h 
              
   saude_game db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,0Ah,00h
              db 0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,0Ah,00h
              db 0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,0Ah,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,0Ah,0Ah,0Ah,00h,00h,00h,00h
              db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h               
              
    pos_yo_navegame equ 119  ; pos y nave dentro do jogar
    pos_xo_navegame equ 90    ; pos x nave dentro do jogar    
     
    altura_navegame equ 10 
    largura_navegame equ 10
    
    pos_yo_asteroidemenu equ 140  
    pos_xo_asteroidemenu equ 125                    

    pos_yo_navemenu equ 140 
    pos_xo_navemenu equ 65        
    
    pos_yo_escudomenu equ 140  
    pos_xo_escudomenu equ 185     

    pos_yo_saudemenu equ 140  
    pos_xo_saudemenu equ 245       
                            
    altura_nave equ 10  
    largura_nave equ 10
    
    altura_asteroide equ 10  
    largura_asteroide equ 10
   
    altura_escudo equ 10  
    largura_escudo equ 10
    
    altura_saude equ 10  
    largura_saude equ 10
.code
   
monta_navegame proc

    mov SI, offset nave 
    mov CL, pos_xo_navegame 
    mov CH, pos_yo_navegame
    
    mov BH, 0
    mov DH, 0
    
    mov BL, 0 ; para contar largura
    mov DL, 0 ; conta altura
    
    loop_linha_monta_navegame:
        cmp DL, altura_navegame ; compara para ver se a linha é igual a altura
        je fim_monta_navegame
        mov CL, pos_xo_navegame ; se nao, volta pra xo_navegame
        mov BL, 0   ; reset da largura armazenada
    
    loop_coluna_monta_navegame:
        mov AH, 0Ch
        mov AL, [si]
        mov BH, 00h
        
        inc CL ; vai botando na sequencia da direita com a função incrementar
        int 10h
        inc SI
        inc BL ; incrementa um em BL=largura
        cmp BL, largura_navegame
        jne loop_coluna_monta_navegame
        
        inc DL ; incrementa DL=altura
        jmp loop_linha_monta_navegame
        
    fim_monta_navegame:
        ret
endp  
    
monta_nave proc

    mov SI, offset nave
    mov CL, pos_xo_navemenu 
    mov CH, pos_yo_navemenu 
    
    mov DH, 0
    mov BH, 0    
    
    mov BL, 0 
    mov DL, 0 
    
    loop_linha_monta_nave:
        cmp DL, altura_nave 
        je fim_monta_nave
        
        mov CL, pos_xo_navemenu 
        mov BL, 0   
    
    loop_coluna_monta_nave:
        mov AH, 0Ch
        mov AL, [si]
        mov BH, 00h
        
        inc CL 
        int 10h
        inc SI
        inc BL 
        cmp BL, largura_nave
        jne loop_coluna_monta_nave
        
        inc DL 
        jmp loop_linha_monta_nave    
    fim_monta_nave:
        ret
endp

monta_asteroide proc

    mov SI, offset asteroide
    mov CL, pos_xo_asteroidemenu 
    mov CH, pos_yo_asteroidemenu 
    
    mov BL, 0 
    mov DL, 0 
    
    mov DH, 0
    mov BH, 0
    
    loop_linha_monta_asteroide:
        cmp DL, altura_asteroide 
        je fim_monta_asteroide
        mov CL, pos_xo_asteroidemenu 
        mov BL, 0   
    
    loop_coluna_monta_asteroide:
        mov AH, 0Ch
        mov AL, [si]
        mov BH, 00h
        
        inc CL 
        int 10h
        inc SI
        inc BL 
        cmp BL, largura_asteroide
        jne loop_coluna_monta_asteroide
        
        inc DL   
        jmp loop_linha_monta_asteroide
        
    fim_monta_asteroide:
        ret
endp

monta_escudo proc

    mov SI, offset escudo
    mov CL, pos_xo_escudomenu     
    mov CH, pos_yo_escudomenu 

    mov DH, 0
    mov BH, 0
    
    mov BL, 0 
    mov DL, 0 
    
    loop_linha_monta_escudo:
        cmp DL, altura_escudo 
        je fim_monta_escudo
        mov CL, pos_xo_escudomenu 
        mov BL, 0  
    
    loop_coluna_monta_escudo:
        mov AH, 0Ch
        mov AL, [si]
        mov BH, 00h
        
        inc CL 
        int 10h
        inc SI
        inc BL 
        cmp BL, largura_escudo
        jne loop_coluna_monta_escudo
        
        inc DL 
        jmp loop_linha_monta_escudo
    fim_monta_escudo:
        ret
endp

monta_saude proc

    mov SI, offset saude
    mov CL, pos_xo_saudemenu
    mov CH, pos_yo_saudemenu 
    
    mov DH, 0
    mov BH, 0
    
    mov BL, 0 
    mov DL, 0 
    
    loop_linha_monta_saude:
        cmp DL, altura_saude 
        je fim_monta_saude
        mov CL, pos_xo_saudemenu 
        mov BL, 0  
    
    loop_coluna_monta_saude:
        mov AH, 0Ch
        mov AL, [si]
        mov BH, 00h
        
        inc CL 
        int 10h
        inc SI
        inc BL 
        cmp BL, largura_saude
        jne loop_coluna_monta_saude
        
        inc DL 
        jmp loop_linha_monta_saude
        
    fim_monta_saude:
        ret
endp


    print_logo_inicial PROC

        push AX
        push SI
        push CX
        push DI

        mov bp, OFFSET main_logo_in  ; ES:BP MENSAGEM
        mov ah, 13h      ; int 13h - escreve string
        mov al, 01h      ; atributo em bl, move cursor
        xor bh, bh       ; pagina de video 0
        mov bl, 0AH        ; attribute 
        mov cx, main_logo_in_length      ; tamanho da string
        mov dh, 1        ; linha string
        mov dl, 1        ; coluna string
        int 10h         ; chama bios
        
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
                ; Verifica o estado da vari??vel manipulada pelas teclas
        cmp opcao_menu_inicial, 0
        je opcao_selecionada_1
        ; Se a vari??vel ?? diferente de 0, assume que est?? opcao_menu_inicial == 1
        mov SI, OFFSET menu_inicial2
        mov DI, menu_inicial2_length

        jmp continuar_atualizacao

        opcao_selecionada_1:
            mov SI, OFFSET menu_inicial1
            mov DI, menu_inicial2_length

        continuar_atualizacao:
            mov bp, SI  
            mov ah, 13h      
            mov al, 01h      
            xor bh, bh      
            mov bl, 0FH      
            mov cx, DI      
            mov dh, 12       
            mov dl, 1       
            int 10h       

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
            ; Atualiza a sele????o
            mov opcao_menu_inicial, 0
            jmp nokey

        arrow_down:
            ; Atualiza a sele????o
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

    inicializa_itens PROC
        push SI
            CALL monta_navegame
            ; CALL monta_escudo
            ; CALL monta_saude
            ; CALL monta_asteroide       
        
        pop SI 
        ret
    endp
 
    ; Rotina para tb atualizar a posicao da nave e asteroides...
    trata_display_game PROC
        push AX
        push CX

        call set_video_mode
      ;  call inicializa_itens
        call monta_navegame
        xor CX, CX

          PLAY_LOOP:
            ;call VALIDATE
;                    call MOVE_NAVE
            ;call CALCULATE_SPEED
            ;           cmp CX, AX
            ;jb CONTINUE_PLAY

         ; pop CX
          ;  pop AX
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

    ; SET VIDEO MODE -----------------------------------------------------------------------------------------------
    set_video_mode proc ; Modo v?deo 13H (320x200)
        push AX
        
        mov AX, 13h     ; programa modo 13h
        int 10h         ; chamada de servi?o bios

        pop AX
        ret
    endp    
    
    inicio:       

        mov AX, @DATA 
        mov ES, AX  
        
        mov AX, @DATA 
        mov DS, AX  
            
        CALL set_video_mode
        laco_principal:
            cmp estado_programa, 2
            je end_game

            cmp estado_programa, 1
            je laco_game

            ; Laco de controle do menu inicial
            CALL monta_escudo
            CALL monta_saude
            CALL monta_asteroide
            CALL monta_nave
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
