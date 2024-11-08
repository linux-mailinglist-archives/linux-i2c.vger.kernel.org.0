Return-Path: <linux-i2c+bounces-7886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7349C1972
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 10:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0021C24EA1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 09:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629071E130F;
	Fri,  8 Nov 2024 09:43:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9DE1E0DE2;
	Fri,  8 Nov 2024 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.224.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731059031; cv=none; b=BIubNpqylpo9IdkScNDS4rNZBb6cKdVRkZQTi+NA08sUSLv2bd8XOw1PO9FmHIh3fGhxQjbVw8jZbaoXUW7GikKU7Yx/4pD0ezh8kn1SQxJgzKCneVLQz6EyjpKEIqOR1qo2HaCNEj5/uhQOspWjIu5lynDxRiK8rSE1FU8DI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731059031; c=relaxed/simple;
	bh=OqdNxP1egErpHe7fa3L9WiiLyL1/x19dlBEjAklqdOE=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=vAOb98GB1sGiQHdq9LbuPoosku5MEY0jzWf/H79Hadftu+S8GHyRoYz4/AoeXBIoEtIbfcy/C8oYsHtMUcCm/o7TNzVon/thOq4a3M8HAphrElMHlBs5c6hJr/cBhEKH7y7nraqpiVlnsto5/m2qakiLqhRgfKL16G0ZEZjmY9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=91.198.224.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=5056aec32c=fe@dev.tdt.de>)
	id 1t9LGo-00Cfps-HZ; Fri, 08 Nov 2024 10:27:10 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1t9LGn-00CfpP-Jt; Fri, 08 Nov 2024 10:27:09 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 3CB3D240040;
	Fri,  8 Nov 2024 10:27:09 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 37997240036;
	Fri,  8 Nov 2024 10:27:09 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id A8ECC39A36;
	Fri,  8 Nov 2024 10:27:08 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 08 Nov 2024 10:27:08 +0100
From: Florian Eckert <fe@dev.tdt.de>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT overlay
 method
In-Reply-To: <Zy3P7ld7UUL8XCrR@smile.fi.intel.com>
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
 <Zy3P7ld7UUL8XCrR@smile.fi.intel.com>
Message-ID: <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate: clean
X-purgate-ID: 151534::1731058030-28FA178A-FCD63596/0/0
X-purgate-type: clean

Hello Konstantin,

On 2024-11-08 09:46, Andy Shevchenko wrote:
> +Cc: Florian (as this indeed rang a bell to me)
> 
> https://lore.kernel.org/all/d84fb798722762862a7fb08f1e343b6a@dev.tdt.de/

The message was forwarded by Andy because I had a similar problem with 
my APU3 [1]
from PC-engine [2], which is also using the PIIX4 for I2C (SMBUS).

>> Maybe I need to modify ACPI code somehow to create these
>> 'physical_nodesX' folders for the relevant i2c-7/8/9 buses?

I don't know if that helps, but with the following SSDT overlay I 
managed
to get the driver to feel responsible for the mcp23017 via the I2C 
(SMBUS) of
the APU3. The mcp23017 is used on my APU3 to add additional LEDs to 
'/sys/class/leds'.

```
DefinitionBlock ("mcp.aml", "SSDT", 5, "TEST", "MCP", 2)
{
         External (\_SB.PCI0.SBUS, DeviceObj)

         Scope (\_SB.PCI0.SBUS)
         {
                 Device (I2C0)
                 {
                         Name (_ADR, Zero)
                         Device (GPIO)
                         {
                                 Name (_HID, "PRP0001")
                                 Name (_DDN, "MCP23017 pinctrl")
                                 Name (_CRS, ResourceTemplate ()
                                 {
                                         I2cSerialBus (
                                                 0x24,
                                                 ControllerInitiated,
                                                 100000,
                                                 AddressingMode7Bit,
                                                 "\\_SB.PCI0.SBUS.I2C0",
                                                 0x00
                                         )
                                 })
                                 Name (_DSD, Package ()
                                 {
                                         
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                         Package () {
                                                 Package () { 
"compatible", "microchip,mcp23017" },
                                         }
                                 })

                                 Device (LEDS)
                                 {
                                         Name (_HID, "PRP0001")
                                         Name (_DDN, "GPIO LEDs device")
                                         Name (_CRS, ResourceTemplate () 
{
                                                 GpioIo (
                                                         Exclusive,
                                                         PullNone,
                                                         0,
                                                         0,
                                                         
IoRestrictionOutputOnly,
                                                         
"\\_SB.PCI0.SBUS.I2C0.GPIO",
                                                         0)
                                                 {
                                                         0,
                                                         1,
                                                         2,
                                                         3,
                                                         4,
                                                         5,
                                                         6,
                                                         7,
                                                 }
                                         })

                                         Name (_DSD, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () { 
"compatible", Package() { "gpio-leds" } },
                                                 },
                                                 
ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                                                 Package () {
                                                         Package () 
{"led-0", "LED0"},
                                                         Package () 
{"led-1", "LED1"},
                                                         Package () 
{"led-2", "LED2"},
                                                         Package () 
{"led-3", "LED3"},
                                                         Package () 
{"led-4", "LED4"},
                                                         Package () 
{"led-5", "LED5"},
                                                         Package () 
{"led-6", "LED6"},
                                                         Package () 
{"led-7", "LED7"},
                                                 }
                                         })

                                         Name (LED0, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:green:led1"},
                                                         Package () 
{"default-state", "off"},
                                                         Package () 
{"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 0, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })

                                         Name (LED1, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:green:led2"},
                                                         Package () 
{"default-state", "off"},
                                                                 Package 
() {"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 1, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })

                                         Name (LED2, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:green:led3"},
                                                         Package () 
{"default-state", "off"},
                                                         Package () 
{"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 2, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })

                                         Name (LED3, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:green:led4"},
                                                         Package () 
{"default-state", "off"},
                                                         Package () 
{"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 3, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })

                                         Name (LED4, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:green:led5"},
                                                         Package () 
{"default-state", "off"},
                                                         Package () 
{"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 4, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })

                                         Name (LED5, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:green:led6"},
                                                         Package () 
{"default-state", "off"},
                                                         Package () 
{"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 5, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })

                                         Name (LED6, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:green:led7"},
                                                         Package () 
{"default-state", "off"},
                                                         Package () 
{"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 6, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })

                                         Name (LED7, Package () {
                                                 
ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                                                 Package () {
                                                         Package () 
{"label", "khan:red:led8"},
                                                         Package () 
{"default-state", "off"},
                                                         Package () 
{"linux,default-trigger", "default-off"},
                                                         Package () 
{"gpios", Package () {^LEDS, 0, 7, 1}},
                                                         Package () 
{"retain-state-suspended", 1},
                                                 }
                                         })
                                 }
                         }
                 }
         }
}
```

Best regards

Florian

[1] https://pcengines.ch/apu3d4.htm
[2] https://pcengines.ch/
[3] 
https://github.com/pcengines/coreboot/blob/8d3e714804b1b2bb5bc89e3ffd9cb3c34f8eb0c6/src/southbridge/amd/pi/hudson/acpi/fch.asl#L29

