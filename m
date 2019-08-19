Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8191F94CFB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 20:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfHSSbF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 14:31:05 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:37711 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfHSSbF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Aug 2019 14:31:05 -0400
Received: from [192.168.1.110] ([95.115.39.37]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MbAUg-1iWdCS1S4e-00bXDX; Mon, 19 Aug 2019 20:30:32 +0200
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
To:     acooks@rationali.st, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
References: <20190802145109.38dd4045@endymion>
 <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
 <db725a3b-7b6e-ac79-ef1c-e601ff45c0f2@rationali.st>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <9019cce9-837f-97fc-0f3b-7503b8fc3717@metux.net>
Date:   Mon, 19 Aug 2019 20:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <db725a3b-7b6e-ac79-ef1c-e601ff45c0f2@rationali.st>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tFzQtVo9IW13IcZLs71jQealC9S0dM4lCdtwZP1a3NELhC/CjWD
 wi7VrMfHt4DhqCAggTDPHFwkSsIZuRQNgwLdAxNPzgCtBuw410F9KA1bo9KraCG6VgNqNaB
 2Z+uy2Fo6gkuwBtquUhHY6rfQdx1WyQnFwv+fTHIw39SNY4w82NDacTfPc5HyiRRy/unOJ7
 r5TH3jf+8CMbHY/0FocIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WUtUMMcrQzs=:18dH83FuLPYuULNunvTaz+
 REAN1tq5Ngs+5okiKy7+OElj+UsL7F9KlGUYD7SCfrbEGJ4I4/40CevMOYcGa4owG1uEXwpzU
 8ZEA586cr0nxdYMWtw95W3wrT0CUkiMe2YO559TIV1UNFCAztNIXBm8Lo0/gspvdhOljQpDVA
 +sgW+/vm+ilNz4jVM8JQXBNNMp8+VZyALRXhq6QegKC1LvTOuiDIOFf5HXMCl/cSM80XgIkpY
 kd7j3FV1FT/LEMJKBKQM9exzLbzzCIspcf45+/taFswpEHM0RdEZKIWCogLcqkpgueOdtaOzQ
 5mbIwkaN8RaYxAawySVAY1CozVikHav9x4QVmV5LktLJNn5l6XO6DkSb5D2gqpDhPiJxUgmQw
 rA4W9L3d6OZXKYEmHlU+jHA0BC5A3RknQxVlujMSEL3J7TqrtZ4Fqu6t2ORvWQBeeywG2+oU2
 INCcvA8hImHr7CaVg+H27AuqL+Usy8jCXM0GynRz72XAkQ0oQEbvFI4cPkOFZsag4ko4EI0se
 jgZ/32OqXnpBRH0Wol2ph6NOs2QiEwi6ai2bGI53ukEOGa2uUlLam5/7A8tncDUy+byHkgA69
 /ZDugPHq76bpvvsK4IHTcmtdGXAdAf3bsV5jCITW2NLcdyylmLeSbpv4c65iWMa5wbqrD4tl+
 7sH8yuD9g7C5OKI62+uvy5YKwvgd8Rxn5SSMh5XG5LEMWsNiJOzr65xxm8PW3zC7jUL+qTqWI
 jL1AdhTrl5MRIlBICW1/tVoq+84vgiJFyPtOW1OlS1MR+BIAYt9ShVMWNX4=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11.08.19 04:52, Andrew Cooks wrote:

Hi,

> My initial work is based on a board that is similar to the APU2, but has additional peripherals connected to the smbus, including a NCT7491 thermal monitor/fan controller and PCA6524 GPIO controller. These are simply peripherals on a board variant, not 'platform' devices, so I didn't want to follow the platform driver approach that the APU2 GPIO driver uses.

Why are they not platform devices ?

IMHO, a platform device is something not on a bus that can do the
probing/enumeration (like eg. pci or usb does).

Can these devices be probed directly by the bus they're connected to,
or do you have a different definition of the term "platform device" ?

:O

> SMBus (and I2C) peripherals can generally not be enumerated without some firmware support. It is possible to probe for specific devices on the bus (eg sensors-detect) but in general it is not feasible to let every supported device driver probe the bus for its device. ACPI and Devicetree provides the kernel with metadata for the device: type, address, calibrated set points for temperature, etc.

Yes, I know. My question was whether these particular devices - if
they're in the SoC itself - do need some extra support in BIOS
(acpi entries, etc), that's not already in aegesa. Or in other words:
do I need to patch my BIOS ?

I was assuming these devices are in the SoC itself - correct me if
I'm wrong.

> Since the peripherals are not standard platform devices, they are not described by the ACPI tables provided by Coreboot or AMD, but it's not too difficult to create supplementary device description tables (ACPI) for non-standard devices. These can be added to coreboot, supplied to qemu as additional firmware files (see -acpitable arg), or built into the kernel (see https://www.kernel.org/doc/Documentation/acpi/ssdt-overlays.txt)

Oh, I didn't know about SSDT overlays yet. That's interesting.

Is it also possible to describe things like leds-gpio or gpio-keyboard ?
Could be a nice idea to trim down my apu2 driver to not much more than
a piece of configuration (just like we'd do on a DT-based system)

> ACPI may be an ugly abomination, but it's what we're stuck with on x86 and it can only improve when more people get their hands on it.

hmm, I'm planning to introduce DT to x86 (also patch up apu'2 coreboot
do deliver a DT to the kernel) ... but just lacking time to get my hands
dirty on this topic.

> You might find it helpful to look at the coreboot source for the APU2 (src/mainboard/pcengines/apu2/gpio_ftns.h)

In which version ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
