Return-Path: <linux-i2c+bounces-7883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5439C184C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 09:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED5C284DBA
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 08:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ECA1E0B8A;
	Fri,  8 Nov 2024 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ok1+COTO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180D1494D4;
	Fri,  8 Nov 2024 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055606; cv=none; b=jnFSHt2WHxo6TLgTMdZ0vHz4BhMQFWdV8pwR1cgbKAVnNIiCir0OaJx8VcRjhdxb2gNXethXTTVAEpnKdfALw2LAI3T9EVnmCrfZArp0C2dfHpKH7dUzudya7R8KNwu8JqmBOouZUSbMjbJvQbmr7894LR8fdUfS3PCKiEhZ1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055606; c=relaxed/simple;
	bh=mvieot8ToUW52uvsaNLXVsq2BARqjAxpK/16x3PdPaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc7JQDUTgf8Ned9T0hm9sWlIdBlnhgMiPPY36X7RSm/iPR0g6/CZEY5mPCwiGHjox3WszoqorxEBs9roNM06jPh4w6ltlKb+lViNJUmO9EMHL+7YuElA0odrMQdWDyZl7ouyYE/bLdn3dJDKwYrDnJYYrxN24FXa9Ejbj+usRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ok1+COTO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731055606; x=1762591606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mvieot8ToUW52uvsaNLXVsq2BARqjAxpK/16x3PdPaI=;
  b=Ok1+COTOk5eV/9uZ8A3Y0jIU4euU2+1d0Ps0Hbc+Aq4fj8fK7eICku5w
   xvoouIriLqEk52tggQcodUBx2lW3UOABeOFpTUOFo1NepT+jU13rSEYZY
   GjaT8xgs4x/OtQhfO8QaIp+7apUUxRnsgDJWXD5Ww72mfjDVQ2u4gQ4uR
   HweR9N0KN1N5gnloV0RlBxB6q3P3FzD6M6iKuXzyt349cmZRroZOwtuaB
   6Reg5wUCx3PKmBJd2uurfyykAW1y6vmVVwsPaBf42no9cVNcb4fHX/W3s
   f/S6hDAya7YyoSo8s1YVGxyUTsyH7OVUV44kz2PQOlJlcFeDJ4UNb1lnv
   Q==;
X-CSE-ConnectionGUID: i2ahKHPMTwyswzZoVmKf3A==
X-CSE-MsgGUID: Kr+tRmRzQWagai1NdxhNdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42032262"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42032262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:46:44 -0800
X-CSE-ConnectionGUID: o9VRCN3ESbmNwbYi3E14Pw==
X-CSE-MsgGUID: 4uQYg3BeRi2ml0Qs1uEc9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85778926"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:46:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9Kdb-0000000CXfM-0IMc;
	Fri, 08 Nov 2024 10:46:39 +0200
Date: Fri, 8 Nov 2024 10:46:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>,
	Florian Eckert <fe@dev.tdt.de>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT
 overlay method
Message-ID: <Zy3P7ld7UUL8XCrR@smile.fi.intel.com>
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Florian (as this indeed rang a bell to me)

https://lore.kernel.org/all/d84fb798722762862a7fb08f1e343b6a@dev.tdt.de/

On Thu, Nov 07, 2024 at 06:51:03PM +0300, Konstantin Aladyshev wrote:
> Hello!
> 
> I'm trying to add I2C devices to I2C/SMBus buses via the ACPI SSDT
> overlay method. I've managed to do it for the I2C buses, but can't get
> it working for the SMBus (PIIX4).
> 
> Now the long description of what I've tried and learned.
> 
> I've successfully managed to add my I2C devices to the I2C buses. In
> this case I2C buses are described in the ACPI code of my system like
> this:
> ```
> Device (I2CF)
> {
>     Name (_HID, "AMDI0010")
>     Name (_UID, 0x05)
>     Method (_CRS, 0, Serialized) {...}
>     Method (_STA, 0, NotSerialized) {...}
> }
> ```
> 
> These buses are present in the system as:
> ```
> $ i2cdetect -l
> i2c-0   unknown         Synopsys DesignWare I2C adapter         N/A
> ...
> ```
> 
> For my custom device (at24 EEPROM) I've created SSDT table:
> ```
> DefinitionBlock ("at24.aml", "SSDT", 5, "", "AT24", 1)
> {
>     External (_SB_.I2CF, DeviceObj)
> 
>     Scope (\_SB.I2CF)
>     {
>         Device (EEP0) {
>             Name (_HID, "PRP0001")
>             Name (_DDN, "Atmel AT24 compatible EEPROM")
>             Name (_CRS, ResourceTemplate () {
>                 I2cSerialBusV2 (
>                     0x0050,              // I2C Slave Address
>                     ControllerInitiated,
>                     400000,              // Bus speed
>                     AddressingMode7Bit,
>                     "\\_SB.I2CF",   // Link to ACPI I2C host controller
>                     0
>                 )
>             })
> 
>             Name (_DSD, Package () {
>                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                 Package () {
>                     Package () { "compatible", Package() { "atmel,24c128" } },
>                 }
>             })
>         }
>     }
> }
> ```
> 
> And after I've loaded it via 'acpi_configfs' I can successfully see
> EEPROM in the system:
> ```
> root@ubuntu-SP3:/home/ubuntu/acpi/custom# hexdump -C
> /sys/bus/i2c/devices/i2c-PRP0001\:00/eeprom
> 00000000  63 6a a9 05 00 65 14 35  9f 81 a7 60 aa c2 18 d2  |cj...e.5...`....|
> 00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> *
> 00004000
> ```
> 
> 
> Now I'm trying to add devices to the SMBus bus. Which in my case is
> produced from the i2c_piix4 PCI device:
> ```
> $ lspci -s 00:14.0 -vvvxxx
> 00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 61)
>         Subsystem: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         NUMA node: 0
>         IOMMU group: 58
>         Kernel driver in use: piix4_smbus
>         Kernel modules: i2c_piix4, sp5100_tco
> 00: 22 10 0b 79 03 04 20 02 61 00 05 0c 00 00 80 00
> 10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 0b 79
> 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ```
> 
> It is described as simple as this in the system ACPI code:
> ```
> Device (SMBS) // \_SB_.PCI0.SMBS
> {
>     Name (_ADR, 0x00140000)  // _ADR: Address
> }
> ```
> And produces several I2C busses to the system:
> ```
> i2c-7   unknown         SMBus PIIX4 adapter port 0 at 0b00      N/A
> i2c-8   unknown         SMBus PIIX4 adapter port 2 at 0b00      N/A
> i2c-9   unknown         SMBus PIIX4 adapter port 1 at 0b20      N/A
> ```
> 
> No matter how I've tried, I can't get to add my custom devices to
> these SMBus buses.
> 
> Apparently just using "\\_SB.PCI0.SMBS" is not enough for this case.
> Maybe I need to somehow create port nodes for this Device? Or maybe it
> is not possible at all with the current piix driver?
> 
> Anyway I've started digging and I've noticed that for the I2C device
> there are two physical_nodes in the sysfs. Where the 'physical_node'
> is a standard folder and 'physical_node1' is a direct link to the
> proper i2c bus:
> ```
> $ ls -la /sys/bus/acpi/devices/AMDI0010\:03/
> total 0
> drwxr-xr-x   4 root root    0 Nov  7 18:07 .
> drwxr-xr-x 294 root root    0 Nov  7 18:05 ..
> -r--r--r--   1 root root 4096 Nov  7 18:06 hid
> -r--r--r--   1 root root 4096 Nov  7 18:06 modalias
> -r--r--r--   1 root root 4096 Nov  7 18:06 path
> lrwxrwxrwx   1 root root    0 Nov  7 18:06 physical_node ->
> ../../../platform/AMDI0010:03
> lrwxrwxrwx   1 root root    0 Nov  7 18:06 physical_node1 ->
> ../../../platform/AMDI0010:03/i2c-1
> drwxr-xr-x   2 root root    0 Nov  7 18:06 power
> -r--r--r--   1 root root 4096 Nov  7 18:06 status
> lrwxrwxrwx   1 root root    0 Nov  7 18:05 subsystem -> ../../../../bus/acpi
> -rw-r--r--   1 root root 4096 Nov  7 18:05 uevent
> -r--r--r--   1 root root 4096 Nov  7 18:06 uid
> drwxr-xr-x   3 root root    0 Nov  7 18:05 wakeup
> 
> $ ls -la /sys/bus/acpi/devices/AMDI0010\:03/physical_node/
> total 0
> drwxr-xr-x    4 root root    0 Nov  7 18:08 .
> drwxr-xr-x 7335 root root    0 Nov  7 18:05 ..
> lrwxrwxrwx    1 root root    0 Nov  7 18:05 driver ->
> ../../../bus/platform/drivers/i2c_designware
> -rw-r--r--    1 root root 4096 Nov  7 18:08 driver_override
> lrwxrwxrwx    1 root root    0 Nov  7 18:08 firmware_node ->
> ../../LNXSYSTM:00/LNXSYBUS:00/AMDI0010:03
> drwxr-xr-x    4 root root    0 Nov  7 18:05 i2c-1
> -r--r--r--    1 root root 4096 Nov  7 18:08 modalias
> drwxr-xr-x    2 root root    0 Nov  7 18:08 power
> lrwxrwxrwx    1 root root    0 Nov  7 18:05 subsystem -> ../../../bus/platform
> -rw-r--r--    1 root root 4096 Nov  7 18:05 uevent
> 
> $ ls -la /sys/bus/acpi/devices/AMDI0010\:03/physical_node1/
> total 0
> drwxr-xr-x 4 root root    0 Nov  7 18:08 .
> drwxr-xr-x 4 root root    0 Nov  7 18:08 ..
> --w------- 1 root root 4096 Nov  7 18:08 delete_device
> lrwxrwxrwx 1 root root    0 Nov  7 18:08 device -> ../../AMDI0010:03
> lrwxrwxrwx 1 root root    0 Nov  7 18:08 firmware_node ->
> ../../../LNXSYSTM:00/LNXSYBUS:00/AMDI0010:03
> drwxr-xr-x 3 root root    0 Nov  7 18:05 i2c-dev
> -r--r--r-- 1 root root 4096 Nov  7 18:05 name
> --w------- 1 root root 4096 Nov  7 18:08 new_device
> drwxr-xr-x 2 root root    0 Nov  7 18:08 power
> lrwxrwxrwx 1 root root    0 Nov  7 18:05 subsystem -> ../../../../bus/i2c
> -rw-r--r-- 1 root root 4096 Nov  7 18:05 uevent
> -r--r--r-- 1 root root 4096 Nov  7 18:08 waiting_for_supplier
> ```
> 
> But in the case of SMBus there is only one 'physical_node' folder (but
> 3 i2c buses) :
> ```
> $ ls -l /sys/bus/acpi/devices/device\:25/
> total 0
> -r--r--r-- 1 root root 4096 Nov  7 18:07 adr
> -r--r--r-- 1 root root 4096 Nov  7 18:07 path
> lrwxrwxrwx 1 root root    0 Nov  7 18:07 physical_node ->
> ../../../../pci0000:00/0000:00:14.0
> drwxr-xr-x 2 root root    0 Nov  7 18:07 power
> lrwxrwxrwx 1 root root    0 Nov  7 18:05 subsystem -> ../../../../../bus/acpi
> -rw-r--r-- 1 root root 4096 Nov  7 18:05 uevent
> drwxr-xr-x 3 root root    0 Nov  7 18:05 wakeup
> 
> $ ls -l /sys/bus/acpi/devices/device\:25/physical_node/
> total 0
> -r--r--r-- 1 root root 4096 Nov  7 18:07 ari_enabled
> -rw-r--r-- 1 root root 4096 Nov  7 18:07 broken_parity_status
> -r--r--r-- 1 root root 4096 Nov  7 18:05 class
> -rw-r--r-- 1 root root  256 Nov  7 18:07 config
> -r--r--r-- 1 root root 4096 Nov  7 18:07 consistent_dma_mask_bits
> -rw-r--r-- 1 root root 4096 Nov  7 18:07 d3cold_allowed
> -r--r--r-- 1 root root 4096 Nov  7 18:05 device
> -r--r--r-- 1 root root 4096 Nov  7 18:07 dma_mask_bits
> lrwxrwxrwx 1 root root    0 Nov  7 18:05 driver ->
> ../../../bus/pci/drivers/piix4_smbus
> -rw-r--r-- 1 root root 4096 Nov  7 18:07 driver_override
> -rw-r--r-- 1 root root 4096 Nov  7 18:07 enable
> lrwxrwxrwx 1 root root    0 Nov  7 18:07 firmware_node ->
> ../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:25
> drwxr-xr-x 4 root root    0 Nov  7 18:05 i2c-7
> drwxr-xr-x 4 root root    0 Nov  7 18:05 i2c-8
> drwxr-xr-x 4 root root    0 Nov  7 18:05 i2c-9
> lrwxrwxrwx 1 root root    0 Nov  7 18:07 iommu -> ../0000:00:00.2/iommu/ivhd3
> lrwxrwxrwx 1 root root    0 Nov  7 18:07 iommu_group ->
> ../../../kernel/iommu_groups/58
> -r--r--r-- 1 root root 4096 Nov  7 18:07 irq
> drwxr-xr-x 2 root root    0 Nov  7 18:07 link
> -r--r--r-- 1 root root 4096 Nov  7 18:07 local_cpulist
> -r--r--r-- 1 root root 4096 Nov  7 18:07 local_cpus
> -r--r--r-- 1 root root 4096 Nov  7 18:07 modalias
> -rw-r--r-- 1 root root 4096 Nov  7 18:07 msi_bus
> -rw-r--r-- 1 root root 4096 Nov  7 18:07 numa_node
> drwxr-xr-x 2 root root    0 Nov  7 18:07 power
> -r--r--r-- 1 root root 4096 Nov  7 18:07 power_state
> --w--w---- 1 root root 4096 Nov  7 18:07 remove
> --w------- 1 root root 4096 Nov  7 18:07 rescan
> -r--r--r-- 1 root root 4096 Nov  7 18:05 resource
> -r--r--r-- 1 root root 4096 Nov  7 18:07 revision
> lrwxrwxrwx 1 root root    0 Nov  7 18:05 subsystem -> ../../../bus/pci
> -r--r--r-- 1 root root 4096 Nov  7 18:07 subsystem_device
> -r--r--r-- 1 root root 4096 Nov  7 18:07 subsystem_vendor
> -rw-r--r-- 1 root root 4096 Nov  7 18:05 uevent
> -r--r--r-- 1 root root 4096 Nov  7 18:05 vendor
> ```
> 
> Maybe I need to modify ACPI code somehow to create these
> 'physical_nodesX' folders for the relevant i2c-7/8/9 buses?
> 
> Any feedback is appreciated.

-- 
With Best Regards,
Andy Shevchenko



