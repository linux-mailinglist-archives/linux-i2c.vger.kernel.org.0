Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E054F41CF55
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Sep 2021 00:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347301AbhI2Wmc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 18:42:32 -0400
Received: from mxout70.expurgate.net ([194.37.255.70]:42979 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343498AbhI2Wma (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Sep 2021 18:42:30 -0400
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mViFi-000CxA-Cg; Thu, 30 Sep 2021 00:40:38 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mViFh-0007nq-8t; Thu, 30 Sep 2021 00:40:37 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 5F662240041;
        Thu, 30 Sep 2021 00:40:36 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id ADC39240040;
        Thu, 30 Sep 2021 00:40:35 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id 399D3200A9;
        Thu, 30 Sep 2021 00:40:35 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 30 Sep 2021 00:40:35 +0200
From:   Florian Eckert <fe@dev.tdt.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Enrico Weigelt <info@metux.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Eckert.Florian@googlemail.com, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Add a SSDT ACPI description to recognize my I2C device connected
 via SMBus
In-Reply-To: <CAHp75Vcc_6mcR4gC-MzVTjTBpuozMJMFTosQjpXN8A25pndNpg@mail.gmail.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de>
 <YUrO5ajlS9wS6xYU@smile.fi.intel.com> <YUrg6TfVhk+TIxDz@smile.fi.intel.com>
 <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
 <CAHp75Vcc_6mcR4gC-MzVTjTBpuozMJMFTosQjpXN8A25pndNpg@mail.gmail.com>
Message-ID: <e221dce908c5ebffa2970c918b45428d@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,
        T_FILL_THIS_FORM_SHORT autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1632955238-000081E6-5AC7E0B7/0/0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> The mcp23s08 can not be connected to I2C. It's a SPI device.
> Which chip do you actually have? I believe it's MCP23017 or MCP23018,
> which is I2C.

Yes the device is a mcp23017, but the driver is the pinctrl_mcp23s08 [1]

root@dev ~ # lsmod | grep mcp
pinctrl_mcp23s08       16384  0
regmap_core            45056  1 pinctrl_mcp23s08,[permanent]

> Summary:
> 1) _CID notation is wrong in ASL;

I got it

> 2) driver seems supports the _ADR schema which you have used in ASL;

This refers to the i2c-0, doesn't it?
My mcp23s08 device is located at the i2c-0 on address 0x24.

> 3) something fishy about I/O addresses in the sysfs (is it a typo when
> you composed the email?);

No

I have asked myself the same question.
Something is not right.
There was a change regarding the Hudson2 in the driver, maybe something 
went wrong [2]?

> 4) it's unclear what you did with ASL to get it loaded;

On my development device I did a `iasl dsl/mcp23017.dsl`
Of the following dsl

$ cat dsl/mcp23017.dsl
DefinitionBlock ("mcp23017.aml", "SSDT", 5, "", "MCP23017", 4)
{
     External (\_SB.PCI0.SBUS, DeviceObj)

     Scope (\_SB.PCI0.SBUS)
     {
         Device (GPIO)
         {
             Name (_HID, "PRP0001")
             Name (_DDN, "MCP23017 gpio expander")
             Name (_ADR, Zero)
             Name (_CRS, ResourceTemplate () {
                 I2cSerialBus (
                     0x24,                   // Bus address
                     ControllerInitiated,    // Don't care
                     400000,                 // Fast mode (400 kHz)
                     AddressingMode7Bit,     // 7-bit addressing
                     "\\_SB.PCI0.SBUS",      // I2C host controller
                     0                       // Must be 0
                 )
             })

             Name (_DSD, Package () {
                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                 Package () {
                     Package () { "compatible", Package () { 
"microchip,mcp23017" } },
                 }
             })
         }
     }
}

After that I copied this to my APU3 Target and executed
  the following commands:
mkdir /sys/kernel/config/acpi/table/mcp23017

cat mcp23s08.aml > /sys/kernel/config/table/mcp23017

> 5) as Mika suggested, have you checked the kernel configuration?

I have now switched on the suggested option
CONFIG_ACPI_CUSTOM_METHOD=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_CONFIGFS_FS=y
CONFIG_ACPI_CONFIGFS=y
CONFIG_ACPI_DEBUG=y

But this did not solved my issue loading ssdt during runtime.

The output of the aml on the target:

cat /sys/kernel/config/acpi/table/mcp23017/aml
SSDTsMCP23017INTL \/_SB_PCI0SBUSK
                                  \/_SB_PCI0SBUS[H
MCP23017 gpio expande_AD_CRS&
#$\_SB.PCI0.SBUS_DSD?
microchip,mcp23017


My iasl version:

iasl --version
Illegal option: --

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20181213
Copyright (c) 2000 - 2018 Intel Corporation


What else can I do?
The initrd option does not work with OpenWrt.
Maybe I can get further if you can give me a good HEX for debug_level 
and the debug_layer?

---
Regards Florian

[1] 
https://github.com/torvalds/linux/blob/master/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
[2] 
https://github.com/torvalds/linux/commit/528d53a1592b0e27c423f7cafc1df85f77fc1163#diff-aa95f6311d1fcc4d85955b153a2510e853807546ac8e0d3aa0310ac30d236147
