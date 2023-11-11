.model small     
      
.stack 100H

.data  

   display_menu db '   _       _                 _     _ ',13,10             
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
  displaymenu_length EQU $-display_menu
  escolher_menu db '               [ Jogar ]              ',13,10
                db '                 Sair                 ',13,10
                
;display_gameover db               ;FIM DE JOGO           '          


.code

;-==================== PROCS PARA ESCRITA =========================-

    ; A variavel fica armazenada em SI, na posi??o da memoria DI
    ; Quantidade de caracterES fica em CX
    ; PROC feita para escrita de string
    esc_stringm PROC
       push ES
       push BX

        
       mov BX, 0h
       mov ES, BX      
       loop_string:       
       lodsb               ; move ES:DI para AL, colocando o proximo caracter em AL
            mov ES:[DI], AL      ; escreve caracter na mem de video
            inc DI              ; move para a proxima coluna
            mov ES:[DI], AH      ; escreve atributo, cor e afins na memoria de video
            inc DI              ; incrementa
            
            loop loop_string  ; repete ate terminar
        pop BX
        pop ES
        
        ret
    ENDP 
    
    ; O Caractere fica armazenado em BL
    ; PROC feita para escrita char na posi??o da memoria DI 
    esc_charm PROC
       push ES
        
       mov AX, 0h
       mov ES, AX                      
         
       mov ES:[DI],BL      
       inc DI           
       mov ES:[DI],BH    
       inc DI
        
       pop ES
       ret
    ENDP

    ; PROC que chama o MENU_INICIO
    menu_inicio PROC
        push AX 
        push SI
        push CX 
        push DI     
        
        mov bp,OFFSET display_menu  ; ES:BP points to message
        mov ah,13h      ; function 13 - write string
        mov al,01h      ; attrib in bl,move cursor
        xor bh,bh       ; video page 0
        mov bl,2        ; attribute 
        mov cx,displaymenu_length      ; length of string
        mov dh,1        ; row to put string
        mov dl,1        ; column to put string
        int 10h         ; call BIOS service
            
        mov bp,OFFSET escolher_menu  ; ES:BP points to message
        mov ah,13h      ; function 13 - write string
        mov al,01h      ; attrib in bl,move cursor
        xor bh,bh       ; video page 0
        mov bl, 7       ; attribute 
        mov cx,84       ; length of string
        mov dh,16        ; row to put string
        mov dl,00        ; column to put string
        int 10h         ; call BIOS service
    
        jmp arrow_up
    
        key_check:
            mov     AH, 01h     
            int     16h         
            jz      nokey
            mov     AH, 00h     
            int     16h   
               
            cmp     AL, 0DH     ; bot?o do teclado enter
            je      center
            
            cmp     AH, 48H     ; seta do teclado para cima
            je      arrow_up
            
            cmp     AH, 50H     ;  seta do teclado para baixo
            je      arrow_down
            
        nokey:
            jmp key_check  
        
                
        arrow_up:
            xor dl, dl          ; Advinda do menu, op??o Sair
            mov BH, 0FH  
            mov DI, 456         ; posi??o q deve ir
            mov BL, '['
            CALL esc_charm   ; chama PROC de escrita
            mov DI, 464         ; posi??o q deve ir
            mov BL, ']'      
            CALL esc_charm   ; chama PROC de escrita
            
            mov DI, 496         ; posi??o q deve ir
            mov BL, ' '
            CALL esc_charm   ; chama PROC de escrita
            mov DI, 503          ; posi??o q deve ir
            mov BL, ' '
            CALL esc_charm   ; chama PROC de escrita
            jmp key_check
            
        arrow_down:
            mov dl, 1         ; Advinda do menu, op??o Sair
            mov BH, 0FH
            mov DI, 427       ; posi??o q deve ir
            mov BL, ' '
            CALL esc_charm ; chama PROC de escrita
            mov DI, 436       ; posi??o q deve ir
            mov BL, ' '
            CALL esc_charm ; chama PROC de escrita
            
            mov DI, 496       ; posi??o q deve ir
            mov BL, '['
            CALL esc_charm ; chama PROC de escrita
            mov DI, 503        ; posi??o q deve ir
            mov BL, ']'
            CALL esc_charm ; chama PROC de escrita
            jmp key_check
            
        center:
            cmp dl, 0
            je jogar
            jmp sair
            
        jogar:
            ;;; deveria chamar a PROC para iniciar o jogo, mas nao consegui sair dessa primeira tela
        sair:
        mov AX,4C00h     ; sair para o dos
        int 21h      ; chamar fun??o dos
        
        pop SI ; Recupera o dado do topo da pilha para o registrador 
        pop DI ; Recupera o dado do topo da pilha para o registrador 
        pop AX ; Recupera o dado do topo da pilha para o registrador 
        pop CX ; Recupera o dado do topo da pilha para o registrador 
        
        ret
    ENDP    
      
    inicio:       
    
        mov AX, @DATA 
        mov ES, AX  
        
        mov AX, @DATA 
        mov DS, AX  
         
         
        mov AX, 13h  ; Programa o modo de video 13h
        int 10h     ; Interrup??o para chama de servi?o da BIOS
        
        
        CALL menu_inicio   
        
        
        ; sair de que jeito
        mov AX, 4C00h     ; sair para o DOS
        int 21h      ; chamar fun??o DOS
         
end inicio