Return-Path: <linux-i2c+bounces-14406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 956A2CA46BC
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 17:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A1263006DB5
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 16:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1ED27FD52;
	Thu,  4 Dec 2025 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5Sn8Pjr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046B24E4A1
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764864804; cv=none; b=LbuIccKjEx8M+xZd2KuDpX5+yba9tGjbS5dxGIfBtKLPPMVogK+TQsEfrVkpRhZRSy9WXiSTMn2DXFlG8qUwOn7igA9OXRpA1wdNt1jGGAywzFHqYevYRSLgqrvLCVOBMAmxdpeq7YOouWR7yGDvysHgPEb14LUlIen50R3z+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764864804; c=relaxed/simple;
	bh=JdOkxLXW8b6lIxvVLFAtWH7bWp0ceG9INrVhPqd6gL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GX8xmK+UM7OGcES2Y7sBiQC87beAZlhmK9w2IWJb3Fc0WNCOz1SYzYzEaxYTPXydHl/a1WSPyphzbdRbZnQE+PTvq2hVK5LZdKKpE9RdfAkfpM0IvVQdmwP5itJb03s1P58U48vjNWtFqNtpPfJpq3t3QOQJLUxG/QQb439/7LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5Sn8Pjr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so1118191e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Dec 2025 08:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764864800; x=1765469600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sj741Y3xy0hshEscQp8Zqhug48OrxvmYFRlr1mGj0Y=;
        b=I5Sn8PjrZfvqOLS5gMooIeKhaDqFSSb0UCKwAEgTY9LHQQzLMmjgFgdHrngPERUZKZ
         V7gfWZcLO9DPchb9EPLiqABA02Fh8XWSUIaXk7H2+oam9R7U7d/zEaVDJO0+GIf3Z1OZ
         nHrf3griG77dWmPGmZEc5q4NZu/JFtZi56cHhnSt3rpFjnDghMR/u684Jo5c4kkMHQYH
         6HRDU+jga5uzKUlHl+sxL36mnDk85EBNhtVubFsIS2C/Bz8Y3kahNwvoUXf4FUZ+keCN
         AsW19L8ot6LuA8fGycOb+5IMrj4lVw6OrCER25jN/QKN/aLocJwJ2PWm9S4mcAk8kxCn
         /4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764864800; x=1765469600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Sj741Y3xy0hshEscQp8Zqhug48OrxvmYFRlr1mGj0Y=;
        b=k+Ft6auP5Aat5bYpbausH8b47qGaoDgthyMEKB8hxbVEXTBmsOWwxzehgfsB2i4Zcd
         0+EADNG56ZJ08mmFB704HYGuULlOIuXdc+kgmM3vVXz0fgls0sgTwd74U137f5E7o5w/
         3k0Z+w2fA9ScaTg3lWs+s3hdUosScHzfeFdovCkXNCmwzUwzyO2l07X8XU2tNxVgS4SK
         4F6eopiIjvi33IVb/FM9+O4IDsHYkgzDbBqRgN5YqUrtpub3XNpnWNTJElgShiGVMFz7
         JXkmH24SaepBEjfJTWSA3dMBpy1dUR42uFE3TEkP7aJgFsWQpNIYD64by0PYtax8ZzUo
         I4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWEfPY7uIP6jOBYXWZ7J6YoZQLn9ITfZ+htJhVNCS5BIDzR7OGhV3QCJQicYAVoEV3FJFq02PwXlGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxWN9LLPRpvsg1rmyMYaf44wg5frzLO+NqD/8rz0ssPj1yYms
	iIGogS1UBzQQVtMReS8tvdIXxIMFeuMN5Uoz+WPOp7xFEtHI08ZNYyACE9pbg6Rv
X-Gm-Gg: ASbGnctTYZmx90UgRXsHF9bPyr/32j2OlXJuym5LbioKQoMXayAGCBJyAcg4/hB6gZc
	aFkMTiTAeD5oiqLHGIhd9bsztYRzs+BbWb1kqnPNdEG9KKVfxoiUeYuSiwi1LAnJzHqz/6/YWR5
	+AwLUzsEjqZ1HI5KBLzVY24jBgMtztQRJbCUH0PvicQboW0Ue+1Yb1z6+fu6v+nlMwoJeOBTF72
	pdGwV9T2qrOKkgYzGa+6BmcBS9L398G77Xepg1b2uD1A1pEs0EGOuKM0rP8X/bdE6bnym4TBjmM
	AX3APFZS/slsBv7+7egkztZIZ3AVkHde5XdHqwF5nVT5zNwugjvsDCtAjnrldBaKN9D6fE+JVzh
	9BMcQZWoDB7DriS0NmO6jvZo1qUPY+l+poRl3Ejyrjx6ptqZBn74PpV16y9tEJpwZmXeP9LMCmJ
	3Asikhh6gI2GOZDyrPt3yGf/OM7WRyTy3du5AQECw=
X-Google-Smtp-Source: AGHT+IHYX8wtXc6VTeT/WlVGySxeCAqSKp30epmWhGPLSxswlzEEE3fJbxd9jCXZ9qW/mBYnUyas8Q==
X-Received: by 2002:a05:6512:3f0c:b0:594:51bd:8fcd with SMTP id 2adb3069b0e04-597d3f305b9mr2861040e87.16.1764864799796;
        Thu, 04 Dec 2025 08:13:19 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c283c9sm612087e87.79.2025.12.04.08.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:13:19 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: designware: Replace magic numbers with named constants
Date: Thu,  4 Dec 2025 19:13:08 +0300
Message-ID: <20251204161309.750032-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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
    * https://lore.kernel.org/all/20251106160206.2617785-1-a.shimko.dev@gmail.com/T/#u
  v3:
    * Add missing include for linux/bitfield.h

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


