Return-Path: <linux-i2c+bounces-6579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9D97578D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EE09B285E7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B67F1B2ECD;
	Wed, 11 Sep 2024 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAB8itVW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBFC1B011C;
	Wed, 11 Sep 2024 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069715; cv=none; b=AjUQNvxwmoz+yOLyJQ1dvFKtT4k/tmEN9cryhLOk2hA5F5Rom2Wnh/oAck0NSln9iwGUJnqSsqUTi+VPHRUGZejDWsNDCmkyZRq+fo6Sib3VuV0aIYa1qV5NMECoewm/9ckBJQPh6U4ONbvrvRAQSVz7prbk3iQjA1su9OiRu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069715; c=relaxed/simple;
	bh=Xpw2+YEb2iWnowHsxmfht9awwdZzRi0FBet/AgU6naY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icnE1fBCPzSvV2WjQ8Cn0YenuYSJMx8kKTiUrHprIomU3QhDuFSf+ocOcMH11s0o0uECQ8/yQf+wOqyWRWcalrOavZnJIZFDfgOJV2ASNLNkfCDcQn/b2hefEKZ4WzNANUhv640JaYX0Urb2Mz6IyaFnKyVVOI/fZh19uSD5Mn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAB8itVW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069713; x=1757605713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xpw2+YEb2iWnowHsxmfht9awwdZzRi0FBet/AgU6naY=;
  b=FAB8itVWJmMkPDGor+1TP/4vlqqSWWLjWOhlVGKS4F9DV232UUcMvLiq
   N7Gl8hit7KpjggdrZJvSxxraGCixsErKVkt1iUNgjv5jdYJRCkW5lI3G2
   8dG49vfiu70ca42vVRgZgCa/1d6wTuO0Ho38PMjWgbc9auA+gneNSq/IB
   QC/rIzaIt2esfOzvdurR89CElJgbU5GlgArHQWDFKVYmH6s9JRR05anzP
   PtVw88SiAqTg9N0DFlU7aweUZtigz30xSD+KNkDqvFUBKIqAPtmbMkdkV
   tY9kfqzxjQgjepdZ3k63LYa5ZVSYimLMND5xIfIAtepRvOUTpk/+i5BgW
   Q==;
X-CSE-ConnectionGUID: T1Yoz48EQcmD6dYMmSEPCg==
X-CSE-MsgGUID: sAPvL6SjQ9qb7rDtn42/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701849"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:26 -0700
X-CSE-ConnectionGUID: EnSrS9SnR4mRbTQQ6nCm8A==
X-CSE-MsgGUID: EdzXl8EFTO2CPiI31oHCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388564"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7FE324C7; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 05/12] i2c: isch: Use custom private data structure
Date: Wed, 11 Sep 2024 18:39:18 +0300
Message-ID: <20240911154820.2846187-6-andriy.shevchenko@linux.intel.com>
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

Use custom private data structure instead of global variables.
With that, remove not anymore true comment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 145 ++++++++++++++++++----------------
 1 file changed, 75 insertions(+), 70 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 8d34d4398f9b..4ec6c0a66a96 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -9,16 +9,14 @@
 
 */
 
-/*
-   Supports:
-	Intel SCH chipsets (AF82US15W, AF82US15L, AF82UL11L)
-   Note: we assume there can only be one device, with one SMBus interface.
-*/
+/* Supports: Intel SCH chipsets (AF82US15W, AF82US15L, AF82UL11L) */
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/kernel.h>
+#include <linux/container_of.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/ioport.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
@@ -46,31 +44,33 @@
 #define SCH_WORD_DATA		0x03
 #define SCH_BLOCK_DATA		0x05
 
-static struct i2c_adapter sch_adapter;
-static void __iomem *sch_smba;
+struct sch_i2c {
+	struct i2c_adapter adapter;
+	void __iomem *smba;
+};
 
 static int backbone_speed = 33000; /* backbone speed in kHz */
 module_param(backbone_speed, int, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(backbone_speed, "Backbone speed in kHz, (default = 33000)");
 
-static inline u8 sch_io_rd8(void __iomem *smba, unsigned int offset)
+static inline u8 sch_io_rd8(struct sch_i2c *priv, unsigned int offset)
 {
-	return ioread8(smba + offset);
+	return ioread8(priv->smba + offset);
 }
 
-static inline void sch_io_wr8(void __iomem *smba, unsigned int offset, u8 value)
+static inline void sch_io_wr8(struct sch_i2c *priv, unsigned int offset, u8 value)
 {
-	iowrite8(value, smba + offset);
+	iowrite8(value, priv->smba + offset);
 }
 
-static inline u16 sch_io_rd16(void __iomem *smba, unsigned int offset)
+static inline u16 sch_io_rd16(struct sch_i2c *priv, unsigned int offset)
 {
-	return ioread16(smba + offset);
+	return ioread16(priv->smba + offset);
 }
 
-static inline void sch_io_wr16(void __iomem *smba, unsigned int offset, u16 value)
+static inline void sch_io_wr16(struct sch_i2c *priv, unsigned int offset, u16 value)
 {
-	iowrite16(value, smba + offset);
+	iowrite16(value, priv->smba + offset);
 }
 
 /*
@@ -80,26 +80,27 @@ static inline void sch_io_wr16(void __iomem *smba, unsigned int offset, u16 valu
  */
 static int sch_transaction(struct i2c_adapter *adap)
 {
+	struct sch_i2c *priv = container_of(adap, struct sch_i2c, adapter);
 	int temp;
 	int result = 0;
 	int retries = 0;
 
 	dev_dbg(&adap->dev,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
-		sch_io_rd8(sch_smba, SMBHSTCNT), sch_io_rd8(sch_smba, SMBHSTCMD),
-		sch_io_rd8(sch_smba, SMBHSTADD),
-		sch_io_rd8(sch_smba, SMBHSTDAT0), sch_io_rd8(sch_smba, SMBHSTDAT1));
+		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
+		sch_io_rd8(priv, SMBHSTADD),
+		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
 
 	/* Make sure the SMBus host is ready to start transmitting */
-	temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
+	temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
 		if (temp & 0x01)
 			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
 		if (temp & 0x06)
 			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
-		sch_io_wr8(sch_smba, SMBHSTSTS, temp);
-		temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
+		sch_io_wr8(priv, SMBHSTSTS, temp);
+		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 		if (temp) {
 			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
@@ -107,13 +108,13 @@ static int sch_transaction(struct i2c_adapter *adap)
 	}
 
 	/* start the transaction by setting bit 4 */
-	temp = sch_io_rd8(sch_smba, SMBHSTCNT);
+	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp |= 0x10;
-	sch_io_wr8(sch_smba, SMBHSTCNT, temp);
+	sch_io_wr8(priv, SMBHSTCNT, temp);
 
 	do {
 		usleep_range(100, 200);
-		temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
+		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	} while ((temp & 0x08) && (retries++ < MAX_RETRIES));
 
 	/* If the SMBus is still busy, we give up */
@@ -129,8 +130,8 @@ static int sch_transaction(struct i2c_adapter *adap)
 		dev_err(&adap->dev, "Error: no response!\n");
 	} else if (temp & 0x01) {
 		dev_dbg(&adap->dev, "Post complete!\n");
-		sch_io_wr8(sch_smba, SMBHSTSTS, temp);
-		temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x07;
+		sch_io_wr8(priv, SMBHSTSTS, temp);
+		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
 			dev_dbg(&adap->dev,
@@ -141,9 +142,9 @@ static int sch_transaction(struct i2c_adapter *adap)
 		dev_dbg(&adap->dev, "No such address.\n");
 	}
 	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
-		sch_io_rd8(sch_smba, SMBHSTCNT), sch_io_rd8(sch_smba, SMBHSTCMD),
-		sch_io_rd8(sch_smba, SMBHSTADD),
-		sch_io_rd8(sch_smba, SMBHSTDAT0), sch_io_rd8(sch_smba, SMBHSTDAT1));
+		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
+		sch_io_rd8(priv, SMBHSTADD),
+		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
 	return result;
 }
 
@@ -158,15 +159,16 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 unsigned short flags, char read_write,
 		 u8 command, int size, union i2c_smbus_data *data)
 {
+	struct sch_i2c *priv = container_of(adap, struct sch_i2c, adapter);
 	int i, len, temp, rc;
 
 	/* Make sure the SMBus host is not busy */
-	temp = sch_io_rd8(sch_smba, SMBHSTSTS) & 0x0f;
+	temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
 		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
-	temp = sch_io_rd16(sch_smba, SMBHSTCLK);
+	temp = sch_io_rd16(priv, SMBHSTCLK);
 	if (!temp) {
 		/*
 		 * We can't determine if we have 33 or 25 MHz clock for
@@ -175,47 +177,47 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * run ~75 kHz instead which should do no harm.
 		 */
 		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
-		sch_io_wr16(sch_smba, SMBHSTCLK, backbone_speed / (4 * 100));
+		sch_io_wr16(priv, SMBHSTCLK, backbone_speed / (4 * 100));
 	}
 
 	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
-		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
 		size = SCH_QUICK;
 		break;
 	case I2C_SMBUS_BYTE:
-		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
 		if (read_write == I2C_SMBUS_WRITE)
-			sch_io_wr8(sch_smba, SMBHSTCMD, command);
+			sch_io_wr8(priv, SMBHSTCMD, command);
 		size = SCH_BYTE;
 		break;
 	case I2C_SMBUS_BYTE_DATA:
-		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
-		sch_io_wr8(sch_smba, SMBHSTCMD, command);
+		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(priv, SMBHSTCMD, command);
 		if (read_write == I2C_SMBUS_WRITE)
-			sch_io_wr8(sch_smba, SMBHSTDAT0, data->byte);
+			sch_io_wr8(priv, SMBHSTDAT0, data->byte);
 		size = SCH_BYTE_DATA;
 		break;
 	case I2C_SMBUS_WORD_DATA:
-		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
-		sch_io_wr8(sch_smba, SMBHSTCMD, command);
+		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(priv, SMBHSTCMD, command);
 		if (read_write == I2C_SMBUS_WRITE) {
-			sch_io_wr8(sch_smba, SMBHSTDAT0, data->word >> 0);
-			sch_io_wr8(sch_smba, SMBHSTDAT1, data->word >> 8);
+			sch_io_wr8(priv, SMBHSTDAT0, data->word >> 0);
+			sch_io_wr8(priv, SMBHSTDAT1, data->word >> 8);
 		}
 		size = SCH_WORD_DATA;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
-		sch_io_wr8(sch_smba, SMBHSTADD, (addr << 1) | read_write);
-		sch_io_wr8(sch_smba, SMBHSTCMD, command);
+		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
+		sch_io_wr8(priv, SMBHSTCMD, command);
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if (len == 0 || len > I2C_SMBUS_BLOCK_MAX)
 				return -EINVAL;
-			sch_io_wr8(sch_smba, SMBHSTDAT0, len);
+			sch_io_wr8(priv, SMBHSTDAT0, len);
 			for (i = 1; i <= len; i++)
-				sch_io_wr8(sch_smba, SMBBLKDAT + i - 1, data->block[i]);
+				sch_io_wr8(priv, SMBBLKDAT + i - 1, data->block[i]);
 		}
 		size = SCH_BLOCK_DATA;
 		break;
@@ -225,9 +227,9 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	}
 	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
 
-	temp = sch_io_rd8(sch_smba, SMBHSTCNT);
+	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp = (temp & 0xb0) | (size & 0x7);
-	sch_io_wr8(sch_smba, SMBHSTCNT, temp);
+	sch_io_wr8(priv, SMBHSTCNT, temp);
 
 	rc = sch_transaction(adap);
 	if (rc)	/* Error in transaction */
@@ -239,18 +241,18 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case SCH_BYTE:
 	case SCH_BYTE_DATA:
-		data->byte = sch_io_rd8(sch_smba, SMBHSTDAT0);
+		data->byte = sch_io_rd8(priv, SMBHSTDAT0);
 		break;
 	case SCH_WORD_DATA:
-		data->word = (sch_io_rd8(sch_smba, SMBHSTDAT0) << 0) +
-			     (sch_io_rd8(sch_smba, SMBHSTDAT1) << 8);
+		data->word = (sch_io_rd8(priv, SMBHSTDAT0) << 0) +
+			     (sch_io_rd8(priv, SMBHSTDAT1) << 8);
 		break;
 	case SCH_BLOCK_DATA:
-		data->block[0] = sch_io_rd8(sch_smba, SMBHSTDAT0);
+		data->block[0] = sch_io_rd8(priv, SMBHSTDAT0);
 		if (data->block[0] == 0 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
 			return -EPROTO;
 		for (i = 1; i <= data->block[0]; i++)
-			data->block[i] = sch_io_rd8(sch_smba, SMBBLKDAT + i - 1);
+			data->block[i] = sch_io_rd8(priv, SMBBLKDAT + i - 1);
 		break;
 	}
 	return 0;
@@ -268,46 +270,49 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= sch_func,
 };
 
-static struct i2c_adapter sch_adapter = {
-	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON,
-	.algo		= &smbus_algorithm,
-};
-
 static int smbus_sch_probe(struct platform_device *dev)
 {
+	struct sch_i2c *priv;
 	struct resource *res;
 	int retval;
 
+	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
 	res = platform_get_resource(dev, IORESOURCE_IO, 0);
 	if (!res)
 		return -EBUSY;
 
-	sch_smba = devm_ioport_map(&dev->dev, res->start, resource_size(res));
-	if (!sch_smba) {
+	priv->smba = devm_ioport_map(&dev->dev, res->start, resource_size(res));
+	if (!priv->smba) {
 		dev_err(&dev->dev, "SMBus region %pR already in use!\n", res);
 		return -EBUSY;
 	}
 
 	/* set up the sysfs linkage to our parent device */
-	sch_adapter.dev.parent = &dev->dev;
+	priv->adapter.dev.parent = &dev->dev;
+	priv->adapter.owner = THIS_MODULE,
+	priv->adapter.class = I2C_CLASS_HWMON,
+	priv->adapter.algo = &smbus_algorithm,
 
-	snprintf(sch_adapter.name, sizeof(sch_adapter.name),
+	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
 		"SMBus SCH adapter at %04x", res->start);
 
-	retval = i2c_add_adapter(&sch_adapter);
+	retval = i2c_add_adapter(&priv->adapter);
 	if (retval)
-		sch_smba = NULL;
+		return retval;
 
-	return retval;
+	platform_set_drvdata(dev, priv);
+
+	return 0;
 }
 
 static void smbus_sch_remove(struct platform_device *pdev)
 {
-	if (sch_smba) {
-		i2c_del_adapter(&sch_adapter);
-		sch_smba = NULL;
-	}
+	struct sch_i2c *priv = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&priv->adapter);
 }
 
 static struct platform_driver smbus_sch_driver = {
-- 
2.43.0.rc1.1336.g36b5255a03ac


