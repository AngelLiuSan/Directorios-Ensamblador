org 100h
jmp inicio
directorio db "C:\emu8086\MyBuild\prueba1", 0 ;ascii del nombre del 
directori1 db "C:\emu8086\MyBuild", 0 ;ascii del nombre del 
archivo db "C:\emu8086\MyBuild\prueba1\prueba.txt", 0 ;ascii del nombre del archivo   
nombre db "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",0  
leido db "Traductores de lenguaje 1$"
handle dw ? ;identificador del arhivo  
;directorio 
inicio:    
;crea directorio
mov dx, offset directorio 
mov ah, 39h  
int 21h  
;Entrar a directorio
mov dx, offset directorio 
mov ah, 3Bh 
int 21h     

;Archivo  
;Crear archivo
mov cx, 00H 
mov dx, offset archivo 
mov ah, 3Ch 
int 21h

;Entrar al archivo
mov al, 1 
mov dx, offset archivo 
mov ah, 3dh 
int 21h 
mov handle, ax 


;Escribir archivo 
mov bx, handle 
mov cx, 25 
mov dx, offset leido
mov ah, 40h 
int 21h

;Salir archivo
mov bx, handle 
mov ah, 3eh 
int 21h
 
;borrar archivo 
mov ah, 41H 
mov dx, offset archivo
int 21h

;Fin de archivo
;directorio 
;Salir directorio
mov dl,0 
mov si,offset nombre
mov ah, 47h ; Obtener directorio actual DS:SI apunta al directorio 
int 21h
;cambiar directorio 
mov dx, offset directori1 ; offset lugar de memoria donde esta la variable
mov ah, 3Bh ; cambio de directorio DS:DX apunta al directorio
int 21h ;llamada a la interrupcion DOS  
;Borrar directorio
mov dx, offset directorio ; offset lugar de memoria donde esta la variable
mov ah, 3AH ; borra directorio DS:DX apunta al directorio
int 21h ;llamada a la interrupcion DOS
ret

