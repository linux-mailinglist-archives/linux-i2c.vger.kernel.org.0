Return-Path: <linux-i2c+bounces-6576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA49975785
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA111F21E15
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F2C1AB6FE;
	Wed, 11 Sep 2024 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XI9L3Kaw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D561AC88D;
	Wed, 11 Sep 2024 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069713; cv=none; b=GDN6f9GMj+mcVdwu01AyM3wo7r2Ve16zoa4Wbfmmx6/PC2bC7yjaAj6uinwatHZ0bdnk+JqMtEmy1odUgbykJ0OajVw4YqWqE84YYkUw7LXoqBwCDl095oUHxfICEpIMw3HhVdk0y0f8l6N7eWNkO/nsFZFzLxBhGdLE0D6ziR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069713; c=relaxed/simple;
	bh=yjaFY7nnLhagAzQ5YObAjZVeoGqHQoN8mznJsgkusn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgnNZDsEn6VMXQppR7icB/Y5fwMatoYHynDNXSAPnr4r6oBWAooyEb7c0kRv3bXiZYp1jeKRR50tc73lOlw0cAE2w3la3U2O4eAByCeLTjOHiFtVU5DtYEFeIAaVHPc2cLobbOzBQ+23lBNuvqQ9MyJUEd4ZN1NPGc4gU6SD1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XI9L3Kaw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069709; x=1757605709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yjaFY7nnLhagAzQ5YObAjZVeoGqHQoN8mznJsgkusn4=;
  b=XI9L3KawmhgQfvEvcMZGB6zzUc2DObmmbjFj5/0LgT40z7X2tmPVJbPD
   cGHNnmrMeUzgBhYkUQmf2D8zFZ5Amm8lJyXr8mqVFAvhFd3+wVc0Mt5MJ
   afqg/eO/exd2E6gt/pIi6Q3hreubM/6IFzRlTwUbJ6i6B4lFSIctx+dsU
   OO+JqwZVZxm8lm7bXjvKINspQVzFqa7xZPTVMMdJqmqVIQGozEskZDLAZ
   Xtd1VLtHHmlP/nwVaMHlKpDBL9myyvXSZbiBgBh15o+/xXMDH3Ot4xNPy
   nd4tk+Y+R0bF7Ob7E9Ga9MrIYl5uypT2TezHCxHT8VzIeMCExNJM9rIWW
   g==;
X-CSE-ConnectionGUID: AmfAYkppRqizbpDN4nfEwA==
X-CSE-MsgGUID: tGkcICBGQLKrMa1kn6AcWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701816"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:24 -0700
X-CSE-ConnectionGUID: vEoEUQsKREOFD+I0cQSNqA==
X-CSE-MsgGUID: UUfL63XBQXGlsUZyl27biQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388552"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6F98B457; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Date: Wed, 11 Sep 2024 18:39:17 +0300
Message-ID: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert driver to use memory mapped IO accessors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 133 ++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 55 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index f44c5fa276dc..8d34d4398f9b 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -24,16 +24,17 @@
 #include <linux/io.h>
 #include <linux/stddef.h>
 #include <linux/string_choices.h>
+#include <linux/types.h>
 
 /* SCH SMBus address offsets */
-#define SMBHSTCNT	(0 + sch_smba)
-#define SMBHSTSTS	(1 + sch_smba)
-#define SMBHSTCLK	(2 + sch_smba)
-#define SMBHSTADD	(4 + sch_smba) /* TSA */
-#define SMBHSTCMD	(5 + sch_smba)
-#define SMBHSTDAT0	(6 + sch_smba)
-#define SMBHSTDAT1	(7 + sch_smba)
-#define SMBBLKDAT	(0x20 + sch_smba)
+#define SMBHSTCNT	0x00
+#define SMBHSTSTS	0x01
+#define SMBHSTCLK	0x02
+#define SMBHSTADD	0x04	/* TSA */
+#define SMBHSTCMD	0x05
+#define SMBHSTDAT0	0x06
+#define SMBHSTDAT1	0x07
+#define SMBBLKDAT	0x20
 
 /* Other settings */
 #define MAX_RETRIES	5000
@@ -45,12 +46,33 @@
 #define SCH_WORD_DATA		0x03
 #define SCH_BLOCK_DATA		0x05
 
-static unsigned short sch_smba;
 static struct i2c_adapter sch_adapter;
+static void __iomem *sch_smba;
+
 static int backbone_speed = 33000; /* backbone speed in kHz */
 module_param(backbone_speed, int, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(backbone_speed, "Backbone speed in kHz, (default = 33000)");
 
+static inline u8 sch_io_rd8(void __iomem *smba, unsigned int offset)
+{
+	return ioread8(smba + offset);
+}
+
+static inline void sch_io_wr8(void __iomem *smba, unsigned int offset, u8 value)
+{
+	iowrite8(value, smba + offset);
+}
+
+static inline u16 sch_io_rd16(void __iomem *smba, unsigned int offset)
+{
+	return ioread16(smba + offset);
+}
+
+static inline void sch_io_wr16(void __iomem *smba, unsigned int offset, u16 value)
+{
+	iowrite16(value, smba + offset);
+}
+
 /*
  * Start the i2c transaction -- the i2c_access will prepare the transaction
  * and this function will execute it.
@@ -64,20 +86,20 @@ static int sch_transaction(struct i2c_adapter *adap)
 
 	dev_dbg(&adap->dev,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
-		inb(SMBHSTCNT),
-		inb(SMBHSTCMD), inb(SMBHSTADD), inb(SMBHSTDAT0),
-		inb(SMBHSTDAT1));
+		sch_io_rd8(sch_smba, SMBHSTCNT), sch_io_rd8(sch_smba, SMBHSTCMD),
+		sch_io_rd8(sch_smba, SMBHSTADD),
+		sch_io_rd8(sch_smba, SMBHSTDAT0), sch_io_rd8(sch_smba, SMBHSTDAT1));
 
 	/* Make sure the SMBus host is ready to start transmitting */
-	temp = inb(SMBHSTSTS) & 0x0f;
+	temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
 		if (temp & 0x01)
 			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
 		if (temp & 0x06)
 			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
-		outb(temp, SMBHSTSTS);
-		temp = inb(SMBHSTSTS) & 0x0f;
+		sch_io_wr8(sch_smba, SMBHSTSTS, temp);
+		temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
 		if (temp) {
 			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
@@ -85,11 +107,13 @@ static int sch_transaction(struct i2c_adapter *adap)
 	}
 
 	/* start the transaction by setting bit 4 */
-	outb(inb(SMBHSTCNT) | 0x10, SMBHSTCNT);
+	temp = sch_io_rd8(sch_smba, SMBHSTCNT);
+	temp |= 0x10;
+	sch_io_wr8(sch_smba, SMBHSTCNT, temp);
 
 	do {
 		usleep_range(100, 200);
-		temp = inb(SMBHSTSTS) & 0x0f;
+		temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
 	} while ((temp & 0x08) && (retries++ < MAX_RETRIES));
 
 	/* If the SMBus is still busy, we give up */
@@ -105,8 +129,8 @@ static int sch_transaction(struct i2c_adapter *adap)
 		dev_err(&adap->dev, "Error: no response!\n");
 	} else if (temp & 0x01) {
 		dev_dbg(&adap->dev, "Post complete!\n");
-		outb(temp, SMBHSTSTS);
-		temp = inb(SMBHSTSTS) & 0x07;
+		sch_io_wr8(sch_smba, SMBHSTSTS, temp);
+		temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
 			dev_dbg(&adap->dev,
@@ -117,9 +141,9 @@ static int sch_transaction(struct i2c_adapter *adap)
 		dev_dbg(&adap->dev, "No such address.\n");
 	}
 	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
-		inb(SMBHSTCNT),
-		inb(SMBHSTCMD), inb(SMBHSTADD), inb(SMBHSTDAT0),
-		inb(SMBHSTDAT1));
+		sch_io_rd8(sch_smba, SMBHSTCNT), sch_io_rd8(sch_smba, SMBHSTCMD),
+		sch_io_rd8(sch_smba, SMBHSTADD),
+		sch_io_rd8(sch_smba, SMBHSTDAT0), sch_io_rd8(sch_smba, SMBHSTDAT1));
 	return result;
 }
 
@@ -137,12 +161,12 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	int i, len, temp, rc;
 
 	/* Make sure the SMBus host is not busy */
-	temp = inb(SMBHSTSTS) & 0x0f;
+	temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
 		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
-	temp = inw(SMBHSTCLK);
+	temp = sch_io_rd16(sch_smba, SMBHSTCLK);
 	if (!temp) {
 		/*
 		 * We can't determine if we have 33 or 25 MHz clock for
@@ -151,47 +175,47 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * run ~75 kHz instead which should do no harm.
 		 */
 		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
-		outw(backbone_speed / (4 * 100), SMBHSTCLK);
+		sch_io_wr16(sch_smba, SMBHSTCLK, backbone_speed / (4 * 100));
 	}
 
 	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
-		outb((addr << 1) | read_write, SMBHSTADD);
+		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
 		size = SCH_QUICK;
 		break;
 	case I2C_SMBUS_BYTE:
-		outb((addr << 1) | read_write, SMBHSTADD);
+		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
 		if (read_write == I2C_SMBUS_WRITE)
-			outb(command, SMBHSTCMD);
+			sch_io_wr8(sch_smba, SMBHSTCMD, command);
 		size = SCH_BYTE;
 		break;
 	case I2C_SMBUS_BYTE_DATA:
-		outb((addr << 1) | read_write, SMBHSTADD);
-		outb(command, SMBHSTCMD);
+		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(sch_smba, SMBHSTCMD, command);
 		if (read_write == I2C_SMBUS_WRITE)
-			outb(data->byte, SMBHSTDAT0);
+			sch_io_wr8(sch_smba, SMBHSTDAT0, data->byte);
 		size = SCH_BYTE_DATA;
 		break;
 	case I2C_SMBUS_WORD_DATA:
-		outb((addr << 1) | read_write, SMBHSTADD);
-		outb(command, SMBHSTCMD);
+		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(sch_smba, SMBHSTCMD, command);
 		if (read_write == I2C_SMBUS_WRITE) {
-			outb(data->word & 0xff, SMBHSTDAT0);
-			outb((data->word & 0xff00) >> 8, SMBHSTDAT1);
+			sch_io_wr8(sch_smba, SMBHSTDAT0, data->word >> 0);
+			sch_io_wr8(sch_smba, SMBHSTDAT1, data->word >> 8);
 		}
 		size = SCH_WORD_DATA;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
-		outb((addr << 1) | read_write, SMBHSTADD);
-		outb(command, SMBHSTCMD);
+		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(sch_smba, SMBHSTCMD, command);
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if (len == 0 || len > I2C_SMBUS_BLOCK_MAX)
 				return -EINVAL;
-			outb(len, SMBHSTDAT0);
+			sch_io_wr8(sch_smba, SMBHSTDAT0, len);
 			for (i = 1; i <= len; i++)
-				outb(data->block[i], SMBBLKDAT+i-1);
+				sch_io_wr8(sch_smba, SMBBLKDAT + i - 1, data->block[i]);
 		}
 		size = SCH_BLOCK_DATA;
 		break;
@@ -200,7 +224,10 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		return -EOPNOTSUPP;
 	}
 	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
-	outb((inb(SMBHSTCNT) & 0xb0) | (size & 0x7), SMBHSTCNT);
+
+	temp = sch_io_rd8(sch_smba, SMBHSTCNT);
+	temp = (temp & 0xb0) | (size & 0x7);
+	sch_io_wr8(sch_smba, SMBHSTCNT, temp);
 
 	rc = sch_transaction(adap);
 	if (rc)	/* Error in transaction */
@@ -212,17 +239,18 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case SCH_BYTE:
 	case SCH_BYTE_DATA:
-		data->byte = inb(SMBHSTDAT0);
+		data->byte = sch_io_rd8(sch_smba, SMBHSTDAT0);
 		break;
 	case SCH_WORD_DATA:
-		data->word = inb(SMBHSTDAT0) + (inb(SMBHSTDAT1) << 8);
+		data->word = (sch_io_rd8(sch_smba, SMBHSTDAT0) << 0) +
+			     (sch_io_rd8(sch_smba, SMBHSTDAT1) << 8);
 		break;
 	case SCH_BLOCK_DATA:
-		data->block[0] = inb(SMBHSTDAT0);
+		data->block[0] = sch_io_rd8(sch_smba, SMBHSTDAT0);
 		if (data->block[0] == 0 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
 			return -EPROTO;
 		for (i = 1; i <= data->block[0]; i++)
-			data->block[i] = inb(SMBBLKDAT+i-1);
+			data->block[i] = sch_io_rd8(sch_smba, SMBBLKDAT + i - 1);
 		break;
 	}
 	return 0;
@@ -255,26 +283,21 @@ static int smbus_sch_probe(struct platform_device *dev)
 	if (!res)
 		return -EBUSY;
 
-	if (!devm_request_region(&dev->dev, res->start, resource_size(res),
-				 dev->name)) {
-		dev_err(&dev->dev, "SMBus region 0x%x already in use!\n",
-			sch_smba);
+	sch_smba = devm_ioport_map(&dev->dev, res->start, resource_size(res));
+	if (!sch_smba) {
+		dev_err(&dev->dev, "SMBus region %pR already in use!\n", res);
 		return -EBUSY;
 	}
 
-	sch_smba = res->start;
-
-	dev_dbg(&dev->dev, "SMBA = 0x%X\n", sch_smba);
-
 	/* set up the sysfs linkage to our parent device */
 	sch_adapter.dev.parent = &dev->dev;
 
 	snprintf(sch_adapter.name, sizeof(sch_adapter.name),
-		"SMBus SCH adapter at %04x", sch_smba);
+		"SMBus SCH adapter at %04x", res->start);
 
 	retval = i2c_add_adapter(&sch_adapter);
 	if (retval)
-		sch_smba = 0;
+		sch_smba = NULL;
 
 	return retval;
 }
@@ -283,7 +306,7 @@ static void smbus_sch_remove(struct platform_device *pdev)
 {
 	if (sch_smba) {
 		i2c_del_adapter(&sch_adapter);
-		sch_smba = 0;
+		sch_smba = NULL;
 	}
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


