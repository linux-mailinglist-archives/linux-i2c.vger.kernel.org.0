Return-Path: <linux-i2c+bounces-14507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BED14CB5DF1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 13:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8290E303B2C7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 12:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7DA2F99A3;
	Thu, 11 Dec 2025 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHkwHwCV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A5A2F6192
	for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765456197; cv=none; b=cJgOB1wvfNsH7cwBRl4JhFePtmP5VPNR6B5R1LFd3ntiM0754XFE+nfQ4YiPQXNNzEfjmWs+JWwaUndSU7vfwILfbmNiiCSHdbBN/XnEioaOuaAGXuU0Bdk6MGAGl3eaX5AC3AxdM1ZZZL9IVTzF3A4nLEyiavam88/rCwF5dmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765456197; c=relaxed/simple;
	bh=Soi10TuFeV0uh/sWMBxo5LMEKWX9cSiI0iTo1Yhicuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/qApCQD1GH6xoKS/E+OntNT7rV7DRCBrJOAPQ+/jveb4vb2L1E24H6uUSu0wJpnmGNu8SyIPTIt2S0ByYauQH4O1NU1pwfKkjySFkoJHrHmNmmiWKdEigdmYObQGyITCt+XuYbD+miROOxGNbSBXwGhg2QJiy+noSswnEAUfRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHkwHwCV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b9728a353so659521fa.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 04:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765456194; x=1766060994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnxtPQyQhm7Ez4s2wO2MHm19H6f+qgA3O57TFq3CmC0=;
        b=DHkwHwCVZQbCSSckbi/ir9Sal/Hp8IW8vMOsj2K8FwVMkqhpGOE2QGgotfhRreEu0n
         byLL5MJt85prOuShR9TQJ9JcslehoNqDvhtu7IRMGRQjJb+g+jc2+E+9XdaTgsw2/ugD
         NiwCx4345atFe5/Rz96v/vtqIQwwtM6PACVb1LW2Gf+eWbnrFagd55VdAyrXUNUXISf8
         rbhclBvMRzKhDWUXnihFu025zEoEuQcnxQRRA/uTsCmCIOoIJNeK1IGag653t7dDK7Ko
         rlftZkS2yKHuV03Xj4VCX/10HWeiHIR24nQOQOS1s5Wl44KiQdL8BWF6Qrv4DQbYTNTU
         BywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765456194; x=1766060994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnxtPQyQhm7Ez4s2wO2MHm19H6f+qgA3O57TFq3CmC0=;
        b=X1njyX3XlxZexc8Wncr4PDdiVG/kd5vRVD7+SRIMX0NDxQ7eo/DshmEIcElEN4A5zh
         uWzmFUdcngNtWiM+wy4OeUd4EUJT39IIsZ0J16ba9I6KeVnPCqScOn9PqDwPMLqwSwfj
         uviHSU9vXpieDgVAEDsEFOqU+t1aVj2EN4j6enHQfyzyQgUZw415k0w3hrTWBiFU0YTV
         hBIDuhIoQmiQIs4Mf5wqkmGNHa06TZTbfuT29/FdaX4bBy3RYQhUjyGXyalrK1StsUFk
         LkF0qIoKk+EepzNWCpSbhGQQwW0D3MdVT4zkfRzZ8U3kP3yG6Dn75TkxcV5Hs0dB2N+7
         8ASA==
X-Forwarded-Encrypted: i=1; AJvYcCW19I0vXhUFaG68GWFk3JmvtMLEMH3xBd7bo7IRYeqNnyQl1FhBNiO7oBAJSF5lyoUmoxUCCEZ4Tbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGWYiTxJQ8ewSy/+ssCpq2BBsn55xQy0bRsP5gXSBhEDyOkgir
	8J2o6GxE54yfRmWxfQXqnUu3Y4AvxAs11XvxksTeyfymhrpnQrCwaeO5
X-Gm-Gg: AY/fxX6UukL++BsdEoOxL11eUCfH79QfzSWARBDcTVpWgnOt9wFG0PmrGfWO9ELNoow
	rhPwkzhz+Xb7lJQaxlXRLfcQgNfagmNq7sD0bn8Ik2eASngOOkUEjVbTLhCdCBHSeU0pR9LldNK
	gA/8Q0NHYS0pmjYQyNkr41Yn16DBeA8lVGdRrqAzQl8ZaVzP/RpsMC3zeK+ssSJPCiz5uf6xB4T
	4u/Q0v4Gv5vCI62hvoAv5h8BjtPZ/WX+vgwP0X0YrDzxuwCRa1x/zOXxDtZp7U7MBmFdhYxauad
	Ya2y0LXehntzCTtAaI6kj1VRMmPjK8cZ38h58oLYyc+/fBWcgqXhkgwG1LzQfCS09Z1DA+oowNB
	uAVC29U9aMN2TtrwXVecoh7pIQEuKUSA+0QQaYGUbg4LgE9OqPkr+P1iRLGxP1Kq/oLqgtHJ7w3
	LtoY5cgphpo/j+52Rl393CN/of5NqFmsLEu0znyIQ=
X-Google-Smtp-Source: AGHT+IFAx8+IMBBZz4sg0FW7i888AnJ1Cu7DY0AP/9/Vjb9aZRfe4SlqVVqShMMoY6c/igcg8ULZ+A==
X-Received: by 2002:a05:6512:3e16:b0:598:efa4:d7aa with SMTP id 2adb3069b0e04-598efa4d7b6mr2351606e87.51.1765456193696;
        Thu, 11 Dec 2025 04:29:53 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199388sm835201e87.90.2025.12.11.04.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:29:53 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: designware: Replace magic numbers with named constants
Date: Thu, 11 Dec 2025 15:29:47 +0300
Message-ID: <20251211122947.1469666-1-a.shimko.dev@gmail.com>
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

This makes the code more self-documenting without altering any
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
    * https://lore.kernel.org/all/20251204161309.750032-1-a.shimko.dev@gmail.com/T/#u
  v4:
    * Renamed DW_IC_DEFAULT_BUS_CAPACITANCE_PF  to DW_IC_DEFAULT_BUS_CAPACITANCE_pF
    * Changed DW_IC_BUSY_POLL_TIMEOUT_US to (1 * USEC_PER_MSEC)
    * Removed DW_IC_ABORT_TOTAL_TIMEOUT_US and DW_IC_BUSY_TOTAL_TIMEOUT_US; use multipliers
    of DW_IC_ABORT_TIMEOUT_US and DW_IC_BUSY_POLL_TIMEOUT_US where needed

 drivers/i2c/busses/i2c-designware-common.c | 29 ++++++++++++++--------
 drivers/i2c/busses/i2c-designware-core.h   | 13 ++++++++++
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..6671e98691ee 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -12,6 +12,7 @@
 #define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -34,6 +35,10 @@
 
 #include "i2c-designware-core.h"
 
+#define DW_IC_DEFAULT_BUS_CAPACITANCE_pF	100
+#define DW_IC_ABORT_TIMEOUT_US			10
+#define DW_IC_BUSY_POLL_TIMEOUT_US		(1 * USEC_PER_MSEC)
+
 static const char *const abort_sources[] = {
 	[ABRT_7B_ADDR_NOACK] =
 		"slave address not acknowledged (7bit mode)",
@@ -106,7 +111,7 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
 	struct dw_i2c_dev *dev = context;
 
 	*val = readw(dev->base + reg) |
-		(readw(dev->base + reg + 2) << 16);
+		(readw(dev->base + reg + DW_IC_REG_STEP_BYTES) << DW_IC_REG_WORD_SHIFT);
 
 	return 0;
 }
@@ -116,7 +121,7 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
 	struct dw_i2c_dev *dev = context;
 
 	writew(val, dev->base + reg);
-	writew(val >> 16, dev->base + reg + 2);
+	writew(val >> DW_IC_REG_WORD_SHIFT, dev->base + reg + DW_IC_REG_STEP_BYTES);
 
 	return 0;
 }
@@ -165,7 +170,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_swab;
 		map_cfg.reg_write = dw_reg_write_swab;
-	} else if (reg == (DW_IC_COMP_TYPE_VALUE & 0x0000ffff)) {
+	} else if (reg == lower_16_bits(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_word;
 		map_cfg.reg_write = dw_reg_write_word;
 	} else if (reg != DW_IC_COMP_TYPE_VALUE) {
@@ -384,7 +389,7 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 	i2c_parse_fw_timings(device, t, false);
 
 	if (device_property_read_u32(device, "snps,bus-capacitance-pf", &dev->bus_capacitance_pF))
-		dev->bus_capacitance_pF = 100;
+		dev->bus_capacitance_pF = DW_IC_DEFAULT_BUS_CAPACITANCE_pF;
 
 	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
 
@@ -539,8 +544,9 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
-					       !(enable & DW_IC_ENABLE_ABORT), 10,
-					       100);
+					       !(enable & DW_IC_ENABLE_ABORT),
+					       DW_IC_ABORT_TIMEOUT_US,
+					       10 * DW_IC_ABORT_TIMEOUT_US);
 		if (ret)
 			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
 	}
@@ -552,7 +558,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 		 * in that case this test reads zero and exits the loop.
 		 */
 		regmap_read(dev->map, DW_IC_ENABLE_STATUS, &status);
-		if ((status & 1) == 0)
+		if (!(status & 1))
 			return;
 
 		/*
@@ -635,7 +641,8 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
 
 	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
 				       !(status & DW_IC_STATUS_ACTIVITY),
-				       1100, 20000);
+				       DW_IC_BUSY_POLL_TIMEOUT_US,
+				       20 * DW_IC_BUSY_POLL_TIMEOUT_US);
 	if (ret) {
 		dev_warn(dev->dev, "timeout waiting for bus ready\n");
 
@@ -699,12 +706,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
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


