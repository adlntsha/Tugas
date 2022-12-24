.model small
.code
org 100h
start:
    jmp mulai
nama        db 13,10,'Nama customer  : $'
nomor       db 13,10,'Nomor customer : $'
lanjut      db 13,10,'Untuk lanjut silahkan tekan y >>>>>>>>>>>>>>>> $'
tampung_nama     db 30,?,30 dup(?)
tampung_nomor    db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
j dw 15

daftar  db 13,10,'                                  ++  DAFTAR HARGA LAPTOP HP ++                        '
        db 13,10,'+----+---------------------------------------------------+--------------+'
        db 13,10,'| NO |              Spesifikasi Laptop                   |    HARGA     |'  
        db 13,10,'+----+---------------------------------------------------+--------------+'
        db 13,10,'| 01 |ASUS ROG ZEPHYRUS G14:RAM 16 GB DDR4 3200 MHz SDRAM|  21.000.000  |'
        db 13,10,'+----+---------------------------------------------------+--------------+'
        db 13,10,'| 02 |LENOVO LEGION :RAM 32 GB DDR4 2666 MHz              |  25.499.000  |'
        db 13,10,'+----+---------------------------------------------------+--------------+'
        db 13,10,'| 03 |MACBOOK 2022 : RAM LPPDR5 24 GB                     |  22.087.890  |'
        db 13,10,'+----+---------------------------------------------------+--------------+','$'



error       db 13,10,'jenis merk laptop yang anda masukkan tidak tersedia $'
pilih       db 13,10,'masukkan nomor jenis nama laptop yang anda pilih $'
success db 13,10,'anda berhasil melakukan pemesanan $'

mulai:
        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,tampung_nama
        int 21h
        push dx

        mov ah,09h
        lea dx,nomor
        int 21h
        mov ah,0ah
        lea dx,tampung_nomor
        int 21h
        push dx

        mov ah,09h
        mov dx,offset daftar
        int 21h
        mov ah,09h
        mov dx,offset lanjut
        int 21h
        mov ah,01h
        int 21h
        cmp al,'y'
        je proses
        jne error_nsg

error_nsg:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h

proses:
    mov ah,09h
    mov dx,offset pilih
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2


    cmp bh,'0'
    cmp bl,'3'
    je hasil3



;--------------------------------------------------------------------------

hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    int 20h


;--------------------------------------------------------------------------------------------------------

teks1       db 13,10,'                                       '
        db 13,10,'JENIS LAPTOP YANG ANDA PILIH ADALAH ASUS ROG ZEPHYRUS G14:RAM 16 GB DDR4 3200 MHz SDRAM '
        db 13,10,'Total harga yang harus anda bayar : Rp 21.000.000'
        db 13,10,'Terima Kasih karena sudah membeli $'

teks2       db 13,10,'                                       '
        db 13,10,'JENIS LAPTOP YANG ANDA PILIH ADALAH LENOVO LEGION :RAM 32 GB DDR4 2666 MHz '
        db 13,10,'Total harga yang harus anda bayar : Rp 25.499.000'
        db 13,10,'Terima Kasih karena sudah membeli $' 

teks3       db 13,10,'                                       '
        db 13,10,'JENIS LAPTOP YANG ANDA PILIH ADALAH MACBOOK 2022 : RAM LPPDR5 24 GB'
        db 13,10,'Total harga yang harus anda bayar : Rp 22.087.890 '
        db 13,10,'Terima Kasih karena sudah membeli $' 


end start