Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A812EEA09
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 00:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbhAGXz5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jan 2021 18:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbhAGXz5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jan 2021 18:55:57 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7725C0612F4;
        Thu,  7 Jan 2021 15:55:16 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id q75so6969348wme.2;
        Thu, 07 Jan 2021 15:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZncM7JH6Ki9FcKPmGbPeUTYbtASY1HLiha8VMirLUHY=;
        b=mMyXEhd1cUGjWTGi0vOP8/6X+t+zUyEBQASUR6Ru0sHOF52lbgJQrX8BQjrmJpl9RH
         IInQNx9iicLUum5zdjbNgCRCPPZ/Aaa/8NKFSc6btEfsOnMb1t6jV1mvOiEHeg212mwn
         C+V483iiw42ts69wgoOvjRtaknBVVTEo0NvaUGZTl6tdIsMvRQssSBf7uD6xWpp9rRNV
         uith9x4ogywuYCApBR0HU3WHFFgDeta5T5zc9tw1jHz4YaAj8CxVBUoVSqZUq1aUU96D
         DXsCxTaGpca/JhJgoFlwM/+DOPu+jNec7sZoz+shzN7xqwWc7WrukuNptry77lKDBn+z
         CoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZncM7JH6Ki9FcKPmGbPeUTYbtASY1HLiha8VMirLUHY=;
        b=QZiHkg7nbcsuA5n14HaWfBOLHTYr7Ye16O5ygeVq8X48yq1QkfnFvM50fUqI04tajv
         qjYetAFMNH7UveTrwCjHw7uWrIyfRf0kwjN6zNfRgj8GFb4op8bdHBno2Afui5SZBhTo
         hrXpBYUoeSlwIpDYfvce2mGx1nuubQQDeQm216DjjptJD0yI23rWlZ3qR1jPy6o9jhw8
         XoBbBfXZwLcJIwBeYyyvLvHfuSQkk28En9QSXi/BWfOmXst4Q2gYiLg5REjWS3vJ/EGZ
         sRQil2xudU8i9DxfjiFqa7WC4efJ0UZOWGLbXAgUkw6qgbDc6Ai+c997JrV57hfyT0SB
         Azdg==
X-Gm-Message-State: AOAM533nxT+LFqqjVQAJRHxm304Kk2xS9u1uKhu43MlhEZfgh9BOo5Ig
        F9WmaPBT71GTyZYvBFDhlWJ8niJScUP4I8YD
X-Google-Smtp-Source: ABdhPJwaqtio3vX4piZLRmmLcmP6Vxg8q/YXAaanNNYcOSEMk1p6rpteK4dG6OqK3aUCUmJVOBuuXw==
X-Received: by 2002:a1c:63d4:: with SMTP id x203mr704864wmb.28.1610063715330;
        Thu, 07 Jan 2021 15:55:15 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id v189sm10471673wmg.14.2021.01.07.15.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 15:55:14 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <778f23fc-b99c-33a2-642d-ca0e47fd4ed5@gmail.com>
Date:   Thu, 7 Jan 2021 23:55:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130200719.GB4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy, all

On 30/11/2020 20:07, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:
>> On platforms where ACPI is designed for use with Windows, resources
>> that are intended to be consumed by sensor devices are sometimes in
>> the _CRS of a dummy INT3472 device upon which the sensor depends. This
>> driver binds to the dummy acpi device (which does not represent a
> acpi device -> acpi_device
>
>> physical PMIC) and maps them into GPIO lines and regulators for use by
>> the sensor device instead.
> ...
>
>> This patch contains the bits of this process that we're least sure about.
>> The sensors in scope for this work are called out as dependent (in their
>> DSDT entry's _DEP) on a device with _HID INT3472. These come in at least
>> 2 kinds; those with an I2cSerialBusV2 entry (which we presume therefore
>> are legitimate tps68470 PMICs that need handling by those drivers - work
>> on that in the future). And those without an I2C device. For those without
>> an I2C device they instead have an array of GPIO pins defined in _CRS. So
>> for example, my Lenovo Miix 510's OVTI2680 sensor is dependent on one of
>> the _latter_ kind of INT3472 devices, with this _CRS:
>>
>> Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>> {
>>     Name (SBUF, ResourceTemplate ()
>>     {
>>         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
>> 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
>> 	    0x00, ResourceConsumer, ,
>>             )
>>             {   // Pin list
>>                 0x0079
>>             }
>>         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
>> 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
>> 	    0x00, ResourceConsumer, ,
>>             )
>>             {   // Pin list
>>                 0x007A
>>             }
>>         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
>> 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
>> 	    0x00, ResourceConsumer, ,
>>             )
>>             {   // Pin list
>>                 0x008F
>>             }
>>     })
>>     Return (SBUF) /* \_SB_.PCI0.PMI1._CRS.SBUF */
>> }
>>
>> and the same device has a _DSM Method, which returns 32-bit ints where
>> the second lowest byte we noticed to match the pin numbers of the GPIO
>> lines:
>>
>> Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>> {
>>     If ((Arg0 == ToUUID ("79234640-9e10-4fea-a5c1-b5aa8b19756f")))
>>     {
>>         If ((Arg2 == One))
>>         {
>>             Return (0x03)
>>         }
>>
>>         If ((Arg2 == 0x02))
>>         {
>>             Return (0x01007900)
>>         }
>>
>>         If ((Arg2 == 0x03))
>>         {
>>             Return (0x01007A0C)
>>         }
>>
>>         If ((Arg2 == 0x04))
>>         {
>>             Return (0x01008F01)
>>         }
>>     }
>>
>>     Return (Zero)
>> }
>>
>> We know that at least some of those pins have to be toggled active for the
>> sensor devices to be available in i2c, so the conclusion we came to was
>> that those GPIO entries assigned to the INT3472 device actually represent
>> GPIOs and regulators to be consumed by the sensors themselves. Tsuchiya
>> noticed that the lowest byte in the return values of the _DSM method
>> seemed to represent the type or function of the GPIO line, and we
>> confirmed that by testing on each surface device that GPIO lines where the
>> low byte in the _DSM entry for that pin was 0x0d controlled the privacy
>> LED of the cameras.
>>
>> We're guessing as to the exact meaning of the function byte, but I
>> conclude they're something like this:
>>
>> 0x00 - probably a reset GPIO
>> 0x01 - regulator for the sensor
>> 0x0c - regulator for the sensor
>> 0x0b - regulator again, but for a VCM or EEPROM
>> 0x0d - privacy led (only one we're totally confident of since we can see
>>        it happen!)
> It's solely Windows driver design...
> Luckily I found some information and can clarify above table:
>
> 0x00 Reset
> 0x01 Power down
> 0x0b Power enable
> 0x0c Clock enable
> 0x0d LED (active high)
>
> The above text perhaps should go somewhere under Documentation.

Coming back to this; there's a bit of an anomaly with the 0x01 Power
Down pin for at least one platform.  As listed above, the OV2680 on one
of my platforms has 3 GPIOs defined, and the table above gives them as
type Reset, Power down and Clock enable. I'd assumed from this table
that "power down" meant a powerdown GPIO (I.E. the one usually called
PWDNB in Omnivision datasheets and "powerdown" in drivers), but the
datasheet for the OV2680 doesn't list a separate reset and powerdown
pin, but rather a single pin that performs both functions.


Am I wrong to treat that as something that ought to be mapped as a
powerdown GPIO to the sensors? Or do you know of any other way to
reconcile that discrepancy?


Failing that; the only way I can think to handle this is to register
proxy GPIO pins assigned to the sensors as you suggested previously, and
have them toggle the GPIO's assigned to the INT3472 based on platform
specific mapping data (I.E. we register a pin called "reset", which on
most platforms just toggles the 0x00 pin, but on this specific platform
would drive both 0x00 and 0x01 together. We're already heading that way
for the regulator consumer supplies so it's sort of nothing new, but I'd
still rather not if it can be avoided.

