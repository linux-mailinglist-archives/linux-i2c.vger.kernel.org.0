Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F6422AEDD
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 14:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgGWMTP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 08:19:15 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19167 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgGWMTN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 08:19:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f197fc70000>; Thu, 23 Jul 2020 05:17:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 05:19:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 05:19:13 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 12:19:13 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 12:19:13 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f19803e0000>; Thu, 23 Jul 2020 05:19:12 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <digetx@gmail.com>, <linux-i2c@vger.kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ldewangan@nvidia.com>,
        <smohammed@nvidia.com>, <rgumasta@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 3/7] i2c: tegra: add flag for register write buffering
Date:   Thu, 23 Jul 2020 17:48:49 +0530
Message-ID: <1595506733-10307-3-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595506631; bh=Bllwqib3qCXycyC1UJOhNAs0mt5jHnNS0tHTaZbyTLE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=C4Y420XmHvLxPEt3DoLJF7qmZvhx0w2clomZFwSZmw4YxNx5TwXHvkjI4Z9SvDvDN
         hJhi9kOq4HVQuu6m1ML+pz9WYpfs5/gNyCeDQ2Vi3zTSFzTBJc7eDStLxy8AdZetEG
         F4MwtRqY66f26bNqY3nRm3feFzTyU18fFphrlvphRwcvkNpBok/8Oe9hAE4QdS8gKN
         vb9E6Xdcb4ExJdZey4NPxzcuojr4O3fzGoYTTTjsNVb6eYtSlKwCNZjEy7jh6FztbE
         SO1KBUxQb5YOAkA/ilrZlaZuLni75+hKvgjFRFBNXAM+e4onMVXfB6OLN5SYEcqLyV
         +z6+ko4Jk0gUg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In chips earlier to Tegra186, register write gets buffered. So to make
sure register writes are completed, there is need to readback the
register. Adding flag to disable this readback for Tegra186 and later
chips.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a841d6c..bdbbca0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -220,6 +220,7 @@ struct tegra_i2c_hw_feature {
 	bool has_mst_fifo;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
+	bool has_reg_write_buffering;
 	bool has_apb_dma;
 	u8 tlow_std_mode;
 	u8 thigh_std_mode;
@@ -325,8 +326,11 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
 	/* Read back register to make sure that register writes completed */
-	if (reg != I2C_TX_FIFO)
-		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	if (i2c_dev->hw->has_reg_write_buffering) {
+		if (reg != I2C_TX_FIFO)
+			readl_relaxed(i2c_dev->base +
+				      tegra_i2c_reg_addr(i2c_dev, reg));
+	}
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
@@ -1450,6 +1454,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1475,6 +1480,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1500,6 +1506,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1525,6 +1532,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1550,6 +1558,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = true,
 	.has_apb_dma = true,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x2,
@@ -1575,6 +1584,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_mst_fifo = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = false,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x4,
 	.thigh_std_mode = 0x3,
@@ -1600,6 +1610,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_mst_fifo = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
+	.has_reg_write_buffering = false,
 	.has_apb_dma = false,
 	.tlow_std_mode = 0x8,
 	.thigh_std_mode = 0x7,
-- 
2.7.4

