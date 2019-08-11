Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D797188F2A
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2019 05:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfHKDKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Aug 2019 23:10:25 -0400
Received: from mail.rationali.st ([13.54.121.199]:44512 "EHLO
        mail.rationali.st" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfHKDKZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Aug 2019 23:10:25 -0400
X-Greylist: delayed 1014 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Aug 2019 23:10:23 EDT
Received: from ppp167-208-210.static.internode.on.net ([59.167.208.210] helo=t460s.rationali.st)
        by mail.rationali.st with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <acooks@rationali.st>)
        id 1hweF7-0000pI-Fk; Sun, 11 Aug 2019 03:10:07 +0000
Reply-To: acooks@rationali.st
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
To:     Jean Delvare <jdelvare@suse.de>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
References: <20190802145109.38dd4045@endymion>
 <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
 <20190809103340.2ef24523@endymion>
From:   Andrew Cooks <acooks@rationali.st>
Message-ID: <87e83cd9-e9a9-ee58-9ea3-7549ae3b0838@rationali.st>
Date:   Sun, 11 Aug 2019 13:09:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190809103340.2ef24523@endymion>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software, running on the system "mail.rationali.st",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/9/19 6:33 PM, Jean Delvare wrote: > Hi Enrico, > > On
    Thu, 8 Aug 2019 11:17:53 +0200, Enrico Weigelt, metux IT consult wrote: >>
    On 02.08.19 14:51, Jean Delvare wrote: >>> These patches fix a cou [...] 
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


On 8/9/19 6:33 PM, Jean Delvare wrote:
> Hi Enrico,
>
> On Thu, 8 Aug 2019 11:17:53 +0200, Enrico Weigelt, metux IT consult wrote:
>> On 02.08.19 14:51, Jean Delvare wrote:
>>> These patches fix a couple of issues with the i2c-piix4 driver on
>>> AMD Family 16h Model 30h SoCs and add ACPI-based enumeration to the
>>> i2c-piix4 driver.  
>> Can you tell a little bit more about what devices are behind the smbus ?
>> I recall the G-412 SoCs (such as on apu2+ boards) have an Hudson inside
>> and fall into this category. (I'll have to check when back in office),
>> so (as the apu2 platform driver maintainer) I'm very interested in this.
> Unfortunately not. I only picked up from where Andrew Cooks left, due
> to me being way too slow to review his patches. I did not want his work
> to be lost. I was able to test the first 2 patches which fix bugs, but
> not the 3rd one which deals with ACPI devices. There does not seem to
> be any such device on the 2 test machines I have remotely access to.

Thanks for taking a look at these patches and thanks for your many years of support and maintenance.

The patches I submitted were developed for an commercial product, but I am not with the company anymore and do not have access to the hardware. This is the device: https://opengear.com/products/om2200-operations-manager/

The specific peripheral that required ACPI support is the NCT7491, and a driver is available at https://github.com/opengear/nct7491-driver

>> Does the probing need some special BIOS support (or do the necessary
>> table entries already come from aegesa) ?
> I assume that ACPI devices are declared in one of the ACPI tables, so
> it comes from the "BIOS", yes, whatever form it takes these days.
Yes, though unfortunately I didn't get a chance to submit this to the coreboot project and no longer have access to the source.
>
>> I have to admit, I'm still confused by the AMD documentation - haven't
>> found a clear documentation on what peripherals exactly are in the
>> G-412 SoC, just puzzled together that the FCH seems to be an Hudson,
>> probably v2. There also seems to be some relation between smbus and
>> gpio, but the gpio's are directly memory-mapped - no idea whether they
>> just share the same base address register or the gpios are really behind
>> smbus and some hw logic directy maps them into mmio space ...
>> Do you happen to have some more information on that ?
> I remember noticing long ago that SMBus ports were using GPIO pins, so
> these pins could be used for SMBus or for any other purpose. I could
> not find any way to figure out from the registers if a given pin pair
> was used for SMBus or not, which is pretty bad because it means we are
> blindly instantiating ALL possible SMBus ports even if some of the pins
> are used for a completely different purpose. It was over 1 year ago
> though, so I don't remember the details, and my findings then may not
> apply to the most recent hardware.
>
>> By the way: I'm considering collecting some hw documentation in the
>> kernel tree (maybe Documentation/hardware/...) - do you folks think
>> that's a good idea ?
> No. Only documentation specifically related to the Linux kernel should
> live in the kernel tree. OS-neutral documentation must go somewhere
> else.
>
Thanks,

Andrew

