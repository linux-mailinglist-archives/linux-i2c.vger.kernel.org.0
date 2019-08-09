Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC78A8742B
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 10:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfHIIdn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 04:33:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:37894 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726054AbfHIIdn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 04:33:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CF469AFBB;
        Fri,  9 Aug 2019 08:33:41 +0000 (UTC)
Date:   Fri, 9 Aug 2019 10:33:40 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andrew Cooks <acooks@rationali.st>, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4
 SMBus
Message-ID: <20190809103340.2ef24523@endymion>
In-Reply-To: <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
References: <20190802145109.38dd4045@endymion>
        <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Enrico,

On Thu, 8 Aug 2019 11:17:53 +0200, Enrico Weigelt, metux IT consult wrote:
> On 02.08.19 14:51, Jean Delvare wrote:
> > These patches fix a couple of issues with the i2c-piix4 driver on
> > AMD Family 16h Model 30h SoCs and add ACPI-based enumeration to the
> > i2c-piix4 driver.  
> 
> Can you tell a little bit more about what devices are behind the smbus ?
> I recall the G-412 SoCs (such as on apu2+ boards) have an Hudson inside
> and fall into this category. (I'll have to check when back in office),
> so (as the apu2 platform driver maintainer) I'm very interested in this.

Unfortunately not. I only picked up from where Andrew Cooks left, due
to me being way too slow to review his patches. I did not want his work
to be lost. I was able to test the first 2 patches which fix bugs, but
not the 3rd one which deals with ACPI devices. There does not seem to
be any such device on the 2 test machines I have remotely access to.

> Does the probing need some special BIOS support (or do the necessary
> table entries already come from aegesa) ?

I assume that ACPI devices are declared in one of the ACPI tables, so
it comes from the "BIOS", yes, whatever form it takes these days.

> I have to admit, I'm still confused by the AMD documentation - haven't
> found a clear documentation on what peripherals exactly are in the
> G-412 SoC, just puzzled together that the FCH seems to be an Hudson,
> probably v2. There also seems to be some relation between smbus and
> gpio, but the gpio's are directly memory-mapped - no idea whether they
> just share the same base address register or the gpios are really behind
> smbus and some hw logic directy maps them into mmio space ...
> Do you happen to have some more information on that ?

I remember noticing long ago that SMBus ports were using GPIO pins, so
these pins could be used for SMBus or for any other purpose. I could
not find any way to figure out from the registers if a given pin pair
was used for SMBus or not, which is pretty bad because it means we are
blindly instantiating ALL possible SMBus ports even if some of the pins
are used for a completely different purpose. It was over 1 year ago
though, so I don't remember the details, and my findings then may not
apply to the most recent hardware.

> By the way: I'm considering collecting some hw documentation in the
> kernel tree (maybe Documentation/hardware/...) - do you folks think
> that's a good idea ?

No. Only documentation specifically related to the Linux kernel should
live in the kernel tree. OS-neutral documentation must go somewhere
else.

-- 
Jean Delvare
SUSE L3 Support
