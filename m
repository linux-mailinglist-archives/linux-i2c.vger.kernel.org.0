Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E2A2341CF
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 11:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732081AbgGaJDB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 05:03:01 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16339 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732069AbgGaJDA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 05:03:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f23de360000>; Fri, 31 Jul 2020 02:02:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 02:02:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 Jul 2020 02:02:59 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 09:02:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 31 Jul 2020 09:02:59 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f23de420003>; Fri, 31 Jul 2020 02:02:59 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v6 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
Date:   Fri, 31 Jul 2020 02:02:47 -0700
Message-ID: <1596186169-18729-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596186166; bh=wDgMkeYCZVezNoEVbmypSzb8rMjS8a+LjilsX0gytzo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=RT6W3p4SgCgOoljBEqKbELdmH2qXofHL8BXKb2Ig/MGPBR6fM3BTFyv+Smi2mXbwn
         iDu3pNcNp5dNfQJvCCQkp1H9aViYjV1D/kbjFOFeoNKdRH+aK70v4TDxGYwiT0BLM5
         9oKYpXbRi2av5rxLy/P4smMQyGoPQVqvKBCXnZy4HL/HV8mImAJfGa9ElceZjf/YIX
         PurTU9GosqlYZjMxaArRM6AfunuIWoERv+vs3PImvELkOe5YVELB68wuTvgW5HG5de
         EGBjMaiV2GcJBy0A3t7glI9QEOThSoOCTUs+5KvRFnn0zfTEF/PVFQSvtVH3uk61IG
         ro6m9rlfpXTEA==
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

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
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

