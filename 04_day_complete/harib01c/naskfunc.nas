; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; ������Ʈ ������ ����� ���	
[INSTRSET "i486p"]				; 486�� ��ɱ��� ����ϰ� �ʹٰ� �ϴ� ���
[BITS 32]					; 32 ��Ʈ ������ ��� �����
[FILE "naskfunc.nas"]				; ���� ���ϸ� ����

		GLOBAL	_io_hlt

[SECTION .text]

_io_hlt:	; void io_hlt(void);
		HLT
		RET
