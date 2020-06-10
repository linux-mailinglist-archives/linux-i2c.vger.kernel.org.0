Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858C71F4D91
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgFJGDi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:03:38 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11247 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgFJGCy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:54 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee077300000>; Tue, 09 Jun 2020 23:01:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jun 2020 23:02:52 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:52 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:52 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee0778b0001>; Tue, 09 Jun 2020 23:02:51 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 14/18] gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
Date:   Tue, 9 Jun 2020 23:02:36 -0700
Message-ID: <1591768960-31648-15-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768881; bh=4ES5kAI2PqYLOuW0Im9Hz1dnAeW5Q4i+H7tHmdv9tVo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=E037ThJS7qicWEsMWvyN/ueFgwG4zQpBEo07RuddWKJ32kyJJ0rkb2WGoa1D9Xx3S
         aYYnrbQ5C3DxvzcEaK4o8IYsP9DzAgP6QJj/0vu7gSL1dLGv407/4ZYwYTsyG0uQz4
         KWf+mdaWYqJ8JnvHIglMdYixDisYyR/XF986yG8HRzjkptct4cZ7L9uPeadAPGzPvV
         yIshu15lKPipChUSrC7cu30GqO9SsPAFoUNScf4gNuRWAw4GzXwPgmNAtu9fl8Qy5q
         JPtccvmr/83nkDj1GZOYRu0Dbig07SfMBAZWQKqvaDcF8hdmf+vZ4uzDx4ZqNwROSf
         k12s7xbWpFdIA==
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
index 38beab9..814363f 100644
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
index f51fe69..a01df6a 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -299,22 +299,35 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
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
@@ -380,12 +393,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
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
index a61ca52..dbad062 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -332,5 +332,6 @@ void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_calibrate(struct tegra_mipi_device *device);
+int tegra_mipi_wait(struct tegra_mipi_device *device);
 
 #endif
-- 
2.7.4

