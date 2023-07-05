; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; ������Ʈ ������ ����� ���	
[INSTRSET "i486p"]				; 486�� ��ɱ��� ����ϰ� �ʹٰ� �ϴ� ���
[BITS 32]					; 32 ��Ʈ ������ ��� �����
[FILE "naskfunc.nas"]				; ���� ���ϸ� ����

		GLOBAL	_io_hlt,_write_mem8

[SECTION .text]

_io_hlt:	; void io_hlt(void);
		HLT
		RET

_write_mem8:	; void write_mem8(int addr, int data);
		MOV		ECX,[ESP+4]		; [ESP+4]�� addr�� �� �����Ƿ� �װ��� ECX�� read
		MOV		AL,[ESP+8]		; [ESP+8]�� data�� �� �����Ƿ� �װ��� AL�� read
		MOV		[ECX],AL
		RET
