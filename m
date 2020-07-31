Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEB42341F2
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 11:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbgGaJDc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 05:03:32 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17500 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732054AbgGaJC6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 05:02:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f23de130000>; Fri, 31 Jul 2020 02:02:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 02:02:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 Jul 2020 02:02:57 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 09:02:57 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 31 Jul 2020 09:02:57 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f23de400003>; Fri, 31 Jul 2020 02:02:57 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v6 05/10] media: tegra-video: Separate CSI stream enable and disable implementations
Date:   Fri, 31 Jul 2020 02:02:44 -0700
Message-ID: <1596186169-18729-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596186131; bh=v45IwLHdNkziBUe5ELO69+GJpyU84YW14CDpQ+/rwO4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=R84NfFWyUFNyu1lVLcCuvKofRYFBMnaB/qny6mEhAcki9jtpd9DYwfmbZyD6uAaCZ
         LCgxEH0ixRbhYEV5X7NXLoh3iMOTTfGIJX3ycl5t0kJ5rIBlQTid3HQ8HOE7tz6OLc
         b39RgAeWxxXKpA/fBJIYvtaBp8jVpM1lYpiVJ/P8pJ2S66FRn05kVwgJ3Dsq+RrNxX
         9Iwi9n4PWiPpXxo2YTwB/TQg6i9jW98O8ZA/7Nel4vzNJYztUN0U9g0J2kYOWkIuCF
         hXkYH79vKSPRi+3NJwzZvOMuB8TLCdOKsmmTU/hVnZPSYTG4vuEZHJ2rqbbtTl9F1g
         OXAbN0+fgfsbg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch separates implementation of CSI stream enable and disable
into separate functions for readability.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 51 ++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index fb667df..cfe6187 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -232,34 +232,53 @@ static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
+static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
-	int ret = 0;
+	int ret;
+
+	ret = pm_runtime_get_sync(csi->dev);
+	if (ret < 0) {
+		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
+		pm_runtime_put_noidle(csi->dev);
+		return ret;
+	}
 
 	csi_chan->pg_mode = chan->pg_mode;
-	if (enable) {
-		ret = pm_runtime_get_sync(csi->dev);
-		if (ret < 0) {
-			dev_err(csi->dev,
-				"failed to get runtime PM: %d\n", ret);
-			pm_runtime_put_noidle(csi->dev);
-			return ret;
-		}
+	ret = csi->ops->csi_start_streaming(csi_chan);
+	if (ret < 0)
+		goto rpm_put;
 
-		ret = csi->ops->csi_start_streaming(csi_chan);
-		if (ret < 0)
-			goto rpm_put;
+	return 0;
 
-		return 0;
-	}
+rpm_put:
+	pm_runtime_put(csi->dev);
+	return ret;
+}
+
+static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct tegra_csi *csi = csi_chan->csi;
 
 	csi->ops->csi_stop_streaming(csi_chan);
 
-rpm_put:
 	pm_runtime_put(csi->dev);
+
+	return 0;
+}
+
+static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
+{
+	int ret;
+
+	if (enable)
+		ret = tegra_csi_enable_stream(subdev);
+	else
+		ret = tegra_csi_disable_stream(subdev);
+
 	return ret;
 }
 
-- 
2.7.4

