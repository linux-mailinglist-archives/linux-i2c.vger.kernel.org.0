Return-Path: <linux-i2c+bounces-3715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67068D51DB
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 20:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25081B215CE
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 18:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4F04C3C3;
	Thu, 30 May 2024 18:35:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8134F898;
	Thu, 30 May 2024 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717094121; cv=none; b=JY5WVmIXGQhSVOlGJ0eS67f+jghvXrVO2tHdBR0X9MRQwyWS6VWhvCIbaTiblRs6JMIQuabyb28KxFHxSi9L8hVCf8neNKsn9p49bMQEDim1+H+1icqhzX1fohyWszSv4X4f+XrR32igF9LaxTmibZewfbKQGM7kIZ9LZe686B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717094121; c=relaxed/simple;
	bh=fI1HIkB3FcZpdTq27dbRjgfIwbhmoilmQ34dJXJoZdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WAZCOVq9a10Klv3Ol/n7Z09vABxz2ry9kFjXvIwi3irooK1HS8CTaKoG1Lpu33PNbVmUo2SntSNBYmrMqG4kvmFriXsVfo2KyiPXiwKVFFRqqIqee1oMBiRkGLpjJWvUd/MFUFCrln/xR6kYISNde3wLCuknjBR62XFn5pkgOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.molgen.mpg.de (g56.guest.molgen.mpg.de [141.14.220.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6C02261E5FE01;
	Thu, 30 May 2024 20:35:01 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: smbus: Log (LP)DDR5 type specific unimplemented message in `i2c_register_spd()`
Date: Thu, 30 May 2024 20:34:43 +0200
Message-ID: <20240530183444.9312-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On several systems Linux logs:

     i2c i2c-0: Memory type 0x22 not supported yet, not instantiating SPD

1.  Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022
2.  Dell Inc. Precision 3660/0PRR48, BIOS 2.9.3 11/22/2023
3.  Dell Inc. OptiPlex SFF Plus 7010/0YGWFV, BIOS 1.7.1 08/11/2023
4.  Run `git grep 'emory type.*supported yet, not instantiating SPD'` in
    the repository of dmesg reports for various computers collected by
    Linux users at https://linux-hardware.org. [1]

Add 0x22 and 0x23 as memory types for DDR5 according to section 7.18.2
(Memory Device — Type), table 78 in *System Management BIOS (SMBIOS)
Reference Specification*, version 3.6.0 [2]. These use JEDEC JESD300-5 for
SPD, and, currently, no driver exists, so add a specific warning for this
case.

Successfully tested on Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022:

    i2c i2c-0: (LP)DDR5 SPD (memory type 0x22) not supported. JEDEC JESD300-5 compatible driv er does not exist yet, not instantiating SPD

    $ sudo dmidecode -t memory
    # dmidecode 3.3
    Getting SMBIOS data from sysfs.
    SMBIOS 3.5.0 present.
    # SMBIOS implementations newer than version 3.3.0 are not
    # fully supported by this version of dmidecode.

    Handle 0x001C, DMI type 16, 23 bytes
    Physical Memory Array
    	Location: System Board Or Motherboard
    	Use: System Memory
    	Error Correction Type: None
    	Maximum Capacity: 128 GB
    	Error Information Handle: Not Provided
    	Number Of Devices: 4

    Handle 0x001D, DMI type 17, 92 bytes
    Memory Device
    	Array Handle: 0x001C
    	Error Information Handle: Not Provided
    	Total Width: 64 bits
    	Data Width: 64 bits
    	Size: 32 GB
    	Form Factor: DIMM
    	Set: None
    	Locator: DIMMA1
    	Bank Locator: P0_Node0_Channel0_Dimm0
    	Type: <OUT OF SPEC>
    	Type Detail: Synchronous Unbuffered (Unregistered)
    	Speed: 4800 MT/s
    	Manufacturer: Samsung
    	Serial Number: 80CE01225004143D90
    	Asset Tag: 9876543210
    	Part Number: M323R4GA3BB0-CQKOL
    	Rank: 2
    	Configured Memory Speed: 3600 MT/s
    	Minimum Voltage: 1.1 V
    	Maximum Voltage: 1.1 V
    	Configured Voltage: 1.1 V
    	Memory Technology: DRAM
    	Memory Operating Mode Capability: Volatile memory
    	Firmware Version: Not Specified
    	Module Manufacturer ID: Bank 1, Hex 0xCE
    	Module Product ID: Unknown
    	Memory Subsystem Controller Manufacturer ID: Unknown
    	Memory Subsystem Controller Product ID: Unknown
    	Non-Volatile Size: None
    	Volatile Size: 32 GB
    	Cache Size: None
    	Logical Size: None

    Handle 0x001E, DMI type 17, 92 bytes
    Memory Device
    	Array Handle: 0x001C
    	Error Information Handle: Not Provided
    	Total Width: 64 bits
    	Data Width: 64 bits
    	Size: 32 GB
    	Form Factor: DIMM
    	Set: None
    	Locator: DIMMA2
    	Bank Locator: P0_Node0_Channel0_Dimm1
    	Type: <OUT OF SPEC>
    	Type Detail: Synchronous Unbuffered (Unregistered)
    	Speed: 4800 MT/s
    	Manufacturer: Samsung
    	Serial Number: 80CE01225004143D96
    	Asset Tag: 9876543210
    	Part Number: M323R4GA3BB0-CQKOL
    	Rank: 2
    	Configured Memory Speed: 3600 MT/s
    	Minimum Voltage: 1.1 V
    	Maximum Voltage: 1.1 V
    	Configured Voltage: 1.1 V
    	Memory Technology: DRAM
    	Memory Operating Mode Capability: Volatile memory
    	Firmware Version: Not Specified
    	Module Manufacturer ID: Bank 1, Hex 0xCE
    	Module Product ID: Unknown
    	Memory Subsystem Controller Manufacturer ID: Unknown
    	Memory Subsystem Controller Product ID: Unknown
    	Non-Volatile Size: None
    	Volatile Size: 32 GB
    	Cache Size: None
    	Logical Size: None

    Handle 0x001F, DMI type 17, 92 bytes
    Memory Device
    	Array Handle: 0x001C
    	Error Information Handle: Not Provided
    	Total Width: 64 bits
    	Data Width: 64 bits
    	Size: 32 GB
    	Form Factor: DIMM
    	Set: None
    	Locator: DIMMB1
    	Bank Locator: P0_Node0_Channel1_Dimm0
    	Type: <OUT OF SPEC>
    	Type Detail: Synchronous Unbuffered (Unregistered)
    	Speed: 4800 MT/s
    	Manufacturer: Samsung
    	Serial Number: 80CE01225004142720
    	Asset Tag: 9876543210
    	Part Number: M323R4GA3BB0-CQKOL
    	Rank: 2
    	Configured Memory Speed: 3600 MT/s
    	Minimum Voltage: 1.1 V
    	Maximum Voltage: 1.1 V
    	Configured Voltage: 1.1 V
    	Memory Technology: DRAM
    	Memory Operating Mode Capability: Volatile memory
    	Firmware Version: Not Specified
    	Module Manufacturer ID: Bank 1, Hex 0xCE
    	Module Product ID: Unknown
    	Memory Subsystem Controller Manufacturer ID: Unknown
    	Memory Subsystem Controller Product ID: Unknown
    	Non-Volatile Size: None
    	Volatile Size: 32 GB
    	Cache Size: None
    	Logical Size: None

    Handle 0x0020, DMI type 17, 92 bytes
    Memory Device
    	Array Handle: 0x001C
    	Error Information Handle: Not Provided
    	Total Width: 64 bits
    	Data Width: 64 bits
    	Size: 32 GB
    	Form Factor: DIMM
    	Set: None
    	Locator: DIMMB2
    	Bank Locator: P0_Node0_Channel1_Dimm1
    	Type: <OUT OF SPEC>
    	Type Detail: Synchronous Unbuffered (Unregistered)
    	Speed: 4800 MT/s
    	Manufacturer: Samsung
    	Serial Number: 80CE0122500414276A
    	Asset Tag: 9876543210
    	Part Number: M323R4GA3BB0-CQKOL
    	Rank: 2
    	Configured Memory Speed: 3600 MT/s
    	Minimum Voltage: 1.1 V
    	Maximum Voltage: 1.1 V
    	Configured Voltage: 1.1 V
    	Memory Technology: DRAM
    	Memory Operating Mode Capability: Volatile memory
    	Firmware Version: Not Specified
    	Module Manufacturer ID: Bank 1, Hex 0xCE
    	Module Product ID: Unknown
    	Memory Subsystem Controller Manufacturer ID: Unknown
    	Memory Subsystem Controller Product ID: Unknown
    	Non-Volatile Size: None
    	Volatile Size: 32 GB
    	Cache Size: None
    	Logical Size: None

[1]: https://github.com/linuxhw/Dmesg
[2]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.6.0.pdf

Cc: Jean Delvare <jdelvare@suse.de>
Link: https://lore.kernel.org/all/20240427094603.b266oz2d5oaar4b3@ninjato/
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/i2c/i2c-smbus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 97f338b123b11..f87f8e1383cc7 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -308,7 +308,7 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
  * target systems are the same.
  * Restrictions to automatic SPD instantiation:
  *  - Only works if all filled slots have the same memory type
- *  - Only works for DDR, DDR2, DDR3 and DDR4 for now
+ *  - Only works for DDR, DDR2, DDR3, DDR4 and DDR5 for now
  *  - Only works on systems with 1 to 8 memory slots
  */
 #if IS_ENABLED(CONFIG_DMI)
@@ -382,6 +382,12 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	case 0x1E:	/* LPDDR4 */
 		name = "ee1004";
 		break;
+	case 0x22:	/* DDR5 */
+	case 0x23:	/* LPDDR5 */
+		dev_info(&adap->dev,
+			 "(LP)DDR5 SPD (memory type 0x%02x) not supported. JEDEC JESD300-5 compatible driver does not exist yet, not instantiating SPD\n",
+			 common_mem_type);
+		return;
 	default:
 		dev_info(&adap->dev,
 			 "Memory type 0x%02x not supported yet, not instantiating SPD\n",
-- 
2.40.1


