Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A9B71473
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 10:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbfGWIz4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 04:55:56 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:56035 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727748AbfGWIzz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 04:55:55 -0400
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id 001AE3A33C; Tue, 23 Jul 2019 10:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563872147;
        bh=ZbfDjg9s3v25K12wKhMz5cNll4Hjy/oSaV1YnINzL6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PxBLA5R7R56jPcw9CVA4e9FnZZg0tUhP4f2E6xTez8x2l5hDA9pd5EXjxxw0FNmZx
         kZuwNP4qn7RALgrPGeqGKtDs0ZhAP+go1AWja2RuyB7GvVXK0vZzsUQ9mm6mNE0gIq
         VbHCOzSgPffZuFI1vzHeBGP1wh5LqsiRgCkgRJesKQeNBWDfHkmRICQWCulLxHfqqf
         dZPhrzSO+ldCN4KK0D9/t5bCtN7n7hqLJrDkCZG2R6N1WMmJNBDv9BnYktPtBIHZOo
         B5Zl49E2680txJV8aBJVaXbOt3AtyUTF+2QjQD/798Ycc4ZyVLHaXL1X7mvk/qUjk5
         Ea2QiWhWRCBkQ==
Date:   Tue, 23 Jul 2019 10:55:46 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190723085546.n4c33twqrtul6fae@valentin-vidic.from.hr>
References: <20190722174504.qwp52opvy6ptyxn6@valentin-vidic.from.hr>
 <20190723100256.3895bd3b@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723100256.3895bd3b@endymion>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 23, 2019 at 10:02:56AM +0200, Jean Delvare wrote:
> I think you are contacting the wrong people and list. The iTCO_wdt
> driver is a watchdog driver and as such it is handled by the watchdog
> subsystem maintainers (Wim Van Sebroeck and Guenter Roeck). You better
> write to them and their list (linux-watchdog@vger).

Hello and yes, I just came from there as we could not work it out :)

https://www.spinics.net/lists/linux-watchdog/msg16232.html

> The fact that iTCO_wdt loads when you load i2c-i801 is just a side
> effect of an implementation detail (i2c-i801 instantiates the watchdog
> device in certain cases, then module alias magic gets the needed driver
> loaded automatically). If you only care about SMBus and not watchdog,
> you can ignore the error message completely.
> 
> If you care about the watchdog feature, you should check what is
> conflicting with iTCO_wdt. Error -16 is -EBUSY which suggests that
> another driver has already grabbed the memory range. This should be
> visible in /proc/iomem.
> 
> If it was grabbed by ACPI, you may need an ACPI driver for your
> watchdog (if anything like that exists). If it was grabbed by another
> non-ACPI driver, both drivers may have to be modified to synchronize
> their access to the hardware.

The only conflict we could find is that loading i2c-i801 creates this
entry in /proc/iomem:

  00c5fffc-00c5ffff : iTCO_wdt

and loading iTCO_wdt after that produces the -16 error.

Loading iTCO_wdt before i2c-i801 does not produce an error but also
does not create /dev/watchdog. If i2c-i801 is loaded after that the
same -16 error appears.

I don't think any other watchdog module is running because /dev/watchdog
does not exist, but I can send a lsmod output.

So the main question at the moment is why loading just i2c-i801 produces
an iTCO_wdt entry in /proc/iomem? Could it be that both i2c-i801 and
iTCO_wdt are trying to register the same region?

-- 
Valentin
