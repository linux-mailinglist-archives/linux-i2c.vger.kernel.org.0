Return-Path: <linux-i2c+bounces-7871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62A9C0A4F
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6CB31F23A36
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 15:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2059C214429;
	Thu,  7 Nov 2024 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlgLLDFe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE3A79D0;
	Thu,  7 Nov 2024 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730994358; cv=none; b=PeUDDymxbUd7cGC3HeqATnV6QqW/+tp+MdSq1s+neRjpcCkVlLBkCoEtAW0A5WZAXlxv9yekN1NwcU40VNfo/0+kcNFFcyf1m2XZ953mlzYCySLtUoaX1BknzDrvG7RWGHg0OuE5XojQFcNE3MpuEeU5rtVbPesPH2KNYYfj7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730994358; c=relaxed/simple;
	bh=2u5FdQrUns8rNA1mGSI7NkwBMKElZL50YHCDGy8KDVY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=aMJq8BNh1/UmmGfNh/klg4beYjlluqPlKeu2hCHspjkd9jIYie9VRbajNBb8Imfi9VMirBF3/FOg+9QkFpcI5g7y7ArpGTqnxK96HkvDmKoHr1wn1MH5aqRAeP3dcuagjGxLKdcmjtcpzkqaYd7GhSSuRp9Q0Xpr6Ipuf5g8k0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlgLLDFe; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-84fd616acf0so530435241.0;
        Thu, 07 Nov 2024 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730994356; x=1731599156; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a1DnKCOZhXoQPhfXyHAIbFfJO0eMPGIcLRUGVS5x2QM=;
        b=dlgLLDFe48zUwhSGb+EQeoHuKTDVfaL/UJG3MGdVIUzZ5AluZ2oMmsS5yG5fJ7teZL
         7kDwmP1553IUkjqrXRllhZoVswHrBSCJJazjTck0QPeYXZ7MZA60iKn167nrcXoY8spi
         N9Sg5C8EfVChs/561o/2jRNMfvhhGLwcGSJta+r7/XczN8X8K9X6KVJnviqEO5Y+QfT+
         /sKfkrLT8VPQnJq1aL+VpfQ8q29LsZcXY8oxYeBrh8TsYDEtMtwVhYI6SgoM1EqpYJsQ
         EqsMyucISkBr7nAsPlVUbEznSPgm6K2Dti07RfVJfJ6CcqdhccBtG4OR4sTtbDz8//oh
         8zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994356; x=1731599156;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1DnKCOZhXoQPhfXyHAIbFfJO0eMPGIcLRUGVS5x2QM=;
        b=BReCtd/TEx/3vZdGy0BqTXzKX6oG1guh7rwBCyuJjnhCmz/G1S0XjDFdZnypja16V2
         t032ZOX7kKgNP7qsmERW+pLov4nwOUTh14RcxLQ2xhqcCkxuo5axpf7coNAu3+h1Pz4g
         hpWKNo+CD5lrrZws+eflo4vj3eQgHTBSRazCiWBYUoFNYJe4sFRhNC3ueGqeLPHPTteo
         htFDuPNILJ/UTEPx1OJ4ZCVOsyFDzYDRHqRWjKAlLKmPRBUKIeCWfOHC3qfXDEc7Xmpk
         w6/6UNtrje/YGi02XYyVQqTKLZfuGt6UOvAdfKEVfrSN2dbYrTF11kjWh+qaDEYmk01P
         J+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJBxSG2TcXmxY/y1RGawTCY3qCjU4Zg4o8i2bk4jJDv8Zen/BFNd5v/YkfXeaeZu/hDhxcGnxsbu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXZCe2RV55dkKvn9QSN42yNT1ab8T5ulbtCiWKP03qbQbxkSO
	Q+vNhi9atZSUddjNAZIaLPKYYXCW9CWFKv9G9zMXrr8dTUAtAyBy1oPuxc7gEmLa0iA3YpAxyU5
	hpiMjgsz6uV6Y+ktGdtWGXdYR7XFoLxZp
X-Google-Smtp-Source: AGHT+IHQHtGBSGu7zrAwBzMTI0FsOL8NKvh/J0bA6G7kLCSR16v9vZbZZw32jXiUZWqfseH+lTCEuLrcnNaeHI/tVRo=
X-Received: by 2002:a05:6122:3111:b0:50d:4cb8:5afd with SMTP id
 71dfb90a1353d-513fe914824mr614024e0c.4.1730994355494; Thu, 07 Nov 2024
 07:45:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Thu, 7 Nov 2024 18:51:03 +0300
Message-ID: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
Subject: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT overlay method
To: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hello!

I'm trying to add I2C devices to I2C/SMBus buses via the ACPI SSDT
overlay method. I've managed to do it for the I2C buses, but can't get
it working for the SMBus (PIIX4).

Now the long description of what I've tried and learned.

I've successfully managed to add my I2C devices to the I2C buses. In
this case I2C buses are described in the ACPI code of my system like
this:
```
Device (I2CF)
{
    Name (_HID, "AMDI0010")
    Name (_UID, 0x05)
    Method (_CRS, 0, Serialized) {...}
    Method (_STA, 0, NotSerialized) {...}
}
```

These buses are present in the system as:
```
$ i2cdetect -l
i2c-0   unknown         Synopsys DesignWare I2C adapter         N/A
...
```

For my custom device (at24 EEPROM) I've created SSDT table:
```
DefinitionBlock ("at24.aml", "SSDT", 5, "", "AT24", 1)
{
    External (_SB_.I2CF, DeviceObj)

    Scope (\_SB.I2CF)
    {
        Device (EEP0) {
            Name (_HID, "PRP0001")
            Name (_DDN, "Atmel AT24 compatible EEPROM")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBusV2 (
                    0x0050,              // I2C Slave Address
                    ControllerInitiated,
                    400000,              // Bus speed
                    AddressingMode7Bit,
                    "\\_SB.I2CF",   // Link to ACPI I2C host controller
                    0
                )
            })

            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "compatible", Package() { "atmel,24c128" } },
                }
            })
        }
    }
}
```

And after I've loaded it via 'acpi_configfs' I can successfully see
EEPROM in the system:
```
root@ubuntu-SP3:/home/ubuntu/acpi/custom# hexdump -C
/sys/bus/i2c/devices/i2c-PRP0001\:00/eeprom
00000000  63 6a a9 05 00 65 14 35  9f 81 a7 60 aa c2 18 d2  |cj...e.5...`....|
00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00004000
```


Now I'm trying to add devices to the SMBus bus. Which in my case is
produced from the i2c_piix4 PCI device:
```
$ lspci -s 00:14.0 -vvvxxx
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 61)
        Subsystem: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0
        IOMMU group: 58
        Kernel driver in use: piix4_smbus
        Kernel modules: i2c_piix4, sp5100_tco
00: 22 10 0b 79 03 04 20 02 61 00 05 0c 00 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 0b 79
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
```

It is described as simple as this in the system ACPI code:
```
Device (SMBS) // \_SB_.PCI0.SMBS
{
    Name (_ADR, 0x00140000)  // _ADR: Address
}
```
And produces several I2C busses to the system:
```
i2c-7   unknown         SMBus PIIX4 adapter port 0 at 0b00      N/A
i2c-8   unknown         SMBus PIIX4 adapter port 2 at 0b00      N/A
i2c-9   unknown         SMBus PIIX4 adapter port 1 at 0b20      N/A
```

No matter how I've tried, I can't get to add my custom devices to
these SMBus buses.

Apparently just using "\\_SB.PCI0.SMBS" is not enough for this case.
Maybe I need to somehow create port nodes for this Device? Or maybe it
is not possible at all with the current piix driver?

Anyway I've started digging and I've noticed that for the I2C device
there are two physical_nodes in the sysfs. Where the 'physical_node'
is a standard folder and 'physical_node1' is a direct link to the
proper i2c bus:
```
$ ls -la /sys/bus/acpi/devices/AMDI0010\:03/
total 0
drwxr-xr-x   4 root root    0 Nov  7 18:07 .
drwxr-xr-x 294 root root    0 Nov  7 18:05 ..
-r--r--r--   1 root root 4096 Nov  7 18:06 hid
-r--r--r--   1 root root 4096 Nov  7 18:06 modalias
-r--r--r--   1 root root 4096 Nov  7 18:06 path
lrwxrwxrwx   1 root root    0 Nov  7 18:06 physical_node ->
../../../platform/AMDI0010:03
lrwxrwxrwx   1 root root    0 Nov  7 18:06 physical_node1 ->
../../../platform/AMDI0010:03/i2c-1
drwxr-xr-x   2 root root    0 Nov  7 18:06 power
-r--r--r--   1 root root 4096 Nov  7 18:06 status
lrwxrwxrwx   1 root root    0 Nov  7 18:05 subsystem -> ../../../../bus/acpi
-rw-r--r--   1 root root 4096 Nov  7 18:05 uevent
-r--r--r--   1 root root 4096 Nov  7 18:06 uid
drwxr-xr-x   3 root root    0 Nov  7 18:05 wakeup

$ ls -la /sys/bus/acpi/devices/AMDI0010\:03/physical_node/
total 0
drwxr-xr-x    4 root root    0 Nov  7 18:08 .
drwxr-xr-x 7335 root root    0 Nov  7 18:05 ..
lrwxrwxrwx    1 root root    0 Nov  7 18:05 driver ->
../../../bus/platform/drivers/i2c_designware
-rw-r--r--    1 root root 4096 Nov  7 18:08 driver_override
lrwxrwxrwx    1 root root    0 Nov  7 18:08 firmware_node ->
../../LNXSYSTM:00/LNXSYBUS:00/AMDI0010:03
drwxr-xr-x    4 root root    0 Nov  7 18:05 i2c-1
-r--r--r--    1 root root 4096 Nov  7 18:08 modalias
drwxr-xr-x    2 root root    0 Nov  7 18:08 power
lrwxrwxrwx    1 root root    0 Nov  7 18:05 subsystem -> ../../../bus/platform
-rw-r--r--    1 root root 4096 Nov  7 18:05 uevent

$ ls -la /sys/bus/acpi/devices/AMDI0010\:03/physical_node1/
total 0
drwxr-xr-x 4 root root    0 Nov  7 18:08 .
drwxr-xr-x 4 root root    0 Nov  7 18:08 ..
--w------- 1 root root 4096 Nov  7 18:08 delete_device
lrwxrwxrwx 1 root root    0 Nov  7 18:08 device -> ../../AMDI0010:03
lrwxrwxrwx 1 root root    0 Nov  7 18:08 firmware_node ->
../../../LNXSYSTM:00/LNXSYBUS:00/AMDI0010:03
drwxr-xr-x 3 root root    0 Nov  7 18:05 i2c-dev
-r--r--r-- 1 root root 4096 Nov  7 18:05 name
--w------- 1 root root 4096 Nov  7 18:08 new_device
drwxr-xr-x 2 root root    0 Nov  7 18:08 power
lrwxrwxrwx 1 root root    0 Nov  7 18:05 subsystem -> ../../../../bus/i2c
-rw-r--r-- 1 root root 4096 Nov  7 18:05 uevent
-r--r--r-- 1 root root 4096 Nov  7 18:08 waiting_for_supplier
```

But in the case of SMBus there is only one 'physical_node' folder (but
3 i2c buses) :
```
$ ls -l /sys/bus/acpi/devices/device\:25/
total 0
-r--r--r-- 1 root root 4096 Nov  7 18:07 adr
-r--r--r-- 1 root root 4096 Nov  7 18:07 path
lrwxrwxrwx 1 root root    0 Nov  7 18:07 physical_node ->
../../../../pci0000:00/0000:00:14.0
drwxr-xr-x 2 root root    0 Nov  7 18:07 power
lrwxrwxrwx 1 root root    0 Nov  7 18:05 subsystem -> ../../../../../bus/acpi
-rw-r--r-- 1 root root 4096 Nov  7 18:05 uevent
drwxr-xr-x 3 root root    0 Nov  7 18:05 wakeup

$ ls -l /sys/bus/acpi/devices/device\:25/physical_node/
total 0
-r--r--r-- 1 root root 4096 Nov  7 18:07 ari_enabled
-rw-r--r-- 1 root root 4096 Nov  7 18:07 broken_parity_status
-r--r--r-- 1 root root 4096 Nov  7 18:05 class
-rw-r--r-- 1 root root  256 Nov  7 18:07 config
-r--r--r-- 1 root root 4096 Nov  7 18:07 consistent_dma_mask_bits
-rw-r--r-- 1 root root 4096 Nov  7 18:07 d3cold_allowed
-r--r--r-- 1 root root 4096 Nov  7 18:05 device
-r--r--r-- 1 root root 4096 Nov  7 18:07 dma_mask_bits
lrwxrwxrwx 1 root root    0 Nov  7 18:05 driver ->
../../../bus/pci/drivers/piix4_smbus
-rw-r--r-- 1 root root 4096 Nov  7 18:07 driver_override
-rw-r--r-- 1 root root 4096 Nov  7 18:07 enable
lrwxrwxrwx 1 root root    0 Nov  7 18:07 firmware_node ->
../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:25
drwxr-xr-x 4 root root    0 Nov  7 18:05 i2c-7
drwxr-xr-x 4 root root    0 Nov  7 18:05 i2c-8
drwxr-xr-x 4 root root    0 Nov  7 18:05 i2c-9
lrwxrwxrwx 1 root root    0 Nov  7 18:07 iommu -> ../0000:00:00.2/iommu/ivhd3
lrwxrwxrwx 1 root root    0 Nov  7 18:07 iommu_group ->
../../../kernel/iommu_groups/58
-r--r--r-- 1 root root 4096 Nov  7 18:07 irq
drwxr-xr-x 2 root root    0 Nov  7 18:07 link
-r--r--r-- 1 root root 4096 Nov  7 18:07 local_cpulist
-r--r--r-- 1 root root 4096 Nov  7 18:07 local_cpus
-r--r--r-- 1 root root 4096 Nov  7 18:07 modalias
-rw-r--r-- 1 root root 4096 Nov  7 18:07 msi_bus
-rw-r--r-- 1 root root 4096 Nov  7 18:07 numa_node
drwxr-xr-x 2 root root    0 Nov  7 18:07 power
-r--r--r-- 1 root root 4096 Nov  7 18:07 power_state
--w--w---- 1 root root 4096 Nov  7 18:07 remove
--w------- 1 root root 4096 Nov  7 18:07 rescan
-r--r--r-- 1 root root 4096 Nov  7 18:05 resource
-r--r--r-- 1 root root 4096 Nov  7 18:07 revision
lrwxrwxrwx 1 root root    0 Nov  7 18:05 subsystem -> ../../../bus/pci
-r--r--r-- 1 root root 4096 Nov  7 18:07 subsystem_device
-r--r--r-- 1 root root 4096 Nov  7 18:07 subsystem_vendor
-rw-r--r-- 1 root root 4096 Nov  7 18:05 uevent
-r--r--r-- 1 root root 4096 Nov  7 18:05 vendor
```

Maybe I need to modify ACPI code somehow to create these
'physical_nodesX' folders for the relevant i2c-7/8/9 buses?

Any feedback is appreciated.

Best regards,
Konstantin Aladyshev

