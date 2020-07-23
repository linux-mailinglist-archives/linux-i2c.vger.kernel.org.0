Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB85022AEE2
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 14:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgGWMTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 08:19:25 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19180 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728806AbgGWMTY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 08:19:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f197fd10001>; Thu, 23 Jul 2020 05:17:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 05:19:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 05:19:23 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 12:19:23 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 12:19:22 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1980470000>; Thu, 23 Jul 2020 05:19:22 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <digetx@gmail.com>, <linux-i2c@vger.kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ldewangan@nvidia.com>,
        <smohammed@nvidia.com>, <rgumasta@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 6/7] i2c: tegra: DMA support for t186 and t194
Date:   Thu, 23 Jul 2020 17:48:52 +0530
Message-ID: <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595506641; bh=lbncHwO3OLR/eiajOIMGJWlwqCWr+tFZpr51JViAPWc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=XXcRiwmSauA6ff2cOSQpKunHfb2/28oVTWDfPcuWiebyd1kAp7nsalRWH2ugrBk3U
         ZmkXutLc0gS9w3YWyC6LmKV7WWaXFDiyufiUQHLzetUtbjxBFgV4JD0DBE/atiOLts
         CsTbaPPS9G6wYGRzWX/UHrC2ILIkrqIV2cpWGHsp+1O7O64d8IcZTsmMXn32Qhy8I8
         TCkBxSwtuWBPrcf43j7QqrzCpU7lrW181xjBXbhT0etvMjYpmneG+FcgdlRpOPLFxA
         mySbe2q1dADrBpOFFJL0VC8+msVsAzCJfWvbQSjFSZbL+qX9xacP3oeZidYHDkcr6R
         JYb7cIHqQjtpQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable GPC DMA support for Tegra186 and Tegra194

Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8ab968e..77198fc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -236,6 +236,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 	bool has_slcg_support;
+	bool has_gpc_dma;
 };
 
 /**
@@ -432,11 +433,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_addr_t dma_phys;
 	int err;
 
-	if (!i2c_dev->hw->has_apb_dma)
-		return 0;
-
-	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+	if (i2c_dev->hw->has_gpc_dma) {
+		if (!IS_ENABLED(CONFIG_TEGRA_GPC_DMA)) {
+			dev_dbg(i2c_dev->dev, "Support for GPC DMA not enabled!\n");
+			return 0;
+		}
+	} else if (i2c_dev->hw->has_apb_dma) {
+		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
+			dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+			return 0;
+		}
+	} else {
+		dev_dbg(i2c_dev->dev, "DMA is not enabled!\n");
 		return 0;
 	}
 
@@ -1490,6 +1498,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1519,6 +1528,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1548,6 +1558,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1577,6 +1588,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1606,6 +1618,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1635,6 +1648,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1664,6 +1678,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.has_gpc_dma = true,
 };
 
 /* Match table for of_platform binding */
-- 
2.7.4

