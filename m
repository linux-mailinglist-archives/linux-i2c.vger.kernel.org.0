Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1A222FA94
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgG0UwY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:52:24 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9087 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgG0Uv6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 16:51:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3e610000>; Mon, 27 Jul 2020 13:51:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:51:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:51:58 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:51:58 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 27 Jul 2020 20:51:58 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1f3e6d0003>; Mon, 27 Jul 2020 13:51:58 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v5 12/14] gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
Date:   Mon, 27 Jul 2020 13:57:30 -0700
Message-ID: <1595883452-17343-13-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883105; bh=qXeZws+JBgq3aj5FVst/JW0XHKo0Of2Z2367pT18YMQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=R7RkXQfYj2HhiSkxQ8yY3KZVj5jOcSzDPNpcPURmX7Uc6ilMRIFOcD739tNAuB6Xh
         688Mb1YwARi439UE8u5/Jvtl7D+C0XnGHU67Qq82htzjwNX542QTvQZ07JXBjd2QYz
         /1gYEPspAKiUnRnDBqK+ABCMekbh1H+qqueiTNeIjReJHpz5CoKFpodSNqs4FKyXBU
         lVWQb9m85BVMjp5UJ4K4LAo61d5XGsAd3APcKU0OFivO8XfwkxjO75ln8/yMOOiAn7
         VbM7WSQ302gYr1NSSMenpf1ZkYSEX12MQqg2//Ey8DcVemMbzUfw2gj0s2JATlAuC8
         16kPhHJXLMs7A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

With the split of MIPI calibration into tegra_mipi_calibrate() and
tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
is done.

So, this patch skips disabling MIPI clock after triggering start of
calibration and disables it only after waiting for done status from
the calibration logic.

This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration()
and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
with their usage.

As MIPI clock is left enabled and in case of any failures with CSI input
streaming tegra_mipi_finish_calibration() will not get invoked.
So added new API tegra_mipi_cancel_calibration() which disables MIPI clock
and consumer drivers can call this in such cases.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c |  4 ++--
 drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
 include/linux/host1x.h      |  5 +++--
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3820e8d..a7864e9 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
 	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
 
-	err = tegra_mipi_calibrate(dsi->mipi);
+	err = tegra_mipi_start_calibration(dsi->mipi);
 	if (err < 0)
 		return err;
 
-	return tegra_mipi_wait(dsi->mipi);
+	return tegra_mipi_finish_calibration(dsi->mipi);
 }
 
 static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e606464..b15ab6e 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 }
 EXPORT_SYMBOL(tegra_mipi_disable);
 
-int tegra_mipi_wait(struct tegra_mipi_device *device)
+void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
+{
+	clk_disable(device->mipi->clk);
+}
+EXPORT_SYMBOL(tegra_mipi_cancel_calibration);
+
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
 {
 	struct tegra_mipi *mipi = device->mipi;
 	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
 	u32 value;
 	int err;
 
-	err = clk_enable(device->mipi->clk);
-	if (err < 0)
-		return err;
-
 	mutex_lock(&device->mipi->lock);
 
 	err = readl_relaxed_poll_timeout(status_reg, value,
@@ -315,9 +317,9 @@ int tegra_mipi_wait(struct tegra_mipi_device *device)
 
 	return err;
 }
-EXPORT_SYMBOL(tegra_mipi_wait);
+EXPORT_SYMBOL(tegra_mipi_finish_calibration);
 
-int tegra_mipi_calibrate(struct tegra_mipi_device *device)
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 {
 	const struct tegra_mipi_soc *soc = device->mipi->soc;
 	unsigned int i;
@@ -382,11 +384,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
 	mutex_unlock(&device->mipi->lock);
-	clk_disable(device->mipi->clk);
 
 	return 0;
 }
-EXPORT_SYMBOL(tegra_mipi_calibrate);
+EXPORT_SYMBOL(tegra_mipi_start_calibration);
 
 static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 	{ .data = MIPI_CAL_CONFIG_CSIA },
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 20c885d..b490dda 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -333,7 +333,8 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
-int tegra_mipi_calibrate(struct tegra_mipi_device *device);
-int tegra_mipi_wait(struct tegra_mipi_device *device);
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
+void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device);
 
 #endif
-- 
2.7.4

