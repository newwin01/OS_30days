# OS knowledge

- v**boxmanage convertdd synoboot.img synoboot.vdi**
- The final two bytes of the first sector are `0x55` and `0xaa`,  which designates to the BIOS that this device is bootable. Once the BIOS finds the boot sector, it copies it into a fixed memory location at 0x7c00, jumps there, and starts executing it.
- Memory map
    
    **IBM PC AT 호환기종의 메모리 맵핑**
    
    - PCI 장치 혹은 PC에 장착하는 카드를 사용할 때, 각 장치가 메모리에 맵핑되는 상태를 설명합니다.
    - 0x00000000 - 0x0009ffff ： RAM
    - 0x000a0000 - 0x000bffff ： 비디오 카드 접근 영역
    - 0x000c0000 - 0x000c7fff ： 비디오 BIOS
    - 0x000c8000 - 0x000dffff ： 각종 카드의 ROM 영역
    - 0x000d0000 - 0x000dffff 영역은 대부분 비어 있다
    - 0x000e0000 - 0x000effff ： 확장 BIOS
    - 0x000f0000 - 0x000fffff ： BIOS
    - 0x00100000 - 0x00efffff ： RAM
    - 0x00f00000 - 0x00ffffff ： RAM 혹은 ISA 홀(BIOS의 설정에 의해서 결정될 수 있다)
        - 286의 경우는, 0x00fffff0로부터의 16바이트에 리셋트 점프 명령이 있을 수도 있다
    - 0x01000000 - 메모리의 끝 ： RAM
    - 메모리의 끝 - 0xffffffef ： PCI 장치등의 메모리 맵핑 I/O에 이용 가능한 영역
    - 0xfffffff0 - 0xffffffff ： 386이후에서는 여기에 리셋트 점프 명령이 있다
    
    # 소프트웨어에 따른 용도 구분
    
    - 0x00000000 - 0x000003ff ： 리얼모드용 인터럽트 벡터
    - 물론 IDT를 변경하면 변경할 수 있지만 기본적으로는 이 주소가 사용된다
    - 0x00000300 - 0x000003ff는 BIOS용 스택
    - 0x00000400 - 0x000004ff : BIOS가 사용하는 영역
    - 0x00007c00 - 0x00007dff ： 부트섹터가 로딩되는 주소
    - 0x0009fc00 - 0x0009ffff ： ACPI 영역
    -