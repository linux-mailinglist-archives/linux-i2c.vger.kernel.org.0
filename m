Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4279F22038F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgGOEUD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:20:03 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9609 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728518AbgGOETl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e836b0000>; Tue, 14 Jul 2020 21:17:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 21:19:40 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:40 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:40 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83da0008>; Tue, 14 Jul 2020 21:19:39 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
Date:   Tue, 14 Jul 2020 21:20:53 -0700
Message-ID: <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786667; bh=tqa8cFH9kC/IhmkUPxcaINoqX9Dl2lsTo66zcOpzXBA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=WKGDFFwkS7eTYdWRlwFfwL6yY8dpiYSCcy7k8J/thmZGgtRvBxPWPI+Hg+haKyrMH
         FRZJ4iOR6szK6WvZqcW9gUam8bqjRz704ODJop3nwnnjtbpkSWlxD4kaGJt/8mzDiV
         eqmyPEWhts0zP083fZ47kW1qnabVqFVPnnFFYMw/62iEeq1yvYRErftXFKkLMAT1Oh
         wADmo5U7pE7pts8W9/Fsnd1HsSrrkxF9kkd56sEPbl/aGvtJbOZ2urvVOt9f/TKFkM
         Yjo95p4TQaGT5C1b38EmvabMxXzcemjKOgeK+iJoJ0MHhCg7ApWQT/3G6VHVGLBYii
         oz+Ai+bjVsTYg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SW can trigger MIPI pads calibration any time after power on
but calibration results will be latched and applied to the pads
by MIPI CAL unit only when the link is in LP-11 state and then
status register will be updated.

For CSI, trigger of pads calibration happen during CSI stream
enable where CSI receiver is kept ready prior to sensor or CSI
transmitter stream start.

So, pads may not be in LP-11 at this time and waiting for the
calibration to be done immediate after calibration start will
result in timeout.

This patch splits tegra_mipi_calibrate() and tegra_mipi_wait()
so triggering for calibration and waiting for it to complete can
happen at different stages.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c |  7 ++++++-
 drivers/gpu/host1x/mipi.c   | 17 +++++++++++++----
 include/linux/host1x.h      |  1 +
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3c09e29..1a76f1f 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -670,6 +670,7 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
 static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 {
 	u32 value;
+	int ret;
 
 	/*
 	 * XXX Is this still needed? The module reset is deasserted right
@@ -693,7 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
 	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
 
-	return tegra_mipi_calibrate(dsi->mipi);
+	ret = tegra_mipi_calibrate(dsi->mipi);
+	if (ret < 0)
+		return ret;
+
+	return tegra_mipi_wait(dsi->mipi);
 }
 
 static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 259e70c..e606464 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -293,18 +293,29 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 }
 EXPORT_SYMBOL(tegra_mipi_disable);
 
-static int tegra_mipi_wait(struct tegra_mipi *mipi)
+int tegra_mipi_wait(struct tegra_mipi_device *device)
 {
+	struct tegra_mipi *mipi = device->mipi;
 	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
 	u32 value;
 	int err;
 
+	err = clk_enable(device->mipi->clk);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&device->mipi->lock);
+
 	err = readl_relaxed_poll_timeout(status_reg, value,
 					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
 					 (value & MIPI_CAL_STATUS_DONE), 50,
 					 250000);
+	mutex_unlock(&device->mipi->lock);
+	clk_disable(device->mipi->clk);
+
 	return err;
 }
+EXPORT_SYMBOL(tegra_mipi_wait);
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 {
@@ -370,12 +381,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value |= MIPI_CAL_CTRL_START;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
-	err = tegra_mipi_wait(device->mipi);
-
 	mutex_unlock(&device->mipi->lock);
 	clk_disable(device->mipi->clk);
 
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL(tegra_mipi_calibrate);
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9e67841..20c885d 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -334,5 +334,6 @@ void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_calibrate(struct tegra_mipi_device *device);
+int tegra_mipi_wait(struct tegra_mipi_device *device);
 
 #endif
-- 
2.7.4

