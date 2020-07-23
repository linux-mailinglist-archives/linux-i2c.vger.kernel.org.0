Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD1022AEDF
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 14:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbgGWMTS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 08:19:18 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10718 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728761AbgGWMTR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 08:19:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1980380001>; Thu, 23 Jul 2020 05:19:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 05:19:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 05:19:16 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 12:19:16 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 12:19:16 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1980410002>; Thu, 23 Jul 2020 05:19:15 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <digetx@gmail.com>, <linux-i2c@vger.kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ldewangan@nvidia.com>,
        <smohammed@nvidia.com>, <rgumasta@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 4/7] i2c: tegra: add high speed mode support
Date:   Thu, 23 Jul 2020 17:48:50 +0530
Message-ID: <1595506733-10307-4-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595506744; bh=MidEY3z1fFgcerAQ5XajHtgp1ERmHHIlbwKkyuQc4F4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=ZWuP9tEX0LJdgmnLAUNwaWG2cioBSr8J/OJRIhzdk5uZeUB+2XY5Vov5sePJ9qvdX
         L1plICtdqyE4dTHj58ZRhpVyzHQAjIh7gRoX+2kS7Fu8S57R0Sniann2E26MmSq26Q
         yuDP9YklMmSEkzBy+/CiTi29jTfne0oSIt5GWtOtMST1NpkY5DkrBdjUGV/xPmeVVS
         YAHMKVTivZKognYyYxKSL5WT4qdP7C9PgQiOC5IDq04D4gO43wCxrOLQiKJ3AhaDN8
         cUQy8QXNFv7ZeFIPWxy5XaAj9XhfkpU8MhvOFG5s7QnKa4ip24Erd7/a4tSireT1/e
         QMdDW5oF1Gt8w==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shardar Shariff Md <smohammed@nvidia.com>

Add high speed mode support

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bdbbca0..2f654ed 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -85,12 +85,14 @@
 #define PACKET_HEADER0_PROTOCOL_I2C		1
 #define PACKET_HEADER0_CONT_ID_MASK		0xF
 
+#define I2C_HEADER_HIGHSPEED_MODE		BIT(22)
 #define I2C_HEADER_CONT_ON_NAK			BIT(21)
 #define I2C_HEADER_READ				BIT(19)
 #define I2C_HEADER_10BIT_ADDR			BIT(18)
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
+#define I2C_HEADER_MASTER_ADDR_SHIFT		12
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -136,6 +138,7 @@
 
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
+#define I2C_HS_MODE				3500000
 
 /* Packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
@@ -215,12 +218,14 @@ struct tegra_i2c_hw_feature {
 	int clk_divisor_std_mode;
 	int clk_divisor_fast_mode;
 	u16 clk_divisor_fast_plus_mode;
+	int clk_multiplier_hs_mode;
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
 	bool has_reg_write_buffering;
+	bool has_hs_mode_support;
 	bool has_apb_dma;
 	u8 tlow_std_mode;
 	u8 thigh_std_mode;
@@ -293,6 +298,7 @@ struct tegra_i2c_dev {
 	bool is_curr_dma_xfer;
 	struct completion dma_complete;
 	bool is_curr_atomic_xfer;
+	int clk_divisor_hs_mode;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
@@ -778,8 +784,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
 
-	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
-	      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
+	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN;
+	if (i2c_dev->bus_clk_rate != I2C_HS_MODE)
+		val |= FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 0x2);
 
 	if (i2c_dev->hw->has_multi_master_mode)
 		val |= I2C_CNFG_MULTI_MASTER_MODE;
@@ -791,6 +798,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 		tegra_i2c_vi_init(i2c_dev);
 
 	/* Make sure clock divisor programmed correctly */
+	if (i2c_dev->bus_clk_rate == I2C_HS_MODE) {
+		i2c_dev->clk_divisor_hs_mode = i2c_dev->hw->clk_divisor_hs_mode;
+	} else {
+		val = i2c_readl(i2c_dev, I2C_CLK_DIVISOR);
+		i2c_dev->clk_divisor_hs_mode = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE, val);
+	}
+
 	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
 				 i2c_dev->hw->clk_divisor_hs_mode) |
 		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
@@ -822,8 +836,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
 	if (!clk_reinit) {
-		clk_multiplier = (tlow + thigh + 2);
-		clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
+		if (i2c_dev->bus_clk_rate == I2C_HS_MODE) {
+			clk_multiplier = i2c_dev->hw->clk_multiplier_hs_mode;
+			clk_multiplier *= (i2c_dev->clk_divisor_hs_mode + 1);
+		} else {
+			clk_multiplier = (tlow + thigh + 2);
+			clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
+		}
 		err = clk_set_rate(i2c_dev->div_clk,
 				   i2c_dev->bus_clk_rate * clk_multiplier);
 		if (err) {
@@ -1244,6 +1263,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		packet_header |= I2C_HEADER_CONT_ON_NAK;
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
+	if (i2c_dev->bus_clk_rate == I2C_HS_MODE)
+		packet_header |= I2C_HEADER_HIGHSPEED_MODE;
 	if (dma && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
@@ -1448,6 +1469,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.clk_divisor_std_mode = 0,
 	.clk_divisor_fast_mode = 0,
 	.clk_divisor_fast_plus_mode = 0,
+	.clk_multiplier_hs_mode = 12,
 	.has_config_load_reg = false,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
@@ -1455,6 +1477,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_reg_write_buffering = true,
+	.has_hs_mode_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1474,6 +1497,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.clk_divisor_std_mode = 0,
 	.clk_divisor_fast_mode = 0,
 	.clk_divisor_fast_plus_mode = 0,
+	.clk_multiplier_hs_mode = 12,
 	.has_config_load_reg = false,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
@@ -1481,6 +1505,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_reg_write_buffering = true,
+	.has_hs_mode_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1500,6 +1525,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.clk_divisor_std_mode = 0x19,
 	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
+	.clk_multiplier_hs_mode = 3,
 	.has_config_load_reg = false,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
@@ -1507,6 +1533,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = true,
+	.has_hs_mode_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1522,10 +1549,11 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
-	.clk_divisor_hs_mode = 1,
+	.clk_divisor_hs_mode = 2,
 	.clk_divisor_std_mode = 0x19,
 	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
+	.clk_multiplier_hs_mode = 13,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
@@ -1533,6 +1561,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = true,
+	.has_hs_mode_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1548,10 +1577,11 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
-	.clk_divisor_hs_mode = 1,
+	.clk_divisor_hs_mode = 2,
 	.clk_divisor_std_mode = 0x19,
 	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
+	.clk_multiplier_hs_mode = 13,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
@@ -1559,6 +1589,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = true,
+	.has_hs_mode_support = false,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1574,10 +1605,11 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
-	.clk_divisor_hs_mode = 1,
+	.clk_divisor_hs_mode = 2,
 	.clk_divisor_std_mode = 0x16,
 	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
+	.clk_multiplier_hs_mode = 13,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
@@ -1585,6 +1617,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = false,
+	.has_hs_mode_support = false,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x3,
@@ -1600,10 +1633,11 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
-	.clk_divisor_hs_mode = 1,
+	.clk_divisor_hs_mode = 2,
 	.clk_divisor_std_mode = 0x4f,
 	.clk_divisor_fast_mode = 0x3c,
 	.clk_divisor_fast_plus_mode = 0x16,
+	.clk_multiplier_hs_mode = 13,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
@@ -1611,6 +1645,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_reg_write_buffering = false,
+	.has_hs_mode_support = true,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
@@ -1694,8 +1729,21 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
 	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						  "nvidia,tegra20-i2c-dvc");
+
+	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
 	i2c_dev->is_vi = of_device_is_compatible(dev->of_node,
 						 "nvidia,tegra210-i2c-vi");
+	if (i2c_dev->bus_clk_rate == I2C_HS_MODE &&
+	    !i2c_dev->hw->has_hs_mode_support) {
+		dev_info(i2c_dev->dev, "HS mode not supported\n");
+		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
+	}
+
+	if (i2c_dev->is_multimaster_mode &&
+	    !i2c_dev->hw->has_multi_master_mode) {
+		dev_info(i2c_dev->dev, "multi-master mode not supported\n");
+		i2c_dev->is_multimaster_mode = false;
+	}
 	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
-- 
2.7.4

