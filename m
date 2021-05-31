Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73577395E28
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhEaNzN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:55:13 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:45851 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232874AbhEaNw7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 May 2021 09:52:59 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14VDkkNF030419;
        Mon, 31 May 2021 15:50:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6v7NrYjfp/K6mcUgfY3OyDF6Ur5//JztO1ogGnWqLt8=;
 b=ep4eZBsTYg3/3yiJnYGDAEzG67fswhKGfjtEjnSzvAG7fAPFK5w1e+CekDUrE5bVMPXh
 kFlRN1nXr1vTbKR2VPM+6jWrhX88StSimSWavjqis8GJgi5JDeoM4rCT8Oj6urBiHM+0
 21+zb7n1W+a5AFpM/wvFQWRUYvW7LSjKx5+5PVkyGdp4LHRwVOkCtKlKFTT3Q6Nx5558
 cn1tuT0YBMgH/VR+/+0hn/atmDTjSlJe4buhGSs+7Q32WobAubSByXt2n7dqTx9hGDxl
 yYWRukbmxmNeSKxs9zrXO11jywd64I6Apa4w7/OBeALAo31H/KDThhjq00AEC9QBnoCo Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38vutw1qdr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 May 2021 15:50:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43DEE10002A;
        Mon, 31 May 2021 15:50:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2565222449B;
        Mon, 31 May 2021 15:50:59 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 May
 2021 15:50:57 +0200
Subject: Re: [PATCH 0/4] Fix the i2c/clk bug of stm32 mcu platform
To:     Dillon Min <dillon.minfei@gmail.com>
CC:     <pierre-yves.mordret@foss.st.com>, <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
 <401eb514-27bd-03f6-f7a5-22604882b28a@foss.st.com>
 <CAL9mu0KScM+imZKVd8pfdm+8hDkRpvMVhGF6cgaEnNiLpkfjoA@mail.gmail.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <980635c6-5abb-f440-0c3d-cf1ee2dd7bf1@foss.st.com>
Date:   Mon, 31 May 2021 15:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0KScM+imZKVd8pfdm+8hDkRpvMVhGF6cgaEnNiLpkfjoA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-31_08:2021-05-31,2021-05-31 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/31/21 3:38 PM, Dillon Min wrote:
> Hi Patrice
> 
> Thanks for your time to test my patch.
> 
> On Mon, May 31, 2021 at 9:20 PM Patrice CHOTARD
> <patrice.chotard@foss.st.com> wrote:
>>
>> Hi Dillon
>>
>>
>>
>> On 5/14/21 1:02 PM, dillon.minfei@gmail.com wrote:
>>> From: Dillon Min <dillon.minfei@gmail.com>
>>>
>>> This seriese fix three i2c/clk bug for stm32 f4/f7
>>> - kernel runing in sdram, i2c driver get data timeout
>>> - ltdc clk turn off after kernel console active
>>> - kernel hang in set ltdc clock rate
>>>
>>> clk bug found on stm32f429/f469-disco board
>>>
>>> Hi Patrice:
>>> below is the guide to verify the patch:
>>>
>>> setup test env with following files(link at below 'files link'):
>>> [1] u-boot-dtb.bin
>>> [2] rootfs zip file (used in kernel initramfs)
>>> [3] u-boot's mkimage to create itb file
>>> [4] kernel config file
>>> [5] my itb with-or-without i2c patch
>>>
>>> This patch based on kernel commit:
>>> 88b06399c9c766c283e070b022b5ceafa4f63f19
>>>
>>> Note:
>>> panel-ilitek-ili9341.c is the driver which was submitted last year, but not
>>> get accepted. it's used to setup touch screen calibration, then test i2c.
>>>
>>> create itb file(please correct path of 'data'):
>>> ./mkimage -f stm32.its stm32.itb
>>>
>>> HW setup:
>>> console:
>>>        PA9, PA10
>>>        usart0
>>>        serial@40011000
>>>        115200 8n1
>>>
>>> -- flash u-boot.bin to stm32f429-disco on PC
>>> $ sudo openocd -f board/stm32f429discovery.cfg -c \
>>>   '{PATH-TO-YOUR-UBOOT}/u-boot-dtb.bin 0x08000000 exit reset'
>>>
>>> -- setup kernel load bootargs at u-boot
>>> U-Boot > setenv bootargs 'console=tty0 console=ttySTM0,115200
>>>                     root=/dev/ram rdinit=/linuxrc loglevel=8 fbcon=rotate:2'
>>> U-Boot > loady;bootm
>>> (download stm32.dtb or your kernel with itb format, or download zImage, dtb)
>>>
>>
>>
>> Thanks for these informations
>> I was able to load and boot DTB and uImage directly in SDRAM as you suggested,
>> i saw Linux logo and kernel log on the STM32F429-disco display,
>> but i can't reach the login.
>>
>> The last kernel log i got is :
>>
>> Starting kernel ...
>>
>> [    0.000000] Booting Linux on physical CPU 0x0
>> [    0.000000] Linux version 5.13.0-rc1-00082-g9dbbd5cb6240-dirty (nxp11987@lmecxl0573.lme1
>> [    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
>> [    0.000000] CPU: unknown data cache, unknown instruction cache
>> [    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F429i-DISCO board
>> [    0.000000] Zone ranges:
>> [    0.000000]   Normal   [mem 0x0000000090000000-0x00000000907fffff]
>> [    0.000000] Movable zone start for each node
>> [    0.000000] Early memory node ranges
>>
>> [...]
>>
>> [    2.637564] printk: console [ttySTM0] enabled
>> [    2.747984] panel-ilitek-ili9341 spi0.1: get optional vcc failed
>> [    2.758986] spi_stm32 40015000.spi: driver initialized
>> [    2.795733] i2c /dev entries driver
>> [    2.849955] stmpe-i2c 0-0041: stmpe811 detected, chip id: 0x811
>> [    2.922030] stmpe-ts stmpe-ts: DMA mask not set
>> [    2.965729] input: stmpe-ts as /devices/platform/soc/40005c00.i2c/i2c-0/0-0041/stmpe-ts0
>> [    2.991570] stm32f4-i2c 40005c00.i2c: STM32F4 I2C driver registered
>> [    3.058262] [drm] Initialized stm 1.0.0 20170330 for 40016800.display-controller on min0
>> [    3.665951] panel-ilitek-ili9341 spi0.1: initialized display rgb interface
>> [    3.765208] Console: switching to colour frame buffer device 30x40
>> [    4.014269] stm32-display 40016800.display-controller: [drm] fb0: stmdrmfb frame buffere
>> [    4.212737] Freeing unused kernel memory: 324K
>> [    4.287300] This architecture does not have kernel memory protection.
>> [    4.401202] Run /linuxrc as init process
>> [    4.478622]   with arguments:
>> [    4.555069]     /linuxrc
>> [    4.595406]   with environment:
>> [    4.672213]     HOME=/
>> [    4.712511]     TERM=linux
>> [  206.785289] random: crng init done
> 
> I guess you didn't add the rootfs to uImage I sent you.

I do use your rootfs

> Could you post all the logs from u-boot startup to kernel log end.


U-Boot 2021.07-rc2 (May 28 2021 - 17:05:35 +0200)                                   
                                                                                    
DRAM:  8 MiB                                                                        
Flash: 2 MiB                                                                        
Loading Environment from Flash... OK                                                
In:    serial@40011000                                                              
Out:   serial@40011000                                                              
Err:   serial@40011000                                                              
Hit any key to stop autoboot:  0                                                    
U-Boot >    setenv bootargs 'console=tty0 console=ttySTM0,115200 root=/dev/ram rdinit=/lin'
U-Boot >                                                                            
U-Boot >                                                                            
U-Boot > setenv loadaddr 0x90400000                                                 
U-Boot > loady                                                                      
## Ready for binary (ymodem) download to 0x90400000 at 115200 bps...                
CxyzModem - CRC mode, 156(SOH)/0(STX)/0(CAN) packets, 7 retries                     
## Total Size      = 0x00004cad = 19629 Bytes                                       
U-Boot > setenv loadaddr 0x90406000                                                 
U-Boot > loady
## Ready for binary (ymodem) download to 0x90406000 at 115200 bps...                
C- CRC mode, 12453(SOH)/0(STX)/0(CAN) packets, 4 retries
## Total Size      = 0x00185140 = 1593664 Bytes
U-Boot > bootm 0x90406000 - 0x90400000
## Booting kernel from Legacy Image at 90406000 ...
   Image Name:   Linux-5.13.0-rc1-00082-g9dbbd5cb
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1593600 Bytes = 1.5 MiB
   Load Address: 90008000
   Entry Point:  90008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 90400000
   Booting using the fdt blob at 0x90400000
   Loading Kernel Image
   Loading Device Tree to 905b9000, end 905c0cac ... OK

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
[    0.000000]   node   0: [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] On node 0 totalpages: 2048
[    0.000000]   Normal zone: 16 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 2048 pages, LIFO batch:0
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2032
[    0.000000] Kernel command line: console=tty0 console=ttySTM0,115200 root=/dev/ram rdin2
[    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 5264K/8192K available (1372K kernel code, 302K rwdata, 516K rodata,)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] /soc/interrupt-controller@40013c00: bank0
[    0.000000] random: get_random_bytes called from start_kernel+0x203/0x370 with crng_ini0
[    0.000000] clocksource: arm_system_timer: mask: 0xffffff max_cycles: 0xffffff, max_idls
[    0.000000] ARM System timer initialized as clocksource
[    0.000026] sched_clock: 32 bits at 90MHz, resolution 11ns, wraps every 23860929530ns
[    0.000665] timer@40000c00: STM32 sched_clock registered
[    0.001275] Switching to timer-based delay loop, resolution 11ns
[    0.001712] timer@40000c00: STM32 delay timer registered
[    0.002253] clocksource: timer@40000c00: mask: 0xffffffff max_cycles: 0xffffffff, max_is
[    0.003076] /soc/timer@40000c00: STM32 clockevent driver initialized (32 bits)
[    0.014135] Console: colour dummy device 80x30
[    0.062375] printk: console [tty0] enabled
[    0.063843] Calibrating delay loop (skipped), value calculated using timer frequency.. )
[    0.066453] pid_max: default: 4096 minimum: 301
[    0.071393] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.073734] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.104759] rcu: Hierarchical SRCU implementation.
[    0.111552] devtmpfs: initialized
[    0.339332] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:s
[    0.341835] pinctrl core: initialized pinctrl subsystem
[    0.658423] stm32f429-pinctrl soc:pin-controller: No package detected, use default one
[    0.680505] stm32f429-pinctrl soc:pin-controller: GPIOA bank added
[    0.689824] stm32f429-pinctrl soc:pin-controller: GPIOB bank added
[    0.699409] stm32f429-pinctrl soc:pin-controller: GPIOC bank added
[    0.708775] stm32f429-pinctrl soc:pin-controller: GPIOD bank added
[    0.718094] stm32f429-pinctrl soc:pin-controller: GPIOE bank added
[    0.727535] stm32f429-pinctrl soc:pin-controller: GPIOF bank added
[    0.736953] stm32f429-pinctrl soc:pin-controller: GPIOG bank added
[    0.746404] stm32f429-pinctrl soc:pin-controller: GPIOH bank added
[    0.756098] stm32f429-pinctrl soc:pin-controller: GPIOI bank added
[    0.765436] stm32f429-pinctrl soc:pin-controller: GPIOJ bank added
[    0.774870] stm32f429-pinctrl soc:pin-controller: GPIOK bank added
[    0.776730] stm32f429-pinctrl soc:pin-controller: Pinctrl STM32 initialized
[    0.997446] stm32-dma 40026000.dma-controller: STM32 DMA driver registered
[    1.029604] stm32-dma 40026400.dma-controller: STM32 DMA driver registered
[    1.043098] clocksource: Switched to clocksource timer@40000c00
[    1.358086] workingset: timestamp_bits=30 max_order=11 bucket_order=0
[    1.632751] io scheduler mq-deadline registered           
[    1.634287] io scheduler kyber registered
[    1.650574] STM32 USART driver initialized
[    1.661272] 40011000.serial: ttySTM0 at MMIO 0x40011000 (irq = 34, base_baud = 5625000)t
[    2.603317] random: fast init done
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


> 
> If possible, you can try my suggestion.
> - tar -jxf stm32_rootfs.tar.bz2
> - add stm32_rootfs to your kernel config( enable initramfs)

As explained above, that's what i did

> - make O=YOUR_KERNEL_OUT zImage dtbs LOADADDR=0x90008000



> - create itb file (combine dtb and kernel, initramfs) by mkimage
>   ./mkimage -f stm32.its stm32.itb

I didn't use .itb file, but directly uImage loaded @0x90406000 and stm32f429-disco.dtb loaded @0x90400000

How do you generate .its file ?


>   (before above command, make sure you correct stm32.its adapt to your env)
> 
> This process will make u-boot to load the kernel more simple.
> 
> Thanks.
> 
> Best Regards.
> Dillon
> 
> 
>>
>>
>> I can't test your I2C patch.
>>
>> Patrice
>>
>>
>>> -- setup ts_calibrate running env on stm32f429-disco
>>> / # export TSLIB_CONFFILE=/etc/ts.conf
>>> / # export TSLIB_TSDEVICE=/dev/input/event0
>>> / # export TSLIB_CONSOLEDEVICE=none
>>> / # export TSLIB_FBDEVICE=/dev/fb0
>>>
>>> -- clear screen
>>> / # ./fb
>>>
>>> -- run ts_calibrate
>>> / # ts_calibrate
>>> (you can calibrate touchscreen now, and get below errors)
>>>
>>> [  113.942087] stmpe-i2c0-0041: failed to read regs 0x52: -110
>>> [  114.063598] stmpe-i2c 0-0041: failed to read reg 0x4b: -16
>>> [  114.185629] stmpe-i2c 0-0041: failed to read reg 0x40: -16
>>> [  114.307257] stmpe-i2c 0-0041: failed to write reg 0xb: -16
>>>
>>> ...
>>> with i2c patch applied, you will find below logs:
>>>
>>> RAW---------------------> 3164 908 183 118.110884
>>> TS_READ_RAW----> x = 3164, y =908, pressure = 183
>>> RAW---------------------> 3166 922 126 118.138946
>>> TS_READ_RAW----> x = 3166, y = 922, pressure = 126
>>> ....
>>>
>>> files link:
>>> https://drive.google.com/drive/folders/1qNbjChcB6UGtKzne2F5x9_WG_sZFyo3o?usp=sharing
>>>
>>>
>>>
>>>
>>> Dillon Min (4):
>>>   drm/panel: Add ilitek ili9341 panel driver
>>>   i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
>>>   clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
>>>   clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
>>>     kernel startup
>>>
>>>  drivers/clk/clk-stm32f4.c                    |   10 +-
>>>  drivers/gpu/drm/panel/Kconfig                |   12 +
>>>  drivers/gpu/drm/panel/Makefile               |    1 +
>>>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1285 ++++++++++++++++++++++++++
>>>  drivers/i2c/busses/i2c-stm32f4.c             |   12 +-
>>>  5 files changed, 1310 insertions(+), 10 deletions(-)
>>>  create mode 100755 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>>>
