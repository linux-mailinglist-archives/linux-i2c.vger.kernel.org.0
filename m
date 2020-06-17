Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6751FC375
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgFQBjq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:39:46 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19583 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgFQBjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee973fe0000>; Tue, 16 Jun 2020 18:38:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jun 2020 18:39:45 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:44 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:44 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee9745f0000>; Tue, 16 Jun 2020 18:39:43 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 14/18] gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
Date:   Tue, 16 Jun 2020 18:41:30 -0700
Message-ID: <1592358094-23459-15-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357886; bh=O5AZ1YsJyVgIvzzx4UikQW0HGSpF8jhWcrl9iX7G1sw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=EphXYlUesGN2f54pb5yFegg+T9OllayVCcfPcs+x0iosgUxgLUw5ssotw4EvOD7mJ
         4O0ylnb7tDe5aKBxSBwrL7WeET3wNQLQp2m3Y5EnFhUsEl8TapJVNd7Gh/MZKbnF7T
         Vo21X0IFvcrqbn2kESBkTwfg9sK+4AjkAhZV1JLHI+yuz6K5FI5caZSxP/+aen1LMx
         jar6UX32EME8otgaGMiiOKn8onleNT4cp6EapRD3MIYvK22/Nh/buUfy44AuAlhsNM
         7Z1ZOOzuuI0dBUZT5qYWlFgDrONMn4Eet5lh0Zw7rsexgfKfDz8toHXXfYvI+jodnr
         jDan0Cpr4pawg==
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
 drivers/gpu/host1x/mipi.c   | 23 +++++++++++++++++------
 include/linux/host1x.h      |  1 +
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 0443589..93e9d85 100644
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
index 93b354b..99ea36f 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -296,22 +296,35 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 }
 EXPORT_SYMBOL(tegra_mipi_disable);
 
-static int tegra_mipi_wait(struct tegra_mipi *mipi)
+int tegra_mipi_wait(struct tegra_mipi_device *device)
 {
+	struct tegra_mipi *mipi = device->mipi;
 	unsigned long timeout = jiffies + msecs_to_jiffies(250);
 	u32 value;
+	int err;
+
+	err = clk_enable(device->mipi->clk);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&device->mipi->lock);
 
 	while (time_before(jiffies, timeout)) {
 		value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
 		if ((value & MIPI_CAL_STATUS_ACTIVE) == 0 &&
 		    (value & MIPI_CAL_STATUS_DONE) != 0)
-			return 0;
+			goto done;
 
 		usleep_range(10, 50);
 	}
 
-	return -ETIMEDOUT;
+	err = -ETIMEDOUT;
+done:
+	mutex_unlock(&device->mipi->lock);
+	clk_disable(device->mipi->clk);
+	return err;
 }
+EXPORT_SYMBOL(tegra_mipi_wait);
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 {
@@ -377,12 +390,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
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
index 61dc577..cf45ec2 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -331,5 +331,6 @@ void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_calibrate(struct tegra_mipi_device *device);
+int tegra_mipi_wait(struct tegra_mipi_device *device);
 
 #endif
-- 
2.7.4

