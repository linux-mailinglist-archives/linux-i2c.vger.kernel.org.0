Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4C322BA66
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 01:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgGWXsU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 19:48:20 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7650 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgGWXsT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 19:48:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1a21b50001>; Thu, 23 Jul 2020 16:48:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 16:48:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 16:48:18 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 23:48:17 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 23:48:17 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1a21c10001>; Thu, 23 Jul 2020 16:48:17 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v4 02/14] i2c: tegra: Remove NULL pointer check before clk_enable/disable/prepare/unprepare
Date:   Thu, 23 Jul 2020 16:51:00 -0700
Message-ID: <1595548272-9809-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595548085; bh=jD0igf8U1bTJzOqQcNuwvqEC25xsAMW3RMlh+sdfw58=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ENPrKbk31hDdtOdLpNXjzsNn+ZpaqkAbsmKyMQNFeyBEMePQLr53Fyi5MJzlLm2NK
         lTq7IZtJTAepkSsqXcTApOvJJBQEJv9zG/LdzmKh15/xQa5j9Tz5wurZWqzb3BhpXP
         qXY9xLxdmpT3xfr+B4r5pplHVlcvs9ygjRg7Yb2kJFxKdyI6LBsxV0OHvTuty+h2Z1
         R6dEVhfW8FdGBKDtfmyHMnwgbdRjtZCisZghA/nAx0IwAmJjvCiUbGm2fQ7iPJ2op8
         pRwyAIGVAQpOpmv0uFy8FzxxnFs40x+FCmSSH4EO6dVmcZ6wXk/bMg40qB0F66R4FD
         3SITAuf3L120A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

clk_enable, clk_disable, clk_prepare, and clk_unprepare APIs have
implementation for checking clk pointer not NULL and clock consumers
can safely call these APIs without NULL pointer check.

So, this patch cleans up Tegra i2c driver to remove explicit checks
before these APIs.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 64 +++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3be1018..c91307b9 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -655,21 +655,17 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		ret = clk_enable(i2c_dev->fast_clk);
-		if (ret < 0) {
-			dev_err(i2c_dev->dev,
-				"Enabling fast clk failed, err %d\n", ret);
-			return ret;
-		}
+	ret = clk_enable(i2c_dev->fast_clk);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev,
+			"Enabling fast clk failed, err %d\n", ret);
+		return ret;
 	}
 
-	if (i2c_dev->slow_clk) {
-		ret = clk_enable(i2c_dev->slow_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable slow clock: %d\n", ret);
-			return ret;
-		}
+	ret = clk_enable(i2c_dev->slow_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable slow clock: %d\n", ret);
+		return ret;
 	}
 
 	ret = clk_enable(i2c_dev->div_clk);
@@ -688,12 +684,8 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
 	clk_disable(i2c_dev->div_clk);
-
-	if (i2c_dev->slow_clk)
-		clk_disable(i2c_dev->slow_clk);
-
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_disable(i2c_dev->fast_clk);
+	clk_disable(i2c_dev->slow_clk);
+	clk_disable(i2c_dev->fast_clk);
 
 	return pinctrl_pm_select_idle_state(i2c_dev->dev);
 }
@@ -1716,20 +1708,16 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c_dev);
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		ret = clk_prepare(i2c_dev->fast_clk);
-		if (ret < 0) {
-			dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
-			return ret;
-		}
+	ret = clk_prepare(i2c_dev->fast_clk);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		return ret;
 	}
 
-	if (i2c_dev->slow_clk) {
-		ret = clk_prepare(i2c_dev->slow_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to prepare slow clock: %d\n", ret);
-			goto unprepare_fast_clk;
-		}
+	ret = clk_prepare(i2c_dev->slow_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to prepare slow clock: %d\n", ret);
+		goto unprepare_fast_clk;
 	}
 
 	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
@@ -1843,12 +1831,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	clk_unprepare(i2c_dev->div_clk);
 
 unprepare_slow_clk:
-	if (i2c_dev->is_vi)
-		clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->slow_clk);
 
 unprepare_fast_clk:
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_unprepare(i2c_dev->fast_clk);
+	clk_unprepare(i2c_dev->fast_clk);
 
 	return ret;
 }
@@ -1867,12 +1853,8 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
-
-	if (i2c_dev->slow_clk)
-		clk_unprepare(i2c_dev->slow_clk);
-
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_unprepare(i2c_dev->fast_clk);
+	clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->fast_clk);
 
 	tegra_i2c_release_dma(i2c_dev);
 	return 0;
-- 
2.7.4

