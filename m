Return-Path: <linux-i2c+bounces-6785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD2C97A0F8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2501C2193C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1464815666B;
	Mon, 16 Sep 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PchLsjXn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59101534FB;
	Mon, 16 Sep 2024 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488166; cv=none; b=E99qtG04P4bI9og7eOTSHR5mrB/yk3K8wTrZ8t/KYe50FM0cUgHpGrDZXvUsXjxxksfpLuWrozjRN7zlM2kUcAiEJd4kvymmhLG9gxJm1sd4VyMCZjhsJZ6HjtWLRoUEXPSPjbUm7uQxOlUu+90fws2WGA2rs29JGoXmQuT++I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488166; c=relaxed/simple;
	bh=bg+I4h26eEN07R1ULIoAgV/yRpIEuUkmcm070Rw0j+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd9YiVQ1RXJA+l557TGydnW/2zXl9YcwJOFsd1gqsx9tjm1SoGG1gUQ+5rz4dcOdxHn0u3tpUjxNS9U1cBOqc1QyEn0p480M0cRTOPAiBzQMsavMKzQ8eMTfj5Z1HjuJBvS5CapUGnm7yKYD0d30yBMSlfKsHdWPWxM6wuDnrvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PchLsjXn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488165; x=1758024165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bg+I4h26eEN07R1ULIoAgV/yRpIEuUkmcm070Rw0j+U=;
  b=PchLsjXnMc32ZgrCjwTo40cjSVOh/fLsKhsdOJoXdN6MkMRbCpcK5XBD
   lm2Zfu0zxwtZPO5JyNBMlzWJehIWpsMEzLCzR4Woj29YO6GyMXHPngDyb
   7WEMd2gigGMJ9o7qjz+9yj+68xu4tt6NcCTFWqbDNT8CPe8aJ1q5g60+q
   6/FkmrMR6dj4mu3a7PhJCCw5qXJo0EDkxbo+4WmM4CKzTdBMIeGItooR3
   E9Leeiu3fDjUyMABAT4NL5AYWn4Vnlv0BPeubTmJYiwKYcmw6Q6mWMtZ2
   sgIn4irLiRazWTYYTaLaK0q6ai8UWC+RKXVQWj2ntaDR+MMP5+pKIOqPn
   g==;
X-CSE-ConnectionGUID: Q4KyiO4LQuOGXuyvHunedg==
X-CSE-MsgGUID: nwPwNgkARsCYC00A+IPslQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24842801"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24842801"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:42 -0700
X-CSE-ConnectionGUID: Jv2DB1rHSu2/4KDueRfcuA==
X-CSE-MsgGUID: SrSY0GEYS3mUGyTEaFKcJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68540772"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 05:02:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CBCCC64A; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 04/11] i2c: isch: Use custom private data structure
Date: Mon, 16 Sep 2024 15:01:31 +0300
Message-ID: <20240916120237.1385982-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
References: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
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
index 0eaefb7b8bca..0fe7c9d1dd0d 100644
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
 		 "SMBus SCH adapter at %04x", (unsigned short)res->start);
 
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


