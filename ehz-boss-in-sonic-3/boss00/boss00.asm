ROM_Offset		EQU			$00400F2C	; Where this code will be inserted into the ROM

*	Sonic 2 EHZ boss reprogrammed for Sonic 3 and Sonic & Knuckles.
*	Originally programmed by Yuji Naka and Masanobu Yamamoto.
*
*	Reprogrammed by LOst.
*	Copyright © 2004 LOst.
*	Copyright © 1994 SEGA.


*	Used Sonic 3 SST LOst Library APIs
LLSANDK_DisplayPattern		EQU		$1ABC6
LLSANDK_DeleteThisSST		EQU		$1ABB6
LLSANDK_SpeedToPos			EQU		$1AB52
LLSANDK_AnimatePattern		EQU		$1ABE8
LLSANDK_CreateSST_A1		EQU		$1BAF2
LLSANDK_FollowFloor_D1_D3	EQU		$F938

*	Main routine 0
ehz_boss_init:
	move	#$2F10,($FFFFEE16).w			; Lock the screen to the right

	move.l	#eggmbl_pt+ROM_Offset,12(a0)	; Pattern table for this SST
	move	#$03A0,10(a0)					; Palette line 0. VRAM 7400
	move	#$0200,8(a0)					; Sprite priority 4
	move.b	#$20,7(a0)						; Object width divided by 2
	move.b	#$14,6(a0)						; Object height divided by 2
	move.b	#$00,5(a0)						; Second routine counter
	bset	#$2,4(a0)						; Action flags follow Playfield offset
	move.b	#$0F,40(a0)						; Collision type
	move.b	#$08,41(a0)						; Collision counter
	move.w	BOSS_X+ROM_Offset,d0
	addi	#464,d0
	move	d0,16(a0)						; X coordinate
	subi	#420,d0
	move	d0,60(a0)
	move.w	BOSS_Y+ROM_Offset,20(a0)		; Y coordinate
	subi	#96,20(a0)
	move.l	#ehz_eggmbl+ROM_Offset,(a0)		; Main boss routine

	movea.l	a0,a3							; In case of an error in the future

	jsr		(LLSANDK_CreateSST_A1).l		; Add a child object to this boss
	bne.s	skip_base						; Was no SST left in RAM? Then skip this child

	move.l	#ehz_boss_base+ROM_Offset,(a1)	; Child will be Eggman's head
	move.l	a0,70(a1)						; Pointer to parent in child SST
	move.l	a1,70(a0)						; Pointer to child in parent SST
	move.l	#eggmbl_pt+ROM_Offset,12(a1)	; Pattern table for this SST
	move	#$03A0,10(a1)					; Palette line 0. VRAM 7400
	move	#$0200,8(a1)					; Sprite priority 4
	move.b	#$20,7(a1)						; Object width divided by 2
	move.b	#$00,5(a1)						; Second routine counter
	move.b	4(a0),4(a1)						; Action flags copied from parent
	move.l	16(a0),16(a1)					; Use the same X coordinate as parent
	move.l	20(a0),20(a1)					; Use the same Y coordinate as parent
	move.b	#$01,32(a1)						; Use animation table 1

skip_base:
	jsr		(LLSANDK_CreateSST_A1).l		; Add a child object to this boss
	bne.s	skip_car						; Was no SST left in RAM? Then skip this child

	move.l	#ehz_boss_car+ROM_Offset,(a1)	; Child will be the drill car
	move.l	a0,70(a1)						; Pointer to parent in child SST
	move.l	#drillcar_pt+ROM_Offset,12(a1)	; Pattern table for this SST
	move	#$0400,10(a1)					; Palette line 0. VRAM 8000
	move	#$0180,8(a1)					; Sprite priority 3
	move.b	#$30,7(a1)						; Object width divided by 2
	move.b	#$10,6(a1)						; Object height divided by 2
	move.b	#$10,30(a1)						; Object height divided by 2
	move.b	#$00,5(a1)						; Second routine counter
	bset	#$2,4(a1)						; Action flags follow Playfield offset
	move.w	BOSS_X+ROM_Offset,16(a1)		; X coordinate
	move.w	BOSS_Y+ROM_Offset,20(a1)		; Y coordinate
	add		#312,16(a1)						; Force the car outside the screen

skip_car:
	movea.l	a1,a3							; The wheels need to be children to the car

	bsr.s	create_wheels					; Subroutine for creating 4 wheels

	jsr		(LLSANDK_CreateSST_A1).l		; Add a child object to this boss
	bne.s	skip_blades						; Was no SST left in RAM? Then skip this child

	move.l	#ehz_boss_blades+ROM_Offset,(a1)	; Child will be the helicopter blades
	move.l	a0,70(a1)						; Pointer to parent in child SST
	move.l	#blades_pt+ROM_Offset,12(a1)	; Pattern table for this SST
	move	#$056C,10(a1)					; Palette line 0. VRAM AD80
	move	#$0100,8(a1)					; Sprite priority 2
	move.b	#$40,7(a1)						; Object width divided by 2
	move.b	#$00,5(a1)						; Second routine counter
	bset	#$2,4(a1)						; Action flags follow Playfield offset
	move.l	16(a0),16(a1)					; Use the same X coordinate as parent
	move.l	20(a0),20(a1)					; Use the same Y coordinate as parent
	move	#$001E,46(a1)					; Main Timer
	
skip_blades:
	rts

*	Coordinates for the boss
BOSS_X:
	dc.w	$2FB0
BOSS_Y:
	dc.w	$0374

*	Subroutine
create_wheels:
	lea		wheels_offs(pc),a2				; Using a table with wheels info

	jsr		(LLSANDK_CreateSST_A1).l		; Add a child object to this boss
	bne.s	skip_wheel1						; Was no SST left in RAM? Then skip this child

	move.l	#ehz_boss_wheels+ROM_Offset,(a1)	; Child will be a wheel
	move.b	#$01,56(a1)						; Wheel 1
	move.l	a3,70(a1)						; Pointer to parent in child SST
	move.l	#drillcar_pt+ROM_Offset,12(a1)	; Pattern table for this SST
	move	#$0400,10(a1)					; Palette line 0. VRAM 8000
	move	#$0100,8(a1)					; Sprite priority 2
	move.b	#$10,7(a1)						; Object width divided by 2
	move.b	#$10,6(a1)						; Object height divided by 2
	move.b	#$10,7(a1)						; Object width divided by 2
	move.b	#$0F,30(a1)						; Object height divided by 2
	move.b	#$10,31(a1)						; Object width divided by 2
	move.b	#$00,5(a1)						; Second routine counter
	bset	#$2,4(a1)						; Action flags follow Playfield offset
	move.w	16(a3),d1						; X coordinate
	move.w	20(a3),d0						; Y coordinate
	add.w	(a2)+,d1						; Add the relative X offset
	add.w	(a2)+,d0						; Add the relative Y offset
	move.w	d1,16(a1)						; Store calculated X coordinate
	move.w	d0,20(a1)						; Store calculated Y coordinate
	move.b	(a2)+,32(a1)					; Animation number
	move.b	(a2)+,34(a1)					; Frame number

skip_wheel1:
	jsr		(LLSANDK_CreateSST_A1).l		; Add a child object to this boss
	bne.s	skip_wheel2						; Was no SST left in RAM? Then skip this child

	move.l	#ehz_boss_wheels+ROM_Offset,(a1)	; Child will be a wheel
	move.b	#$02,56(a1)						; Wheel 2
	move.l	a3,70(a1)						; Pointer to parent in child SST
	move.l	#drillcar_pt+ROM_Offset,12(a1)	; Pattern table for this SST
	move	#$0400,10(a1)					; Palette line 0. VRAM 8000
	move	#$0100,8(a1)					; Sprite priority 2
	move.b	#$10,7(a1)						; Object width divided by 2
	move.b	#$10,6(a1)						; Object height divided by 2
	move.b	#$0F,30(a1)						; Object height divided by 2
	move.b	#$10,31(a1)						; Object width divided by 2
	move.b	#$00,5(a1)						; Second routine counter
	bset	#$2,4(a1)						; Action flags follow Playfield offset
	move.w	16(a3),d1						; X coordinate
	move.w	20(a3),d0						; Y coordinate
	add.w	(a2)+,d1						; Add the relative X offset
	add.w	(a2)+,d0						; Add the relative Y offset
	move.w	d1,16(a1)						; Store calculated X coordinate
	move.w	d0,20(a1)						; Store calculated Y coordinate
	move.b	(a2)+,32(a1)					; Animation number
	move.b	(a2)+,34(a1)					; Frame number

skip_wheel2:
	jsr		(LLSANDK_CreateSST_A1).l		; Add a child object to this boss
	bne.s	skip_wheel3						; Was no SST left in RAM? Then skip this child

	move.l	#ehz_boss_wheels+ROM_Offset,(a1)	; Child will be a wheel
	move.b	#$03,56(a1)						; Wheel 3
	move.l	a3,70(a1)						; Pointer to parent in child SST
	move.l	#drillcar_pt+ROM_Offset,12(a1)	; Pattern table for this SST
	move	#$0400,10(a1)					; Palette line 0. VRAM 8000
	move	#$0180,8(a1)					; Sprite priority 3
	move.b	#$10,7(a1)						; Object width divided by 2
	move.b	#$10,6(a1)						; Object height divided by 2
	move.b	#$0F,30(a1)						; Object height divided by 2
	move.b	#$10,31(a1)						; Object width divided by 2
	move.b	#$00,5(a1)						; Second routine counter
	bset	#$2,4(a1)						; Action flags follow Playfield offset
	move.w	16(a3),d1						; X coordinate
	move.w	20(a3),d0						; Y coordinate
	add.w	(a2)+,d1						; Add the relative X offset
	add.w	(a2)+,d0						; Add the relative Y offset
	move.w	d1,16(a1)						; Store calculated X coordinate
	move.w	d0,20(a1)						; Store calculated Y coordinate
	move.b	(a2)+,32(a1)					; Animation number
	move.b	(a2)+,34(a1)					; Frame number

skip_wheel3:
	jsr		(LLSANDK_CreateSST_A1).l		; Add a child object to this boss
	bne.s	skip_drill						; Was no SST left in RAM? Then skip this child

	move.l	#ehz_boss_drill+ROM_Offset,(a1)	; Child will be the drill
	move.l	a3,70(a1)						; Pointer to parent in child SST
	move.l	#drillcar_pt+ROM_Offset,12(a1)	; Pattern table for this SST
	move	#$0400,10(a1)					; Palette line 0. VRAM 8000
	move	#$0100,8(a1)					; Sprite priority 2
	move.b	#$20,31(a1)						; Object width divided by 2
	move.b	#$10,7(a1)						; Object width divided by 2
	move.b	#$10,6(a1)						; Object height divided by 2
	move.b	#$00,5(a1)						; Second routine counter
	bset	#$2,4(a1)						; Action flags follow Playfield offset
	move.w	16(a3),d1						; X coordinate
	move.w	20(a3),d0						; Y coordinate
	add.w	(a2)+,d1						; Add the relative X offset
	add.w	(a2)+,d0						; Add the relative Y offset
	move.w	d1,16(a1)						; Store calculated X coordinate
	move.w	d0,20(a1)						; Store calculated Y coordinate
	move.b	(a2)+,32(a1)					; Animation number
	move.b	(a2)+,34(a1)					; Frame number

skip_drill:
	rts

wheels_offs:
wheel_coord_1:
	dc.w	$001C
	dc.w	$000C
	dc.w	$0104
		
wheel_coord_2:
	dc.w	-$000C
	dc.w	$000C
	dc.w	$0104

wheel_coord_3:
	dc.w	-$002C
	dc.w	$000C
	dc.w	$0206

drill_coord_1:
	dc.w	-$0036
	dc.w	$0008
	dc.w	$0001

ehz_boss_wheels:
	cmpi.b	#$01,56(a0)
	bne.s	not_w1
	
	lea		wheel_coord_1(pc),a2
	bra.s	set_w

not_w1:
	cmpi.b	#$02,56(a0)
	bne.s	is_w3
	
	lea		wheel_coord_2(pc),a2
	bra.s	set_w

is_w3:
	lea		wheel_coord_3(pc),a2
	
set_w:
	bsr.s	set_wheel_relative

	jsr		LLSANDK_FollowFloor_D1_D3

	add		d1,20(a0)
	movea.l	70(a0),a1
	move	5(a1),d0
	cmpi	#$04,d0
	bcs.s	force_anim

	move	24(a1),d0
	cmpi	#-$02C0,d0
	bge.s	skip_wheel_anim

force_anim:
	lea		wheels_animation(pc),a1
	
	jsr		(LLSANDK_AnimatePattern).l
		
skip_wheel_anim:
	jmp		(LLSANDK_DisplayPattern).l

ehz_boss_drill:
	lea		drill_coord_1(pc),a2

	bsr.s	set_wheel_relative

	lea		wheels_animation(pc),a1
	
	jsr		(LLSANDK_AnimatePattern).l
		
	jmp		(LLSANDK_DisplayPattern).l

set_wheel_relative:
	move.w	(a2)+,d1
	move.w	(a2),d0

	movea.l	70(a0),a1
	btst	#0,4(a1)
	beq.s	wheel_face_left

	neg		d1
	bset	#0,42(a0)
	bset	#0,4(a0)
	bra.s	wheel_face_right

wheel_face_left:
	bclr	#0,42(a0)
	bclr	#0,4(a0)

wheel_face_right:
	add.w	16(a1),d1
	add.w	20(a1),d0
	move.w	d1,16(a0)
	move.w	d0,20(a0)
	rts

wheels_animation:
	dc.w	drill-wheels_animation
	dc.w	wheel_1-wheels_animation
	dc.w	wheel_2-wheels_animation

drill:
	dc.b	$05,$01
	dc.b	$02,$03
	dc.b	$FF

	dc.b	$00

wheel_1:
	dc.b	$01,$04
	dc.b	$05,$FF

wheel_2:
	dc.b	$01,$06
	dc.b	$07,$FF

ehz_eggmbl:
	moveq	#0,d0
	move.b	5(a0),d0
	move	eggmbl_tbl(pc,d0),d1
	jsr		eggmbl_tbl(pc,d1)

	movea.l	70(a0),a1
	move.l	16(a0),16(a1)
	move.l	20(a0),20(a1)
	move.b	4(a0),42(a1)

	jmp		(LLSANDK_DisplayPattern).l

eggmbl_tbl:
	dc.w	eggmbl_wait-eggmbl_tbl
	dc.w	eggmbl_flyin0-eggmbl_tbl
	dc.w	eggmbl_flyin1-eggmbl_tbl
	dc.w	eggmbl_flyin2-eggmbl_tbl
	dc.w	waiting_blades-eggmbl_tbl
	dc.w	go_left-eggmbl_tbl
	dc.w	go_right-eggmbl_tbl

eggmbl_wait:
	move	#-$0200,24(a0)
	move	#$0000,26(a0)
	rts

eggmbl_flyin0:
	jsr		(LLSANDK_SpeedToPos).l
	move	60(a0),d0
	move	16(a0),d1
	cmp		d0,d1
	bcc.s	flyin0

	move	#-$0100,24(a0)
	move	#$0040,26(a0)
	addq.b	#2,5(a0)
	
flyin0:
	rts

eggmbl_flyin1:
	jsr		(LLSANDK_SpeedToPos).l
	move	BOSS_X+ROM_Offset,d0
	move	16(a0),d1
	cmp		d0,d1
	bcc.s	flyin1

	move	d0,16(a0)
	clr		24(a0)
	clr		26(a0)
	addq.b	#2,5(a0)
	
flyin1:
	rts

eggmbl_flyin2:
	addi	#$0001,20(a0)
	move	BOSS_Y+ROM_Offset,d0
	move	20(a0),d1
	addi	#$0008,d1
	cmp		d1,d0
	beq.s	wait_for_blades

	rts

wait_for_blades:
	addq.b	#2,5(a0)
	move	#$003A,46(a0)
	rts

waiting_blades:
	bsr.s	wait_count
	rts

go_left:
	subi	#$0002,16(a0)

	move	BOSS_X+ROM_Offset,d0
	subi	#310,d0
	move	16(a0),d1
	cmp		d0,d1
	bcc.s	left

	bset	#0,4(a0)
	addq.b	#2,5(a0)
	
left:
	rts

go_right:
	addi	#$0002,16(a0)

	move	BOSS_X+ROM_Offset,d0
	addi	#310,d0
	move	16(a0),d1
	cmp		d0,d1
	bcs.s	right

	bclr	#0,4(a0)
	subq.b	#2,5(a0)
	
right:
	rts

wait_count:
	tst.w	46(a0)
	bne.s	not_ready

	addq.b	#2,5(a0)
	rts

not_ready:
	subi	#$0001,46(a0)
	rts

ehz_boss_car:
	moveq	#0,d0
	move.b	5(a0),d0
	move	boss_car_tbl(pc,d0),d1
	jsr		boss_car_tbl(pc,d1)

	jmp		(LLSANDK_DisplayPattern).l

boss_car_tbl:
	dc.w	boss_in_range-boss_car_tbl
	dc.w	car_wait_start-boss_car_tbl
	dc.w	car_into_position-boss_car_tbl
	dc.w	car_wait_park-boss_car_tbl
	dc.w	car_follow_boss-boss_car_tbl

boss_in_range:
	move	($FFFFEE78).w,d0
	move	#$2F10,d5
	cmp		d5,d0
	bcc.s	boss_ready_to_begin
	rts

boss_ready_to_begin:
	movea.l	70(a0),a1
	addq.b	#2,5(a1)
	addq.b	#2,5(a0)
	move	#$001E,46(a0)
	move	#-$0800,24(a0)

	moveq	#25,d0
	jsr		$1358.l
	rts

car_wait_start:
	bsr		wait_count
	rts

car_into_position:
	move	BOSS_X+ROM_Offset,d5
	move	16(a0),d0
	cmp		d5,d0
	ble.s	car_ready

	subi	#-$001A,24(a0)
	bmi.s	speed_minus
	
	move	#-$0010,24(a0)

speed_minus:		
	jsr		(LLSANDK_SpeedToPos).l

	rts

car_ready:
	clr		24(a0)
	move	BOSS_X+ROM_Offset,16(a0)
	movea.l	70(a0),a1
	move	20(a1),d0
	addi	#$0008,d0
	move	20(a0),d1
	cmp		d1,d0
	beq.s	car_begin

	rts

car_begin:
	addq.b	#2,5(a0)
	move	#$0038,46(a0)
	rts

car_wait_park:
	bsr		wait_count
	rts
		
car_follow_boss:
	move	#-1024,24(a0)
	movea.l	70(a0),a1
	move.l	16(a1),16(a0)
	move.l	20(a1),20(a0)
	addi	#$0008,20(a0)
	move.b	4(a1),4(a0)
	rts

ehz_boss_blades:
	tst.b	69(a0)
	bne.s	blade_hide

	movea.l	70(a0),a1
	move.l	16(a1),16(a0)
	move.l	20(a1),20(a0)
	btst	#0,4(a1)
	beq.s	blades_face_left

	bset	#0,42(a0)
	bra.s	blades_face_right

blades_face_left:
	bclr	#0,42(a0)

blades_face_right:
	move.b	5(a1),d0
	cmpi.b	#$08,d0
	bne.s	blades_rotate

	move.b	#$01,32(a0)

	tst.b	34(a0)
	bne.s	blades_anim
	
	move.b	#$FF,69(a0)
	move	#$0280,8(a0)

blade_hide:
	move	BOSS_Y+ROM_Offset,d5
	addi	#$0004,d5
	move	20(a0),d0
	cmp		d5,d0
	beq.s	delete_blades

	addi	#$0001,20(a0)
		
	jmp		(LLSANDK_DisplayPattern).l

delete_blades:
	move.l	#LLSANDK_DeleteThisSST,(a0)
	rts

blades_rotate:
	moveq	#0,d0
	move	#$D1,d0
	
	jsr		$1380.l

	move.b	#$00,32(a0)

blades_anim:
	lea		blades_animation(pc),a1

	jsr		(LLSANDK_AnimatePattern).l

	jmp		(LLSANDK_DisplayPattern).l

blades_animation:
	dc.w	blade_run-blades_animation
	dc.w	blade_close-blades_animation
	dc.w	blade_open-blades_animation

blade_run:
	dc.b	$01,$05
	dc.b	$06,$FF

blade_close:
	dc.b	$01,$01
	dc.b	$01,$01
	dc.b	$02,$02
	dc.b	$02,$03
	dc.b	$03,$03
	dc.b	$04,$04
	dc.b	$04,$00
	dc.b	$00,$00
	dc.b	$00,$00
	dc.b	$00,$00
	dc.b	$00,$FD

blade_open:
	dc.b	$01,$00
	dc.b	$00,$00
	dc.b	$00,$00
	dc.b	$00,$00
	dc.b	$00,$04
	dc.b	$04,$04
	dc.b	$03,$03
	dc.b	$03,$02
	dc.b	$02,$02
	dc.b	$01,$01
	dc.b	$01,$05
	dc.b	$06,$FD

ehz_boss_base:
	movea.l	70(a0),a1
	move.b	5(a1),d0
	cmpi.b	#$08,d0
	bne.s	base_norm

	move.b	#$03,32(a0)
	
	bra.s	base_anim

base_norm:
	move.b	#$01,32(a0)

base_anim:
	lea		base_animation(pc),a1
	jsr		(LLSANDK_AnimatePattern).l
	
	jmp		(LLSANDK_DisplayPattern).l

base_animation:
	dc.w	eggmbl_craft-base_animation
	dc.w	base_head_normal-base_animation
	dc.w	base_head_damage-base_animation
	dc.w	base_head_laugh-base_animation
	dc.w	base_head_die-base_animation

eggmbl_craft:
	dc.b	$0F,$00
	dc.b	$FF

	dc.b	$00

base_head_normal:
	dc.b	$07, $01
	dc.b	$02, $FF

base_head_damage:
	dc.b	$07, $05
	dc.b	$05, $05
	dc.b	$05, $05
	dc.b	$05, $FD

base_head_laugh:
	dc.b	$07, $03
	dc.b	$04, $03
	dc.b	$04, $03
	dc.b	$04, $FF

base_head_die:
	dc.b	$0F, $07
	dc.b	$07, $07
	dc.b	$07, $07
	dc.b	$07, $07
	dc.b	$07, $07
	dc.b	$07, $FD

*	Sprite mappings generated with LOst Library 2.10
eggmbl_pt:
	incbin	bosship.smp

drillcar_pt:
	incbin	bossehz.smp

blades_pt:
	incbin	bossheli.smp