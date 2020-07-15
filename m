Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDA9220394
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728805AbgGOEUI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:20:08 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9602 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728478AbgGOETk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e836a0000>; Tue, 14 Jul 2020 21:17:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 Jul 2020 21:19:39 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:39 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:39 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83d90012>; Tue, 14 Jul 2020 21:19:38 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 15/18] gpu: host1x: mipi: Use readl_relaxed_poll_timeout in tegra_mipi_wait
Date:   Tue, 14 Jul 2020 21:20:52 -0700
Message-ID: <1594786855-26506-16-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786666; bh=OrA56lLocgK9NzCJgW1OH13QXVaE/JCoai+p9SudmJM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=EagUyXsE4GMVuPsntbJiXG3xrszqGUU+vvJPtKF6z8xFdQbeMP6YtaTGIfslblg9g
         Ay6PkUk5h9UcorGLN7CwC6ccJ+8VofSHlRiew9ls9mHV0W/+c1mskBQZNZNE0fbZxV
         /bdIPL/o2MgnZRXPNO2sSrS9av/ebTn57GlcySbqWNHOAyhAWq6BnTXc1PXRIRlgDw
         lJoNHGNnd6atAPF2x/4cxdAmXFq+nIoQDqy5SJjJrhMa28p5t2y2Uoce8bZh94s1PR
         Lg7hDeBcXBkEmOvqY4xMbVcMBoOhVH7wWWfVpMFJjy2q3CeMB4/gT7x9mTirjIl/O4
         ztHF1t/jb7OWA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use readl_relaxed_poll_timeout() in tegra_mipi_wait() to simplify
the code.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/host1x/mipi.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 762d349..259e70c 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -21,9 +21,9 @@
  */
 
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -295,19 +295,15 @@ EXPORT_SYMBOL(tegra_mipi_disable);
 
 static int tegra_mipi_wait(struct tegra_mipi *mipi)
 {
-	unsigned long timeout = jiffies + msecs_to_jiffies(250);
+	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
 	u32 value;
+	int err;
 
-	while (time_before(jiffies, timeout)) {
-		value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
-		if ((value & MIPI_CAL_STATUS_ACTIVE) == 0 &&
-		    (value & MIPI_CAL_STATUS_DONE) != 0)
-			return 0;
-
-		usleep_range(10, 50);
-	}
-
-	return -ETIMEDOUT;
+	err = readl_relaxed_poll_timeout(status_reg, value,
+					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
+					 (value & MIPI_CAL_STATUS_DONE), 50,
+					 250000);
+	return err;
 }
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
-- 
2.7.4

