; haribote-os
; TAB=4

; BOOT_INFO����
CYLS	EQU		0x0ff0			; boot sector�� �����Ѵ�
LEDS	EQU		0x0ff1
VMODE	EQU		0x0ff2			; �� �������� ���� ����.� ��Ʈ Į���ΰ�?
SCRNX	EQU		0x0ff4			; �ػ��� X
SCRNY	EQU		0x0ff6			; �ػ��� Y
VRAM	EQU		0x0ff8			; �׷��� ������ ���� ����

		ORG		0xc200		; �� ���α׷��� ��� Read�Ǵ°�

		MOV		AL, 0x13	; VGA �׷��Ƚ�, 320 x200x8bit Į��
		MOV		AH,0x00
		INT		0x10
		MOV		BYTE [VMODE], 8	; ȭ�� ��带 write�Ѵ�
		MOV		WORD [SCRNX],320
		MOV		WORD [SCRNY],200
		MOV		DWORD [VRAM],0x000a0000

; Ű������ LED���¸� BIOS�� �˷��ش�

		MOV		AH,0x02
		INT		0x16 		; keyboard BIOS
		MOV		[LEDS],AL

fin:
		HLT
		JMP		fin
