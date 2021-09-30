Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE25641D321
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Sep 2021 08:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348243AbhI3GRo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Sep 2021 02:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348217AbhI3GRo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Sep 2021 02:17:44 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159FFC06161C;
        Wed, 29 Sep 2021 23:16:02 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id ba1so17807487edb.4;
        Wed, 29 Sep 2021 23:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+je6x5elkPbn/OrVuyHzg5kSHlABzrNC5YEtV4KwUY0=;
        b=Qqt3DwTmYVgavT+bkSOapqelbrkGa9ZI9JD/Wxmq2MQz9nf2kvr7Aanua4UQmeDCqX
         t6djPS7RK4Bz+AWLf+Ba6Qifr/W4KOnzWlV+jPEkBJhpeGkJIbAyvSX/moy8SVrTbN//
         pBy+ckwWcBrf7IoqU3aIsMcYjJgGQlHqs+Ebf1XIfPEmu4tSUkLU/6I9KSuySxfCracI
         QKasonTCfYbvbKNNOfJVkg/xyR38M3Ckgir7UPdDNsN7y+CsdCQ+wRLMSuQqRLdQMYlv
         vxfCR/HMf/fgRwB0qDO9yFQInMQlHWr1tkP23qLzCsrJSgj5lqiK2h0o5JWn4vD4DU4U
         NSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+je6x5elkPbn/OrVuyHzg5kSHlABzrNC5YEtV4KwUY0=;
        b=JPTTjLgIWgW8tDLbLD+UVtxlMWgVuUpF9d6UK9BwpZEP1+lt2kvd0vfz5BEH9tyIeZ
         dLBJLgWnN2YVoW8D9RLtA8r2EZDv7XI5QPU4OZWFnf8rWHeifUL2//qOHIndaAKPZyBM
         ZcT4FtDVgkyo7v/1TqDQTDW06cX3Nm1FNgaB2rLeqhHVlDUV8LAy0EWH3rO9avNk0ozX
         bXy9mSyvLy9nzdrARYSN3JaQuQxkjyohUGhqPpjHhbxlRoRirJP9idO8hBnvi0SeR5cg
         Wtd+j8hunJrHyvAADoadn4V8IQtDgRBL5EFSwhmMpTe48PWi1aaNYmcv7hpuj2T7esS7
         w2kA==
X-Gm-Message-State: AOAM533gfi6eToNfolChNusbQ+qGtT7vwOR4V8yTJH6bOGjF+NBR8ZKl
        +TluE7xNtYIkl7ShXOdrCnJkzHIpZoftaDMVSQ65JRe9U9B+Q4Ia
X-Google-Smtp-Source: ABdhPJyZw/wkAxeRSgTS1Fs1pWRL2rR5oEHTfIiRIhDtpnmEFiM0M2C6/vdo5dUOY3hn03ypVZ53zFrvfXKhipMNxWs=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr4658417ejc.69.1632982560555;
 Wed, 29 Sep 2021 23:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de> <YUrO5ajlS9wS6xYU@smile.fi.intel.com>
 <YUrg6TfVhk+TIxDz@smile.fi.intel.com> <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
 <CAHp75Vcc_6mcR4gC-MzVTjTBpuozMJMFTosQjpXN8A25pndNpg@mail.gmail.com> <e221dce908c5ebffa2970c918b45428d@dev.tdt.de>
In-Reply-To: <e221dce908c5ebffa2970c918b45428d@dev.tdt.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Sep 2021 09:15:26 +0300
Message-ID: <CAHp75VdALPTzQE-tKj40Ft2b+13AyQKh-Scia_EjYyp54mJtPA@mail.gmail.com>
Subject: Re: Add a SSDT ACPI description to recognize my I2C device connected
 via SMBus
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Enrico Weigelt <info@metux.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Eckert.Florian@googlemail.com, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 30, 2021 at 1:40 AM Florian Eckert <fe@dev.tdt.de> wrote:

...

> > 2) driver seems supports the _ADR schema which you have used in ASL;
>
> This refers to the i2c-0, doesn't it?

Quite likely, but no guarantees. The number of the controller is
issued in order of enumeration which may be not deterministic. What is
real _ADR mapping here is that:

0 == physical port 0
1 == physical port 1
...
n == physical port n

> My mcp23s08 device is located at the i2c-0 on address 0x24.

...

> > 4) it's unclear what you did with ASL to get it loaded;
>
> On my development device I did a `iasl dsl/mcp23017.dsl`
> Of the following dsl
>
> $ cat dsl/mcp23017.dsl
> DefinitionBlock ("mcp23017.aml", "SSDT", 5, "", "MCP23017", 4)
> {
>      External (\_SB.PCI0.SBUS, DeviceObj)
>
>      Scope (\_SB.PCI0.SBUS)
>      {

According to the 2) above and as we learnt from the actual code this
missed one level of the devices, i.e. I2C port

Device (I2C0)
{
        Name (_ADR, Zero)

>          Device (GPIO)
>          {

>              Name (_HID, "PRP0001")
>              Name (_ADR, Zero)

This is against specification as I told you already. _CID/_HID may not
be together with _ADR.

>              Name (_CRS, ResourceTemplate () {
>                  I2cSerialBus (
>                      0x24,                   // Bus address
>                      ControllerInitiated,    // Don't care
>                      400000,                 // Fast mode (400 kHz)
>                      AddressingMode7Bit,     // 7-bit addressing
>                      "\\_SB.PCI0.SBUS",      // I2C host controller
>                      0                       // Must be 0
>                  )
>              })
>
>              Name (_DSD, Package () {
>                  ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                  Package () {
>                      Package () { "compatible", Package () {
> "microchip,mcp23017" } },
>                  }
>              })
>          }
>      }
> }
>
> After that I copied this to my APU3 Target and executed
>   the following commands:
> mkdir /sys/kernel/config/acpi/table/mcp23017
>
> cat mcp23s08.aml > /sys/kernel/config/table/mcp23017

Yeah, but your I2C controller already been enumerated, so this won't
have any effect due to half-baked ACPI table in the firmware
(coreboot) which should be

Device (SBUS)
{
    Name (_ADR, 0x00140000)
    Device (PORT0)
    {
       Name (_ADR, Zero)
    }
    ...
    Device(PORTn)
    {
        Name (_ADR, n)
    }
}

...

> > 5) as Mika suggested, have you checked the kernel configuration?
>
> I have now switched on the suggested option
> CONFIG_ACPI_CUSTOM_METHOD=y
> CONFIG_ACPI_TABLE_UPGRADE=y
> CONFIG_CONFIGFS_FS=y
> CONFIG_ACPI_CONFIGFS=y
> CONFIG_ACPI_DEBUG=y
>
> But this did not solved my issue loading ssdt during runtime.

It won't as explained in 4) above.

> The output of the aml on the target:
>
> cat /sys/kernel/config/acpi/table/mcp23017/aml

Don't use `cat` against binary files. But we don't really need that.
It's the same as after iasl.

...

> My iasl version:
>
> iasl --version
> Illegal option: --
>
> Intel ACPI Component Architecture
> ASL+ Optimizing Compiler/Disassembler version 20181213

Please, update to something newer.

> Copyright (c) 2000 - 2018 Intel Corporation

...

Current summary:
 1) you still have issues with ASL
 2) there is boot ordering issues with the controller itself

> What else can I do?

So, the course of actions as I see is:
- fix the asl
- fix the coreboot to represent ports of the I2C controller
- switch to use initramfs method (or EFI)
- if possible, to unbind and bind back the i2c controller after AML is
loaded via configfs (it may be not, if it's occupied by some
peripheral devices / drivers that are crucial to system to work)

> The initrd option does not work with OpenWrt.

Why not? If indeed so (but I don't believe in this), OpenWRT has a bug
/ missed feature, which must be fixed there.

-- 
With Best Regards,
Andy Shevchenko
