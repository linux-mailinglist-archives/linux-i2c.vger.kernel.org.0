Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF26A0DC1
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 00:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbfH1Wt2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 18:49:28 -0400
Received: from mail.rationali.st ([13.54.121.199]:51354 "EHLO
        mail.rationali.st" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbfH1Wt1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Aug 2019 18:49:27 -0400
Received: from ppp167-208-210.static.internode.on.net ([59.167.208.210] helo=t460s.rationali.st)
        by mail.rationali.st with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <acooks@rationali.st>)
        id 1i36kG-0001AW-Qp; Wed, 28 Aug 2019 22:49:08 +0000
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
 <db725a3b-7b6e-ac79-ef1c-e601ff45c0f2@rationali.st>
 <9019cce9-837f-97fc-0f3b-7503b8fc3717@metux.net>
From:   Andrew Cooks <acooks@rationali.st>
Message-ID: <086642c8-547c-ca95-3475-3ef05c77ada6@rationali.st>
Date:   Thu, 29 Aug 2019 08:48:51 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9019cce9-837f-97fc-0f3b-7503b8fc3717@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software, running on the system "mail.rationali.st",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/20/19 4:30 AM, Enrico Weigelt, metux IT consult wrote:
    > On 11.08.19 04:52, Andrew Cooks wrote: > > Hi, > >> My initial work is
   based on a board that is similar to the APU2, but has additional pe [...] 
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


On 8/20/19 4:30 AM, Enrico Weigelt, metux IT consult wrote:
> On 11.08.19 04:52, Andrew Cooks wrote:
>
> Hi,
>
>> My initial work is based on a board that is similar to the APU2, but has additional peripherals connected to the smbus, including a NCT7491 thermal monitor/fan controller and PCA6524 GPIO controller. These are simply peripherals on a board variant, not 'platform' devices, so I didn't want to follow the platform driver approach that the APU2 GPIO driver uses.
> Why are they not platform devices ?
>
> IMHO, a platform device is something not on a bus that can do the
> probing/enumeration (like eg. pci or usb does).
>
> Can these devices be probed directly by the bus they're connected to,
> or do you have a different definition of the term "platform device" ?

ACPI was created to provide the PNP mechanism for buses that do not support enumeration, like SMBus. SMBus is similar to I2C, and can be routed to expansion cards, like Ethernet NICs. A system with expansion card Foo is not a different platform from a system with expansion card Bar, and you wouldn't necessarily want to support both Foo and Bar in the same platform driver.

>
> :O
>
>> SMBus (and I2C) peripherals can generally not be enumerated without some firmware support. It is possible to probe for specific devices on the bus (eg sensors-detect) but in general it is not feasible to let every supported device driver probe the bus for its device. ACPI and Devicetree provides the kernel with metadata for the device: type, address, calibrated set points for temperature, etc.
> Yes, I know. My question was whether these particular devices - if
> they're in the SoC itself - do need some extra support in BIOS
> (acpi entries, etc), that's not already in aegesa. Or in other words:
> do I need to patch my BIOS ?
>
> I was assuming these devices are in the SoC itself - correct me if
> I'm wrong.

This patch is about adding a mechanism to describe peripherals that are not in the SoC, but attached to the SMBus. I also provided examples of the kinds of devices that need this support (eg. NCT7491).

>
>> Since the peripherals are not standard platform devices, they are not described by the ACPI tables provided by Coreboot or AMD, but it's not too difficult to create supplementary device description tables (ACPI) for non-standard devices. These can be added to coreboot, supplied to qemu as additional firmware files (see -acpitable arg), or built into the kernel (see https://www.kernel.org/doc/Documentation/acpi/ssdt-overlays.txt)
> Oh, I didn't know about SSDT overlays yet. That's interesting.
>
> Is it also possible to describe things like leds-gpio or gpio-keyboard ?
> Could be a nice idea to trim down my apu2 driver to not much more than
> a piece of configuration (just like we'd do on a DT-based system)
Yes and maybe. The extra ACPI layer is inconvenient and more complex than a platform driver, as should be evident from the patch history and this discussion.
>
>> ACPI may be an ugly abomination, but it's what we're stuck with on x86 and it can only improve when more people get their hands on it.
> hmm, I'm planning to introduce DT to x86 (also patch up apu'2 coreboot
> do deliver a DT to the kernel) ... but just lacking time to get my hands
> dirty on this topic.
>
>> You might find it helpful to look at the coreboot source for the APU2 (src/mainboard/pcengines/apu2/gpio_ftns.h)
> In which version ?
>
>
> --mtx
>
