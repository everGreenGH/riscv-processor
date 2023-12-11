/* ********************************************
 *	COSE222 Lab #2
 *
 *	Module: instruction memory (imem.sv)
 *	- 1 address input port
 *	- 32-bit 1 data output port
 *	- A single entry size is 32 bit, which is equivalent to the RISC-V instruction size
 *
 *	Author: Gunjae Koo (gunjaekoo@korea.ac.kr)
 *
 * ********************************************
 */

`timescale 1ns/1ps

module imem
#(  parameter IMEM_DEPTH = 1024,    // imem depth (default: 1024 entries = 4 KB)
              IMEM_ADDR_WIDTH = 10 )
(
    input   [IMEM_ADDR_WIDTH-1:0]   addr, // pc를 주소로 받아서,
    output  [31:0]  dout // 32bit instruction을 반환한다.
);

    logic   [31:0]  data[0:IMEM_DEPTH-1]; // instruction을 저장하기 위한 레지스터이다.

    assign dout = data[addr]; // 레지스터에서 주소에 맞는 instruction 값을 반환한다.

// synthesis translate_off
    initial begin
        for (int i = 0; i < IMEM_DEPTH; i++)
            data[i] = 'b0; // 0으로 모두 초기화
        $readmemb("imem.mem", data); // imem.mem 데이터 파일에서 가져옴
    end
// synthesis translate_on

endmodule
