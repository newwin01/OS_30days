void io_hlt(void);

void HariMain(void)
{
	int i; /* ���� ����.i��� �ϴ� ������ 32 ��Ʈ ������ */
	char *p; /* p��� �ϴ� ������ BYTE [...]�� ���� */

	for (i = 0xa0000; i <= 0xaffff; i++) {

		p = (char *) i; /* ������ ���� */
		*p = i & 0x0f;

		/* �̰����� write_mem8(i, i & 0x0f); ��� */
	}

	for (;;) {
		io_hlt();
	}
}
