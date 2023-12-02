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

    lsb_delay_us       dw  50000 ; byte carregado na funcao de delay em microsegundos
    msb_delay_us       dw      0 ; byte carregado na funcao de delay em microsegundos
         
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
              
    pos_y_navegame  dw 100    ; posicao y nave dentro do jogo (variavel atualizada pelas teclas up e down)
    pos_xo_navegame equ 90    ; posicao x nave dentro do jogo (constante nave soh se moviementa para cima e para baixo)

    ; Define o limite inferior e superior em y do posicionamento da nave
    lim_inferior_nave equ 170
    lim_superior_nave equ  10
 
    ; Define o segmento de video
    video_segment equ 0A000H
    
    ; Definicoes para o posicionamento dos elementos visuais na tela de menu inicial
    altura_nave equ 10  
    largura_nave equ 10

    altura_asteroide equ 10  
    largura_asteroide equ 10
   
    altura_escudo equ 10  
    largura_escudo equ 10
    
    altura_saude equ 10  
    largura_saude equ 10

    pos_yo_itens_menu_inicial equ 110
     
    pos_xo_asteroidemenu equ 125                    
    pos_xo_navemenu equ 65        
    pos_xo_escudomenu equ 185     
    pos_xo_saudemenu equ 245       
                            
.code

; Funcao deve popular registradores cx e dx, sendo dx os 16 bits menos significativos e o cx 
; os 16 bits mais significativos da contagem em microsegundos do delay
delay_microsegundos proc
    push cx
    push dx

    ; Configurar os registradores CX e DX com o intervalo desejado
    mov cx, msb_delay_us   
    mov dx, lsb_delay_us 

    ; Chamar a interrupcao 15h para suspender o tempo
    mov ah, 86H      ; funcao AH=86H da interrupcao 15h
    int 15h
    
    pop dx
    pop cx

    ret
endp

; Params SI -> endereco do objeto
;        AX -> pixel linha
;        BX -> pixel coluna
desenha_objeto proc

    push ds
    push cx
    push ax
    push di
    push es

    mov cx, 320
    mul cx          ; implicitamente multiplica por ax
    mov di, ax      
    add di, bx
    mov ax, 0A000h
    mov es, ax
    
    mov bl, 10
    laco_desenha_objeto:
        mov cx, 10
        rep movsb
        add di, 310
        dec bl
        jz fim_desenha_objeto
        jmp laco_desenha_objeto
    
    fim_desenha_objeto:
        pop es
        pop di
        pop ax
        pop cx
        pop ds
        ret
endp  

movimenta_obj_cima proc
    push ds     ; salvar contexto do data segment
    
    ; operar sobre a memoria de video
    mov ax, 0A000h
    mov es, ax

    pop ds      ; restaurar contexto do data segment
    ret
endp

movimenta_obj_baixo proc
    push ds     ; salvar contexto do data segment

    ; operar sobre a memoria de video
    mov ax, 0A000h
    mov es, ax

    pop ds      ; restaurar contexto do data segment
    ret
endp
    
print_logo_inicial PROC

    push AX
    push SI
    push CX
    push DI

    mov bp, OFFSET main_logo_in     ; ES:BP MENSAGEM
    mov ah, 13h                     ; int 13h - escreve string
    mov al, 01h                     ; atributo em bl, move cursor
    xor bh, bh                      ; pagina de video 0
    mov bl, 0AH                     ; attribute 
    mov cx, main_logo_in_length     ; tamanho da string
    mov dh, 1                       ; linha string
    mov dl, 1                       ; coluna string
    int 10h                         ; chama bios
    
    pop DI
    pop CX
    pop SI
    pop AX

    ret

print_logo_inicial ENDP

print_objetos_menu_inicial proc
       ; print escudo
        mov si, offset escudo
        mov ax, pos_yo_itens_menu_inicial
        mov bx, pos_xo_escudomenu
        call desenha_objeto 
        ; print saude 
        mov si, offset saude
        mov ax, pos_yo_itens_menu_inicial
        mov bx, pos_xo_saudemenu
        call desenha_objeto       
        ; print asteroide
        mov si, offset asteroide
        mov ax, pos_yo_itens_menu_inicial
        mov bx, pos_xo_asteroidemenu     
        call desenha_objeto
        ; print nave
        mov si, offset nave
        mov ax, pos_yo_itens_menu_inicial
        mov bx, pos_xo_navemenu     
        call desenha_objeto
    ret
print_objetos_menu_inicial endp

print_opcoes_menu_inicial PROC
    push AX
    push SI
    push CX
    push DI

    ; Verifica o estado da variavel manipulada pelas teclas
    cmp opcao_menu_inicial, 0
    je opcao_selecionada_1
    ; Se a varialvel eh diferente de 0, assume-se que opcao_menu_inicial == 1
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
    
    call print_logo_inicial
    call print_objetos_menu_inicial
    call print_opcoes_menu_inicial

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
        ; Atualiza a selecao
        mov opcao_menu_inicial, 0
        jmp nokey

    arrow_down:
        ; Atualiza a selecao
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

; Rotina para tb atualizar a posicao da nave e asteroides...
trata_display_game PROC

    ;call set_video_mode

    ret

trata_display_game ENDP

trata_teclado_game PROC

    push AX 
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
        ; testa o limite de tamanho da tela
        mov AX, pos_y_navegame
        cmp AX, lim_superior_nave
        ; se for maior ou igual ao limite superior da tela movimenta
        jge atualiza_pos_nave_cima
        jmp nokey_game

        ; movimenta nave para cima
        atualiza_pos_nave_cima:
            sub AX, 1
            mov pos_y_navegame, AX
            jmp nokey_game

    arrow_down_game:
        ; testa o limite de tamanho da tela
        mov AX, pos_y_navegame
        cmp AX, lim_inferior_nave 
        ; se for menor ou igual ao limite inferior da tela movimenta
        jle atualiza_pos_nave_baixo
        jmp nokey_game

        ; movimenta nave para baixo
        atualiza_pos_nave_baixo:
            add AX, 1
            mov pos_y_navegame, AX
            jmp nokey_game

    center_game:
        ; atira um projetil
        jmp nokey_game

    nokey_game:

    pop DI ; Recupera o dado do topo da pilha para o registrador 
    pop AX ; Recupera o dado do topo da pilha para o registrador 
    pop CX ; Recupera o dado do topo da pilha para o registrador 
    
    ret

trata_teclado_game ENDP

; Para as movimentacoes precisa atualizar o DI, e o SI
; O DI eh o pixel inicial do objeto
; SI eh o objeto
movimenta_nave_cima proc
    push ds

    pop ds
    ret
endp 

movimenta_nave_baixo proc
    push ds

    pop ds    
    ret
endp

; Rotina para variaveis e parametros de controle do game, exemplo vidas, colisoes, 
; temporizacao dos asteroides, etc... 
trata_controle_game PROC

    ; implementar

    ret

trata_controle_game ENDP

; SET VIDEO MODE -----------------------------------------------------------------------------------------------
set_video_mode proc ; Modo video 13H (320x200)
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

    ; Laco de controle do menu inicial
    laco_principal:
        cmp estado_programa, 2
        je end_game

        cmp estado_programa, 1
        je limpa_tela
        
        cmp estado_programa, 3
        je laco_game

        CALL trata_display_init
        CALL trata_teclado_menu_inicial

        jmp laco_principal 

        limpa_tela:
            CALL set_video_mode

            ; Desenha a nave a primeira vez
            mov si, offset nave
            mov ax, pos_y_navegame
            mov bx, pos_xo_navegame
            call desenha_objeto

            mov estado_programa, 3
        jmp laco_principal

        laco_game:
            ;CALL trata_display_game
            CALL trata_teclado_game
            mov si, offset nave
            mov ax, pos_y_navegame
            mov bx, pos_xo_navegame
            call desenha_objeto
            ;CALL trata_controle_game
            ;CALL delay_microsegundos

        jmp laco_principal  
    
    ; Rotulo para finalizar o programa
    end_game:
        mov AX, 4C00h     ; sair para o DOS
        int 21h           ; chamar fun??o DOS
        
end inicio
