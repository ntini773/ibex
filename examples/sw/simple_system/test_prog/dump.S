
test.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00100000 <_vectors_start>:
  100000:	3420006f          	j	100342 <default_exc_handler>
  100004:	33e0006f          	j	100342 <default_exc_handler>
  100008:	33a0006f          	j	100342 <default_exc_handler>
  10000c:	3360006f          	j	100342 <default_exc_handler>
  100010:	3320006f          	j	100342 <default_exc_handler>
  100014:	32e0006f          	j	100342 <default_exc_handler>
  100018:	32a0006f          	j	100342 <default_exc_handler>
  10001c:	32a0006f          	j	100346 <timer_handler>
  100020:	3220006f          	j	100342 <default_exc_handler>
  100024:	31e0006f          	j	100342 <default_exc_handler>
  100028:	31a0006f          	j	100342 <default_exc_handler>
  10002c:	3160006f          	j	100342 <default_exc_handler>
  100030:	3120006f          	j	100342 <default_exc_handler>
  100034:	30e0006f          	j	100342 <default_exc_handler>
  100038:	30a0006f          	j	100342 <default_exc_handler>
  10003c:	3060006f          	j	100342 <default_exc_handler>
  100040:	3020006f          	j	100342 <default_exc_handler>
  100044:	2fe0006f          	j	100342 <default_exc_handler>
  100048:	2fa0006f          	j	100342 <default_exc_handler>
  10004c:	2f60006f          	j	100342 <default_exc_handler>
  100050:	2f20006f          	j	100342 <default_exc_handler>
  100054:	2ee0006f          	j	100342 <default_exc_handler>
  100058:	2ea0006f          	j	100342 <default_exc_handler>
  10005c:	2e60006f          	j	100342 <default_exc_handler>
  100060:	2e20006f          	j	100342 <default_exc_handler>
  100064:	2de0006f          	j	100342 <default_exc_handler>
  100068:	2da0006f          	j	100342 <default_exc_handler>
  10006c:	2d60006f          	j	100342 <default_exc_handler>
  100070:	2d20006f          	j	100342 <default_exc_handler>
  100074:	2ce0006f          	j	100342 <default_exc_handler>
  100078:	2ca0006f          	j	100342 <default_exc_handler>
  10007c:	0000                	.insn	2, 0x0000
  10007e:	0000                	.insn	2, 0x0000
  100080:	2ca0006f          	j	10034a <reset_handler>

Disassembly of section .text:

00100084 <putchar>:
  100084:	0ff57793          	zext.b	a5,a0
  100088:	00020737          	lui	a4,0x20
  10008c:	c31c                	sw	a5,0(a4)
  10008e:	8082                	ret

00100090 <puts>:
  100090:	00020737          	lui	a4,0x20
  100094:	00054783          	lbu	a5,0(a0)
  100098:	e399                	bnez	a5,10009e <puts+0xe>
  10009a:	4501                	li	a0,0
  10009c:	8082                	ret
  10009e:	0505                	addi	a0,a0,1
  1000a0:	c31c                	sw	a5,0(a4)
  1000a2:	bfcd                	j	100094 <puts+0x4>

001000a4 <puthex>:
  1000a4:	4721                	li	a4,8
  1000a6:	4625                	li	a2,9
  1000a8:	000206b7          	lui	a3,0x20
  1000ac:	01c55793          	srli	a5,a0,0x1c
  1000b0:	00f66963          	bltu	a2,a5,1000c2 <puthex+0x1e>
  1000b4:	03078793          	addi	a5,a5,48
  1000b8:	c29c                	sw	a5,0(a3)
  1000ba:	177d                	addi	a4,a4,-1 # 1ffff <_stack_len+0x17fff>
  1000bc:	0512                	slli	a0,a0,0x4
  1000be:	f77d                	bnez	a4,1000ac <puthex+0x8>
  1000c0:	8082                	ret
  1000c2:	03778793          	addi	a5,a5,55
  1000c6:	bfcd                	j	1000b8 <puthex+0x14>

001000c8 <sim_halt>:
  1000c8:	000207b7          	lui	a5,0x20
  1000cc:	4705                	li	a4,1
  1000ce:	c798                	sw	a4,8(a5)
  1000d0:	8082                	ret

001000d2 <pcount_reset>:
  1000d2:	b0201073          	csrw	minstret,zero
  1000d6:	b0001073          	csrw	mcycle,zero
  1000da:	b0301073          	csrw	mhpmcounter3,zero
  1000de:	b0401073          	csrw	mhpmcounter4,zero
  1000e2:	b0501073          	csrw	mhpmcounter5,zero
  1000e6:	b0601073          	csrw	mhpmcounter6,zero
  1000ea:	b0701073          	csrw	mhpmcounter7,zero
  1000ee:	b0801073          	csrw	mhpmcounter8,zero
  1000f2:	b0901073          	csrw	mhpmcounter9,zero
  1000f6:	b0a01073          	csrw	mhpmcounter10,zero
  1000fa:	b0b01073          	csrw	mhpmcounter11,zero
  1000fe:	b0c01073          	csrw	mhpmcounter12,zero
  100102:	b0d01073          	csrw	mhpmcounter13,zero
  100106:	b0e01073          	csrw	mhpmcounter14,zero
  10010a:	b0f01073          	csrw	mhpmcounter15,zero
  10010e:	b1001073          	csrw	mhpmcounter16,zero
  100112:	b1101073          	csrw	mhpmcounter17,zero
  100116:	b1201073          	csrw	mhpmcounter18,zero
  10011a:	b1301073          	csrw	mhpmcounter19,zero
  10011e:	b1401073          	csrw	mhpmcounter20,zero
  100122:	b1501073          	csrw	mhpmcounter21,zero
  100126:	b1601073          	csrw	mhpmcounter22,zero
  10012a:	b1701073          	csrw	mhpmcounter23,zero
  10012e:	b1801073          	csrw	mhpmcounter24,zero
  100132:	b1901073          	csrw	mhpmcounter25,zero
  100136:	b1a01073          	csrw	mhpmcounter26,zero
  10013a:	b1b01073          	csrw	mhpmcounter27,zero
  10013e:	b1c01073          	csrw	mhpmcounter28,zero
  100142:	b1d01073          	csrw	mhpmcounter29,zero
  100146:	b1e01073          	csrw	mhpmcounter30,zero
  10014a:	b1f01073          	csrw	mhpmcounter31,zero
  10014e:	b8201073          	csrw	minstreth,zero
  100152:	b8001073          	csrw	mcycleh,zero
  100156:	b8301073          	csrw	mhpmcounter3h,zero
  10015a:	b8401073          	csrw	mhpmcounter4h,zero
  10015e:	b8501073          	csrw	mhpmcounter5h,zero
  100162:	b8601073          	csrw	mhpmcounter6h,zero
  100166:	b8701073          	csrw	mhpmcounter7h,zero
  10016a:	b8801073          	csrw	mhpmcounter8h,zero
  10016e:	b8901073          	csrw	mhpmcounter9h,zero
  100172:	b8a01073          	csrw	mhpmcounter10h,zero
  100176:	b8b01073          	csrw	mhpmcounter11h,zero
  10017a:	b8c01073          	csrw	mhpmcounter12h,zero
  10017e:	b8d01073          	csrw	mhpmcounter13h,zero
  100182:	b8e01073          	csrw	mhpmcounter14h,zero
  100186:	b8f01073          	csrw	mhpmcounter15h,zero
  10018a:	b9001073          	csrw	mhpmcounter16h,zero
  10018e:	b9101073          	csrw	mhpmcounter17h,zero
  100192:	b9201073          	csrw	mhpmcounter18h,zero
  100196:	b9301073          	csrw	mhpmcounter19h,zero
  10019a:	b9401073          	csrw	mhpmcounter20h,zero
  10019e:	b9501073          	csrw	mhpmcounter21h,zero
  1001a2:	b9601073          	csrw	mhpmcounter22h,zero
  1001a6:	b9701073          	csrw	mhpmcounter23h,zero
  1001aa:	b9801073          	csrw	mhpmcounter24h,zero
  1001ae:	b9901073          	csrw	mhpmcounter25h,zero
  1001b2:	b9a01073          	csrw	mhpmcounter26h,zero
  1001b6:	b9b01073          	csrw	mhpmcounter27h,zero
  1001ba:	b9c01073          	csrw	mhpmcounter28h,zero
  1001be:	b9d01073          	csrw	mhpmcounter29h,zero
  1001c2:	b9e01073          	csrw	mhpmcounter30h,zero
  1001c6:	b9f01073          	csrw	mhpmcounter31h,zero
  1001ca:	8082                	ret

001001cc <get_mepc>:
  1001cc:	34102573          	csrr	a0,mepc
  1001d0:	8082                	ret

001001d2 <get_mcause>:
  1001d2:	34202573          	csrr	a0,mcause
  1001d6:	8082                	ret

001001d8 <get_mtval>:
  1001d8:	34302573          	csrr	a0,mtval
  1001dc:	8082                	ret

001001de <simple_exc_handler>:
  1001de:	1141                	addi	sp,sp,-16
  1001e0:	00000517          	auipc	a0,0x0
  1001e4:	1f850513          	addi	a0,a0,504 # 1003d8 <main+0xe>
  1001e8:	c606                	sw	ra,12(sp)
  1001ea:	355d                	jal	100090 <puts>
  1001ec:	00000517          	auipc	a0,0x0
  1001f0:	1fc50513          	addi	a0,a0,508 # 1003e8 <main+0x1e>
  1001f4:	3d71                	jal	100090 <puts>
  1001f6:	00000517          	auipc	a0,0x0
  1001fa:	20250513          	addi	a0,a0,514 # 1003f8 <main+0x2e>
  1001fe:	3d49                	jal	100090 <puts>
  100200:	34102573          	csrr	a0,mepc
  100204:	3545                	jal	1000a4 <puthex>
  100206:	00000517          	auipc	a0,0x0
  10020a:	1fe50513          	addi	a0,a0,510 # 100404 <main+0x3a>
  10020e:	3549                	jal	100090 <puts>
  100210:	34202573          	csrr	a0,mcause
  100214:	3d41                	jal	1000a4 <puthex>
  100216:	00000517          	auipc	a0,0x0
  10021a:	1fa50513          	addi	a0,a0,506 # 100410 <main+0x46>
  10021e:	3d8d                	jal	100090 <puts>
  100220:	34302573          	csrr	a0,mtval
  100224:	3541                	jal	1000a4 <puthex>
  100226:	000207b7          	lui	a5,0x20
  10022a:	4729                	li	a4,10
  10022c:	c398                	sw	a4,0(a5)
  10022e:	4705                	li	a4,1
  100230:	c798                	sw	a4,8(a5)
  100232:	a001                	j	100232 <simple_exc_handler+0x54>

00100234 <timer_disable>:
  100234:	08000793          	li	a5,128
  100238:	3047b073          	csrc	mie,a5
  10023c:	8082                	ret

0010023e <timer_read>:
  10023e:	000306b7          	lui	a3,0x30
  100242:	00468793          	addi	a5,a3,4 # 30004 <tohost+0xfffc>
  100246:	4398                	lw	a4,0(a5)
  100248:	4288                	lw	a0,0(a3)
  10024a:	438c                	lw	a1,0(a5)
  10024c:	fee59de3          	bne	a1,a4,100246 <timer_read+0x8>
  100250:	8082                	ret

00100252 <timecmp_update>:
  100252:	000307b7          	lui	a5,0x30
  100256:	577d                	li	a4,-1
  100258:	c798                	sw	a4,8(a5)
  10025a:	c7cc                	sw	a1,12(a5)
  10025c:	c788                	sw	a0,8(a5)
  10025e:	8082                	ret

00100260 <timer_enable>:
  100260:	1141                	addi	sp,sp,-16
  100262:	c606                	sw	ra,12(sp)
  100264:	c422                	sw	s0,8(sp)
  100266:	c226                	sw	s1,4(sp)
  100268:	4681                	li	a3,0
  10026a:	00000797          	auipc	a5,0x0
  10026e:	1be78793          	addi	a5,a5,446 # 100428 <time_elapsed>
  100272:	c394                	sw	a3,0(a5)
  100274:	4701                	li	a4,0
  100276:	c3d8                	sw	a4,4(a5)
  100278:	00000797          	auipc	a5,0x0
  10027c:	1a878793          	addi	a5,a5,424 # 100420 <time_increment>
  100280:	842a                	mv	s0,a0
  100282:	84ae                	mv	s1,a1
  100284:	c388                	sw	a0,0(a5)
  100286:	c3cc                	sw	a1,4(a5)
  100288:	3f5d                	jal	10023e <timer_read>
  10028a:	9522                	add	a0,a0,s0
  10028c:	00853433          	sltu	s0,a0,s0
  100290:	95a6                	add	a1,a1,s1
  100292:	95a2                	add	a1,a1,s0
  100294:	3f7d                	jal	100252 <timecmp_update>
  100296:	08000793          	li	a5,128
  10029a:	3047a073          	csrs	mie,a5
  10029e:	47a1                	li	a5,8
  1002a0:	3007a073          	csrs	mstatus,a5
  1002a4:	40b2                	lw	ra,12(sp)
  1002a6:	4422                	lw	s0,8(sp)
  1002a8:	4492                	lw	s1,4(sp)
  1002aa:	0141                	addi	sp,sp,16
  1002ac:	8082                	ret

001002ae <get_elapsed_time>:
  1002ae:	00000797          	auipc	a5,0x0
  1002b2:	17a78793          	addi	a5,a5,378 # 100428 <time_elapsed>
  1002b6:	4388                	lw	a0,0(a5)
  1002b8:	43cc                	lw	a1,4(a5)
  1002ba:	8082                	ret

001002bc <simple_timer_handler>:
  1002bc:	715d                	addi	sp,sp,-80
  1002be:	d03e                	sw	a5,32(sp)
  1002c0:	00000797          	auipc	a5,0x0
  1002c4:	16078793          	addi	a5,a5,352 # 100420 <time_increment>
  1002c8:	de22                	sw	s0,60(sp)
  1002ca:	4380                	lw	s0,0(a5)
  1002cc:	dc26                	sw	s1,56(sp)
  1002ce:	43c4                	lw	s1,4(a5)
  1002d0:	d632                	sw	a2,44(sp)
  1002d2:	c686                	sw	ra,76(sp)
  1002d4:	c496                	sw	t0,72(sp)
  1002d6:	c29a                	sw	t1,68(sp)
  1002d8:	c09e                	sw	t2,64(sp)
  1002da:	d436                	sw	a3,40(sp)
  1002dc:	d23a                	sw	a4,36(sp)
  1002de:	ce42                	sw	a6,28(sp)
  1002e0:	cc46                	sw	a7,24(sp)
  1002e2:	ca72                	sw	t3,20(sp)
  1002e4:	c876                	sw	t4,16(sp)
  1002e6:	c67a                	sw	t5,12(sp)
  1002e8:	c47e                	sw	t6,8(sp)
  1002ea:	da2a                	sw	a0,52(sp)
  1002ec:	d82e                	sw	a1,48(sp)
  1002ee:	3f81                	jal	10023e <timer_read>
  1002f0:	9522                	add	a0,a0,s0
  1002f2:	00853433          	sltu	s0,a0,s0
  1002f6:	95a6                	add	a1,a1,s1
  1002f8:	95a2                	add	a1,a1,s0
  1002fa:	3fa1                	jal	100252 <timecmp_update>
  1002fc:	00000597          	auipc	a1,0x0
  100300:	12c58593          	addi	a1,a1,300 # 100428 <time_elapsed>
  100304:	4180                	lw	s0,0(a1)
  100306:	41c4                	lw	s1,4(a1)
  100308:	40b6                	lw	ra,76(sp)
  10030a:	00140513          	addi	a0,s0,1
  10030e:	00853633          	sltu	a2,a0,s0
  100312:	5472                	lw	s0,60(sp)
  100314:	009607b3          	add	a5,a2,s1
  100318:	c188                	sw	a0,0(a1)
  10031a:	c1dc                	sw	a5,4(a1)
  10031c:	42a6                	lw	t0,72(sp)
  10031e:	4316                	lw	t1,68(sp)
  100320:	4386                	lw	t2,64(sp)
  100322:	54e2                	lw	s1,56(sp)
  100324:	5552                	lw	a0,52(sp)
  100326:	55c2                	lw	a1,48(sp)
  100328:	5632                	lw	a2,44(sp)
  10032a:	56a2                	lw	a3,40(sp)
  10032c:	5712                	lw	a4,36(sp)
  10032e:	5782                	lw	a5,32(sp)
  100330:	4872                	lw	a6,28(sp)
  100332:	48e2                	lw	a7,24(sp)
  100334:	4e52                	lw	t3,20(sp)
  100336:	4ec2                	lw	t4,16(sp)
  100338:	4f32                	lw	t5,12(sp)
  10033a:	4fa2                	lw	t6,8(sp)
  10033c:	6161                	addi	sp,sp,80
  10033e:	30200073          	mret

00100342 <default_exc_handler>:
  100342:	e9dff06f          	j	1001de <simple_exc_handler>

00100346 <timer_handler>:
  100346:	f77ff06f          	j	1002bc <simple_timer_handler>

0010034a <reset_handler>:
  10034a:	00000093          	li	ra,0
  10034e:	8106                	mv	sp,ra
  100350:	8186                	mv	gp,ra
  100352:	8206                	mv	tp,ra
  100354:	8286                	mv	t0,ra
  100356:	8306                	mv	t1,ra
  100358:	8386                	mv	t2,ra
  10035a:	8406                	mv	s0,ra
  10035c:	8486                	mv	s1,ra
  10035e:	8506                	mv	a0,ra
  100360:	8586                	mv	a1,ra
  100362:	8606                	mv	a2,ra
  100364:	8686                	mv	a3,ra
  100366:	8706                	mv	a4,ra
  100368:	8786                	mv	a5,ra
  10036a:	8806                	mv	a6,ra
  10036c:	8886                	mv	a7,ra
  10036e:	8906                	mv	s2,ra
  100370:	8986                	mv	s3,ra
  100372:	8a06                	mv	s4,ra
  100374:	8a86                	mv	s5,ra
  100376:	8b06                	mv	s6,ra
  100378:	8b86                	mv	s7,ra
  10037a:	8c06                	mv	s8,ra
  10037c:	8c86                	mv	s9,ra
  10037e:	8d06                	mv	s10,ra
  100380:	8d86                	mv	s11,ra
  100382:	8e06                	mv	t3,ra
  100384:	8e86                	mv	t4,ra
  100386:	8f06                	mv	t5,ra
  100388:	8f86                	mv	t6,ra
  10038a:	00038117          	auipc	sp,0x38
  10038e:	c7610113          	addi	sp,sp,-906 # 138000 <_stack_start>

00100392 <_start>:
  100392:	00000d17          	auipc	s10,0x0
  100396:	08ed0d13          	addi	s10,s10,142 # 100420 <time_increment>
  10039a:	00000d97          	auipc	s11,0x0
  10039e:	096d8d93          	addi	s11,s11,150 # 100430 <_bss_end>
  1003a2:	01bd5763          	bge	s10,s11,1003b0 <main_entry>

001003a6 <zero_loop>:
  1003a6:	000d2023          	sw	zero,0(s10)
  1003aa:	0d11                	addi	s10,s10,4
  1003ac:	ffaddde3          	bge	s11,s10,1003a6 <zero_loop>

001003b0 <main_entry>:
  1003b0:	4501                	li	a0,0
  1003b2:	4581                	li	a1,0
  1003b4:	016000ef          	jal	1003ca <main>
  1003b8:	000202b7          	lui	t0,0x20
  1003bc:	02a1                	addi	t0,t0,8 # 20008 <tohost>
  1003be:	4305                	li	t1,1
  1003c0:	0062a023          	sw	t1,0(t0)

001003c4 <sleep_loop>:
  1003c4:	10500073          	wfi
  1003c8:	bff5                	j	1003c4 <sleep_loop>

001003ca <main>:
  1003ca:	00000797          	auipc	a5,0x0
  1003ce:	0527a783          	lw	a5,82(a5) # 10041c <result>
  1003d2:	4729                	li	a4,10
  1003d4:	c398                	sw	a4,0(a5)
  1003d6:	a001                	j	1003d6 <main+0xc>

Disassembly of section .rodata:

001003d8 <.rodata>:
  1003d8:	5845                	li	a6,-15
  1003da:	54504543          	.insn	4, 0x54504543
  1003de:	4f49                	li	t5,18
  1003e0:	214e                	.insn	2, 0x214e
  1003e2:	2121                	jal	1007ea <_bss_end+0x3ba>
  1003e4:	000a                	c.slli	zero,0x2
  1003e6:	0000                	unimp
  1003e8:	3d3d                	jal	100226 <simple_exc_handler+0x48>
  1003ea:	3d3d                	jal	100228 <simple_exc_handler+0x4a>
  1003ec:	3d3d                	jal	10022a <simple_exc_handler+0x4c>
  1003ee:	3d3d                	jal	10022c <simple_exc_handler+0x4e>
  1003f0:	3d3d                	jal	10022e <simple_exc_handler+0x50>
  1003f2:	3d3d                	jal	100230 <simple_exc_handler+0x52>
  1003f4:	000a                	c.slli	zero,0x2
  1003f6:	0000                	unimp
  1003f8:	454d                	li	a0,19
  1003fa:	4350                	lw	a2,4(a4)
  1003fc:	203a                	.insn	2, 0x203a
  1003fe:	2020                	.insn	2, 0x2020
  100400:	7830                	.insn	2, 0x7830
  100402:	0000                	unimp
  100404:	4d0a                	lw	s10,128(sp)
  100406:	53554143          	.insn	4, 0x53554143
  10040a:	3a45                	jal	ffdba <tohost+0xdfdb2>
  10040c:	3020                	.insn	2, 0x3020
  10040e:	0078                	addi	a4,sp,12
  100410:	4d0a                	lw	s10,128(sp)
  100412:	5654                	lw	a3,44(a2)
  100414:	4c41                	li	s8,16
  100416:	203a                	.insn	2, 0x203a
  100418:	3020                	.insn	2, 0x3020
  10041a:	0078                	addi	a4,sp,12

Disassembly of section .data:

0010041c <result>:
  10041c:	0000                	unimp
  10041e:	2000                	.insn	2, 0x2000

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	000004eb          	.insn	4, 0x04eb
   4:	0005                	c.nop	1
   6:	0401                	addi	s0,s0,0
   8:	0000                	unimp
   a:	0000                	unimp
   c:	c014                	sw	a3,0(s0)
   e:	0000                	unimp
  10:	1d00                	addi	s0,sp,688
  12:	00000043          	.insn	4, 0x0043
  16:	0000                	unimp
  18:	0000                	unimp
  1a:	0084                	addi	s1,sp,64
  1c:	0010                	.insn	2, 0x0010
  1e:	02be                	slli	t0,t0,0xf
  20:	0000                	unimp
  22:	0000                	unimp
  24:	0000                	unimp
  26:	0801                	addi	a6,a6,0
  28:	0000a907          	.insn	4, 0xa907
  2c:	0100                	addi	s0,sp,128
  2e:	0704                	addi	s1,sp,896
  30:	000000b3          	add	ra,zero,zero
  34:	0101                	addi	sp,sp,0
  36:	4c06                	lw	s8,64(sp)
  38:	0000                	unimp
  3a:	0100                	addi	s0,sp,128
  3c:	0502                	c.slli64	a0
  3e:	000001b7          	lui	gp,0x0
  42:	0401                	addi	s0,s0,0
  44:	8d05                	sub	a0,a0,s1
  46:	0001                	nop
  48:	0100                	addi	s0,sp,128
  4a:	0508                	addi	a0,sp,640
  4c:	0188                	addi	a0,sp,192
  4e:	0000                	unimp
  50:	0101                	addi	sp,sp,0
  52:	4a08                	lw	a0,16(a2)
  54:	0000                	unimp
  56:	0100                	addi	s0,sp,128
  58:	0702                	c.slli64	a4
  5a:	0058                	addi	a4,sp,4
  5c:	0000                	unimp
  5e:	0001dc0f          	.insn	4, 0x0001dc0f
  62:	3400                	.insn	2, 0x3400
  64:	0068                	addi	a0,sp,12
  66:	0000                	unimp
  68:	0401                	addi	s0,s0,0
  6a:	0000ae07          	.insn	4, 0xae07
  6e:	0f00                	addi	s0,sp,912
  70:	0038                	addi	a4,sp,8
  72:	0000                	unimp
  74:	00002637          	lui	a2,0x2
  78:	1500                	addi	s0,sp,672
  7a:	0000006f          	j	7a <_min_stack-0x1f86>
  7e:	0416                	slli	s0,s0,0x5
  80:	6905                	lui	s2,0x1
  82:	746e                	.insn	2, 0x746e
  84:	1000                	addi	s0,sp,32
  86:	0196                	slli	gp,gp,0x5
  88:	0000                	unimp
  8a:	138a                	slli	t2,t2,0x22
  8c:	0079                	c.nop	30
  8e:	0000                	unimp
  90:	0305                	addi	t1,t1,1
  92:	0428                	addi	a0,sp,520
  94:	0010                	.insn	2, 0x0010
  96:	7910                	.insn	2, 0x7910
  98:	0001                	nop
  9a:	8b00                	.insn	2, 0x8b00
  9c:	6f0a                	.insn	2, 0x6f0a
  9e:	0000                	unimp
  a0:	0500                	addi	s0,sp,640
  a2:	10042003          	lw	zero,256(s0)
  a6:	0400                	addi	s0,sp,512
  a8:	01fd                	addi	gp,gp,31 # 1f <_min_stack-0x1fe1>
  aa:	0000                	unimp
  ac:	bcb6                	.insn	2, 0xbcb6
  ae:	1002                	c.slli	zero,0x20
  b0:	8600                	.insn	2, 0x8600
  b2:	0000                	unimp
  b4:	0100                	addi	s0,sp,128
  b6:	f29c                	.insn	2, 0xf29c
  b8:	0000                	unimp
  ba:	0a00                	addi	s0,sp,272
  bc:	01e8                	addi	a0,sp,204
  be:	0000                	unimp
  c0:	02d0                	addi	a2,sp,324
  c2:	0010                	.insn	2, 0x0010
  c4:	0024                	addi	s1,sp,8
  c6:	0000                	unimp
  c8:	f50303b7          	lui	t2,0xf5030
  cc:	0001                	nop
  ce:	0c00                	addi	s0,sp,528
  d0:	0000                	unimp
  d2:	1100                	addi	s0,sp,160
  d4:	0024                	addi	s1,sp,8
  d6:	0000                	unimp
  d8:	0105                	addi	sp,sp,1
  da:	0002                	c.slli64	zero
  dc:	0200                	addi	s0,sp,256
  de:	02f0                	addi	a2,sp,332
  e0:	0010                	.insn	2, 0x0010
  e2:	0130                	addi	a2,sp,136
  e4:	0000                	unimp
  e6:	fc02                	.insn	2, 0xfc02
  e8:	1002                	c.slli	zero,0x20
  ea:	0800                	addi	s0,sp,16
  ec:	0001                	nop
  ee:	0000                	unimp
  f0:	0000                	unimp
  f2:	0001c117          	auipc	sp,0x1c
  f6:	0100                	addi	s0,sp,128
  f8:	0ab2                	slli	s5,s5,0xc
  fa:	0000006f          	j	fa <_min_stack-0x1f06>
  fe:	02ae                	slli	t0,t0,0xb
 100:	0010                	.insn	2, 0x0010
 102:	000e                	c.slli	zero,0x3
 104:	0000                	unimp
 106:	9c01                	.insn	2, 0x9c01
 108:	7304                	.insn	2, 0x7304
 10a:	0000                	unimp
 10c:	ac00                	.insn	2, 0xac00
 10e:	0252                	slli	tp,tp,0x14
 110:	0010                	.insn	2, 0x0010
 112:	000e                	c.slli	zero,0x3
 114:	0000                	unimp
 116:	9c01                	.insn	2, 0x9c01
 118:	0130                	addi	a2,sp,136
 11a:	0000                	unimp
 11c:	ae18                	.insn	2, 0xae18
 11e:	0001                	nop
 120:	0100                	addi	s0,sp,128
 122:	1eac                	addi	a1,sp,888
 124:	0000006f          	j	124 <_min_stack-0x1edc>
 128:	5a06                	lw	s4,96(sp)
 12a:	935b0493          	addi	s1,s6,-1739
 12e:	0004                	.insn	2, 0x0004
 130:	a312                	.insn	2, 0xa312
 132:	0001                	nop
 134:	a000                	.insn	2, 0xa000
 136:	6f0a                	.insn	2, 0x6f0a
 138:	0000                	unimp
 13a:	3e00                	.insn	2, 0x3e00
 13c:	1002                	c.slli	zero,0x20
 13e:	1400                	addi	s0,sp,544
 140:	0000                	unimp
 142:	0100                	addi	s0,sp,128
 144:	809c                	.insn	2, 0x809c
 146:	0001                	nop
 148:	0b00                	addi	s0,sp,400
 14a:	015d                	addi	sp,sp,23 # 1c109 <_stack_len+0x14109>
 14c:	0000                	unimp
 14e:	5ea1                	li	t4,-24
 150:	0000                	unimp
 152:	0100                	addi	s0,sp,128
 154:	0b5e                	slli	s6,s6,0x17
 156:	001e                	c.slli	zero,0x7
 158:	0000                	unimp
 15a:	5ea2                	lw	t4,40(sp)
 15c:	0000                	unimp
 15e:	0100                	addi	s0,sp,128
 160:	0b5a                	slli	s6,s6,0x16
 162:	0082                	c.slli64	ra
 164:	0000                	unimp
 166:	6fa8                	.insn	2, 0x6fa8
 168:	0000                	unimp
 16a:	1300                	addi	s0,sp,416
 16c:	2da8007b          	.insn	4, 0x2da8007b
 170:	26a8                	.insn	2, 0x26a8
 172:	2008                	.insn	2, 0x2008
 174:	26a8                	.insn	2, 0x26a8
 176:	7a24                	.insn	2, 0x7a24
 178:	a800                	.insn	2, 0xa800
 17a:	a82d                	j	1b4 <_min_stack-0x1e4c>
 17c:	2126                	.insn	2, 0x2126
 17e:	009f 6b19 0001      	.insn	6, 0x00016b19009f
 184:	0100                	addi	s0,sp,128
 186:	069e                	slli	a3,a3,0x7
 188:	0234                	addi	a3,sp,264
 18a:	0010                	.insn	2, 0x0010
 18c:	000a                	c.slli	zero,0x2
 18e:	0000                	unimp
 190:	9c01                	.insn	2, 0x9c01
 192:	2b04                	.insn	2, 0x2b04
 194:	0000                	unimp
 196:	9300                	.insn	2, 0x9300
 198:	0260                	addi	s0,sp,268
 19a:	0010                	.insn	2, 0x0010
 19c:	004e                	c.slli	zero,0x13
 19e:	0000                	unimp
 1a0:	9c01                	.insn	2, 0x9c01
 1a2:	01e8                	addi	a0,sp,204
 1a4:	0000                	unimp
 1a6:	9f1a                	add	t5,t5,t1
 1a8:	0000                	unimp
 1aa:	0100                	addi	s0,sp,128
 1ac:	006f1c93          	slli	s9,t5,0x6
 1b0:	0000                	unimp
 1b2:	0019                	c.nop	6
 1b4:	0000                	unimp
 1b6:	0001e81b          	.insn	4, 0x0001e81b
 1ba:	8800                	.insn	2, 0x8800
 1bc:	1002                	c.slli	zero,0x20
 1be:	0e00                	addi	s0,sp,784
 1c0:	0000                	unimp
 1c2:	0100                	addi	s0,sp,128
 1c4:	f5030397          	auipc	t2,0xf5030
 1c8:	0001                	nop
 1ca:	3200                	.insn	2, 0x3200
 1cc:	0000                	unimp
 1ce:	0500                	addi	s0,sp,640
 1d0:	0201                	addi	tp,tp,0 # 0 <_min_stack-0x2000>
 1d2:	0000                	unimp
 1d4:	8a02                	jr	s4
 1d6:	1002                	c.slli	zero,0x20
 1d8:	3000                	.insn	2, 0x3000
 1da:	0001                	nop
 1dc:	0200                	addi	s0,sp,256
 1de:	0296                	slli	t0,t0,0x5
 1e0:	0010                	.insn	2, 0x0010
 1e2:	0108                	addi	a0,sp,128
 1e4:	0000                	unimp
 1e6:	0000                	unimp
 1e8:	8d1c                	.insn	2, 0x8d1c
 1ea:	0000                	unimp
 1ec:	0100                	addi	s0,sp,128
 1ee:	148d                	addi	s1,s1,-29
 1f0:	00020c03          	lb	s8,0(tp) # 0 <_min_stack-0x2000>
 1f4:	1d00                	addi	s0,sp,688
 1f6:	009f 0000 8d01      	.insn	6, 0x8d010000009f
 1fc:	00006f2f          	.insn	4, 0x6f2f
 200:	0900                	addi	s0,sp,144
 202:	001e                	c.slli	zero,0x7
 204:	0000                	unimp
 206:	6f8e                	.insn	2, 0x6f8e
 208:	0000                	unimp
 20a:	0000                	unimp
 20c:	0b04                	addi	s1,sp,400
 20e:	0000                	unimp
 210:	7b00                	.insn	2, 0x7b00
 212:	01de                	slli	gp,gp,0x17
 214:	0010                	.insn	2, 0x0010
 216:	0056                	c.slli	zero,0x15
 218:	0000                	unimp
 21a:	9c01                	.insn	2, 0x9c01
 21c:	00000327          	.insn	4, 0x0327
 220:	5906                	lw	s2,96(sp)
 222:	00000003          	lb	zero,0(zero) # 0 <_min_stack-0x2000>
 226:	1002                	c.slli	zero,0x20
 228:	0400                	addi	s0,sp,512
 22a:	0000                	unimp
 22c:	7f00                	.insn	2, 0x7f00
 22e:	390a                	.insn	2, 0x390a
 230:	0002                	c.slli64	zero
 232:	0500                	addi	s0,sp,640
 234:	00000367          	jalr	t1,zero # 0 <_min_stack-0x2000>
 238:	0600                	addi	s0,sp,768
 23a:	0340                	addi	s0,sp,388
 23c:	0000                	unimp
 23e:	0210                	addi	a2,sp,256
 240:	0010                	.insn	2, 0x0010
 242:	0004                	.insn	2, 0x0004
 244:	0000                	unimp
 246:	0a81                	addi	s5,s5,0
 248:	0252                	slli	tp,tp,0x14
 24a:	0000                	unimp
 24c:	4e05                	li	t3,1
 24e:	00000003          	lb	zero,0(zero) # 0 <_min_stack-0x2000>
 252:	2706                	.insn	2, 0x2706
 254:	20000003          	lb	zero,512(zero) # 200 <_min_stack-0x1e00>
 258:	1002                	c.slli	zero,0x20
 25a:	0400                	addi	s0,sp,512
 25c:	0000                	unimp
 25e:	8300                	.insn	2, 0x8300
 260:	6b0a                	.insn	2, 0x6b0a
 262:	0002                	c.slli64	zero
 264:	0500                	addi	s0,sp,640
 266:	0335                	addi	t1,t1,13
 268:	0000                	unimp
 26a:	0600                	addi	s0,sp,768
 26c:	0000045b          	.insn	4, 0x045b
 270:	0226                	slli	tp,tp,0x9
 272:	0010                	.insn	2, 0x0010
 274:	0008                	.insn	2, 0x0008
 276:	0000                	unimp
 278:	0384                	addi	s1,sp,448
 27a:	0288                	addi	a0,sp,320
 27c:	0000                	unimp
 27e:	00046c03          	.insn	4, 0x00046c03
 282:	3f00                	.insn	2, 0x3f00
 284:	0000                	unimp
 286:	0000                	unimp
 288:	841e                	mv	s0,t2
 28a:	2e000003          	lb	zero,736(zero) # 2e0 <_min_stack-0x1d20>
 28e:	1002                	c.slli	zero,0x20
 290:	0400                	addi	s0,sp,512
 292:	0000                	unimp
 294:	0100                	addi	s0,sp,128
 296:	0385                	addi	t2,t2,1 # f50301c5 <fromhost+0xf4ef81b5>
 298:	1001ec07          	.insn	4, 0x1001ec07
 29c:	0800                	addi	s0,sp,16
 29e:	0004                	.insn	2, 0x0004
 2a0:	af00                	.insn	2, 0xaf00
 2a2:	0002                	c.slli64	zero
 2a4:	0800                	addi	s0,sp,16
 2a6:	5a01                	li	s4,-32
 2a8:	0305                	addi	t1,t1,1
 2aa:	03d8                	addi	a4,sp,452
 2ac:	0010                	.insn	2, 0x0010
 2ae:	0700                	addi	s0,sp,896
 2b0:	01f6                	slli	gp,gp,0x1d
 2b2:	0010                	.insn	2, 0x0010
 2b4:	0408                	addi	a0,sp,512
 2b6:	0000                	unimp
 2b8:	02c6                	slli	t0,t0,0x11
 2ba:	0000                	unimp
 2bc:	0108                	addi	a0,sp,128
 2be:	055a                	slli	a0,a0,0x16
 2c0:	1003e803          	.insn	4, 0x1003e803
 2c4:	0000                	unimp
 2c6:	10020007          	.insn	4, 0x10020007
 2ca:	0800                	addi	s0,sp,16
 2cc:	0004                	.insn	2, 0x0004
 2ce:	dd00                	sw	s0,56(a0)
 2d0:	0002                	c.slli64	zero
 2d2:	0800                	addi	s0,sp,16
 2d4:	5a01                	li	s4,-32
 2d6:	0305                	addi	t1,t1,1
 2d8:	03f8                	addi	a4,sp,460
 2da:	0010                	.insn	2, 0x0010
 2dc:	0200                	addi	s0,sp,256
 2de:	0206                	slli	tp,tp,0x1
 2e0:	0010                	.insn	2, 0x0010
 2e2:	038d                	addi	t2,t2,3
 2e4:	0000                	unimp
 2e6:	10021007          	.insn	4, 0x10021007
 2ea:	0800                	addi	s0,sp,16
 2ec:	0004                	.insn	2, 0x0004
 2ee:	fd00                	.insn	2, 0xfd00
 2f0:	0002                	c.slli64	zero
 2f2:	0800                	addi	s0,sp,16
 2f4:	5a01                	li	s4,-32
 2f6:	0305                	addi	t1,t1,1
 2f8:	0404                	addi	s1,sp,512
 2fa:	0010                	.insn	2, 0x0010
 2fc:	0200                	addi	s0,sp,256
 2fe:	0216                	slli	tp,tp,0x5
 300:	0010                	.insn	2, 0x0010
 302:	038d                	addi	t2,t2,3
 304:	0000                	unimp
 306:	10022007          	.insn	4, 0x10022007
 30a:	0800                	addi	s0,sp,16
 30c:	0004                	.insn	2, 0x0004
 30e:	1d00                	addi	s0,sp,688
 310:	08000003          	lb	zero,128(zero) # 80 <_min_stack-0x1f80>
 314:	5a01                	li	s4,-32
 316:	0305                	addi	t1,t1,1
 318:	0410                	addi	a2,sp,512
 31a:	0010                	.insn	2, 0x0010
 31c:	0200                	addi	s0,sp,256
 31e:	0226                	slli	tp,tp,0x9
 320:	0010                	.insn	2, 0x0010
 322:	038d                	addi	t2,t2,3
 324:	0000                	unimp
 326:	0c00                	addi	s0,sp,528
 328:	000001f3          	.insn	4, 0x01f3
 32c:	2d75                	jal	9e8 <_min_stack-0x1618>
 32e:	0000                	unimp
 330:	4000                	lw	s0,0(s0)
 332:	09000003          	lb	zero,144(zero) # 90 <_min_stack-0x1f70>
 336:	0156                	slli	sp,sp,0x15
 338:	0000                	unimp
 33a:	5e76                	lw	t3,124(sp)
 33c:	0000                	unimp
 33e:	0000                	unimp
 340:	000c                	.insn	2, 0x000c
 342:	0000                	unimp
 344:	6f00                	.insn	2, 0x6f00
 346:	002d                	c.nop	11
 348:	0000                	unimp
 34a:	0359                	addi	t1,t1,22
 34c:	0000                	unimp
 34e:	5609                	li	a2,-30
 350:	0001                	nop
 352:	7000                	.insn	2, 0x7000
 354:	005e                	c.slli	zero,0x17
 356:	0000                	unimp
 358:	0c00                	addi	s0,sp,528
 35a:	01ea                	slli	gp,gp,0x1a
 35c:	0000                	unimp
 35e:	2d69                	jal	9f8 <_min_stack-0x1608>
 360:	0000                	unimp
 362:	7200                	.insn	2, 0x7200
 364:	09000003          	lb	zero,144(zero) # 90 <_min_stack-0x1f70>
 368:	0156                	slli	sp,sp,0x15
 36a:	0000                	unimp
 36c:	5e6a                	lw	t3,184(sp)
 36e:	0000                	unimp
 370:	0000                	unimp
 372:	121f 0002 0100      	.insn	6, 0x01000002121f
 378:	00d20627          	.insn	4, 0x00d20627
 37c:	0010                	.insn	2, 0x0010
 37e:	00fa                	slli	ra,ra,0x1e
 380:	0000                	unimp
 382:	9c01                	.insn	2, 0x9c01
 384:	4120                	lw	s0,64(a0)
 386:	0000                	unimp
 388:	0100                	addi	s0,sp,128
 38a:	0625                	addi	a2,a2,9 # 2009 <_min_stack+0x9>
 38c:	0401                	addi	s0,s0,0
 38e:	021f 0000 a415      	.insn	6, 0xa4150000021f
 394:	1000                	addi	s0,sp,32
 396:	2400                	.insn	2, 0x2400
 398:	0000                	unimp
 39a:	0100                	addi	s0,sp,128
 39c:	089c                	addi	a5,sp,80
 39e:	0004                	.insn	2, 0x0004
 3a0:	1300                	addi	s0,sp,416
 3a2:	0068                	addi	a0,sp,12
 3a4:	5e15                	li	t3,-27
 3a6:	0000                	unimp
 3a8:	4800                	lw	s0,16(s0)
 3aa:	0000                	unimp
 3ac:	2100                	.insn	2, 0x2100
 3ae:	01d2                	slli	gp,gp,0x14
 3b0:	0000                	unimp
 3b2:	1601                	addi	a2,a2,-32
 3b4:	00007e07          	.insn	4, 0x7e07
 3b8:	5300                	lw	s0,32(a4)
 3ba:	0000                	unimp
 3bc:	1100                	addi	s0,sp,160
 3be:	00000013          	nop
 3c2:	6922                	.insn	2, 0x6922
 3c4:	0100                	addi	s0,sp,128
 3c6:	0c19                	addi	s8,s8,6
 3c8:	007e                	c.slli	zero,0x1f
 3ca:	0000                	unimp
 3cc:	006e                	c.slli	zero,0x1b
 3ce:	0000                	unimp
 3d0:	5b06                	lw	s6,96(sp)
 3d2:	0004                	.insn	2, 0x0004
 3d4:	b400                	.insn	2, 0xb400
 3d6:	1000                	addi	s0,sp,32
 3d8:	0000                	unimp
 3da:	0000                	unimp
 3dc:	1d00                	addi	s0,sp,688
 3de:	0003ed07          	.insn	4, 0x0003ed07
 3e2:	0300                	addi	s0,sp,384
 3e4:	046c                	addi	a1,sp,524
 3e6:	0000                	unimp
 3e8:	0090                	addi	a2,sp,64
 3ea:	0000                	unimp
 3ec:	0a00                	addi	s0,sp,272
 3ee:	0000045b          	.insn	4, 0x045b
 3f2:	00b8                	addi	a4,sp,72
 3f4:	0010                	.insn	2, 0x0010
 3f6:	001d                	c.nop	7
 3f8:	0000                	unimp
 3fa:	071f 6c03 0004      	.insn	6, 0x00046c03071f
 400:	9800                	.insn	2, 0x9800
 402:	0000                	unimp
 404:	0000                	unimp
 406:	0000                	unimp
 408:	e512                	.insn	2, 0xe512
 40a:	0001                	nop
 40c:	0d00                	addi	s0,sp,656
 40e:	7e05                	lui	t3,0xfffe1
 410:	0000                	unimp
 412:	9000                	.insn	2, 0x9000
 414:	1000                	addi	s0,sp,32
 416:	1400                	addi	s0,sp,544
 418:	0000                	unimp
 41a:	0100                	addi	s0,sp,128
 41c:	499c                	lw	a5,16(a1)
 41e:	0004                	.insn	2, 0x0004
 420:	1300                	addi	s0,sp,416
 422:	00727473          	csrrci	s0,0x7,4
 426:	490d                	li	s2,3
 428:	0004                	.insn	2, 0x0004
 42a:	a500                	.insn	2, 0xa500
 42c:	0000                	unimp
 42e:	0a00                	addi	s0,sp,272
 430:	0000045b          	.insn	4, 0x045b
 434:	0090                	addi	a2,sp,64
 436:	0010                	.insn	2, 0x0010
 438:	000c                	.insn	2, 0x000c
 43a:	0000                	unimp
 43c:	6c03050f          	.insn	4, 0x6c03050f
 440:	0004                	.insn	2, 0x0004
 442:	b000                	.insn	2, 0xb000
 444:	0000                	unimp
 446:	0000                	unimp
 448:	2300                	.insn	2, 0x2300
 44a:	5604                	lw	s1,40(a2)
 44c:	0004                	.insn	2, 0x0004
 44e:	0100                	addi	s0,sp,128
 450:	0801                	addi	a6,a6,0
 452:	00000053          	.insn	4, 0x0053
 456:	4f24                	lw	s1,88(a4)
 458:	0004                	.insn	2, 0x0004
 45a:	2500                	.insn	2, 0x2500
 45c:	0000006b          	.insn	4, 0x006b
 460:	0701                	addi	a4,a4,0
 462:	7e05                	lui	t3,0xfffe1
 464:	0000                	unimp
 466:	0100                	addi	s0,sp,128
 468:	00000477          	.insn	4, 0x0477
 46c:	6326                	.insn	2, 0x6326
 46e:	0100                	addi	s0,sp,128
 470:	007e1107          	.insn	4, 0x007e1107
 474:	0000                	unimp
 476:	0d00                	addi	s0,sp,656
 478:	0000045b          	.insn	4, 0x045b
 47c:	0084                	addi	s1,sp,64
 47e:	0010                	.insn	2, 0x0010
 480:	000c                	.insn	2, 0x000c
 482:	0000                	unimp
 484:	9c01                	.insn	2, 0x9c01
 486:	0492                	slli	s1,s1,0x4
 488:	0000                	unimp
 48a:	00046c27          	.insn	4, 0x00046c27
 48e:	0100                	addi	s0,sp,128
 490:	005a                	c.slli	zero,0x16
 492:	8428                	.insn	2, 0x8428
 494:	c8000003          	lb	zero,-896(zero) # fffffc80 <fromhost+0xffec7c70>
 498:	1000                	addi	s0,sp,32
 49a:	0a00                	addi	s0,sp,272
 49c:	0000                	unimp
 49e:	0100                	addi	s0,sp,128
 4a0:	0d9c                	addi	a5,sp,720
 4a2:	0359                	addi	t1,t1,22
 4a4:	0000                	unimp
 4a6:	01cc                	addi	a1,sp,196
 4a8:	0010                	.insn	2, 0x0010
 4aa:	0006                	c.slli	zero,0x1
 4ac:	0000                	unimp
 4ae:	9c01                	.insn	2, 0x9c01
 4b0:	04bc                	addi	a5,sp,584
 4b2:	0000                	unimp
 4b4:	670e                	.insn	2, 0x670e
 4b6:	01000003          	lb	zero,16(zero) # 10 <_min_stack-0x1ff0>
 4ba:	005a                	c.slli	zero,0x16
 4bc:	400d                	c.li	zero,3
 4be:	d2000003          	lb	zero,-736(zero) # fffffd20 <fromhost+0xffec7d10>
 4c2:	1001                	c.nop	-32
 4c4:	0600                	addi	s0,sp,768
 4c6:	0000                	unimp
 4c8:	0100                	addi	s0,sp,128
 4ca:	d79c                	sw	a5,40(a5)
 4cc:	0004                	.insn	2, 0x0004
 4ce:	0e00                	addi	s0,sp,784
 4d0:	034e                	slli	t1,t1,0x13
 4d2:	0000                	unimp
 4d4:	5a01                	li	s4,-32
 4d6:	2900                	.insn	2, 0x2900
 4d8:	00000327          	.insn	4, 0x0327
 4dc:	01d8                	addi	a4,sp,196
 4de:	0010                	.insn	2, 0x0010
 4e0:	0006                	c.slli	zero,0x1
 4e2:	0000                	unimp
 4e4:	9c01                	.insn	2, 0x9c01
 4e6:	350e                	.insn	2, 0x350e
 4e8:	01000003          	lb	zero,16(zero) # 10 <_min_stack-0x1ff0>
 4ec:	005a                	c.slli	zero,0x16
 4ee:	8b00                	.insn	2, 0x8b00
 4f0:	0000                	unimp
 4f2:	0500                	addi	s0,sp,640
 4f4:	0100                	addi	s0,sp,128
 4f6:	9504                	.insn	2, 0x9504
 4f8:	0002                	c.slli64	zero
 4fa:	0200                	addi	s0,sp,256
 4fc:	00c0                	addi	s0,sp,68
 4fe:	0000                	unimp
 500:	561d                	li	a2,-25
 502:	0001                	nop
 504:	0000                	unimp
 506:	0000                	unimp
 508:	3b00                	.insn	2, 0x3b00
 50a:	0000                	unimp
 50c:	0000                	unimp
 50e:	0000                	unimp
 510:	6600                	.insn	2, 0x6600
 512:	0005                	c.nop	1
 514:	0300                	addi	s0,sp,384
 516:	0156                	slli	sp,sp,0x15
 518:	0000                	unimp
 51a:	1101                	addi	sp,sp,-32
 51c:	0000380f          	.insn	4, 0x380f
 520:	0500                	addi	s0,sp,640
 522:	10041c03          	lh	s8,256(s0)
 526:	0400                	addi	s0,sp,512
 528:	4504                	lw	s1,8(a0)
 52a:	0000                	unimp
 52c:	0500                	addi	s0,sp,640
 52e:	0504                	addi	s1,sp,640
 530:	6e69                	lui	t3,0x1a
 532:	0074                	addi	a3,sp,12
 534:	3e06                	.insn	2, 0x3e06
 536:	0000                	unimp
 538:	0700                	addi	s0,sp,896
 53a:	0226                	slli	tp,tp,0x9
 53c:	0000                	unimp
 53e:	1301                	addi	t1,t1,-32
 540:	3e06                	.insn	2, 0x3e06
 542:	0000                	unimp
 544:	ca00                	sw	s0,16(a2)
 546:	0e001003          	lh	zero,224(zero) # e0 <_min_stack-0x1f20>
 54a:	0000                	unimp
 54c:	0100                	addi	s0,sp,128
 54e:	019c                	addi	a5,sp,192
 550:	0061                	c.nop	24
 552:	3e14                	.insn	2, 0x3e14
 554:	0000                	unimp
 556:	0200                	addi	s0,sp,256
 558:	6201                	.insn	2, 0x6201
 55a:	1500                	addi	s0,sp,672
 55c:	003e                	c.slli	zero,0xf
 55e:	0000                	unimp
 560:	00630103          	lb	sp,6(t1)
 564:	3e16                	.insn	2, 0x3e16
 566:	0000                	unimp
 568:	0500                	addi	s0,sp,640
 56a:	6401                	.insn	2, 0x6401
 56c:	1800                	addi	s0,sp,48
 56e:	003e                	c.slli	zero,0xf
 570:	0000                	unimp
 572:	0105                	addi	sp,sp,1
 574:	0065                	c.nop	25
 576:	3e19                	jal	8c <_min_stack-0x1f74>
 578:	0000                	unimp
 57a:	0a00                	addi	s0,sp,272
 57c:	0000                	unimp
 57e:	001f 0000 0005      	.insn	6, 0x00050000001f
 584:	0401                	addi	s0,s0,0
 586:	00000303          	lb	t1,0(zero) # 0 <_min_stack-0x2000>
 58a:	ee01                	bnez	a2,5a2 <_min_stack-0x1a5e>
 58c:	0005                	c.nop	1
 58e:	4e00                	lw	s0,24(a2)
 590:	0000                	unimp
 592:	2b00                	.insn	2, 0x2b00
 594:	0002                	c.slli64	zero
 596:	7200                	.insn	2, 0x7200
 598:	0002                	c.slli64	zero
 59a:	b500                	.insn	2, 0xb500
 59c:	0002                	c.slli64	zero
 59e:	0100                	addi	s0,sp,128
 5a0:	80                	.byte	0x80

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	2401                	jal	200 <_min_stack-0x1e00>
   2:	0b00                	addi	s0,sp,400
   4:	030b3e0b          	.insn	4, 0x030b3e0b
   8:	000e                	c.slli	zero,0x3
   a:	0200                	addi	s0,sp,256
   c:	0048                	addi	a0,sp,4
   e:	017d                	addi	sp,sp,31
  10:	0000137f 31000503 	.insn	12, 0x00170213310005030000137f
  18:	00170213 
  1c:	0400                	addi	s0,sp,512
  1e:	012e                	slli	sp,sp,0xb
  20:	0e03193f 3b01213a 	.insn	8, 0x3b01213a0e03193f
  28:	0621390b          	.insn	4, 0x0621390b
  2c:	01111927          	.insn	4, 0x01111927
  30:	0612                	slli	a2,a2,0x4
  32:	1840                	addi	s0,sp,52
  34:	197a                	slli	s2,s2,0x3e
  36:	1301                	addi	t1,t1,-32
  38:	0000                	unimp
  3a:	3405                	jal	fffffa5a <fromhost+0xffec7a4a>
  3c:	3100                	.insn	2, 0x3100
  3e:	06000013          	li	zero,96
  42:	011d                	addi	sp,sp,7
  44:	1331                	addi	t1,t1,-20
  46:	0111                	addi	sp,sp,4
  48:	0612                	slli	a2,a2,0x4
  4a:	2158                	.insn	2, 0x2158
  4c:	5901                	li	s2,-32
  4e:	010b570b          	.insn	4, 0x010b570b
  52:	07000013          	li	zero,112
  56:	0148                	addi	a0,sp,132
  58:	017d                	addi	sp,sp,31
  5a:	1301137f 49080000 	.insn	12, 0x7e180200490800001301137f
  62:	7e180200 
  66:	0018                	.insn	2, 0x0018
  68:	0900                	addi	s0,sp,144
  6a:	0034                	addi	a3,sp,8
  6c:	213a0e03          	lb	t3,531(s4)
  70:	3b01                	jal	fffffd80 <fromhost+0xffec7d70>
  72:	0c21390b          	.insn	4, 0x0c21390b
  76:	1349                	addi	t1,t1,-14
  78:	0000                	unimp
  7a:	1d0a                	slli	s10,s10,0x22
  7c:	3101                	jal	fffffc7c <fromhost+0xffec7c6c>
  7e:	55015213          	.insn	4, 0x55015213
  82:	01215817          	auipc	a6,0x1215
  86:	0b59                	addi	s6,s6,22
  88:	00000b57          	.insn	4, 0x0b57
  8c:	0300340b          	.insn	4, 0x0300340b
  90:	3a0e                	.insn	2, 0x3a0e
  92:	0121                	addi	sp,sp,8
  94:	21390b3b          	.insn	4, 0x21390b3b
  98:	490c                	lw	a1,16(a0)
  9a:	00180213          	addi	tp,a6,1 # 1215083 <fromhost+0x10dd073>
  9e:	0c00                	addi	s0,sp,528
  a0:	012e                	slli	sp,sp,0xb
  a2:	0e03193f 3b01213a 	.insn	8, 0x3b01213a0e03193f
  aa:	0e21390b          	.insn	4, 0x0e21390b
  ae:	1349                	addi	t1,t1,-14
  b0:	2120                	.insn	2, 0x2120
  b2:	0101                	addi	sp,sp,0
  b4:	0d000013          	li	zero,208
  b8:	012e                	slli	sp,sp,0xb
  ba:	1331                	addi	t1,t1,-20
  bc:	0111                	addi	sp,sp,4
  be:	0612                	slli	a2,a2,0x4
  c0:	1840                	addi	s0,sp,52
  c2:	197a                	slli	s2,s2,0x3e
  c4:	1301                	addi	t1,t1,-32
  c6:	0000                	unimp
  c8:	340e                	.insn	2, 0x340e
  ca:	3100                	.insn	2, 0x3100
  cc:	00180213          	addi	tp,a6,1
  d0:	0f00                	addi	s0,sp,912
  d2:	0016                	c.slli	zero,0x5
  d4:	213a0e03          	lb	t3,531(s4)
  d8:	3b02                	.insn	2, 0x3b02
  da:	1921390b          	.insn	4, 0x1921390b
  de:	1349                	addi	t1,t1,-14
  e0:	0000                	unimp
  e2:	3410                	.insn	2, 0x3410
  e4:	0300                	addi	s0,sp,384
  e6:	3a0e                	.insn	2, 0x3a0e
  e8:	0121                	addi	sp,sp,8
  ea:	0b390b3b          	.insn	4, 0x0b390b3b
  ee:	1349                	addi	t1,t1,-14
  f0:	1802193f 0b110000 	.insn	8, 0x0b1100001802193f
  f8:	5501                	li	a0,-32
  fa:	12000017          	auipc	zero,0x12000
  fe:	012e                	slli	sp,sp,0xb
 100:	0e03193f 3b01213a 	.insn	8, 0x3b01213a0e03193f
 108:	270b390b          	.insn	4, 0x270b390b
 10c:	4919                	li	s2,6
 10e:	12011113          	.insn	4, 0x12011113
 112:	4006                	.insn	2, 0x4006
 114:	7a18                	.insn	2, 0x7a18
 116:	0119                	addi	sp,sp,6
 118:	13000013          	li	zero,304
 11c:	0005                	c.nop	1
 11e:	213a0803          	lb	a6,531(s4)
 122:	3b01                	jal	fffffe32 <fromhost+0xffec7e22>
 124:	1621390b          	.insn	4, 0x1621390b
 128:	1349                	addi	t1,t1,-14
 12a:	1702                	slli	a4,a4,0x20
 12c:	0000                	unimp
 12e:	1114                	addi	a3,sp,160
 130:	2501                	jal	730 <_min_stack-0x18d0>
 132:	130e                	slli	t1,t1,0x23
 134:	1b1f030b          	.insn	4, 0x1b1f030b
 138:	111f 1201 1006      	.insn	6, 0x10061201111f
 13e:	15000017          	auipc	zero,0x15000
 142:	0035                	c.nop	13
 144:	1349                	addi	t1,t1,-14
 146:	0000                	unimp
 148:	2416                	.insn	2, 0x2416
 14a:	0b00                	addi	s0,sp,400
 14c:	030b3e0b          	.insn	4, 0x030b3e0b
 150:	0008                	.insn	2, 0x0008
 152:	1700                	addi	s0,sp,928
 154:	002e                	c.slli	zero,0xb
 156:	0e03193f 0b3b0b3a 	.insn	8, 0x0b3b0b3a0e03193f
 15e:	0b39                	addi	s6,s6,14
 160:	13491927          	.insn	4, 0x13491927
 164:	0111                	addi	sp,sp,4
 166:	0612                	slli	a2,a2,0x4
 168:	1840                	addi	s0,sp,52
 16a:	197a                	slli	s2,s2,0x3e
 16c:	0000                	unimp
 16e:	0518                	addi	a4,sp,640
 170:	0300                	addi	s0,sp,384
 172:	3a0e                	.insn	2, 0x3a0e
 174:	390b3b0b          	.insn	4, 0x390b3b0b
 178:	0213490b          	.insn	4, 0x0213490b
 17c:	0018                	.insn	2, 0x0018
 17e:	1900                	addi	s0,sp,176
 180:	002e                	c.slli	zero,0xb
 182:	0e03193f 0b3b0b3a 	.insn	8, 0x0b3b0b3a0e03193f
 18a:	0b39                	addi	s6,s6,14
 18c:	01111927          	.insn	4, 0x01111927
 190:	0612                	slli	a2,a2,0x4
 192:	1840                	addi	s0,sp,52
 194:	197a                	slli	s2,s2,0x3e
 196:	0000                	unimp
 198:	051a                	slli	a0,a0,0x6
 19a:	0300                	addi	s0,sp,384
 19c:	3a0e                	.insn	2, 0x3a0e
 19e:	390b3b0b          	.insn	4, 0x390b3b0b
 1a2:	0213490b          	.insn	4, 0x0213490b
 1a6:	1b000017          	auipc	zero,0x1b000
 1aa:	011d                	addi	sp,sp,7
 1ac:	1331                	addi	t1,t1,-20
 1ae:	0111                	addi	sp,sp,4
 1b0:	0612                	slli	a2,a2,0x4
 1b2:	0b58                	addi	a4,sp,404
 1b4:	0b59                	addi	s6,s6,22
 1b6:	00000b57          	.insn	4, 0x0b57
 1ba:	2e1c                	.insn	2, 0x2e1c
 1bc:	0301                	addi	t1,t1,0
 1be:	3a0e                	.insn	2, 0x3a0e
 1c0:	390b3b0b          	.insn	4, 0x390b3b0b
 1c4:	2019270b          	.insn	4, 0x2019270b
 1c8:	0013010b          	.insn	4, 0x0013010b
 1cc:	1d00                	addi	s0,sp,688
 1ce:	0005                	c.nop	1
 1d0:	0b3a0e03          	lb	t3,179(s4)
 1d4:	0b390b3b          	.insn	4, 0x0b390b3b
 1d8:	1349                	addi	t1,t1,-14
 1da:	0000                	unimp
 1dc:	1d1e                	slli	s10,s10,0x27
 1de:	3100                	.insn	2, 0x3100
 1e0:	12011113          	.insn	4, 0x12011113
 1e4:	5806                	lw	a6,96(sp)
 1e6:	570b590b          	.insn	4, 0x570b590b
 1ea:	1f00000b          	.insn	4, 0x1f00000b
 1ee:	002e                	c.slli	zero,0xb
 1f0:	0e03193f 0b3b0b3a 	.insn	8, 0x0b3b0b3a0e03193f
 1f8:	0b39                	addi	s6,s6,14
 1fa:	0111                	addi	sp,sp,4
 1fc:	0612                	slli	a2,a2,0x4
 1fe:	1840                	addi	s0,sp,52
 200:	197a                	slli	s2,s2,0x3e
 202:	0000                	unimp
 204:	2e20                	.insn	2, 0x2e20
 206:	3f00                	.insn	2, 0x3f00
 208:	0319                	addi	t1,t1,6
 20a:	3a0e                	.insn	2, 0x3a0e
 20c:	390b3b0b          	.insn	4, 0x390b3b0b
 210:	000b200b          	.insn	4, 0x000b200b
 214:	2100                	.insn	2, 0x2100
 216:	0034                	addi	a3,sp,8
 218:	0b3a0e03          	lb	t3,179(s4)
 21c:	0b390b3b          	.insn	4, 0x0b390b3b
 220:	1349                	addi	t1,t1,-14
 222:	1702                	slli	a4,a4,0x20
 224:	0000                	unimp
 226:	3422                	.insn	2, 0x3422
 228:	0300                	addi	s0,sp,384
 22a:	3a08                	.insn	2, 0x3a08
 22c:	390b3b0b          	.insn	4, 0x390b3b0b
 230:	0213490b          	.insn	4, 0x0213490b
 234:	23000017          	auipc	zero,0x23000
 238:	0b0b000f          	.insn	4, 0x0b0b000f
 23c:	1349                	addi	t1,t1,-14
 23e:	0000                	unimp
 240:	2624                	.insn	2, 0x2624
 242:	4900                	lw	s0,16(a0)
 244:	25000013          	li	zero,592
 248:	012e                	slli	sp,sp,0xb
 24a:	0e03193f 0b3b0b3a 	.insn	8, 0x0b3b0b3a0e03193f
 252:	0b39                	addi	s6,s6,14
 254:	13491927          	.insn	4, 0x13491927
 258:	0b20                	addi	s0,sp,408
 25a:	1301                	addi	t1,t1,-32
 25c:	0000                	unimp
 25e:	0526                	slli	a0,a0,0x9
 260:	0300                	addi	s0,sp,384
 262:	3a08                	.insn	2, 0x3a08
 264:	390b3b0b          	.insn	4, 0x390b3b0b
 268:	0013490b          	.insn	4, 0x0013490b
 26c:	2700                	.insn	2, 0x2700
 26e:	0005                	c.nop	1
 270:	1331                	addi	t1,t1,-20
 272:	1802                	slli	a6,a6,0x20
 274:	0000                	unimp
 276:	2e28                	.insn	2, 0x2e28
 278:	3100                	.insn	2, 0x3100
 27a:	12011113          	.insn	4, 0x12011113
 27e:	4006                	.insn	2, 0x4006
 280:	7a18                	.insn	2, 0x7a18
 282:	0019                	c.nop	6
 284:	2900                	.insn	2, 0x2900
 286:	012e                	slli	sp,sp,0xb
 288:	1331                	addi	t1,t1,-20
 28a:	0111                	addi	sp,sp,4
 28c:	0612                	slli	a2,a2,0x4
 28e:	1840                	addi	s0,sp,52
 290:	197a                	slli	s2,s2,0x3e
 292:	0000                	unimp
 294:	0100                	addi	s0,sp,128
 296:	0034                	addi	a3,sp,8
 298:	213a0803          	lb	a6,531(s4)
 29c:	3b01                	jal	ffffffac <fromhost+0xffec7f9c>
 29e:	0921390b          	.insn	4, 0x0921390b
 2a2:	1349                	addi	t1,t1,-14
 2a4:	0b1c                	addi	a5,sp,400
 2a6:	0000                	unimp
 2a8:	1102                	slli	sp,sp,0x20
 2aa:	2501                	jal	8aa <_min_stack-0x1756>
 2ac:	130e                	slli	t1,t1,0x23
 2ae:	1b1f030b          	.insn	4, 0x1b1f030b
 2b2:	551f 1117 1001      	.insn	6, 0x10011117551f
 2b8:	03000017          	auipc	zero,0x3000
 2bc:	0034                	addi	a3,sp,8
 2be:	0b3a0e03          	lb	t3,179(s4)
 2c2:	0b390b3b          	.insn	4, 0x0b390b3b
 2c6:	1349                	addi	t1,t1,-14
 2c8:	1802193f 0f040000 	.insn	8, 0x0f0400001802193f
 2d0:	0b00                	addi	s0,sp,400
 2d2:	0013490b          	.insn	4, 0x0013490b
 2d6:	0500                	addi	s0,sp,640
 2d8:	0024                	addi	s1,sp,8
 2da:	0b3e0b0b          	.insn	4, 0x0b3e0b0b
 2de:	00000803          	lb	a6,0(zero) # 0 <_min_stack-0x2000>
 2e2:	3506                	.insn	2, 0x3506
 2e4:	4900                	lw	s0,16(a0)
 2e6:	07000013          	li	zero,112
 2ea:	012e                	slli	sp,sp,0xb
 2ec:	0e03193f 0b3b0b3a 	.insn	8, 0x0b3b0b3a0e03193f
 2f4:	0b39                	addi	s6,s6,14
 2f6:	1349                	addi	t1,t1,-14
 2f8:	0111                	addi	sp,sp,4
 2fa:	0612                	slli	a2,a2,0x4
 2fc:	1840                	addi	s0,sp,52
 2fe:	197a                	slli	s2,s2,0x3e
 300:	0000                	unimp
 302:	0100                	addi	s0,sp,128
 304:	0011                	c.nop	4
 306:	1710                	addi	a2,sp,928
 308:	1755                	addi	a4,a4,-11
 30a:	0e1b0e03          	lb	t3,225(s6)
 30e:	0e25                	addi	t3,t3,9 # 1a009 <_stack_len+0x12009>
 310:	00000513          	li	a0,0
	...

Disassembly of section .debug_loclists:

00000000 <.debug_loclists>:
   0:	000000b7          	lui	ra,0x0
   4:	0005                	c.nop	1
   6:	0004                	.insn	2, 0x0004
   8:	0000                	unimp
   a:	0000                	unimp
   c:	cc04                	sw	s1,24(s0)
   e:	f204                	.insn	2, 0xf204
  10:	0604                	addi	s1,sp,768
  12:	9358                	.insn	2, 0x9358
  14:	5904                	lw	s1,48(a0)
  16:	04000493          	li	s1,64
  1a:	03dc                	addi	a5,sp,452
  1c:	0485                	addi	s1,s1,1
  1e:	5a06                	lw	s4,96(sp)
  20:	935b0493          	addi	s1,s6,-1739
  24:	0404               