Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC387416329
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 18:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242087AbhIWQ0b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 12:26:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:15667 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232675AbhIWQ0b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Sep 2021 12:26:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="223533867"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
   d="scan'208";a="223533867"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 09:24:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
   d="scan'208";a="614009871"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 09:24:56 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 23 Sep 2021 19:24:54 +0300
Date:   Thu, 23 Sep 2021 19:24:54 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Enrico Weigelt <info@metux.net>,
        Jean Delvare <jdelvare@suse.com>,
        Florian.Eckert@googlemail.com, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Add a SSDT ACPI description to recognize my I2C device connected
 via SMBus
Message-ID: <YUyqVsYs5oajm//6@lahna>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
 <290741faab199d3e43b6255bf2282075@dev.tdt.de>
 <YUrO5ajlS9wS6xYU@smile.fi.intel.com>
 <YUrg6TfVhk+TIxDz@smile.fi.intel.com>
 <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d84fb798722762862a7fb08f1e343b6a@dev.tdt.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Sep 23, 2021 at 04:17:13PM +0200, Florian Eckert wrote:
> I am working wit OpenWrt which has recently switched the kernel version
> from 5.4 to 5.10 on x86 Target [1] in its master branch.
> 
> I am using a APU3 board from PC-Engine [2].
> 
> The APU3 board has an SMBus [3] device (Intel PIIX4 and compatible
> (ATI/AMD/Serverworks/Broadcom/SMSC) to communicate with additional connected
> I2C devices.
> 
> On This SMBus there is a IO expander from microchip connect [4] via the
> SMBus (i2c).
> I used this microchip IO expander to control additional LEDs, as the APU3
> only has 3.
> 
> So far, everything has worked fine, because I had wirten a platform device
> for this.
> Everything was recognized and compiled cleanly and I could control the LEDs
> from the user-land.
> 
> Due to the following change [5] between 5.4 and 5.10 by removing the
> platform data support in
> the IO expander mcp23s08, my plaform device does not compile anymore,
> I can no longer use the platform device pattern for this kind of device.
> 
> The only possibility I can think of now is to make this device known
> to the kernel via a dynamic ACPI SSDT table. I have already tried various
> things but I can't get the driver [4] to feel responsible for this device.
> 
> I have used the following links that were provided by "Andy Shevchenko" to
> me
> to understand the concept begind ACPI SSDT handling. Thanks for that.
> 
> https://connect.linaro.org/resources/lvc21f/lvc21f-304/
> https://www.youtube.com/watch?v=nlKjUAv3RL0&ab_channel=OSDNConf
> https://stackoverflow.com/questions/65727454/
> https://stackoverflow.com/questions/60105101/
> https://stackoverflow.com/questions/54768841/
> https://stackoverflow.com/questions/46095840/
> https://github.com/westeri/meta-acpi/tree/master/recipes-bsp/acpi-tables/samples/
> 
> This is my aml file that I tried with. It loads but nothing happens.
> 
> DefinitionBlock ("mcp23s08.aml", "SSDT", 5, "", "IO", 2)
> {
>     External (\_SB.PCI0.SBUS, DeviceObj)
> 
>     Device (\_SB.PCI0.SBUS.BUS0)
>     {
>         Name (_CID, "smbus")
>         NAME (_ADR, Zero)
>         Device (PIN)
>         {
>             Name (_HID, "PRP0001")
>             Name (_DDN, "io expander")
>             Name (_CRS, ResourceTemplate () {
>                 I2cSerialBus (
>                     0x24,                   // Bus address
>                     ControllerInitiated,    // Don't care
>                     400000,                 // Fast mode (400 kHz)
>                     AddressingMode7Bit,     // 7-bit addressing
>                     "\\_SB.PCI0.SBUS.BUS0", // I2C host controller
>                     0                       // Must be 0
>                 )
>             })
> 
>             Name (_DSD, Package () {
>                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                 Package () {
>                     Package () { "compatible", Package () {
> "microchip,mcp23017" } },
>                 }
>             })
>         }
>     }
> }
> 
> In Coreboot the SMBus named SBUS and is on address 0x0014000 [7].
> 
> But I'm not sure if that's right at all.
> Somehow I don't understand how the io expander is connected to SMBus.
> According to my research, however, it should fit.
> 
> The SMBus device driver i2c-piix4 creates 3 I2C devices:
> ls -la /sys/bus/i2c/devices/
> ../../../devices/pci0000:00/0000:00:14.0/i2c-0 (SMBus PIIX4 adapter port 0
> at 0b00)
> ../../../devices/pci0000:00/0000:00:14.0/i2c-1 (SMBus PIIX4 adapter port 2
> at 0b00)
> ../../../devices/pci0000:00/0000:00:14.0/i2c-2 (SMBus PIIX4 adapter port 1
> at 0b20)
> 
> 
> The mcp23s08 is connected to the i2c-0 with address 0x24
> 
> Therefore I believe the following applies
> 
> +------+    +------+
> | PCI0 |--->| SMB0 |--> i2c client A (0x24)
> |      |    |      |
> +------+    +------+
> 
> 
> I have enabled the following kernel config parameters for ACPI SSDT:
> CONFIG_ACPI_CUSTOM_METHOD
> CONFIG_CONFIGFS_FS
> CONFIG_ACPI_CONFIGFS
> CONFIG_ACPI_DEBUG

How do you load the SSDT? Via initrd or something else? You may need to
enable CONFIG_ACPI_TABLE_UPGRADE too. Also do you see in dmesg that the
SSDT is loaded?

Then I suggest checking the below attributes:

 ../../../devices/pci0000:00/0000:00:14.0/firmware_node/path
 ../../../devices/pci0000:00/0000:00:14.0/i2c-0/firmware_node/path
