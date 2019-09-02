Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCCBA52D1
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 11:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730100AbfIBJ2z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 05:28:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:33244 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729717AbfIBJ2z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 05:28:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 48022AEA1;
        Mon,  2 Sep 2019 09:28:54 +0000 (UTC)
Date:   Mon, 2 Sep 2019 11:29:02 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Hans L <thehans@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Problems with decode-dimms
Message-ID: <20190902112902.6b1abf42@endymion>
In-Reply-To: <CAFoRp-PH=Bjs+vSmCvA9i0X3Jw7M6zuUCew7y=A7gxNUSrRZ7g@mail.gmail.com>
References: <CAFoRp-PH=Bjs+vSmCvA9i0X3Jw7M6zuUCew7y=A7gxNUSrRZ7g@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Sun, 1 Sep 2019 12:46:23 -0500, Hans L wrote:
> Hello, I have a computer running Linux Mint 19.2, and wanted to use
> decode-dimms to read DDR4 SPD data.
> 
> Some basic relevant hardware info:
> CPU: AMD Ryzen 2700X
> Mobo: Asus Prime B450 Plus
> RAM: 2 kits (4x8GB total) of: "Corsair Vengeance LPX 16GB (2 X 8GB)
> DDR4 3000 (PC4-24000) C16 1.35V - CMK16GX4M2D3000C16"
> 
> 
> I noticed that support for DDR4 was somewhat-recently added (via
> "ee1004"), so I updated from kernel ~4.15 to the latest kernel
> available through the Mint repos:
> $ uname -a
> Linux gypsy 5.0.0-25-generic #26~18.04.1-Ubuntu SMP Thu Aug 1 13:51:02
> UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> 
> I ran "modprobe eeprom" and "modprobe ee1004" to insert the modules.

If you have DDR4 memory then do NOT modprobe eeprom. The legacy eeprom
driver will stupidly bind to ALL devices in I2C address range
0x50-0x57, preventing the right driver (ee1004) from claiming these
addresses later.

> I also checked for other i2c modules which I think were already loaded:
> hans@gypsy:~$ lsmod | grep i2c
> i2c_piix4              28672  0
> i2c_nvidia_gpu         16384  0
> 
> Here is the list of i2c buses available:
> hans@gypsy:~$ sudo i2cdetect -l
> i2c-3   smbus           SMBus PIIX4 adapter port 3 at 0b00      SMBus adapter
> i2c-1   smbus           SMBus PIIX4 adapter port 0 at 0b00      SMBus adapter
> i2c-8   i2c             NVIDIA i2c adapter 6 at 9:00.0          I2C adapter
> i2c-6   i2c             NVIDIA i2c adapter 3 at 9:00.0          I2C adapter
> i2c-4   smbus           SMBus PIIX4 adapter port 4 at 0b00      SMBus adapter
> i2c-2   smbus           SMBus PIIX4 adapter port 2 at 0b00      SMBus adapter
> i2c-0   i2c             NVIDIA GPU I2C adapter                  I2C adapter
> i2c-7   i2c             NVIDIA i2c adapter 5 at 9:00.0          I2C adapter
> i2c-5   i2c             NVIDIA i2c adapter 1 at 9:00.0          I2C adapter
> 
> And this is what I see when I try to detect them (SMBus / non-NVIDIA ones):
> hans@gypsy:~$ sudo i2cdetect -y 1
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: 20 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: 30 31 -- -- 34 35 36 -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: UU UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> hans@gypsy:~$ sudo i2cdetect -y 2
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> hans@gypsy:~$ sudo i2cdetect -y 3
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> hans@gypsy:~$ sudo i2cdetect -y 4
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> Is it indicating any kind of problem that bus 1 address 0x50-0x53
> shows "UU UU UU UU"?

It means that a driver is bound to these addresses. You can check which
driver it is with:

$ ls -l /sys/bus/i2c/devices/1-005[0123]/driver

Maybe I could include the information in the output of decode-dimms
itself to help spot mistakes.

> Anyways, when I ran decode-dimms, I was getting just a short report of
> mostly nonsense, and I realized that I needed a newer i2c-tools
> package than my distro provided(4.0-2), so I removed that one, and
> downloaded this one:
> http://jdelvare.nerim.net/mirror/i2c-tools/i2c-tools-4.1.tar.xz
> I ran "make" and "sudo make install" and NOW I can run decode-dimms!
> 
> But I have some issues with the output:
> 
> 1) I get a ton of warnings about "uninitialized value"s at the top of the output
> 
> 2) The "Maximum module speed ... 2132 MHz (PC4-17000)" is shown, but
> these modules are sold as DDR4-3000 (and currently running at 2733,
> see dmidecode output below also).  Does the SPD data not include XMP /
> DOCP(what Asus calls XMP in BIOS) info?

No, decode-dimms doesn't know about XMP. I'm not even sure if the data
is inside the SPD EEPROM or somewhere else. So decode-dimms will only
report the standard speeds your memory modules are capable of, not the
overclocked / non-standard speeds.

>    2a) Also, small nitpick, but I'm pretty sure the "MHz" should be
> "MT/s" regardless of the numerical value shown.

Yes, you are right. This was fixed in dmidecode some times ago, and the
same should be done for decode-dimms. The confusion comes from vendor
themselves lying when DDR memory first hit the market. They used MHz
because that's what customers were used to, but actually gave MT/s
numbers otherwise the values could be less than non-DDR memory which
would confuse the customers. Now all memory is DDR anyway so it no
longer matters.

> 3) I was really hoping specifically to get information about the die
> manufacturer/type on these DIMMs, but the "Manufacturer Data"  section
> just shows "Undefined".  Is it likely that this information simply not
> divulged by this model, or is there possibly any bug in how the data
> is decoded (maybe related to all the warnings?)

Warnings are not supposed to happen so let's fix them first. And yes it
looks related. This however does not guarantee that there will be any
useful data after we fix the problem.

> Here is what I get from "sudo dmidecode -t17" (I only list first bank
> to keep it brief here, they are all basically the same):
> # dmidecode 3.1
> Getting SMBIOS data from sysfs.
> SMBIOS 3.1.1 present.
> 
> Handle 0x002E, DMI type 17, 84 bytes
> Memory Device
> Array Handle: 0x0027
> Error Information Handle: 0x002D
> Total Width: 64 bits
> Data Width: 64 bits
> Size: 8192 MB
> Form Factor: DIMM
> Set: None
> Locator: DIMM_A1
> Bank Locator: BANK 0
> Type: DDR4
> Type Detail: Synchronous Unbuffered (Unregistered)
> Speed: 2733 MT/s
> Manufacturer: Corsair
> Serial Number: 00000000
> Asset Tag: Not Specified
> Part Number: CMK16GX4M2D3000C16
> Rank: 1
> Configured Clock Speed: 2733 MT/s
> Minimum Voltage: 1.2 V
> Maximum Voltage: 1.2 V
> Configured Voltage: 1.2 V

Looks good.

> They are currently running at 2733 MT/s despite their advertised 3000,
> as I could not get BIOS to post with any higher setting.  I started
> with a single 2x8GB kit which ran fine at 3000, but later when I added
> the second kit of 2x8GB, I found the clocks were limited, so that's
> what made me curious to decode some more detailed info about the chips
> on these DIMMS etc.
> 
> 
> And finally here is the log I got from "decode-dimms --side-by-side
> 2&> logfile":  
> 
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 431.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 432.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 431.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 432.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 431.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 432.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 431.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 432.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 431.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 432.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 431.
> Use of uninitialized value $b in numeric eq (==) at
> /usr/local/bin/decode-dimms line 432.
> Use of uninitialized value $code in chr at /usr/local/bin/decode-dimms
> line 2106.
> (...)

All these warnings are emitted from decode_ddr4_mfg_data() directly or
indirectly. I suspect you are using the eeprom driver, which only
reports the first 256 bytes of EEPROM data. The manufacturer data of
DDR4 modules is in bytes 320-351.

I'll add a check in the script to not call the function if this part of
the EEPROM is missing. Better a clear error message than pages of
cryptic warnings.

> # decode-dimms version $Revision$
> 
> Memory Serial Presence Detect Decoder
> By Philip Edelbrock, Christian Zuckschwerdt, Burkart Lingner,
> Jean Delvare, Trent Piepho and others
> 
> 
> Decoding EEPROM                                  1-0050
> 1-0051           1-0052           1-0053
> Guessing DIMM is in                              bank 1           bank
> 2           bank 3           bank 4
> 
> ---=== SPD EEPROM Information ===---
> EEPROM CRC of bytes 0-125                        OK (0x0DB6)
> # of bytes written to SDRAM EEPROM               384
> Total number of bytes in EEPROM                  512
> Fundamental Memory type                          DDR4 SDRAM
> SPD Revision                                     1.0
> Module Type                                      UDIMM
> EEPROM CRC of bytes 128-253                      OK (0x58B6)
> 
> ---=== Memory Characteristics ===---
> Maximum module speed                             2132 MHz (PC4-17000)
> Size                                             8192 MB
> Banks x Rows x Columns x Bits                    16 x 16 x 10 x 64
> SDRAM Device Width                               8 bits
> Ranks                                            1
> AA-RCD-RP-RAS (cycles)                           15-15-15-36
> Supported CAS Latencies                          24T, 23T, 22T, 21T,
> 20T, 19T, 18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T, 9T, 8T, 7T
> 
> ---=== Timings at Standard Speeds ===---
> AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-31
> AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-27
> 
> ---=== Timing Parameters ===---
> Minimum Cycle Time (tCKmin)                      0.938 ns
> Maximum Cycle Time (tCKmax)                      1.500 ns
> Minimum CAS Latency Time (tAA)                   13.500 ns
> Minimum RAS to CAS Delay (tRCD)                  13.500 ns
> Minimum Row Precharge Delay (tRP)                13.500 ns
> Minimum Active to Precharge Delay (tRAS)         33.000 ns
> Minimum Active to Auto-Refresh Delay (tRC)       46.500 ns
> Minimum Recovery Delay (tRFC1)                   350.000 ns
> Minimum Recovery Delay (tRFC2)                   260.000 ns
> Minimum Recovery Delay (tRFC4)                   160.000 ns
> Minimum Four Activate Window Delay (tFAW)        21.000 ns
> Minimum Row Active to Row Active Delay (tRRD_S)  3.700 ns
> Minimum Row Active to Row Active Delay (tRRD_L)  5.300 ns
> Minimum CAS to CAS Delay (tCCD_L)                5.356 ns
> 
> ---=== Other Information ===---
> Package Type                                     Monolithic
> Maximum Activate Count                           Unlimited
> Post Package Repair                              Not supported
> Module Nominal Voltage                           1.2 V
> Thermal Sensor                                   No
> 
> ---=== Physical Characteristics ===---
> Module Height                                    32 mm
> Module Thickness                                 2 mm front, 2 mm back
> Module Reference Card                            A revision 0
> 
> ---=== Manufacturer Data ===---
> Module Manufacturer                              Undefined
> Part Number                                      Undefined
> 
> 
> Number of SDRAM DIMMs detected and decoded: 4
> 
> 
> Any help would be appreciated, thanks!

Most likely your problems are caused by the eeprom driver. Unload it,
then manually bind the I2C addresses to the ee1004 driver (see
Documentation/i2c/instantiating-devices, Method 4), and I think the
warnings will be gone. I still want to improve the script to properly
report the problem.

-- 
Jean Delvare
SUSE L3 Support
