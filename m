Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF6F3962F3
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 17:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbhEaPCq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 11:02:46 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23720 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234126AbhEaPAk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 May 2021 11:00:40 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14VEqnM5029799;
        Mon, 31 May 2021 16:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=selector1;
 bh=PrbAbrAwwH2yOHfoX4gGxtNns83nGbG6cYXmWboKu9c=;
 b=bMTpOWvyJTx6qgF/i5qj2OzXSUItkWlitHUN89EhgTYExjZZqHKd1l4LtjHsfQMMBVQT
 Ot7u6jOwhuivFgYoxdoYTg37WON3yYakaCJBwqisDTFIvHrXFQfjTXuyL8bVYA3maDVx
 yO83sQ/K1vp1b5mjP1Uhf+sbJilLre2HfQ7Z4MQQ9P3c8mvZGWd5vhsI7dUYGVJNap5x
 aj5/re+OrrwXkMYIAOIiMklb1YacAwu8VdO94y603RJG+RxWgaONYmwfUt6TtUuLP8u9
 roGJshRe2O2hPuVxW1CiJAPXJggEv43GSsA+veUSynTKAQA31P9aa2RPZVkw3SnuhAMW nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38w0y7g9gh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 May 2021 16:58:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F080710002A;
        Mon, 31 May 2021 16:58:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDA6C2C4211;
        Mon, 31 May 2021 16:58:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 May
 2021 16:58:38 +0200
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
 <980635c6-5abb-f440-0c3d-cf1ee2dd7bf1@foss.st.com>
 <CAL9mu0LQAcQbq2Y2=hbrqf_qTuv5-41nD+Dkz57Las5uD1OssA@mail.gmail.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <770ec91e-044b-ec6d-9e5d-0632fb333f43@foss.st.com>
Date:   Mon, 31 May 2021 16:58:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0LQAcQbq2Y2=hbrqf_qTuv5-41nD+Dkz57Las5uD1OssA@mail.gmail.com>
Content-Type: multipart/mixed;
        boundary="------------21C1E71F54C5988315BB645C"
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-31_08:2021-05-31,2021-05-31 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--------------21C1E71F54C5988315BB645C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Dillon

On 5/31/21 4:29 PM, Dillon Min wrote:
> Hi Patrice
> 
> On Mon, May 31, 2021 at 9:51 PM Patrice CHOTARD
> <patrice.chotard@foss.st.com> wrote:
>>
>>
>>
>> On 5/31/21 3:38 PM, Dillon Min wrote:
>>> Hi Patrice
>>>
>>> Thanks for your time to test my patch.
>>>
>>> On Mon, May 31, 2021 at 9:20 PM Patrice CHOTARD
>>> <patrice.chotard@foss.st.com> wrote:
>>>>
>>>> Hi Dillon
>>>>
>>>>
>>>>
>>>> On 5/14/21 1:02 PM, dillon.minfei@gmail.com wrote:
>>>>> From: Dillon Min <dillon.minfei@gmail.com>
>>>>>
>>>>> This seriese fix three i2c/clk bug for stm32 f4/f7
>>>>> - kernel runing in sdram, i2c driver get data timeout
>>>>> - ltdc clk turn off after kernel console active
>>>>> - kernel hang in set ltdc clock rate
>>>>>
>>>>> clk bug found on stm32f429/f469-disco board
>>>>>
>>>>> Hi Patrice:
>>>>> below is the guide to verify the patch:
>>>>>
>>>>> setup test env with following files(link at below 'files link'):
>>>>> [1] u-boot-dtb.bin
>>>>> [2] rootfs zip file (used in kernel initramfs)
>>>>> [3] u-boot's mkimage to create itb file
>>>>> [4] kernel config file
>>>>> [5] my itb with-or-without i2c patch
>>>>>
>>>>> This patch based on kernel commit:
>>>>> 88b06399c9c766c283e070b022b5ceafa4f63f19
>>>>>
>>>>> Note:
>>>>> panel-ilitek-ili9341.c is the driver which was submitted last year, but not
>>>>> get accepted. it's used to setup touch screen calibration, then test i2c.
>>>>>
>>>>> create itb file(please correct path of 'data'):
>>>>> ./mkimage -f stm32.its stm32.itb
>>>>>
>>>>> HW setup:
>>>>> console:
>>>>>        PA9, PA10
>>>>>        usart0
>>>>>        serial@40011000
>>>>>        115200 8n1
>>>>>
>>>>> -- flash u-boot.bin to stm32f429-disco on PC
>>>>> $ sudo openocd -f board/stm32f429discovery.cfg -c \
>>>>>   '{PATH-TO-YOUR-UBOOT}/u-boot-dtb.bin 0x08000000 exit reset'
>>>>>
>>>>> -- setup kernel load bootargs at u-boot
>>>>> U-Boot > setenv bootargs 'console=tty0 console=ttySTM0,115200
>>>>>                     root=/dev/ram rdinit=/linuxrc loglevel=8 fbcon=rotate:2'
>>>>> U-Boot > loady;bootm
>>>>> (download stm32.dtb or your kernel with itb format, or download zImage, dtb)
>>>>>
>>>>
>>>>
>>>> Thanks for these informations
>>>> I was able to load and boot DTB and uImage directly in SDRAM as you suggested,
>>>> i saw Linux logo and kernel log on the STM32F429-disco display,
>>>> but i can't reach the login.
>>>>
>>>> The last kernel log i got is :
>>>>
>>>> Starting kernel ...
>>>>
>>>> [    0.000000] Booting Linux on physical CPU 0x0
>>>> [    0.000000] Linux version 5.13.0-rc1-00082-g9dbbd5cb6240-dirty (nxp11987@lmecxl0573.lme1
>>>> [    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
>>>> [    0.000000] CPU: unknown data cache, unknown instruction cache
>>>> [    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F429i-DISCO board
>>>> [    0.000000] Zone ranges:
>>>> [    0.000000]   Normal   [mem 0x0000000090000000-0x00000000907fffff]
>>>> [    0.000000] Movable zone start for each node
>>>> [    0.000000] Early memory node ranges
>>>>
>>>> [...]
>>>>
>>>> [    2.637564] printk: console [ttySTM0] enabled
>>>> [    2.747984] panel-ilitek-ili9341 spi0.1: get optional vcc failed
>>>> [    2.758986] spi_stm32 40015000.spi: driver initialized
>>>> [    2.795733] i2c /dev entries driver
>>>> [    2.849955] stmpe-i2c 0-0041: stmpe811 detected, chip id: 0x811
>>>> [    2.922030] stmpe-ts stmpe-ts: DMA mask not set
>>>> [    2.965729] input: stmpe-ts as /devices/platform/soc/40005c00.i2c/i2c-0/0-0041/stmpe-ts0
>>>> [    2.991570] stm32f4-i2c 40005c00.i2c: STM32F4 I2C driver registered
>>>> [    3.058262] [drm] Initialized stm 1.0.0 20170330 for 40016800.display-controller on min0
>>>> [    3.665951] panel-ilitek-ili9341 spi0.1: initialized display rgb interface
>>>> [    3.765208] Console: switching to colour frame buffer device 30x40
>>>> [    4.014269] stm32-display 40016800.display-controller: [drm] fb0: stmdrmfb frame buffere
>>>> [    4.212737] Freeing unused kernel memory: 324K
>>>> [    4.287300] This architecture does not have kernel memory protection.
>>>> [    4.401202] Run /linuxrc as init process
>>>> [    4.478622]   with arguments:
>>>> [    4.555069]     /linuxrc
>>>> [    4.595406]   with environment:
>>>> [    4.672213]     HOME=/
>>>> [    4.712511]     TERM=linux
>>>> [  206.785289] random: crng init done
>>>
>>> I guess you didn't add the rootfs to uImage I sent you.
>>
>> I do use your rootfs
>>
>>> Could you post all the logs from u-boot startup to kernel log end.
>>
>>
>> U-Boot 2021.07-rc2 (May 28 2021 - 17:05:35 +0200)
>>
>> DRAM:  8 MiB
>> Flash: 2 MiB
>> Loading Environment from Flash... OK
>> In:    serial@40011000
>> Out:   serial@40011000
>> Err:   serial@40011000
>> Hit any key to stop autoboot:  0
>> U-Boot >    setenv bootargs 'console=tty0 console=ttySTM0,115200 root=/dev/ram rdinit=/lin'
> 
> It seems bootargs are broken here.
> should be setenv bootargs 'console=tty0 console=ttySTM0,115200
> root=/dev/ram rdinit=/linuxrc loglevel=8 fbcon=rotate:2'

It's just a copy/paste issue from my minicom window to my mailer, 
but the bootargs is correct ;-)

See a correct U-boot/kernel log in attached.


> 
>> U-Boot >
>> U-Boot >
>> U-Boot > setenv loadaddr 0x90400000
>> U-Boot > loady
>> ## Ready for binary (ymodem) download to 0x90400000 at 115200 bps...
>> CxyzModem - CRC mode, 156(SOH)/0(STX)/0(CAN) packets, 7 retries
>> ## Total Size      = 0x00004cad = 19629 Bytes
>> U-Boot > setenv loadaddr 0x90406000
>> U-Boot > loady
>> ## Ready for binary (ymodem) download to 0x90406000 at 115200 bps...
>> C- CRC mode, 12453(SOH)/0(STX)/0(CAN) packets, 4 retries
>> ## Total Size      = 0x00185140 = 1593664 Bytes
>> U-Boot > bootm 0x90406000 - 0x90400000
>> ## Booting kernel from Legacy Image at 90406000 ...
>>    Image Name:   Linux-5.13.0-rc1-00082-g9dbbd5cb
>>    Image Type:   ARM Linux Kernel Image (uncompressed)
>>    Data Size:    1593600 Bytes = 1.5 MiB
>>    Load Address: 90008000
>>    Entry Point:  90008000
>>    Verifying Checksum ... OK
>> ## Flattened Device Tree blob at 90400000
>>    Booting using the fdt blob at 0x90400000
>>    Loading Kernel Image
>>    Loading Device Tree to 905b9000, end 905c0cac ... OK
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
>> [    0.000000]   node   0: [mem 0x0000000090000000-0x00000000907fffff]
>> [    0.000000] Initmem setup node 0 [mem 0x0000000090000000-0x00000000907fffff]
>> [    0.000000] On node 0 totalpages: 2048
>> [    0.000000]   Normal zone: 16 pages used for memmap
>> [    0.000000]   Normal zone: 0 pages reserved
>> [    0.000000]   Normal zone: 2048 pages, LIFO batch:0
>> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
>> [    0.000000] pcpu-alloc: [0] 0
>> [    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2032
>> [    0.000000] Kernel command line: console=tty0 console=ttySTM0,115200 root=/dev/ram rdin2
> 
> ditto

same explanation as above, the command line displayed is truncated, but it is the one expected.


> 
>> [    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>> [    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
>> [    0.000000] Memory: 5264K/8192K available (1372K kernel code, 302K rwdata, 516K rodata,)
>> [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>> [    0.000000] rcu:     RCU event tracing is enabled.
>> [    0.000000]  Trampoline variant of Tasks RCU enabled.
>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
>> [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
>> [    0.000000] /soc/interrupt-controller@40013c00: bank0
>> [    0.000000] random: get_random_bytes called from start_kernel+0x203/0x370 with crng_ini0
>> [    0.000000] clocksource: arm_system_timer: mask: 0xffffff max_cycles: 0xffffff, max_idls
>> [    0.000000] ARM System timer initialized as clocksource
>> [    0.000026] sched_clock: 32 bits at 90MHz, resolution 11ns, wraps every 23860929530ns
>> [    0.000665] timer@40000c00: STM32 sched_clock registered
>> [    0.001275] Switching to timer-based delay loop, resolution 11ns
>> [    0.001712] timer@40000c00: STM32 delay timer registered
>> [    0.002253] clocksource: timer@40000c00: mask: 0xffffffff max_cycles: 0xffffffff, max_is
>> [    0.003076] /soc/timer@40000c00: STM32 clockevent driver initialized (32 bits)
>> [    0.014135] Console: colour dummy device 80x30
>> [    0.062375] printk: console [tty0] enabled
>> [    0.063843] Calibrating delay loop (skipped), value calculated using timer frequency.. )
>> [    0.066453] pid_max: default: 4096 minimum: 301
>> [    0.071393] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>> [    0.073734] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>> [    0.104759] rcu: Hierarchical SRCU implementation.
>> [    0.111552] devtmpfs: initialized
>> [    0.339332] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:s
>> [    0.341835] pinctrl core: initialized pinctrl subsystem
>> [    0.658423] stm32f429-pinctrl soc:pin-controller: No package detected, use default one
>> [    0.680505] stm32f429-pinctrl soc:pin-controller: GPIOA bank added
>> [    0.689824] stm32f429-pinctrl soc:pin-controller: GPIOB bank added
>> [    0.699409] stm32f429-pinctrl soc:pin-controller: GPIOC bank added
>> [    0.708775] stm32f429-pinctrl soc:pin-controller: GPIOD bank added
>> [    0.718094] stm32f429-pinctrl soc:pin-controller: GPIOE bank added
>> [    0.727535] stm32f429-pinctrl soc:pin-controller: GPIOF bank added
>> [    0.736953] stm32f429-pinctrl soc:pin-controller: GPIOG bank added
>> [    0.746404] stm32f429-pinctrl soc:pin-controller: GPIOH bank added
>> [    0.756098] stm32f429-pinctrl soc:pin-controller: GPIOI bank added
>> [    0.765436] stm32f429-pinctrl soc:pin-controller: GPIOJ bank added
>> [    0.774870] stm32f429-pinctrl soc:pin-controller: GPIOK bank added
>> [    0.776730] stm32f429-pinctrl soc:pin-controller: Pinctrl STM32 initialized
>> [    0.997446] stm32-dma 40026000.dma-controller: STM32 DMA driver registered
>> [    1.029604] stm32-dma 40026400.dma-controller: STM32 DMA driver registered
>> [    1.043098] clocksource: Switched to clocksource timer@40000c00
>> [    1.358086] workingset: timestamp_bits=30 max_order=11 bucket_order=0
>> [    1.632751] io scheduler mq-deadline registered
>> [    1.634287] io scheduler kyber registered
>> [    1.650574] STM32 USART driver initialized
>> [    1.661272] 40011000.serial: ttySTM0 at MMIO 0x40011000 (irq = 34, base_baud = 5625000)t
>> [    2.603317] random: fast init done
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
>>
>>
>>>
>>> If possible, you can try my suggestion.
>>> - tar -jxf stm32_rootfs.tar.bz2
>>> - add stm32_rootfs to your kernel config( enable initramfs)
>>
>> As explained above, that's what i did
>>
>>> - make O=YOUR_KERNEL_OUT zImage dtbs LOADADDR=0x90008000
>>
>>
>>
>>> - create itb file (combine dtb and kernel, initramfs) by mkimage
>>>   ./mkimage -f stm32.its stm32.itb
>>
>> I didn't use .itb file, but directly uImage loaded @0x90406000 and stm32f429-disco.dtb loaded @0x90400000
> 
> It's fine with manual load dtb and uImage.
> 
>>
>> How do you generate .its file ?
> 
> I refer to u-boot doc , U-BOOT-SOURCE/doc/uImage.FIT/kernel.its
> you can just change the PATH('data = ' filed) of my stm32.its.
> you can correct bootargs in u-boot, try again
> 
> good luck.
> 
> Thanks
> 
> Best Regards
> Dillon
> 
>>
>>
>>>   (before above command, make sure you correct stm32.its adapt to your env)
>>>
>>> This process will make u-boot to load the kernel more simple.
>>>
>>> Thanks.
>>>
>>> Best Regards.
>>> Dillon
>>>
>>>
>>>>
>>>>
>>>> I can't test your I2C patch.
>>>>
>>>> Patrice
>>>>
>>>>
>>>>> -- setup ts_calibrate running env on stm32f429-disco
>>>>> / # export TSLIB_CONFFILE=/etc/ts.conf
>>>>> / # export TSLIB_TSDEVICE=/dev/input/event0
>>>>> / # export TSLIB_CONSOLEDEVICE=none
>>>>> / # export TSLIB_FBDEVICE=/dev/fb0
>>>>>
>>>>> -- clear screen
>>>>> / # ./fb
>>>>>
>>>>> -- run ts_calibrate
>>>>> / # ts_calibrate
>>>>> (you can calibrate touchscreen now, and get below errors)
>>>>>
>>>>> [  113.942087] stmpe-i2c0-0041: failed to read regs 0x52: -110
>>>>> [  114.063598] stmpe-i2c 0-0041: failed to read reg 0x4b: -16
>>>>> [  114.185629] stmpe-i2c 0-0041: failed to read reg 0x40: -16
>>>>> [  114.307257] stmpe-i2c 0-0041: failed to write reg 0xb: -16
>>>>>
>>>>> ...
>>>>> with i2c patch applied, you will find below logs:
>>>>>
>>>>> RAW---------------------> 3164 908 183 118.110884
>>>>> TS_READ_RAW----> x = 3164, y =908, pressure = 183
>>>>> RAW---------------------> 3166 922 126 118.138946
>>>>> TS_READ_RAW----> x = 3166, y = 922, pressure = 126
>>>>> ....
>>>>>
>>>>> files link:
>>>>> https://drive.google.com/drive/folders/1qNbjChcB6UGtKzne2F5x9_WG_sZFyo3o?usp=sharing
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Dillon Min (4):
>>>>>   drm/panel: Add ilitek ili9341 panel driver
>>>>>   i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
>>>>>   clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
>>>>>   clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
>>>>>     kernel startup
>>>>>
>>>>>  drivers/clk/clk-stm32f4.c                    |   10 +-
>>>>>  drivers/gpu/drm/panel/Kconfig                |   12 +
>>>>>  drivers/gpu/drm/panel/Makefile               |    1 +
>>>>>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1285 ++++++++++++++++++++++++++
>>>>>  drivers/i2c/busses/i2c-stm32f4.c             |   12 +-
>>>>>  5 files changed, 1310 insertions(+), 10 deletions(-)
>>>>>  create mode 100755 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>>>>>

--------------21C1E71F54C5988315BB645C
Content-Type: text/plain; charset="UTF-8"; name="uboot_kernel_log.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="uboot_kernel_log.txt"

ClUtQm9vdCAyMDIxLjA3LXJjMiAoTWF5IDI4IDIwMjEgLSAxNzowNTozNSArMDIwMCkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CkRSQU06ICA4IE1pQiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CkZsYXNoOiAyIE1pQiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CkxvYWRpbmcgRW52aXJvbm1lbnQgZnJvbSBGbGFzaC4uLiBPSyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CkluOiAgICBzZXJpYWxANDAwMTEwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ck91dDogICBzZXJpYWxANDAwMTEwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CkVycjogICBzZXJpYWxANDAwMTEwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CkhpdCBhbnkga2V5IHRvIHN0b3AgYXV0b2Jvb3Q6ICAwICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ClUtQm9vdCA+ICBzZXRlbnYgYm9vdGFyZ3MgJ2NvbnNvbGU9dHR5MCBjb25zb2xlPXR0eVNU
TTAsMTE1MjAwIHJvb3Q9L2Rldi9yYW0gcmRpbml0PS9saW51eHJjIGxvZ2xldmVsPTggZmJj
b249cm90YXRlOjInClUtQm9vdCA+IHNldGVudiBsb2FkYWRkciAweDkwNDAwMDAwICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgClUtQm9vdCA+IGxvYWR5ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiMjIFJlYWR5IGZvciBiaW5hcnkgKHltb2RlbSkgZG93bmxvYWQgdG8g
MHg5MDQwMDAwMCBhdCAxMTUyMDAgYnBzLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCkN5ek1vZGVtIC0gQ1JDIG1vZGUsIDE1NihTT0gpLzAoU1RYKS8wKENB
TikgcGFja2V0cywgNiByZXRyaWVzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiMjIFRvdGFsIFNpemUgICAgICA9IDB4MDAwMDRjYWQgPSAxOTYyOSBC
eXRlcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgClUtQm9vdCA+IHNldGVudiBsb2FkYWRkciAweDkwNDA2MDAwICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgClUtQm9vdCA+IGxvYWR5ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiMjIFJlYWR5IGZvciBiaW5hcnkgKHltb2RlbSkgZG93bmxvYWQgdG8g
MHg5MDQwNjAwMCBhdCAxMTUyMDAgYnBzLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCkN5ek1vZGVtIC0gQ1JDIG1vZGUsIDEyNDUzKFNPSCkvMChTVFgpLzAo
Q0FOKSBwYWNrZXRzLCA0IHJldHJpZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiMjIFRvdGFsIFNpemUgICAgICA9IDB4MDAxODUxNDAgPSAxNTkzNjY0
IEJ5dGVzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgClUtQm9vdCA+IGJvb3RtIDB4OTA0MDYwMDAgLSAweDkwNDAwMDAwICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiMjIEJvb3Rpbmcga2VybmVsIGZyb20gTGVnYWN5IEltYWdlIGF0IDkw
NDA2MDAwIC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIEltYWdlIE5hbWU6ICAgTGludXgtNS4xMy4wLXJjMS0wMDA4Mi1n
OWRiYmQ1Y2IgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIEltYWdlIFR5cGU6ICAgQVJNIExpbnV4IEtlcm5lbCBJbWFnZSAo
dW5jb21wcmVzc2VkKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIERhdGEgU2l6ZTogICAgMTU5MzYwMCBCeXRlcyA9IDEuNSBNaUIg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIExvYWQgQWRkcmVzczogOTAwMDgwMDAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIEVudHJ5IFBvaW50OiAgOTAwMDgwMDAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIFZlcmlmeWluZyBDaGVja3N1bSAuLi4gT0sgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiMjIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIGF0IDkwNDAwMDAw
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBibG9iIGF0IDB4OTA0MDAw
MDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIExvYWRpbmcgS2VybmVsIEltYWdlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgIExvYWRpbmcgRGV2aWNlIFRyZWUgdG8gOTA1YjkwMDAsIGVuZCA5
MDVjMGNhYyAuLi4gT0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgClN0YXJ0aW5nIGtlcm5lbCAuLi4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKWyAgICAwLjAwMDAwMF0gQm9vdGlu
ZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwClsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNp
b24gNS4xMy4wLXJjMS0wMDA4Mi1nOWRiYmQ1Y2I2MjQwLWRpcnR5IChueHAxMTk4N0BsbWVj
eGwwNTczLmxtZS5zdC5jb20pIChhcm0tYnVpbGRyb290LXVjbGludXgtdWNsaWJjZ251ZWFi
aTEKWyAgICAwLjAwMDAwMF0gQ1BVOiBBUk12Ny1NIFs0MTBmYzI0MV0gcmV2aXNpb24gMSAo
QVJNdjdNKSwgY3I9MDAwMDAwMDAKWyAgICAwLjAwMDAwMF0gQ1BVOiB1bmtub3duIGRhdGEg
Y2FjaGUsIHVua25vd24gaW5zdHJ1Y3Rpb24gY2FjaGUKWyAgICAwLjAwMDAwMF0gT0Y6IGZk
dDogTWFjaGluZSBtb2RlbDogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyRjQyOWktRElTQ08g
Ym9hcmQKWyAgICAwLjAwMDAwMF0gWm9uZSByYW5nZXM6ClsgICAgMC4wMDAwMDBdICAgTm9y
bWFsICAgW21lbSAweDAwMDAwMDAwOTAwMDAwMDAtMHgwMDAwMDAwMDkwN2ZmZmZmXQpbICAg
IDAuMDAwMDAwXSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAgIDAuMDAw
MDAwXSBFYXJseSBtZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAwMDAwMF0gICBub2RlICAg
MDogW21lbSAweDAwMDAwMDAwOTAwMDAwMDAtMHgwMDAwMDAwMDkwN2ZmZmZmXQpbICAgIDAu
MDAwMDAwXSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAwMDAwMDA5MDAwMDAwMC0w
eDAwMDAwMDAwOTA3ZmZmZmZdClsgICAgMC4wMDAwMDBdIE9uIG5vZGUgMCB0b3RhbHBhZ2Vz
OiAyMDQ4ClsgICAgMC4wMDAwMDBdICAgTm9ybWFsIHpvbmU6IDE2IHBhZ2VzIHVzZWQgZm9y
IG1lbW1hcApbICAgIDAuMDAwMDAwXSAgIE5vcm1hbCB6b25lOiAwIHBhZ2VzIHJlc2VydmVk
ClsgICAgMC4wMDAwMDBdICAgTm9ybWFsIHpvbmU6IDIwNDggcGFnZXMsIExJRk8gYmF0Y2g6
MApbICAgIDAuMDAwMDAwXSBwY3B1LWFsbG9jOiBzMCByMCBkMzI3NjggdTMyNzY4IGFsbG9j
PTEqMzI3NjgKWyAgICAwLjAwMDAwMF0gcGNwdS1hbGxvYzogWzBdIDAgClsgICAgMC4wMDAw
MDBdIEJ1aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91cGluZyBvZmYuICBUb3RhbCBw
YWdlczogMjAzMgpbICAgIDAuMDAwMDAwXSBLZXJuZWwgY29tbWFuZCBsaW5lOiBjb25zb2xl
PXR0eTAgY29uc29sZT10dHlTVE0wLDExNTIwMCByb290PS9kZXYvcmFtIHJkaW5pdD0vbGlu
dXhyYyBsb2dsZXZlbD04IGZiY29uPXJvdGF0ZToyClsgICAgMC4wMDAwMDBdIERlbnRyeSBj
YWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAwLCA0MDk2IGJ5dGVzLCBs
aW5lYXIpClsgICAgMC4wMDAwMDBdIElub2RlLWNhY2hlIGhhc2ggdGFibGUgZW50cmllczog
MTAyNCAob3JkZXI6IDAsIDQwOTYgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjAwMDAwMF0gbWVt
IGF1dG8taW5pdDogc3RhY2s6b2ZmLCBoZWFwIGFsbG9jOm9mZiwgaGVhcCBmcmVlOm9mZgpb
ICAgIDAuMDAwMDAwXSBNZW1vcnk6IDUyNjRLLzgxOTJLIGF2YWlsYWJsZSAoMTM3Mksga2Vy
bmVsIGNvZGUsIDMwMksgcndkYXRhLCA1MTZLIHJvZGF0YSwgMzI0SyBpbml0LCAxMTlLIGJz
cywgMjkyOEsgcmVzZXJ2ZWQsIDBLIGNtYS0pClsgICAgMC4wMDAwMDBdIFNMVUI6IEhXYWxp
Z249MzIsIE9yZGVyPTAtMywgTWluT2JqZWN0cz0wLCBDUFVzPTEsIE5vZGVzPTEKWyAgICAw
LjAwMDAwMF0gcmN1OiBQcmVlbXB0aWJsZSBoaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0
aW9uLgpbICAgIDAuMDAwMDAwXSByY3U6ICAgICBSQ1UgZXZlbnQgdHJhY2luZyBpcyBlbmFi
bGVkLgpbICAgIDAuMDAwMDAwXSAgVHJhbXBvbGluZSB2YXJpYW50IG9mIFRhc2tzIFJDVSBl
bmFibGVkLgpbICAgIDAuMDAwMDAwXSByY3U6IFJDVSBjYWxjdWxhdGVkIHZhbHVlIG9mIHNj
aGVkdWxlci1lbmxpc3RtZW50IGRlbGF5IGlzIDEwIGppZmZpZXMuClsgICAgMC4wMDAwMDBd
IE5SX0lSUVM6IDE2LCBucl9pcnFzOiAxNiwgcHJlYWxsb2NhdGVkIGlycXM6IDE2ClsgICAg
MC4wMDAwMDBdIC9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJANDAwMTNjMDA6IGJhbmswClsg
ICAgMC4wMDAwMDBdIHJhbmRvbTogZ2V0X3JhbmRvbV9ieXRlcyBjYWxsZWQgZnJvbSBzdGFy
dF9rZXJuZWwrMHgyMDMvMHgzNzAgd2l0aCBjcm5nX2luaXQ9MApbICAgIDAuMDAwMDAwXSBj
bG9ja3NvdXJjZTogYXJtX3N5c3RlbV90aW1lcjogbWFzazogMHhmZmZmZmYgbWF4X2N5Y2xl
czogMHhmZmZmZmYsIG1heF9pZGxlX25zOiAzMzE4MTYwMzAgbnMKWyAgICAwLjAwMDAwMF0g
QVJNIFN5c3RlbSB0aW1lciBpbml0aWFsaXplZCBhcyBjbG9ja3NvdXJjZQpbICAgIDAuMDAw
MDI2XSBzY2hlZF9jbG9jazogMzIgYml0cyBhdCA5ME1IeiwgcmVzb2x1dGlvbiAxMW5zLCB3
cmFwcyBldmVyeSAyMzg2MDkyOTUzMG5zClsgICAgMC4wMDA2NjVdIHRpbWVyQDQwMDAwYzAw
OiBTVE0zMiBzY2hlZF9jbG9jayByZWdpc3RlcmVkClsgICAgMC4wMDEyNzVdIFN3aXRjaGlu
ZyB0byB0aW1lci1iYXNlZCBkZWxheSBsb29wLCByZXNvbHV0aW9uIDExbnMKWyAgICAwLjAw
MTcxMl0gdGltZXJANDAwMDBjMDA6IFNUTTMyIGRlbGF5IHRpbWVyIHJlZ2lzdGVyZWQKWyAg
ICAwLjAwMjI1M10gY2xvY2tzb3VyY2U6IHRpbWVyQDQwMDAwYzAwOiBtYXNrOiAweGZmZmZm
ZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiAyMTIzNjIyNzE4NyBu
cwpbICAgIDAuMDAzMDc2XSAvc29jL3RpbWVyQDQwMDAwYzAwOiBTVE0zMiBjbG9ja2V2ZW50
IGRyaXZlciBpbml0aWFsaXplZCAoMzIgYml0cykKWyAgICAwLjAxNDEzNV0gQ29uc29sZTog
Y29sb3VyIGR1bW15IGRldmljZSA4MHgzMApbICAgIDAuMDYyMzc1XSBwcmludGs6IGNvbnNv
bGUgW3R0eTBdIGVuYWJsZWQKWyAgICAwLjA2Mzg0M10gQ2FsaWJyYXRpbmcgZGVsYXkgbG9v
cCAoc2tpcHBlZCksIHZhbHVlIGNhbGN1bGF0ZWQgdXNpbmcgdGltZXIgZnJlcXVlbmN5Li4g
MTgwLjAwIEJvZ29NSVBTIChscGo9OTAwMDAwKQpbICAgIDAuMDY2NDUzXSBwaWRfbWF4OiBk
ZWZhdWx0OiA0MDk2IG1pbmltdW06IDMwMQpbICAgIDAuMDcxMzkzXSBNb3VudC1jYWNoZSBo
YXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAwLCA0MDk2IGJ5dGVzLCBsaW5lYXIp
ClsgICAgMC4wNzM3MzRdIE1vdW50cG9pbnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAx
MDI0IChvcmRlcjogMCwgNDA5NiBieXRlcywgbGluZWFyKQpbICAgIDAuMTA0NzU5XSByY3U6
IEhpZXJhcmNoaWNhbCBTUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMTExNTUyXSBkZXZ0
bXBmczogaW5pdGlhbGl6ZWQKWyAgICAwLjMzOTMzMl0gY2xvY2tzb3VyY2U6IGppZmZpZXM6
IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6
IDE5MTEyNjA0NDYyNzUwMDAwIG5zClsgICAgMC4zNDE4MzVdIHBpbmN0cmwgY29yZTogaW5p
dGlhbGl6ZWQgcGluY3RybCBzdWJzeXN0ZW0KWyAgICAwLjY1ODQyM10gc3RtMzJmNDI5LXBp
bmN0cmwgc29jOnBpbi1jb250cm9sbGVyOiBObyBwYWNrYWdlIGRldGVjdGVkLCB1c2UgZGVm
YXVsdCBvbmUKWyAgICAwLjY4MDUwNV0gc3RtMzJmNDI5LXBpbmN0cmwgc29jOnBpbi1jb250
cm9sbGVyOiBHUElPQSBiYW5rIGFkZGVkClsgICAgMC42ODk4MjRdIHN0bTMyZjQyOS1waW5j
dHJsIHNvYzpwaW4tY29udHJvbGxlcjogR1BJT0IgYmFuayBhZGRlZApbICAgIDAuNjk5NDA5
XSBzdG0zMmY0MjktcGluY3RybCBzb2M6cGluLWNvbnRyb2xsZXI6IEdQSU9DIGJhbmsgYWRk
ZWQKWyAgICAwLjcwODc3NV0gc3RtMzJmNDI5LXBpbmN0cmwgc29jOnBpbi1jb250cm9sbGVy
OiBHUElPRCBiYW5rIGFkZGVkClsgICAgMC43MTgwOTRdIHN0bTMyZjQyOS1waW5jdHJsIHNv
YzpwaW4tY29udHJvbGxlcjogR1BJT0UgYmFuayBhZGRlZApbICAgIDAuNzI3NTM1XSBzdG0z
MmY0MjktcGluY3RybCBzb2M6cGluLWNvbnRyb2xsZXI6IEdQSU9GIGJhbmsgYWRkZWQKWyAg
ICAwLjczNjk1M10gc3RtMzJmNDI5LXBpbmN0cmwgc29jOnBpbi1jb250cm9sbGVyOiBHUElP
RyBiYW5rIGFkZGVkClsgICAgMC43NDY0MDRdIHN0bTMyZjQyOS1waW5jdHJsIHNvYzpwaW4t
Y29udHJvbGxlcjogR1BJT0ggYmFuayBhZGRlZApbICAgIDAuNzU2MDk4XSBzdG0zMmY0Mjkt
cGluY3RybCBzb2M6cGluLWNvbnRyb2xsZXI6IEdQSU9JIGJhbmsgYWRkZWQKWyAgICAwLjc2
NTQzNl0gc3RtMzJmNDI5LXBpbmN0cmwgc29jOnBpbi1jb250cm9sbGVyOiBHUElPSiBiYW5r
IGFkZGVkClsgICAgMC43NzQ4NzBdIHN0bTMyZjQyOS1waW5jdHJsIHNvYzpwaW4tY29udHJv
bGxlcjogR1BJT0sgYmFuayBhZGRlZApbICAgIDAuNzc2NzMwXSBzdG0zMmY0MjktcGluY3Ry
bCBzb2M6cGluLWNvbnRyb2xsZXI6IFBpbmN0cmwgU1RNMzIgaW5pdGlhbGl6ZWQKWyAgICAw
Ljk5NzQ0Nl0gc3RtMzItZG1hIDQwMDI2MDAwLmRtYS1jb250cm9sbGVyOiBTVE0zMiBETUEg
ZHJpdmVyIHJlZ2lzdGVyZWQKWyAgICAxLjAyOTYwNF0gc3RtMzItZG1hIDQwMDI2NDAwLmRt
YS1jb250cm9sbGVyOiBTVE0zMiBETUEgZHJpdmVyIHJlZ2lzdGVyZWQKWyAgICAxLjA0MzA5
OF0gY2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIHRpbWVyQDQwMDAwYzAw
ClsgICAgMS4zNTgwODZdIHdvcmtpbmdzZXQ6IHRpbWVzdGFtcF9iaXRzPTMwIG1heF9vcmRl
cj0xMSBidWNrZXRfb3JkZXI9MApbICAgIDEuNjMyNzUxXSBpbyBzY2hlZHVsZXIgbXEtZGVh
ZGxpbmUgcmVnaXN0ZXJlZApbICAgIDEuNjM0Mjg3XSBpbyBzY2hlZHVsZXIga3liZXIgcmVn
aXN0ZXJlZApbICAgIDEuNjUwNTc0XSBTVE0zMiBVU0FSVCBkcml2ZXIgaW5pdGlhbGl6ZWQK
WyAgICAxLjY2MTI3Ml0gNDAwMTEwMDAuc2VyaWFsOiB0dHlTVE0wIGF0IE1NSU8gMHg0MDAx
MTAwMCAoaXJxID0gMzQsIGJhc2VfYmF1ZCA9IDU2MjUwMDApIGlzIGEgc3RtMzItdXNhcnQK
WyAgICAyLjYwMzMxN10gcmFuZG9tOiBmYXN0IGluaXQgZG9uZQpbICAgIDIuNjM3NTY0XSBw
cmludGs6IGNvbnNvbGUgW3R0eVNUTTBdIGVuYWJsZWQKWyAgICAyLjc0Nzk4NF0gcGFuZWwt
aWxpdGVrLWlsaTkzNDEgc3BpMC4xOiBnZXQgb3B0aW9uYWwgdmNjIGZhaWxlZApbICAgIDIu
NzU4OTg2XSBzcGlfc3RtMzIgNDAwMTUwMDAuc3BpOiBkcml2ZXIgaW5pdGlhbGl6ZWQKWyAg
ICAyLjc5NTczM10gaTJjIC9kZXYgZW50cmllcyBkcml2ZXIKWyAgICAyLjg0OTk1NV0gc3Rt
cGUtaTJjIDAtMDA0MTogc3RtcGU4MTEgZGV0ZWN0ZWQsIGNoaXAgaWQ6IDB4ODExClsgICAg
Mi45MjIwMzBdIHN0bXBlLXRzIHN0bXBlLXRzOiBETUEgbWFzayBub3Qgc2V0ClsgICAgMi45
NjU3MjldIGlucHV0OiBzdG1wZS10cyBhcyAvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvNDAwMDVj
MDAuaTJjL2kyYy0wLzAtMDA0MS9zdG1wZS10cy9pbnB1dC9pbnB1dDAKWyAgICAyLjk5MTU3
MF0gc3RtMzJmNC1pMmMgNDAwMDVjMDAuaTJjOiBTVE0zMkY0IEkyQyBkcml2ZXIgcmVnaXN0
ZXJlZApbICAgIDMuMDU4MjYyXSBbZHJtXSBJbml0aWFsaXplZCBzdG0gMS4wLjAgMjAxNzAz
MzAgZm9yIDQwMDE2ODAwLmRpc3BsYXktY29udHJvbGxlciBvbiBtaW5vciAwClsgICAgMy42
NjU5NTFdIHBhbmVsLWlsaXRlay1pbGk5MzQxIHNwaTAuMTogaW5pdGlhbGl6ZWQgZGlzcGxh
eSByZ2IgaW50ZXJmYWNlClsgICAgMy43NjUyMTNdIENvbnNvbGU6IHN3aXRjaGluZyB0byBj
b2xvdXIgZnJhbWUgYnVmZmVyIGRldmljZSAzMHg0MApbICAgIDQuMDE0MjQwXSBzdG0zMi1k
aXNwbGF5IDQwMDE2ODAwLmRpc3BsYXktY29udHJvbGxlcjogW2RybV0gZmIwOiBzdG1kcm1m
YiBmcmFtZSBidWZmZXIgZGV2aWNlClsgICAgNC4yMTI3MTRdIEZyZWVpbmcgdW51c2VkIGtl
cm5lbCBtZW1vcnk6IDMyNEsKWyAgICA0LjI4NzI3MV0gVGhpcyBhcmNoaXRlY3R1cmUgZG9l
cyBub3QgaGF2ZSBrZXJuZWwgbWVtb3J5IHByb3RlY3Rpb24uClsgICAgNC40MDExOTddIFJ1
biAvbGludXhyYyBhcyBpbml0IHByb2Nlc3MKWyAgICA0LjQ3ODYxMl0gICB3aXRoIGFyZ3Vt
ZW50czoKWyAgICA0LjU1NTA2Nl0gICAgIC9saW51eHJjClsgICAgNC41OTU0MDRdICAgd2l0
aCBlbnZpcm9ubWVudDoKWyAgICA0LjY3MjIxMl0gICAgIEhPTUU9LwpbICAgIDQuNzEyNTEx
XSAgICAgVEVSTT1saW51eApbICAyMDYuNzg1Mjg4XSByYW5kb206IGNybmcgaW5pdCBkb25l
Cg==
--------------21C1E71F54C5988315BB645C--
