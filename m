Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C75E1C7A04
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgEFTP3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbgEFTP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:15:29 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4955C061A0F;
        Wed,  6 May 2020 12:15:28 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 188so3763137wmc.2;
        Wed, 06 May 2020 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yVGEaDVN9EH8e66m+dGthw3khL1ip4BsCSEbJZibwvU=;
        b=k7pTJaMawOITCKqkcWYc2n51P9QpIwDIn2X3MNdr3bBZy0cPbSIVVOIqZujrTm6oy0
         L8jNfzR0gE1c3A8JACi8j7Xv12C7pyZw2KSx4G8EcM2d3FVr9VWQkPo0+PMdiz1Jkh1v
         KODGsLiW95QYNOE9J5WT26UzgkmxYl03AWLM270RQXMeqtFLgTQ5gHL0nA2z4ybv1rzN
         2LZCOYP+Iov3XqQbVn50lxmRtDlVpTlRrTpzNDt3EwVhn5uYEg9wk3NXOWl0ScJ4io0D
         aCc859n2cu9YvknDm8YH9F3qYJT/1FmTUvgrwbwTjE040cqdkKM4y/7UH5R//v7NqRlt
         +z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yVGEaDVN9EH8e66m+dGthw3khL1ip4BsCSEbJZibwvU=;
        b=WGDncRlHjcWpWbhrpg3ngfhF3mlsfOxx+Ctpp7fpwQI1R2XplMhXQlH/ofVK4J4Ncp
         LCR+jCgx06A1WkZBo+goO1/m40uTERIz1ijghY+GW1FDcittRdCGxzK4f7AiTSb+/Xni
         Wi4WtZ5H5cutgOgrlBbcyh0nFyw6h8G4rkd+Zx+Qltg14oQqE+66sBVsCL7eVJMzj2GS
         LhReeSAbz7qRhu9C1lZt2TrI3S1b46Em8yMQVOf5MJwIJ6Z7rxTLJhoseaX61joNIhaZ
         8MyJyKweXxskVhFQxKT6BhJN30In3wysIZewOs4EQis4091FTiqNbdwIXVqsXTVb9tQI
         t1EA==
X-Gm-Message-State: AGi0PuacHNc8EACzx/f6XuGT4RhFFyYXZkCdYvKyou8s/MrnJa33SYF1
        lBcrp6nwrsJ02ILoN/OQeEw=
X-Google-Smtp-Source: APiQypJrOYffXlPiKp57Cb1fjkMm5V5EWmWt1R1bo3bgSOhUnw7SbIIEqg+jlFG8HsodsF65BGtUgQ==
X-Received: by 2002:a7b:c118:: with SMTP id w24mr5769786wmi.173.1588792527500;
        Wed, 06 May 2020 12:15:27 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id l6sm4410305wrb.75.2020.05.06.12.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:15:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/4] i2c: tegra: Use FIELD_PREP/FIELD_GET macros
Date:   Wed,  6 May 2020 21:15:09 +0200
Message-Id: <20200506191511.2791107-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506191511.2791107-1-thierry.reding@gmail.com>
References: <20200506191511.2791107-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Using these macros helps increase readability of the code.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 81 +++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4cee596a604d..e8e64498dd8b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -6,6 +6,7 @@
  * Author: Colin Cross <ccross@android.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
@@ -29,11 +30,11 @@
 #define BYTES_PER_FIFO_WORD 4
 
 #define I2C_CNFG				0x000
-#define I2C_CNFG_DEBOUNCE_CNT_SHIFT		12
+#define I2C_CNFG_DEBOUNCE_CNT			GENMASK(14, 12)
 #define I2C_CNFG_PACKET_MODE_EN			BIT(10)
 #define I2C_CNFG_NEW_MASTER_FSM			BIT(11)
 #define I2C_CNFG_MULTI_MASTER_MODE		BIT(17)
-#define I2C_STATUS				0x01C
+#define I2C_STATUS				0x01c
 #define I2C_SL_CNFG				0x020
 #define I2C_SL_CNFG_NACK			BIT(1)
 #define I2C_SL_CNFG_NEWSL			BIT(2)
@@ -48,10 +49,8 @@
 #define I2C_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 5)
 #define I2C_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) << 2)
 #define I2C_FIFO_STATUS				0x060
-#define I2C_FIFO_STATUS_TX_MASK			0xF0
-#define I2C_FIFO_STATUS_TX_SHIFT		4
-#define I2C_FIFO_STATUS_RX_MASK			0x0F
-#define I2C_FIFO_STATUS_RX_SHIFT		0
+#define I2C_FIFO_STATUS_TX			GENMASK(7, 4)
+#define I2C_FIFO_STATUS_RX			GENMASK(3, 0)
 #define I2C_INT_MASK				0x064
 #define I2C_INT_STATUS				0x068
 #define I2C_INT_BUS_CLR_DONE			BIT(11)
@@ -61,7 +60,8 @@
 #define I2C_INT_TX_FIFO_DATA_REQ		BIT(1)
 #define I2C_INT_RX_FIFO_DATA_REQ		BIT(0)
 #define I2C_CLK_DIVISOR				0x06c
-#define I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT	16
+#define I2C_CLK_DIVISOR_STD_FAST_MODE		GENMASK(31, 16)
+#define I2C_CLK_DIVISOR_HSMODE			GENMASK(15, 0)
 
 #define DVC_CTRL_REG1				0x000
 #define DVC_CTRL_REG1_INTR_EN			BIT(10)
@@ -77,10 +77,11 @@
 #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
 #define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
 
-#define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
-#define PACKET_HEADER0_PACKET_ID_SHIFT		16
-#define PACKET_HEADER0_CONT_ID_SHIFT		12
-#define PACKET_HEADER0_PROTOCOL_I2C		BIT(4)
+#define PACKET_HEADER0_HEADER_SIZE		GENMASK(29, 28)
+#define PACKET_HEADER0_PACKET_ID		GENMASK(23, 16)
+#define PACKET_HEADER0_CONT_ID			GENMASK(15, 12)
+#define PACKET_HEADER0_PROTOCOL			GENMASK(7, 4)
+#define PACKET_HEADER0_PROTOCOL_I2C		1
 
 #define I2C_HEADER_CONT_ON_NAK			BIT(21)
 #define I2C_HEADER_READ				BIT(19)
@@ -91,21 +92,23 @@
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
-#define I2C_BC_SCLK_THRESHOLD			9
-#define I2C_BC_SCLK_THRESHOLD_SHIFT		16
+#define I2C_BC_SCLK_THRESHOLD			GENMASK(23, 16)
 #define I2C_BC_STOP_COND			BIT(2)
 #define I2C_BC_TERMINATE			BIT(1)
 #define I2C_BC_ENABLE				BIT(0)
 #define I2C_BUS_CLEAR_STATUS			0x088
 #define I2C_BC_STATUS				BIT(0)
 
-#define I2C_CONFIG_LOAD				0x08C
+#define I2C_CONFIG_LOAD				0x08c
 #define I2C_MSTR_CONFIG_LOAD			BIT(0)
 
 #define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
 
-#define I2C_CONFIG_LOAD_TIMEOUT			1000000
+#define I2C_INTERFACE_TIMING_0			0x094
+#define  I2C_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
+#define  I2C_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define I2C_INTERFACE_TIMING_1			0x098
 
 #define I2C_MST_FIFO_CONTROL			0x0b4
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
@@ -114,14 +117,11 @@
 #define I2C_MST_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 16)
 
 #define I2C_MST_FIFO_STATUS			0x0b8
-#define I2C_MST_FIFO_STATUS_RX_MASK		0xff
-#define I2C_MST_FIFO_STATUS_RX_SHIFT		0
-#define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
-#define I2C_MST_FIFO_STATUS_TX_SHIFT		16
+#define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
+#define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
-#define I2C_INTERFACE_TIMING_0			0x94
-#define I2C_THIGH_SHIFT				8
-#define I2C_INTERFACE_TIMING_1			0x98
+/* configuration load timeout in microseconds */
+#define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
 /* Packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
@@ -495,12 +495,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
-		rx_fifo_avail = (val & I2C_MST_FIFO_STATUS_RX_MASK) >>
-			I2C_MST_FIFO_STATUS_RX_SHIFT;
+		rx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
 	} else {
 		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
-		rx_fifo_avail = (val & I2C_FIFO_STATUS_RX_MASK) >>
-			I2C_FIFO_STATUS_RX_SHIFT;
+		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
 	}
 
 	/* Rounds down to not include partial word at the end of buf */
@@ -551,12 +549,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
-		tx_fifo_avail = (val & I2C_MST_FIFO_STATUS_TX_MASK) >>
-			I2C_MST_FIFO_STATUS_TX_SHIFT;
+		tx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_TX, val);
 	} else {
 		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
-		tx_fifo_avail = (val & I2C_FIFO_STATUS_TX_MASK) >>
-			I2C_FIFO_STATUS_TX_SHIFT;
+		tx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_TX, val);
 	}
 
 	/* Rounds down to not include partial word at the end of buf */
@@ -719,7 +715,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 		tegra_dvc_init(i2c_dev);
 
 	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
-		(0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
+	      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
 
 	if (i2c_dev->hw->has_multi_master_mode)
 		val |= I2C_CNFG_MULTI_MASTER_MODE;
@@ -728,9 +724,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 
 	/* Make sure clock divisor programmed correctly */
-	clk_divisor = i2c_dev->hw->clk_divisor_hs_mode;
-	clk_divisor |= i2c_dev->clk_divisor_non_hs_mode <<
-					I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT;
+	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
+				 i2c_dev->hw->clk_divisor_hs_mode) |
+		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
+				 i2c_dev->clk_divisor_non_hs_mode);
 	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
 
 	if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
@@ -745,7 +742,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	}
 
 	if (i2c_dev->hw->has_interface_timing_reg) {
-		val = (thigh << I2C_THIGH_SHIFT) | tlow;
+		val = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, thigh) |
+		      FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, tlow);
 		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
 	}
 
@@ -1054,8 +1052,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	u32 reg;
 
 	reinit_completion(&i2c_dev->msg_complete);
-	reg = (I2C_BC_SCLK_THRESHOLD << I2C_BC_SCLK_THRESHOLD_SHIFT) |
-	      I2C_BC_STOP_COND | I2C_BC_TERMINATE;
+	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
+	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	if (i2c_dev->hw->has_config_load_reg) {
 		err = tegra_i2c_wait_for_config_load(i2c_dev);
@@ -1148,10 +1146,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		}
 	}
 
-	packet_header = (0 << PACKET_HEADER0_HEADER_SIZE_SHIFT) |
-			PACKET_HEADER0_PROTOCOL_I2C |
-			(i2c_dev->cont_id << PACKET_HEADER0_CONT_ID_SHIFT) |
-			(1 << PACKET_HEADER0_PACKET_ID_SHIFT);
+	packet_header = FIELD_PREP(PACKET_HEADER0_HEADER_SIZE, 0) |
+			FIELD_PREP(PACKET_HEADER0_PROTOCOL,
+				   PACKET_HEADER0_PROTOCOL_I2C) |
+			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
+			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
 	if (dma && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
-- 
2.24.1

