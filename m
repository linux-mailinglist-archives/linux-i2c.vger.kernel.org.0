Return-Path: <linux-i2c+bounces-14002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF1C3C412
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 17:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2303426EE5
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 16:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5D53314CB;
	Thu,  6 Nov 2025 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA7EG4Nj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9BE32E6BD
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 16:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444934; cv=none; b=TLGuDyofwpCk7oqMVzf6FOT6zC3ONE2jnrD+qPD3XAw2PLclkxtkGTRd5zVpMiuQoL3praHlAlpnc43Q54kmBAqCmNhtEeQ4I4LmnOglVZbHId3lBEMTsRDttmMFVdaqjcWQfsL/7n83IbMVEU27VtRX15tIWDDD04LENzDrw78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444934; c=relaxed/simple;
	bh=oTIkHrAGc+PJG6lIC9MbDF4ws+gdVwa9wYkQ8yopGNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbOzUY/rNqxKrXw3x+hPMUTcluPpRPAIj4uYog+V4d9eRRX4+bioXtUkQuJyHSTxc7zvigNiDbSeZPOhD1CNNHVXbcphj+2aFAShqMJx9y5lzjFB0ZFYNmigCbzpkngFfK//Kxh3kHGX4BELIrWkBFyC9iCda6515vjweoWrSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA7EG4Nj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so1656722a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 06 Nov 2025 08:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762444930; x=1763049730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44vNGM2NsIAugsSY4yeMEiLRHsHSPV8cmDAjt250+bg=;
        b=NA7EG4NjUKIuLEhQyH6jdwyfPCgYox1h5Qs2tMjwsflA8hq617z8KLwCKw9Fxqxexu
         0tcZOLT8JMGoh+8e0iRkWqeSQvjFXR7XMxZoRyg4qhxGOWBjUu+Gzl1rMGiQ0Ze4GXuG
         Xz2ULS2EzyvCPZh1kV+F1Sf0Ypv/hgT938xiFGN5EmQUjt8CIOHi2+eeFdvZYK3HUlyg
         T79IOSt1p7BrYT/3akzQy6y1kYTYU6z0vIYd1NLfpQLodxtXE74S8a/cUzs19K53VSru
         Xti62hbHY0FjN3BTUXi7UhB21ciIL3QOWcOlriiWHAPgSVp66vEHn7IRRLzhVMQEI8JF
         j8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444930; x=1763049730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44vNGM2NsIAugsSY4yeMEiLRHsHSPV8cmDAjt250+bg=;
        b=HjiLuapmtBoh71HVnyaSnV5HJrl0gQX/AitAOxEOIBA8U8ZT9F4mBWDI0UcgTZf0hH
         ZDpMsbHiuolj6FedQ3WKgu3JzD+79v/slyk41SBn8hzQ5G8u51s+SUPeM0qrj76b6/0w
         EqMp0AcfaYIzfG4bSEiYLj2SmSiOjrWcSj63cd20NWYid2GRqL72kRkr8WYZPIp4AiNO
         aZUAAXdafr+R3jbdP7XJJvla9BqsuImY5EmvWSpB0tK+TlX/EuLYuP9J8JhLJ1YEe7f5
         SVKBQazeMD/8jmWHHHFciiQHcnI6MjttPFy300o3k3peb+y9alSCKO+iyr0LBfpLko6z
         yG6w==
X-Forwarded-Encrypted: i=1; AJvYcCXonNVdWQ1+QMp48/JBkOuW4d43/2R49ROwxQuLeDZ3VOMN7oes64X+mWGJF6UlCaXOYqdVySthPRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylV+kndxgkwiiL/8IbhjSwKKsMISZ6t+if+ryrpVxNrV5lDP60
	zFqopDk//LYMdF/wVNGMeTtJDLbyaTGJc0HNotF9TULXpScixYk4MlLa
X-Gm-Gg: ASbGnctj2t0BE1wTb9CvYwLVG1McPXTN9dZoVUIJHaw84dI0blhgJKKM1HSJ0qXrknm
	KPOns6p9inLuH9qUwVAW8bjF5jmW9t08IhPF0xRDZWUrBZPLKki0uL1ACxoTXJm74y+zgcdYco1
	Uf/l2MoQFtMEmgR8oNClpi3AZ+VFO2nibZrXypydXlLR14GKuK+EdEPqDu3pmqBpraB8tY/0ZKz
	UJJOb+QzGamNyljQM1Mw3uQFIO1ikum9kvQ+COXlINpS6KoHytFQWEer/rCI65gHc13LjFc7CFW
	TXZbXoAH8rFpIy/JU+uMdjBA3TG/dirhFydi0tixShhicet6MvRCr6WMZh3Qk97q7qAkTePQSOc
	/6YChcRxLBGw+fqaArzY5yExmbIFfCiY7Du0U+LBcF9edzckbJRDu1ooD/eHqvbrG158EueasRS
	0+wfBSFj9Am6cBI0hiF5/36B3hmvY=
X-Google-Smtp-Source: AGHT+IHhiwaS86Qf05ow+2ljmxHHVJaS1EqN2g3gDNvTqSg2n0SjpaidlCNbWm4msNcpmzg8Mzjszg==
X-Received: by 2002:a05:6402:5189:b0:641:1f6c:bccf with SMTP id 4fb4d7f45d1cf-6411f6cbe71mr3204075a12.16.1762444929652;
        Thu, 06 Nov 2025 08:02:09 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f862cd7sm2230000a12.30.2025.11.06.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:02:09 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: designware: Replace magic numbers with named constants
Date: Thu,  6 Nov 2025 19:02:05 +0300
Message-ID: <20251106160206.2617785-1-a.shimko.dev@gmail.com>
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
Best regards,
Artem Shimko

ChangeLog:
  v1:
    * https://lore.kernel.org/all/20251105161845.2535367-1-a.shimko.dev@gmail.com/T/#u
  v2:
    * Move register-related constants to i2c-designware-core.h
    * Remove unnecessary comments to reduce clutter  
    * Keep only essential timeouts and default parameters in .c file
    * Use FIELD_GET() for FIFO depth extraction as suggested

 drivers/i2c/busses/i2c-designware-common.c | 32 ++++++++++++++--------
 drivers/i2c/busses/i2c-designware-core.h   | 13 +++++++++
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..1aa10e712712 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -34,6 +34,14 @@
 
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
@@ -106,7 +114,7 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
 	struct dw_i2c_dev *dev = context;
 
 	*val = readw(dev->base + reg) |
-		(readw(dev->base + reg + 2) << 16);
+		(readw(dev->base + reg + DW_IC_REG_STEP_BYTES) << DW_IC_REG_WORD_SHIFT);
 
 	return 0;
 }
@@ -116,7 +124,7 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
 	struct dw_i2c_dev *dev = context;
 
 	writew(val, dev->base + reg);
-	writew(val >> 16, dev->base + reg + 2);
+	writew(val >> DW_IC_REG_WORD_SHIFT, dev->base + reg + DW_IC_REG_STEP_BYTES);
 
 	return 0;
 }
@@ -165,7 +173,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_swab;
 		map_cfg.reg_write = dw_reg_write_swab;
-	} else if (reg == (DW_IC_COMP_TYPE_VALUE & 0x0000ffff)) {
+	} else if (reg == lower_16_bits(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_word;
 		map_cfg.reg_write = dw_reg_write_word;
 	} else if (reg != DW_IC_COMP_TYPE_VALUE) {
@@ -384,7 +392,7 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 	i2c_parse_fw_timings(device, t, false);
 
 	if (device_property_read_u32(device, "snps,bus-capacitance-pf", &dev->bus_capacitance_pF))
-		dev->bus_capacitance_pF = 100;
+		dev->bus_capacitance_pF = DW_IC_DEFAULT_BUS_CAPACITANCE_PF;
 
 	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
 
@@ -539,8 +547,9 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
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
@@ -552,7 +561,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 		 * in that case this test reads zero and exits the loop.
 		 */
 		regmap_read(dev->map, DW_IC_ENABLE_STATUS, &status);
-		if ((status & 1) == 0)
+		if (!(status & 1))
 			return;
 
 		/*
@@ -635,7 +644,8 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
 
 	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
 				       !(status & DW_IC_STATUS_ACTIVITY),
-				       1100, 20000);
+				       DW_IC_BUSY_POLL_TIMEOUT_US,
+				       DW_IC_BUSY_TOTAL_TIMEOUT_US);
 	if (ret) {
 		dev_warn(dev->dev, "timeout waiting for bus ready\n");
 
@@ -699,12 +709,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
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


