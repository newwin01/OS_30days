; hello-os
; TAB=4

		ORG		0x7c00			; �� ���α׷��� ��� read�Ǵ°�

; ���ϴ� ǥ������ FAT12 ���� �÷��� ��ũ�� ���� ���

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; boot sector�̸��� �����Ӱ� �ᵵ ����(8����Ʈ)
		DW		512			; 1���� ũ��(512�� �ؾ� ��)
		DB		1			; Ŭ������ ũ��(1���ͷ� �ؾ� ��)
		DW		1			; FAT�� ��𿡼� ���۵ɱ�(������ 1����°����)
		DB		2			; FAT ����(2�� �ؾ� ��)
		DW		224			; ��Ʈ ���丮 ������ ũ��(������ 224��Ʈ���� �Ѵ�)
		DW		2880			; ����̺� ũ��(2880���ͷ� �ؾ� ��)
		DB		0xf0			; �̵�� Ÿ��(0xf0�� �ؾ� ��)
		DW		9			; FAT������ ����(9���ͷ� �ؾ� ��)
		DW		18			; 1Ʈ���� �� ���� ���Ͱ� ������(18�� �ؾ� ��)
		DW		2			; ��� ��(2�� �ؾ� ��)
		DD		0			; ��Ƽ���� ������� �ʱ� ������ ����� �ݵ�� 0
		DD		2880			; ����̺� ũ�⸦ �ѹ� �� write
		DB		0,0,0x29		; �� ������ �� ������ �� �θ� ���� �� ����
		DD		0xffffffff		; �Ƹ�, ���� �ø��� ��ȣ
		DB		"HELLO-OS   "		; ��ũ �̸�(11����Ʈ)
		DB		"FAT12   "		; ���� �̸�(8����Ʈ)
		RESB	18				; �켱 18����Ʈ�� ��� �д�

; ���α׷� ��ü

entry:
		MOV		AX, 0			; �������� �ʱ�ȭ
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI, 1			; SI�� 1�� ���Ѵ�
		CMP		AL,0
		JE		fin
		MOV		AH, 0x0e		; �� ���� ǥ�� Function
		MOV		BX, 15			; Į�� �ڵ�
		INT		0x10			; ���� BIOS ȣ��
		JMP		putloop
fin:
		HLT					; �����ΰ� ���� ������ CPU�� ������Ų��
		JMP		fin			; Endless Loop

msg:
		DB		0x0a, 0x0a		; ������ 2��
		DB		"hello, world"
		DB		0x0a			; ����
		DB		0

		RESB	0x7dfe-$		; 0x7dfe������ 0x00�� ä��� ���

		DB		0x55, 0xaa
