Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD68A168E5D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 12:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgBVLNT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 06:13:19 -0500
Received: from mail-il1-f182.google.com ([209.85.166.182]:42003 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgBVLNT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Feb 2020 06:13:19 -0500
Received: by mail-il1-f182.google.com with SMTP id x2so3844369ila.9;
        Sat, 22 Feb 2020 03:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Ht5BoY4Unpl7Z+knQPBoIyIniKZQ/PndFQpeGScWNOg=;
        b=t6NTppqn5wJdtw8VlyZ/AvOHefL6e7n8KWG0Aqnmn7EDo/i2+7IrUswKcKOUyTrVYo
         8VOXuZt9Ea2d3EjMk8D0CFXhD/SZeIan12eFWJgj7+w3v5sxPq1PgpX0uwZskLPqA/Zo
         DYP3e629pM/elBqIJ9vqJXpEZPeBvC51DpciCpyan9s0u+zYej2P2wcgr7IkCS5I68WX
         QYX1w445QTOsSaF6ZLdOcHOcCqfHqcz6ixZz62vrnjBAbidktsnHyUuR+/M0SIZhEzSy
         q/FONZZXIMmlpMq56VKluxHYQcWv/VQ3BB+XvSYIAmfzYujDl0JZL5qI1JPq3xzzEVhO
         fNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Ht5BoY4Unpl7Z+knQPBoIyIniKZQ/PndFQpeGScWNOg=;
        b=LGXjzO2uGzP/j1Fcw+HD+LyAhoNSVfr9caRL7afrO40BW5uRn/oPDj8JNDrgaOu+kK
         9SNn0I5Mu0tIGtpYUKGSTNLXjgzxjEPgV2Z+uCLwDqrHfreSwQgLXbZX7JvqyqIOrCDE
         o8PCb6rDcJZPob806lsnfflxdEha1fuD3hFpSd1BPty97ad25juGMOjqyzKls4nk0xbc
         j9SA5GjEjpwYuhlJDu/NdD4tqy7A4mTNEcdcx30kJGErou//4DMlGGYxX81WRh6bWqrn
         9DwZERBXtBz5EDyhOMIgGSbLRtLvn46P3sucnHzL2t7IPJKKHZsUbreuzw0zI9lIIG87
         hjoA==
X-Gm-Message-State: APjAAAVJDqDnePdlfYo/1M6NUL8uOB1TzysgFidWvB91K52/cCKs7DXZ
        Op2r0llXrLoCtXbSf2LGIuC6LxPIs3eXmqdH0xw=
X-Google-Smtp-Source: APXvYqyZYteqVWyvhXrnoZ3cXXqYSvKuW7cUtmxNri/Z/UE90+7L+OEOo8VOF6Ymoo34PWyws9+OcdufW7YTbDFjzQY=
X-Received: by 2002:a05:6e02:f0f:: with SMTP id x15mr42502883ilj.298.1582369998523;
 Sat, 22 Feb 2020 03:13:18 -0800 (PST)
MIME-Version: 1.0
From:   Martin Volf <martin.volf.42@gmail.com>
Date:   Sat, 22 Feb 2020 12:13:07 +0100
Message-ID: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
Subject: [regression] nct6775 does not load in 5.4 and 5.5, bisected to b84398d6d7f90080
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
kernels, the driver nct6775 does not load.

It is working OK in version 5.3. I have used almost all released stable
versions from 5.3.8 to 5.3.16; I didn't try older kernels.

Even on new kernels the sensors-detect finds the sensors:
        Found `Nuvoton NCT6796D Super IO Sensors' Success!
            (address 0x290, driver `nct6775')
but "modprobe nct6775" says:
        ERROR: could not insert 'nct6775': No such device
There is nothing interesting in dmesg.

git bisect found out the first bad commit is
b84398d6d7f900805662b1619223fd644d862d7c,
i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond

Unfortunately I am not able to revert it in v5.4 to confirm it is really
the culprit.

Is there a way to have working hwmon sensors on my system in newer linux
kernels?

Thanks,

Martin

--8<--
lspci
00:00.0 Host bridge: Intel Corporation 8th Gen Core 8-core Desktop
Processor Host Bridge/DRAM Registers [Coffee Lake S] (rev 0d)
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 630
(Desktop 9 Series) (rev 02)
00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI
Host Controller (rev 10)
00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 10)
00:16.0 Communication controller: Intel Corporation Cannon Lake PCH
HECI Controller (rev 10)
00:17.0 SATA controller: Intel Corporation Cannon Lake PCH SATA AHCI
Controller (rev 10)
00:1b.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
Port #17 (rev f0)
00:1c.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
Port #1 (rev f0)
00:1c.6 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
Port #7 (rev f0)
00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
Port #9 (rev f0)
00:1f.0 ISA bridge: Intel Corporation Z390 Chipset LPC/eSPI Controller (rev 10)
00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake
PCH SPI Controller (rev 10)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (7)
I219-V (rev 10)
