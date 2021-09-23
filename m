Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A3A4166AE
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 22:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243104AbhIWU2a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 16:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240613AbhIWU23 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 16:28:29 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312EBC061574;
        Thu, 23 Sep 2021 13:26:57 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id u27so26933531edi.9;
        Thu, 23 Sep 2021 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=atDDON76pCaIr33CBjVV6JN/xj2+t0SUWRmP0fBJZ+I=;
        b=P0TnoufLvA0W3kQuhtrDrup3Ktf3Blsd/9VhZccFrD3zZZ6ornDq0K80agw5XbF2DS
         uNPXHiOKL6xWubpjIyWFj/bCjxL4mqubHsCFYKsll4nQXKdmIEDSkVvSRne5yYjtBBj6
         jMyPN86y+lvGJkq3OtX810ZWzvMl/4hiNvFKDH2BxD0Hze7W0ObLVP6EyzEHotzdj3Bl
         JLGXV75Byj3sAAypIGblLz6nPprQ6kLvs2iQdMA4mV/VbAK4Z9r3BDfNwdXbOs1+75qW
         QLtpvH1zw86VjT6f81lemfvfSVNMLFT9vrJzwizVGL8vPEvugmO5hT49Fq/juudSviwk
         FpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=atDDON76pCaIr33CBjVV6JN/xj2+t0SUWRmP0fBJZ+I=;
        b=JCV4mXjJqe7ArtheXkCGG9GNxuTQ6rdNsb4C9y//x3vtomgvWdnOa7ysMSSJgjj9z1
         tW1ycfCK33o9D/s5zZzEX9CypfU1eFQdtOWQARYJ64Gw1IzBeOfA5l8I/8xyjjclYzdz
         6Nhb4kgXByXwltVy30Ao0kgzX03ngXocj6zkJqAAI8kR6RcGuK3CwQ1OkN1bjgNj4uKd
         AokJbfj0d62dBrcXpSoWZtQwJt3UXAaxfekAJDHz8ZzZBdqLQKanlW6+YsHQ/fuHOiIl
         xZNrS3g49mDpDKpWFjqCqyMlZqAP4BeMa0bvJQ9DV8ohOCFNmI70SfE1Lr2vihWVJMc8
         pqvw==
X-Gm-Message-State: AOAM531xZjXZ4F6z9uqmZFjhaXZlDEkaBK753K//I4auhWAypmH8q2NI
        kHAfQ1XAyJM0GYtbW35vQUsD5X8dOOVrGFJbAHmKcZWix34RSjIa
X-Google-Smtp-Source: ABdhPJyl4Cah8yFqsekgMtcq7u2MLdsetq+L+fhmlx00p010TvCgfw28N4f5hWGtl1TNJVJKUH4UtiinDaV/7RLsa2Y=
X-Received: by 2002:a50:e0c8:: with SMTP id j8mr831132edl.283.1632428815163;
 Thu, 23 Sep 2021 13:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de> <YUrO5ajlS9wS6xYU@smile.fi.intel.com>
 <YUrg6TfVhk+TIxDz@smile.fi.intel.com> <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
In-Reply-To: <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 23 Sep 2021 23:26:18 +0300
Message-ID: <CAHp75Vcc_6mcR4gC-MzVTjTBpuozMJMFTosQjpXN8A25pndNpg@mail.gmail.com>
Subject: Re: Add a SSDT ACPI description to recognize my I2C device connected
 via SMBus
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Enrico Weigelt <info@metux.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Florian.Eckert@googlemail.com, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 23, 2021 at 5:26 PM Florian Eckert <fe@dev.tdt.de> wrote:

...

> This is my aml file that I tried with. It loads but nothing happens.

It's ASL, have you compiled it?

> DefinitionBlock ("mcp23s08.aml", "SSDT", 5, "", "IO", 2)
> {
>      External (\_SB.PCI0.SBUS, DeviceObj)
>
>      Device (\_SB.PCI0.SBUS.BUS0)
>      {

>          Name (_CID, "smbus")
>          NAME (_ADR, Zero)

This seems not right.

First of all, using _ADR along with _HID or _CID is against ACPI
specification. Second, the _CID value is against specification. (AR:
Please, drop _CID)

Third, what does _ADR == 0 mean? In the ACPI the _ADR == 0 for the PCI
device is only allowed for the PCI Host Bridge. What you need to put
here is the address of the PCI device, but it looks like you added the
BUS0 device which is not needed at all and ACPI tables already provide
it. Share (decompiled) DSDT of the device in question somewhere and we
can check this. (Okay, nevermind, I found something, see below)

>          Device (PIN)
>          {
>              Name (_HID, "PRP0001")
>              Name (_DDN, "io expander")
>              Name (_CRS, ResourceTemplate () {
>                  I2cSerialBus (
>                      0x24,                   // Bus address

Bus?! It's a slave address, i.e. your MCP chip address.

>                      ControllerInitiated,    // Don't care
>                      400000,                 // Fast mode (400 kHz)
>                      AddressingMode7Bit,     // 7-bit addressing
>                      "\\_SB.PCI0.SBUS.BUS0", // I2C host controller

Should be double checked, see above. Otherwise it seems good.

>                      0                       // Must be 0
>                  )
>              })
>
>              Name (_DSD, Package () {
>                  ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                  Package () {
>                      Package () { "compatible", Package () {
> "microchip,mcp23017" } },

Have you read https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
just in case?

(I think compatible should be enough, but who knows)

>                  }
>              })
>          }
>      }
> }
>
> In Coreboot the SMBus named SBUS and is on address 0x0014000 [7].

Exactly. It means 00:14.0 in BDF notation.

> But I'm not sure if that's right at all.
> Somehow I don't understand how the io expander is connected to SMBus.
> According to my research, however, it should fit.
>
> The SMBus device driver i2c-piix4 creates 3 I2C devices:
> ls -la /sys/bus/i2c/devices/
> ../../../devices/pci0000:00/0000:00:14.0/i2c-0 (SMBus PIIX4 adapter port
> 0 at 0b00)
> ../../../devices/pci0000:00/0000:00:14.0/i2c-1 (SMBus PIIX4 adapter port
> 2 at 0b00)

Same I/O for two different ports?!

> ../../../devices/pci0000:00/0000:00:14.0/i2c-2 (SMBus PIIX4 adapter port
> 1 at 0b20)

Ah, it looks like a multifunctional device. In that case you have to
be sure the driver of the I2C controller is ready for the ACPI
enumeration (seems not). Basically you may use _ADR == 0, 1, ... for
children, but you need to document this and agree with AMD on the use.

Okay, it seems it has this:
  https://elixir.bootlin.com/linux/v5.15-rc2/source/drivers/i2c/i2c-mux.c#L396
which should populate a firmware node to a certain child.

> The mcp23s08 is connected to the i2c-0 with address 0x24

The mcp23s08 can not be connected to I2C. It's a SPI device.
Which chip do you actually have? I believe it's MCP23017 or MCP23018,
which is I2C.


Summary:
1) _CID notation is wrong in ASL;
2) driver seems supports the _ADR schema which you have used in ASL;
3) something fishy about I/O addresses in the sysfs (is it a typo when
you composed the email?);
4) it's unclear what you did with ASL to get it loaded;
5) as Mika suggested, have you checked the kernel configuration?

Otherwise I can't see anything else suspicious here.

-- 
With Best Regards,
Andy Shevchenko
