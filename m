Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B38B1FC391
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgFQBkX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:40:23 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13817 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgFQBjo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee974520000>; Tue, 16 Jun 2020 18:39:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jun 2020 18:39:43 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:43 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:43 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee9745d0007>; Tue, 16 Jun 2020 18:39:42 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 13/18] gpu: host1x: mipi: Update tegra_mipi_request() to be node based
Date:   Tue, 16 Jun 2020 18:41:29 -0700
Message-ID: <1592358094-23459-14-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357970; bh=kCDex2voNG6qTIY1Ta7QIgB/EQkB6udXUuVzRgnTSpc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Tg3lahZYzRoKd0bxhIGM95MH01LHqDAi27S8bJiL7oNdd/leRgRcAhPUzRKh58Xvl
         q4knR2P+o1ywQiDW+t66BxkwsPXhqta0TlJndatEq2eqGivOWgMEazUV4OHYfNYi+v
         Z+zmzXwZilHKHSCRKgse1cVzqzM1DJv9mS4UX06vfdhpT2DdfS5SlGYHWcviUNEZ+S
         NSxV04MdVruSOkss+609AHej7Dp2U90c6OXXE0HJcDPnXyHNznDzTvURpjh97p6P5M
         hN1yhhlD0huSnzKm8xlcWo3bTFc43W9A54Zg9st+2x1F5TZLywm1bDs1VEH72FZ3B0
         pjIMg54c7yByA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tegra CSI driver need a separate MIPI device for each channel as
calibration of corresponding MIPI pads for each channel should
happen independently.

So, this patch updates tegra_mipi_request() API to add a device_node
pointer argument to allow creating mipi device for specific device
node rather than a device.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c | 2 +-
 drivers/gpu/host1x/mipi.c   | 7 +++++--
 include/linux/host1x.h      | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 38beab9..0443589 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1618,7 +1618,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);
 
-	dsi->mipi = tegra_mipi_request(&pdev->dev);
+	dsi->mipi = tegra_mipi_request(&pdev->dev, NULL);
 	if (IS_ERR(dsi->mipi))
 		return PTR_ERR(dsi->mipi);
 
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e00809d..93b354b 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -206,13 +206,16 @@ static int tegra_mipi_power_down(struct tegra_mipi *mipi)
 	return 0;
 }
 
-struct tegra_mipi_device *tegra_mipi_request(struct device *device)
+struct tegra_mipi_device *tegra_mipi_request(struct device *device,
+					     struct device_node *np)
 {
-	struct device_node *np = device->of_node;
 	struct tegra_mipi_device *dev;
 	struct of_phandle_args args;
 	int err;
 
+	if (!np)
+		np = device->of_node;
+
 	err = of_parse_phandle_with_args(np, "nvidia,mipi-calibrate",
 					 "#nvidia,mipi-calibrate-cells", 0,
 					 &args);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index c230b4e..61dc577 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -325,7 +325,8 @@ int host1x_client_resume(struct host1x_client *client);
 
 struct tegra_mipi_device;
 
-struct tegra_mipi_device *tegra_mipi_request(struct device *device);
+struct tegra_mipi_device *tegra_mipi_request(struct device *device,
+					     struct device_node *np);
 void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
-- 
2.7.4

