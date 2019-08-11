Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71D888F36
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2019 05:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfHKDZ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Aug 2019 23:25:29 -0400
Received: from mail.rationali.st ([13.54.121.199]:44530 "EHLO
        mail.rationali.st" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfHKDZ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Aug 2019 23:25:29 -0400
Received: from ppp167-208-210.static.internode.on.net ([59.167.208.210] helo=t460s.rationali.st)
        by mail.rationali.st with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <acooks@rationali.st>)
        id 1hwdyJ-0000m7-9g; Sun, 11 Aug 2019 02:53:10 +0000
Reply-To: acooks@rationali.st
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
References: <20190802145109.38dd4045@endymion>
 <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
From:   Andrew Cooks <acooks@rationali.st>
Message-ID: <db725a3b-7b6e-ac79-ef1c-e601ff45c0f2@rationali.st>
Date:   Sun, 11 Aug 2019 12:52:37 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software, running on the system "mail.rationali.st",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Enrico On 8/8/19 7:17 PM, Enrico Weigelt, metux IT consult
    wrote: > On 02.08.19 14:51, Jean Delvare wrote: > > Hi, > >> These patches
    fix a couple of issues with the i2c-piix4 driver on >> AMD Family 16h Mod
    [...] 
 Content analysis details:   (-2.9 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Enrico

On 8/8/19 7:17 PM, Enrico Weigelt, metux IT consult wrote:
> On 02.08.19 14:51, Jean Delvare wrote:
>
> Hi,
>
>> These patches fix a couple of issues with the i2c-piix4 driver on
>> AMD Family 16h Model 30h SoCs and add ACPI-based enumeration to the
>> i2c-piix4 driver.
> Can you tell a little bit more about what devices are behind the smbus ?
> I recall the G-412 SoCs (such as on apu2+ boards) have an Hudson inside
> and fall into this category. (I'll have to check when back in office),
> so (as the apu2 platform driver maintainer) I'm very interested in this.
My initial work is based on a board that is similar to the APU2, but has additional peripherals connected to the smbus, including a NCT7491 thermal monitor/fan controller and PCA6524 GPIO controller. These are simply peripherals on a board variant, not 'platform' devices, so I didn't want to follow the platform driver approach that the APU2 GPIO driver uses.
>
> Does the probing need some special BIOS support (or do the necessary
> table entries already come from aegesa) ?

SMBus (and I2C) peripherals can generally not be enumerated without some firmware support. It is possible to probe for specific devices on the bus (eg sensors-detect) but in general it is not feasible to let every supported device driver probe the bus for its device. ACPI and Devicetree provides the kernel with metadata for the device: type, address, calibrated set points for temperature, etc.

Since the peripherals are not standard platform devices, they are not described by the ACPI tables provided by Coreboot or AMD, but it's not too difficult to create supplementary device description tables (ACPI) for non-standard devices. These can be added to coreboot, supplied to qemu as additional firmware files (see -acpitable arg), or built into the kernel (see https://www.kernel.org/doc/Documentation/acpi/ssdt-overlays.txt)

ACPI may be an ugly abomination, but it's what we're stuck with on x86 and it can only improve when more people get their hands on it.

>
> I have to admit, I'm still confused by the AMD documentation - haven't
> found a clear documentation on what peripherals exactly are in the
> G-412 SoC, just puzzled together that the FCH seems to be an Hudson,
> probably v2. There also seems to be some relation between smbus and
> gpio, but the gpio's are directly memory-mapped - no idea whether they
> just share the same base address register or the gpios are really behind
> smbus and some hw logic directy maps them into mmio space ...
> Do you happen to have some more information on that ?
You might find it helpful to look at the coreboot source for the APU2 (src/mainboard/pcengines/apu2/gpio_ftns.h)
>
> By the way: I'm considering collecting some hw documentation in the
> kernel tree (maybe Documentation/hardware/...) - do you folks think
> that's a good idea ?

Would it be awesome if specs were available for every device supported by the kernel? Absolutely, what a dream! Perhaps a separate repo, like the linux-firmware repo, would be better for binary objects that don't change. Unfortunately, copyright makes this hard. NDAs make this hard. Hardware companies just don't seem to work like that.

>
> --mtx

Regards,
 

Andrew
