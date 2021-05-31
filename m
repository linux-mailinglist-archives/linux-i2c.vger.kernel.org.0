Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D17C395BCA
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhEaNYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:24:45 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60568 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232281AbhEaNWp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 May 2021 09:22:45 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14VDGG8h017742;
        Mon, 31 May 2021 15:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=a2HRjUDuOdBPvwc+9z9T/CFX3ODxZ1xmC88BSw9xlJg=;
 b=lcPQNuc9ZE4ed4uCmXixNOTR7xg9H2S7d+bRAvdugGyN0soEYxPgICLqbxlp/Vjqd085
 AREIzrdxyk/YwFrnYMBJ6OfyEPfFRny74oIhP5M2GcHgQXtsVwVFZDiexAweUzzoAPL8
 lYM4e5quAMtNhvURIKvCxuy0hhJGTbSdO9NEeMdwWHssyasbFuYGjP012uNKMIhko7GS
 CbUu1E1kT7tIDNf/JQiCDeOvqfhh5I/ssBgWJViCu/x7B5TIGGLHnbNcZP2mgZZc3uTw
 WSyppcyE0ZQJwKVGTvxMxjtDWuvsjsnSfM9gfNo1zPQGIpyv4xRDebXpXeM14yY61qv4 xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38vbah4var-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 May 2021 15:20:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11F4410002A;
        Mon, 31 May 2021 15:20:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA73924187E;
        Mon, 31 May 2021 15:20:44 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 May
 2021 15:20:43 +0200
Subject: Re: [PATCH 0/4] Fix the i2c/clk bug of stm32 mcu platform
To:     <dillon.minfei@gmail.com>, <pierre-yves.mordret@foss.st.com>,
        <alain.volmat@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-clk@vger.kernel.org>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <401eb514-27bd-03f6-f7a5-22604882b28a@foss.st.com>
Date:   Mon, 31 May 2021 15:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-31_08:2021-05-31,2021-05-31 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dillon



On 5/14/21 1:02 PM, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> This seriese fix three i2c/clk bug for stm32 f4/f7
> - kernel runing in sdram, i2c driver get data timeout
> - ltdc clk turn off after kernel console active
> - kernel hang in set ltdc clock rate
> 
> clk bug found on stm32f429/f469-disco board
> 
> Hi Patrice:
> below is the guide to verify the patch:
> 
> setup test env with following files(link at below 'files link'):
> [1] u-boot-dtb.bin
> [2] rootfs zip file (used in kernel initramfs)
> [3] u-boot's mkimage to create itb file
> [4] kernel config file
> [5] my itb with-or-without i2c patch
> 
> This patch based on kernel commit:
> 88b06399c9c766c283e070b022b5ceafa4f63f19
> 
> Note:
> panel-ilitek-ili9341.c is the driver which was submitted last year, but not
> get accepted. it's used to setup touch screen calibration, then test i2c.
> 
> create itb file(please correct path of 'data'):
> ./mkimage -f stm32.its stm32.itb
> 
> HW setup:
> console:
>        PA9, PA10
>        usart0
>        serial@40011000
>        115200 8n1
> 
> -- flash u-boot.bin to stm32f429-disco on PC
> $ sudo openocd -f board/stm32f429discovery.cfg -c \
>   '{PATH-TO-YOUR-UBOOT}/u-boot-dtb.bin 0x08000000 exit reset'
> 
> -- setup kernel load bootargs at u-boot
> U-Boot > setenv bootargs 'console=tty0 console=ttySTM0,115200
>                     root=/dev/ram rdinit=/linuxrc loglevel=8 fbcon=rotate:2'
> U-Boot > loady;bootm
> (download stm32.dtb or your kernel with itb format, or download zImage, dtb)
> 


Thanks for these informations
I was able to load and boot DTB and uImage directly in SDRAM as you suggested, 
i saw Linux logo and kernel log on the STM32F429-disco display, 
but i can't reach the login.

The last kernel log i got is :

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.13.0-rc1-00082-g9dbbd5cb6240-dirty (nxp11987@lmecxl0573.lme1
[    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F429i-DISCO board
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges

[...]

[    2.637564] printk: console [ttySTM0] enabled
[    2.747984] panel-ilitek-ili9341 spi0.1: get optional vcc failed
[    2.758986] spi_stm32 40015000.spi: driver initialized
[    2.795733] i2c /dev entries driver
[    2.849955] stmpe-i2c 0-0041: stmpe811 detected, chip id: 0x811
[    2.922030] stmpe-ts stmpe-ts: DMA mask not set
[    2.965729] input: stmpe-ts as /devices/platform/soc/40005c00.i2c/i2c-0/0-0041/stmpe-ts0
[    2.991570] stm32f4-i2c 40005c00.i2c: STM32F4 I2C driver registered
[    3.058262] [drm] Initialized stm 1.0.0 20170330 for 40016800.display-controller on min0
[    3.665951] panel-ilitek-ili9341 spi0.1: initialized display rgb interface
[    3.765208] Console: switching to colour frame buffer device 30x40
[    4.014269] stm32-display 40016800.display-controller: [drm] fb0: stmdrmfb frame buffere
[    4.212737] Freeing unused kernel memory: 324K
[    4.287300] This architecture does not have kernel memory protection.
[    4.401202] Run /linuxrc as init process
[    4.478622]   with arguments:
[    4.555069]     /linuxrc
[    4.595406]   with environment:
[    4.672213]     HOME=/
[    4.712511]     TERM=linux
[  206.785289] random: crng init done


I can't test your I2C patch.

Patrice


> -- setup ts_calibrate running env on stm32f429-disco
> / # export TSLIB_CONFFILE=/etc/ts.conf
> / # export TSLIB_TSDEVICE=/dev/input/event0
> / # export TSLIB_CONSOLEDEVICE=none
> / # export TSLIB_FBDEVICE=/dev/fb0
> 
> -- clear screen
> / # ./fb
> 
> -- run ts_calibrate 
> / # ts_calibrate
> (you can calibrate touchscreen now, and get below errors)
> 
> [  113.942087] stmpe-i2c0-0041: failed to read regs 0x52: -110
> [  114.063598] stmpe-i2c 0-0041: failed to read reg 0x4b: -16
> [  114.185629] stmpe-i2c 0-0041: failed to read reg 0x40: -16
> [  114.307257] stmpe-i2c 0-0041: failed to write reg 0xb: -16
> 
> ...
> with i2c patch applied, you will find below logs:
> 
> RAW---------------------> 3164 908 183 118.110884
> TS_READ_RAW----> x = 3164, y =908, pressure = 183
> RAW---------------------> 3166 922 126 118.138946
> TS_READ_RAW----> x = 3166, y = 922, pressure = 126
> ....
> 
> files link:
> https://drive.google.com/drive/folders/1qNbjChcB6UGtKzne2F5x9_WG_sZFyo3o?usp=sharing
> 
> 
> 
> 
> Dillon Min (4):
>   drm/panel: Add ilitek ili9341 panel driver
>   i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
>   clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
>   clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
>     kernel startup
> 
>  drivers/clk/clk-stm32f4.c                    |   10 +-
>  drivers/gpu/drm/panel/Kconfig                |   12 +
>  drivers/gpu/drm/panel/Makefile               |    1 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1285 ++++++++++++++++++++++++++
>  drivers/i2c/busses/i2c-stm32f4.c             |   12 +-
>  5 files changed, 1310 insertions(+), 10 deletions(-)
>  create mode 100755 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> 
