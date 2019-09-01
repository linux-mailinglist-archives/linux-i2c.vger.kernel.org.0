Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42022A4AF8
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2019 19:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbfIARrD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Sep 2019 13:47:03 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:45371 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbfIARrD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Sep 2019 13:47:03 -0400
Received: by mail-ed1-f45.google.com with SMTP id x19so13637058eda.12
        for <linux-i2c@vger.kernel.org>; Sun, 01 Sep 2019 10:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=8hxcpZlAkj7h2zREEKZM39qIVFQ6jLvFB1PIah7KVxY=;
        b=YaPNDxnPEObCBWiQiejDlxVU5X0J/yyaU3hUGbImkP95KMXiG7BfnMUD67WdwffX4Z
         YIRZxnS73AnTZx4yl+FieXW/RnIRePz38+h43AK2AFjnAwHEVEK3+jVxEJM5/eTVbYSg
         5vNp0scXZ8l2ChDFP9MaX/X6yNlV/qJKclm+ETtjvL4BBBkZv4wgcbqmzo4vJFmJDtKC
         RHrBtl4pkocE6BkyMEAomkLdgMowFQQiRyWCW6NxhfczwRgOp0knD7dmYSKS8WX0oXLz
         tHikj3JJ8AE6659Z+cwCU2F0HxfNMyB0IOU7U/2o1udz86+PUUOzCJHjClykjx/ZFVUt
         +dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=8hxcpZlAkj7h2zREEKZM39qIVFQ6jLvFB1PIah7KVxY=;
        b=Ud+gxUyIxBKplQPVTORhZcKDbde4UT1mrXKpcoa7Wh1ruM5jUQ1PxVF9PpCOUjOYQS
         velUIj5Hp9UzzLQOEk5jSf7B/Y6vnCAeYbmWX6LCR53kuh65SXDXNQwKpC4A+NhRlplz
         iibDaYgVZBwUGsSMfAPrW5mpZOyrRNUn46qN37MWFSZ8Y00yA58MgtXu7oe/LKyfFvSL
         y1Og5YRkKQPGi2nOym2U7v/xBBjmxGb+3tLJa2f9rZIXAp4n3AG88/fMMeiiHggcqJ/T
         5l8sP75sLDEopFtdriMemJzmqlwANMb4TjlNc85wreFB4wlxHlB/V3rdR7NN0ep+5EPy
         kknw==
X-Gm-Message-State: APjAAAUoBWMjv/Nzvya066dtvS4zVkkdFzRpxdjHK7l1E0GX15m5B+rd
        fl6BFxj8b24gtfANJVlJ2eZU5GMLuh0PF03UfMcH2A9MoaI=
X-Google-Smtp-Source: APXvYqw8CupUQfpGSZtxxSovGNwI1YpUk8HQEF4kWU6etYiPXocDtXN7IrPk1BjYigBHugJgR7BCI7PP0w0xgOPCDRM=
X-Received: by 2002:a17:906:c401:: with SMTP id u1mr1959422ejz.254.1567360019427;
 Sun, 01 Sep 2019 10:46:59 -0700 (PDT)
MIME-Version: 1.0
From:   Hans L <thehans@gmail.com>
Date:   Sun, 1 Sep 2019 12:46:23 -0500
Message-ID: <CAFoRp-PH=Bjs+vSmCvA9i0X3Jw7M6zuUCew7y=A7gxNUSrRZ7g@mail.gmail.com>
Subject: Problems with decode-dimms
To:     linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello, I have a computer running Linux Mint 19.2, and wanted to use
decode-dimms to read DDR4 SPD data.

Some basic relevant hardware info:
CPU: AMD Ryzen 2700X
Mobo: Asus Prime B450 Plus
RAM: 2 kits (4x8GB total) of: "Corsair Vengeance LPX 16GB (2 X 8GB)
DDR4 3000 (PC4-24000) C16 1.35V - CMK16GX4M2D3000C16"


I noticed that support for DDR4 was somewhat-recently added (via
"ee1004"), so I updated from kernel ~4.15 to the latest kernel
available through the Mint repos:
$ uname -a
Linux gypsy 5.0.0-25-generic #26~18.04.1-Ubuntu SMP Thu Aug 1 13:51:02
UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

I ran "modprobe eeprom" and "modprobe ee1004" to insert the modules.
I also checked for other i2c modules which I think were already loaded:
hans@gypsy:~$ lsmod | grep i2c
i2c_piix4              28672  0
i2c_nvidia_gpu         16384  0

Here is the list of i2c buses available:
hans@gypsy:~$ sudo i2cdetect -l
i2c-3   smbus           SMBus PIIX4 adapter port 3 at 0b00      SMBus adapter
i2c-1   smbus           SMBus PIIX4 adapter port 0 at 0b00      SMBus adapter
i2c-8   i2c             NVIDIA i2c adapter 6 at 9:00.0          I2C adapter
i2c-6   i2c             NVIDIA i2c adapter 3 at 9:00.0          I2C adapter
i2c-4   smbus           SMBus PIIX4 adapter port 4 at 0b00      SMBus adapter
i2c-2   smbus           SMBus PIIX4 adapter port 2 at 0b00      SMBus adapter
i2c-0   i2c             NVIDIA GPU I2C adapter                  I2C adapter
i2c-7   i2c             NVIDIA i2c adapter 5 at 9:00.0          I2C adapter
i2c-5   i2c             NVIDIA i2c adapter 1 at 9:00.0          I2C adapter

And this is what I see when I try to detect them (SMBus / non-NVIDIA ones):
hans@gypsy:~$ sudo i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: 20 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 31 -- -- 34 35 36 -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: UU UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
hans@gypsy:~$ sudo i2cdetect -y 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
hans@gypsy:~$ sudo i2cdetect -y 3
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
hans@gypsy:~$ sudo i2cdetect -y 4
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

Is it indicating any kind of problem that bus 1 address 0x50-0x53
shows "UU UU UU UU"?


Anyways, when I ran decode-dimms, I was getting just a short report of
mostly nonsense, and I realized that I needed a newer i2c-tools
package than my distro provided(4.0-2), so I removed that one, and
downloaded this one:
http://jdelvare.nerim.net/mirror/i2c-tools/i2c-tools-4.1.tar.xz
I ran "make" and "sudo make install" and NOW I can run decode-dimms!

But I have some issues with the output:

1) I get a ton of warnings about "uninitialized value"s at the top of the output

2) The "Maximum module speed ... 2132 MHz (PC4-17000)" is shown, but
these modules are sold as DDR4-3000 (and currently running at 2733,
see dmidecode output below also).  Does the SPD data not include XMP /
DOCP(what Asus calls XMP in BIOS) info?
   2a) Also, small nitpick, but I'm pretty sure the "MHz" should be
"MT/s" regardless of the numerical value shown.

3) I was really hoping specifically to get information about the die
manufacturer/type on these DIMMs, but the "Manufacturer Data"  section
just shows "Undefined".  Is it likely that this information simply not
divulged by this model, or is there possibly any bug in how the data
is decoded (maybe related to all the warnings?)


Here is what I get from "sudo dmidecode -t17" (I only list first bank
to keep it brief here, they are all basically the same):
# dmidecode 3.1
Getting SMBIOS data from sysfs.
SMBIOS 3.1.1 present.

Handle 0x002E, DMI type 17, 84 bytes
Memory Device
Array Handle: 0x0027
Error Information Handle: 0x002D
Total Width: 64 bits
Data Width: 64 bits
Size: 8192 MB
Form Factor: DIMM
Set: None
Locator: DIMM_A1
Bank Locator: BANK 0
Type: DDR4
Type Detail: Synchronous Unbuffered (Unregistered)
Speed: 2733 MT/s
Manufacturer: Corsair
Serial Number: 00000000
Asset Tag: Not Specified
Part Number: CMK16GX4M2D3000C16
Rank: 1
Configured Clock Speed: 2733 MT/s
Minimum Voltage: 1.2 V
Maximum Voltage: 1.2 V
Configured Voltage: 1.2 V


They are currently running at 2733 MT/s despite their advertised 3000,
as I could not get BIOS to post with any higher setting.  I started
with a single 2x8GB kit which ran fine at 3000, but later when I added
the second kit of 2x8GB, I found the clocks were limited, so that's
what made me curious to decode some more detailed info about the chips
on these DIMMS etc.


And finally here is the log I got from "decode-dimms --side-by-side
2&> logfile":

Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in chr at /usr/local/bin/decode-dimms
line 2106.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in sprintf at
/usr/local/bin/decode-dimms line 2111.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in numeric ge (>=) at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $year in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $week in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $_[0] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[1] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[2] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[3] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value in sprintf at /usr/local/bin/decode-dimms line 2174.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in chr at /usr/local/bin/decode-dimms
line 2106.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in sprintf at
/usr/local/bin/decode-dimms line 2111.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in numeric ge (>=) at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $year in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $week in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $_[0] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[1] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[2] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[3] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value in sprintf at /usr/local/bin/decode-dimms line 2174.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in chr at /usr/local/bin/decode-dimms
line 2106.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in sprintf at
/usr/local/bin/decode-dimms line 2111.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in numeric ge (>=) at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $year in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $week in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $_[0] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[1] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[2] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[3] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value in sprintf at /usr/local/bin/decode-dimms line 2174.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in chr at /usr/local/bin/decode-dimms
line 2106.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $code in sprintf at
/usr/local/bin/decode-dimms line 2111.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $week in bitwise and (&) at
/usr/local/bin/decode-dimms line 2089.
Use of uninitialized value $year in numeric ge (>=) at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $year in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $week in sprintf at
/usr/local/bin/decode-dimms line 2092.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value $_[0] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[1] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[2] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $_[3] in sprintf at
/usr/local/bin/decode-dimms line 2117.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 431.
Use of uninitialized value $b in numeric eq (==) at
/usr/local/bin/decode-dimms line 432.
Use of uninitialized value in sprintf at /usr/local/bin/decode-dimms line 2174.
# decode-dimms version $Revision$

Memory Serial Presence Detect Decoder
By Philip Edelbrock, Christian Zuckschwerdt, Burkart Lingner,
Jean Delvare, Trent Piepho and others


Decoding EEPROM                                  1-0050
1-0051           1-0052           1-0053
Guessing DIMM is in                              bank 1           bank
2           bank 3           bank 4

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-125                        OK (0x0DB6)
# of bytes written to SDRAM EEPROM               384
Total number of bytes in EEPROM                  512
Fundamental Memory type                          DDR4 SDRAM
SPD Revision                                     1.0
Module Type                                      UDIMM
EEPROM CRC of bytes 128-253                      OK (0x58B6)

---=== Memory Characteristics ===---
Maximum module speed                             2132 MHz (PC4-17000)
Size                                             8192 MB
Banks x Rows x Columns x Bits                    16 x 16 x 10 x 64
SDRAM Device Width                               8 bits
Ranks                                            1
AA-RCD-RP-RAS (cycles)                           15-15-15-36
Supported CAS Latencies                          24T, 23T, 22T, 21T,
20T, 19T, 18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T, 9T, 8T, 7T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-31
AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-27

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin)                      0.938 ns
Maximum Cycle Time (tCKmax)                      1.500 ns
Minimum CAS Latency Time (tAA)                   13.500 ns
Minimum RAS to CAS Delay (tRCD)                  13.500 ns
Minimum Row Precharge Delay (tRP)                13.500 ns
Minimum Active to Precharge Delay (tRAS)         33.000 ns
Minimum Active to Auto-Refresh Delay (tRC)       46.500 ns
Minimum Recovery Delay (tRFC1)                   350.000 ns
Minimum Recovery Delay (tRFC2)                   260.000 ns
Minimum Recovery Delay (tRFC4)                   160.000 ns
Minimum Four Activate Window Delay (tFAW)        21.000 ns
Minimum Row Active to Row Active Delay (tRRD_S)  3.700 ns
Minimum Row Active to Row Active Delay (tRRD_L)  5.300 ns
Minimum CAS to CAS Delay (tCCD_L)                5.356 ns

---=== Other Information ===---
Package Type                                     Monolithic
Maximum Activate Count                           Unlimited
Post Package Repair                              Not supported
Module Nominal Voltage                           1.2 V
Thermal Sensor                                   No

---=== Physical Characteristics ===---
Module Height                                    32 mm
Module Thickness                                 2 mm front, 2 mm back
Module Reference Card                            A revision 0

---=== Manufacturer Data ===---
Module Manufacturer                              Undefined
Part Number                                      Undefined


Number of SDRAM DIMMs detected and decoded: 4


Any help would be appreciated, thanks!
-Hans
