Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36904160F9
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 16:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbhIWO0u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 10:26:50 -0400
Received: from mxout70.expurgate.net ([194.37.255.70]:41681 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241308AbhIWO0u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 10:26:50 -0400
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Sep 2021 10:26:49 EDT
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mTPXM-0004Hd-1D; Thu, 23 Sep 2021 16:17:20 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mTPXL-000465-13; Thu, 23 Sep 2021 16:17:19 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 44992240041;
        Thu, 23 Sep 2021 16:17:18 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id A9CD2240040;
        Thu, 23 Sep 2021 16:17:17 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id 6971620110;
        Thu, 23 Sep 2021 16:17:13 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 23 Sep 2021 16:17:13 +0200
From:   Florian Eckert <fe@dev.tdt.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Enrico Weigelt <info@metux.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>, Florian.Eckert@googlemail.com
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Add a SSDT ACPI description to recognize my I2C device connected via
 SMBus
In-Reply-To: <YUrg6TfVhk+TIxDz@smile.fi.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de>
 <YUrO5ajlS9wS6xYU@smile.fi.intel.com> <YUrg6TfVhk+TIxDz@smile.fi.intel.com>
Message-ID: <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,
        T_FILL_THIS_FORM_SHORT autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate: clean
X-purgate-ID: 151534::1632406639-000081E6-9F458C7C/0/0
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I am working wit OpenWrt which has recently switched the kernel version
from 5.4 to 5.10 on x86 Target [1] in its master branch.

I am using a APU3 board from PC-Engine [2].

The APU3 board has an SMBus [3] device (Intel PIIX4 and compatible
(ATI/AMD/Serverworks/Broadcom/SMSC) to communicate with additional 
connected I2C devices.

On This SMBus there is a IO expander from microchip connect [4] via the 
SMBus (i2c).
I used this microchip IO expander to control additional LEDs, as the 
APU3 only has 3.

So far, everything has worked fine, because I had wirten a platform 
device for this.
Everything was recognized and compiled cleanly and I could control the 
LEDs from the user-land.

Due to the following change [5] between 5.4 and 5.10 by removing the 
platform data support in
the IO expander mcp23s08, my plaform device does not compile anymore,
I can no longer use the platform device pattern for this kind of device.

The only possibility I can think of now is to make this device known
to the kernel via a dynamic ACPI SSDT table. I have already tried 
various
things but I can't get the driver [4] to feel responsible for this 
device.

I have used the following links that were provided by "Andy Shevchenko" 
to me
to understand the concept begind ACPI SSDT handling. Thanks for that.

https://connect.linaro.org/resources/lvc21f/lvc21f-304/
https://www.youtube.com/watch?v=nlKjUAv3RL0&ab_channel=OSDNConf
https://stackoverflow.com/questions/65727454/
https://stackoverflow.com/questions/60105101/
https://stackoverflow.com/questions/54768841/
https://stackoverflow.com/questions/46095840/
https://github.com/westeri/meta-acpi/tree/master/recipes-bsp/acpi-tables/samples/

This is my aml file that I tried with. It loads but nothing happens.

DefinitionBlock ("mcp23s08.aml", "SSDT", 5, "", "IO", 2)
{
     External (\_SB.PCI0.SBUS, DeviceObj)

     Device (\_SB.PCI0.SBUS.BUS0)
     {
         Name (_CID, "smbus")
         NAME (_ADR, Zero)
         Device (PIN)
         {
             Name (_HID, "PRP0001")
             Name (_DDN, "io expander")
             Name (_CRS, ResourceTemplate () {
                 I2cSerialBus (
                     0x24,                   // Bus address
                     ControllerInitiated,    // Don't care
                     400000,                 // Fast mode (400 kHz)
                     AddressingMode7Bit,     // 7-bit addressing
                     "\\_SB.PCI0.SBUS.BUS0", // I2C host controller
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

In Coreboot the SMBus named SBUS and is on address 0x0014000 [7].

But I'm not sure if that's right at all.
Somehow I don't understand how the io expander is connected to SMBus.
According to my research, however, it should fit.

The SMBus device driver i2c-piix4 creates 3 I2C devices:
ls -la /sys/bus/i2c/devices/
../../../devices/pci0000:00/0000:00:14.0/i2c-0 (SMBus PIIX4 adapter port 
0 at 0b00)
../../../devices/pci0000:00/0000:00:14.0/i2c-1 (SMBus PIIX4 adapter port 
2 at 0b00)
../../../devices/pci0000:00/0000:00:14.0/i2c-2 (SMBus PIIX4 adapter port 
1 at 0b20)


The mcp23s08 is connected to the i2c-0 with address 0x24

Therefore I believe the following applies

+------+    +------+
| PCI0 |--->| SMB0 |--> i2c client A (0x24)
|      |    |      |
+------+    +------+


I have enabled the following kernel config parameters for ACPI SSDT:
CONFIG_ACPI_CUSTOM_METHOD
CONFIG_CONFIGFS_FS
CONFIG_ACPI_CONFIGFS
CONFIG_ACPI_DEBUG

The goal would be that the ACPI mapping for the i2c-pii4 and the 
connected pinctrl-mcp23s08 exactly works as
show in the video [5] from Andy Shevchenko.

I think others will have the same problem in the future when they update 
the kernel on an X86 embedded device
which does not support device trees and also now no platform data 
handling.


- Florian

[1] 
https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=64be0eadc17988f29d0a4b89569840d917746498
[2] https://pcengines.ch/apu.htm
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/i2c/busses/i2c-piix4.c?h=v5.10.68
[4] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/pinctrl/pinctrl-max77620.c?h=v5.10.68
[5] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/pinctrl/pinctrl-mcp23s08.c?h=v5.10.68&id=6aba6ed879b3471903c8ada28ba968a268df6143
[6] https://www.youtube.com/watch?v=nlKjUAv3RL0&ab_channel=OSDNConf
[7] 
https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/southbridge/amd/pi/hudson/acpi/fch.asl#29
