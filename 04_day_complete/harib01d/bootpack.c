void io_hlt(void);

void HariMain(void)
{
	int i; /* ���� ����.i��� �ϴ� ������ 32��Ʈ ������ */
	char *p; /* p��� �ϴ� ������ BYTE [...]�� ���� */

	p = (char *) 0xa0000; /* ������ ���� */

	for (i = 0; i <= 0xffff; i++) {
		*(p + i) = i & 0x0f;
	}

	for (;;) {
		io_hlt();
	}
}
