Return-Path: <linux-i2c+bounces-14397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05394CA3777
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 12:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC20B301A734
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 11:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431A92FF67D;
	Thu,  4 Dec 2025 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myUayP67"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304012EC08D
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848497; cv=none; b=RkHhReBVRFjo37zO8q0HXFYOUqlvWYHXRGE43KfMGLee8/1jh3JgGMFcw49qO9AzTCBx5y+tBgYIVdRXNrzTYRi6Or8vQxQebFNlywdZFTr2iUTyUtV/QgNKeZn6XYLs15Chq/2QKYIDDigGjn1pclpCCPpJGzvOCPySd0TW8MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848497; c=relaxed/simple;
	bh=8ysDNsy2lkvgQyvTQ2XfxB4qq8ZeLthjTiIJRMygwBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOXe2o6elckploA/hKycNmdeEe9HIKNfuLsiUJpDFl+Uug9ICGojtcwePWF0ya7eJsFbFqBftiDkQcE1EK3md+hQ1nXV2P93taG0N606UaldBvBKPS1KEfYOJcYGJnA9Rb+9hJDtGHlR5YsErOhU29Mn/wLmt9oJ5jLEXtJelko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myUayP67; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59445ee9738so648082e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Dec 2025 03:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764848493; x=1765453293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haiFQ80Yih4RGujm7GCUrVKtIh86tkCb7eluzFIF+KQ=;
        b=myUayP67IETETvaANiXDWB3JVlkGs5D1658br34sXtDbMJx3C8yM+mDo759IMqvjlU
         jUGSWICguQOkZ/EwvLc8mR4iTHG1fgcoVEVeiDn5rB0HNp2ekTu7iU7gdSCfTHwS6P5E
         ksXaXCgrtf75UXNQcImlKQyA4FE4/hcLljsRo8xKDloz4TYMhrMB6aZdTgIitDopCYjJ
         QgiPr7iJ/4rIkMy4Zx+Npgwk3M3dVQNKOOv15rcULnsxeVEXO4HncV2JBFe8Pg7ONFVb
         w/pWdjcbEAR9AKrykVtGOXV/xPE4LGGOPskiIXqNnU807t/lyDJIA4Mag0oXsNfN3WuO
         hr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764848493; x=1765453293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=haiFQ80Yih4RGujm7GCUrVKtIh86tkCb7eluzFIF+KQ=;
        b=GDOqIiI9utfl6VJGwbZsJvq8PrkwF5ORF8md2kZKvJwzOBrxDyiJUoo6lgxXWxWA/d
         psYNpjl5IpRZmm7n/JtWiTfX2GKCHI2z8ZdUEAYb7xFpQ4nQapmt5Fvo2vwdvnBQXnfg
         uIMxzqHDx2HsvPRF8m/j3oivb/s9Hcg3kZqSlS9FrIFbaFdZ05gxPjE9gMgLy8ebYZwy
         9FcIdXaW4tiCbNZTiZWd+T5vBqj0BBuxEqDIOkhHJ1tBknXpg7rZt8maCC6OcEa7MAf6
         smPXvWkH8tR1zStSnNVhnaENQnGndzfqjKa3Luwu26EMfwVCUMaTy97pjfbQ4Q4U/TMO
         MRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxk3VflW6XsmONok21sEEL023UjkoW6udD+Ab0oZ8GNDhPu5RKYUNP8OcsoQExJfRQUkAnVLCJ8Io=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHpjjetAWbXcZGJLRqMs9wL/Uhyhd2X3tDwaLeXbafcUg8lqo
	T18AwsPMiEvrpX4+HtY9JDEs64htKSAoWZ5ZDedVmCRjwJTRvXozdzA0HRVEjem8
X-Gm-Gg: ASbGncvsmpvr2VKtzZvO7dY2639ZlPPtCmmBfgl+YjwLR9K9pds3b/B6U9RfL+xmiNQ
	gaaAWfN9QfRR/N9WPNo2lQNMUDmZp5LTfYwoFL5ocnpcx8s8deaGzB7akhzZ2lR9AwfihddDFTJ
	jWr3ax622DE3n3T0qAPnWjF7u25x2kkLUZCG1Et2fQl6alIySMELVxn+C+Qb2U8BFt5VJwJtHPj
	BgyxLjAUarzYFIS6cjw3DcBQqPNjCOTGbZ19oRbVe+7XpJq01zQ+QCoW+SAVo5kE+/hCX6U1/iq
	9quMLvAOWJW4VvI1WGmG0luiMZTrwphWdnCmAuc2AUZcy4nB9rg+jBmrJC3rgYDUqwvvtgotrhN
	KRQ9b47Q6dwrCvZsxjNtF8BVJRslVHFh7VGJmZRHiYo0NpRb8h0RA4eju+28C8Wm2NdWiibkg35
	SwixyBnDXYl8LJAVIGVyYXPDpspgMu
X-Google-Smtp-Source: AGHT+IEtztpJ7iBt4egd3bpkWCCHJ+oz0UMfLgzrvSsmcj/F5M/i7zeaJgUS2DpR+cKLH9oakJpHNg==
X-Received: by 2002:a05:6512:104f:b0:595:7d95:eaad with SMTP id 2adb3069b0e04-597d3f59bd2mr2466899e87.22.1764848492941;
        Thu, 04 Dec 2025 03:41:32 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2eaedsm430736e87.99.2025.12.04.03.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:41:32 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: a.shimko.dev@gmail.com
Cc: andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: [PATCH v2] i2c: designware: Replace magic numbers with named constants
Date: Thu,  4 Dec 2025 14:41:29 +0300
Message-ID: <20251204114129.607200-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106110935.2563071-1-a.shimko.dev@gmail.com>
References: <20251106110935.2563071-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace various magic numbers with properly named constants to improve
code readability and maintainability. This includes constants for
register access, timing adjustments, timeouts, FIFO parameters,
and default values.

The change makes the code more self-documenting without altering any
functionality.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---

Hello maintainers and reviewers,

Fix replaces magic numbers throughout the DesignWare I2C driver with named 
constants to improve code readability and maintainability.

The change introduces constants for register access, timing adjustments, 
timeouts, FIFO parameters, and default values, all properly documented 
with comments.

No functional changes.

Thank you for your consideration.
--
Regards,
Artem

ChangeLog:
  v1:
    * https://lore.kernel.org/all/20251105161845.2535367-1-a.shimko.dev@gmail.com/T/#u
  v2:
    * Move register-related constants to i2c-designware-core.h
    * Remove unnecessary comments to reduce clutter  
    * Keep only essential timeouts and default parameters in .c file
    * Use FIELD_GET() for FIFO depth extraction as suggested

 drivers/i2c/busses/i2c-designware-common.c | 33 ++++++++++++++--------
 drivers/i2c/busses/i2c-designware-core.h   | 13 +++++++++
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..3bc55068da03 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -12,6 +12,7 @@
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -34,6 +35,14 @@
 
 #include "i2c-designware-core.h"
 
+#define DW_IC_DEFAULT_BUS_CAPACITANCE_PF	100
+
+#define DW_IC_ABORT_TIMEOUT_US			10
+#define DW_IC_ABORT_TOTAL_TIMEOUT_US		100
+
+#define DW_IC_BUSY_POLL_TIMEOUT_US		1100
+#define DW_IC_BUSY_TOTAL_TIMEOUT_US		20000
+
 static const char *const abort_sources[] = {
 	[ABRT_7B_ADDR_NOACK] =
 		"slave address not acknowledged (7bit mode)",
@@ -106,7 +115,7 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
 	struct dw_i2c_dev *dev = context;
 
 	*val = readw(dev->base + reg) |
-		(readw(dev->base + reg + 2) << 16);
+		(readw(dev->base + reg + DW_IC_REG_STEP_BYTES) << DW_IC_REG_WORD_SHIFT);
 
 	return 0;
 }
@@ -116,7 +125,7 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
 	struct dw_i2c_dev *dev = context;
 
 	writew(val, dev->base + reg);
-	writew(val >> 16, dev->base + reg + 2);
+	writew(val >> DW_IC_REG_WORD_SHIFT, dev->base + reg + DW_IC_REG_STEP_BYTES);
 
 	return 0;
 }
@@ -165,7 +174,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_swab;
 		map_cfg.reg_write = dw_reg_write_swab;
-	} else if (reg == (DW_IC_COMP_TYPE_VALUE & 0x0000ffff)) {
+	} else if (reg == lower_16_bits(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_word;
 		map_cfg.reg_write = dw_reg_write_word;
 	} else if (reg != DW_IC_COMP_TYPE_VALUE) {
@@ -384,7 +393,7 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 	i2c_parse_fw_timings(device, t, false);
 
 	if (device_property_read_u32(device, "snps,bus-capacitance-pf", &dev->bus_capacitance_pF))
-		dev->bus_capacitance_pF = 100;
+		dev->bus_capacitance_pF = DW_IC_DEFAULT_BUS_CAPACITANCE_PF;
 
 	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
 
@@ -539,8 +548,9 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
-					       !(enable & DW_IC_ENABLE_ABORT), 10,
-					       100);
+					       !(enable & DW_IC_ENABLE_ABORT),
+					       DW_IC_ABORT_TIMEOUT_US,
+					       DW_IC_ABORT_TOTAL_TIMEOUT_US);
 		if (ret)
 			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
 	}
@@ -552,7 +562,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 		 * in that case this test reads zero and exits the loop.
 		 */
 		regmap_read(dev->map, DW_IC_ENABLE_STATUS, &status);
-		if ((status & 1) == 0)
+		if (!(status & 1))
 			return;
 
 		/*
@@ -635,7 +645,8 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
 
 	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
 				       !(status & DW_IC_STATUS_ACTIVITY),
-				       1100, 20000);
+				       DW_IC_BUSY_POLL_TIMEOUT_US,
+				       DW_IC_BUSY_TOTAL_TIMEOUT_US);
 	if (ret) {
 		dev_warn(dev->dev, "timeout waiting for bus ready\n");
 
@@ -699,12 +710,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	tx_fifo_depth = ((param >> 16) & 0xff) + 1;
-	rx_fifo_depth = ((param >> 8)  & 0xff) + 1;
+	tx_fifo_depth = FIELD_GET(DW_IC_FIFO_TX_FIELD, param) + 1;
+	rx_fifo_depth = FIELD_GET(DW_IC_FIFO_RX_FIELD, param) + 1;
 	if (!dev->tx_fifo_depth) {
 		dev->tx_fifo_depth = tx_fifo_depth;
 		dev->rx_fifo_depth = rx_fifo_depth;
-	} else if (tx_fifo_depth >= 2) {
+	} else if (tx_fifo_depth >= DW_IC_FIFO_MIN_DEPTH) {
 		dev->tx_fifo_depth = min_t(u32, dev->tx_fifo_depth,
 				tx_fifo_depth);
 		dev->rx_fifo_depth = min_t(u32, dev->rx_fifo_depth,
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..a699953bf5ae 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -41,6 +41,19 @@
 #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
 #define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
 
+/*
+ * Register access parameters
+ */
+#define DW_IC_REG_STEP_BYTES			2
+#define DW_IC_REG_WORD_SHIFT			16
+
+/*
+ * FIFO depth configuration
+ */
+#define DW_IC_FIFO_TX_FIELD			GENMASK(23, 16)
+#define DW_IC_FIFO_RX_FIELD			GENMASK(15, 8)
+#define DW_IC_FIFO_MIN_DEPTH			2
+
 /*
  * Registers offset
  */
-- 
2.43.0


