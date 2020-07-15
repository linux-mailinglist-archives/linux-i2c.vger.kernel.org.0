Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1507022037F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgGOETm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:19:42 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4642 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgGOETm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:42 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e83d10000>; Tue, 14 Jul 2020 21:19:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 Jul 2020 21:19:41 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:41 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:41 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83dc0000>; Tue, 14 Jul 2020 21:19:40 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 17/18] media: tegra-video: Add CSI MIPI pads calibration
Date:   Tue, 14 Jul 2020 21:20:54 -0700
Message-ID: <1594786855-26506-18-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786769; bh=Ah9VTi1AABBsKQfXAi49KcBbZ1sPcfnwuIUbjiM3nVs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Ei3KOiqBwd54qMK+GrKDSAPG06t7zT4OpORFtI6uqbIshnRups7TcalnaTsA0eNLE
         seg7CRJXcH+ALtH9XEJFWyau97q6q0pZCXaK2yfZNtdQpL2YhF9VPEHaCq17zCgkJA
         zCvx9WXvOaMYcdO4ghDaZhH0WZ+IDs4eh6lrGBiGJJJJ4KqH1UvnVRj8NU5aDSWVu9
         66dkHAkj45m1vC0eI3s75Kt1GbBkiTBYLHHK48YJZ/J57njX0YgsYz7OnP51gHLIUb
         bN+DsIIxxbkwNAoa8SLm53bSBjV7GhLx4GDEzwg7TIZMNsPxnI7EIXY+poodOb7X9V
         nENCv46zVApmw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

CSI MIPI pads need to be enabled and calibrated for capturing from
the external sensor or transmitter.

MIPI CAL unit calibrates MIPI pads pull-up, pull-down and termination
impedances. Calibration is done by co-work of MIPI BIAS pad and MIPI
CAL control unit.

Triggering calibration start can happen any time after MIPI pads are
enabled but calibration results will be latched and applied to MIPI
pads by MIPI CAL unit only when the link is in LP11 state and then
calibration status register gets updated.

This patch enables CSI MIPI pads and calibrates them during streaming.

Tegra CSI receiver is able to catch the very first clock transition.
So, CSI receiver is always enabled prior to sensor streaming and
trigger of calibration start is done during CSI subdev streaming and
status of calibration is verified after sensor stream on.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 44 +++++++++++++++++++++++++++++++--
 drivers/staging/media/tegra-video/csi.h |  2 ++
 drivers/staging/media/tegra-video/vi.c  | 16 ++++++++++++
 3 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index c21dd09..75c844d 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -252,15 +252,42 @@ static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
 			return ret;
 		}
 
+		if (csi_chan->mipi) {
+			ret = tegra_mipi_enable(csi_chan->mipi);
+			if (ret < 0) {
+				dev_err(csi->dev,
+					"failed to enable MIPI pads: %d\n",
+					ret);
+				goto rpm_put;
+			}
+
+			/*
+			 * CSI MIPI pads PULLUP, PULLDN and TERM impedances
+			 * need to be calibrated after power on.
+			 * So, trigger the calibration start here and results
+			 * will be latched and applied to the pads when link is
+			 * in LP11 state during start of sensor streaming.
+			 */
+			tegra_mipi_calibrate(csi_chan->mipi);
+		}
+
 		ret = csi->ops->csi_start_streaming(csi_chan);
 		if (ret < 0)
-			goto rpm_put;
+			goto disable_mipi;
 
 		return 0;
 	}
 
 	csi->ops->csi_stop_streaming(csi_chan);
 
+disable_mipi:
+	if (csi_chan->mipi) {
+		ret = tegra_mipi_disable(csi_chan->mipi);
+		if (ret < 0)
+			dev_err(csi->dev,
+				"failed to disable MIPI pads: %d\n", ret);
+	}
+
 rpm_put:
 	pm_runtime_put(csi->dev);
 	return ret;
@@ -294,6 +321,7 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   unsigned int num_pads)
 {
 	struct tegra_csi_channel *chan;
+	int ret = 0;
 
 	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
 	if (!chan)
@@ -312,7 +340,16 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	}
 
-	return 0;
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		return 0;
+
+	chan->mipi = tegra_mipi_request(csi->dev, node);
+	if (IS_ERR(chan->mipi)) {
+		ret = PTR_ERR(chan->mipi);
+		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+	}
+
+	return ret;
 }
 
 static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
@@ -475,6 +512,9 @@ static void tegra_csi_channels_cleanup(struct tegra_csi *csi)
 	struct tegra_csi_channel *chan, *tmp;
 
 	list_for_each_entry_safe(chan, tmp, &csi->csi_chans, list) {
+		if (chan->mipi)
+			tegra_mipi_free(chan->mipi);
+
 		subdev = &chan->subdev;
 		if (subdev->dev) {
 			if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 78a5110..0d50fc3 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -50,6 +50,7 @@ struct tegra_csi;
  * @framerate: active framerate for TPG
  * @h_blank: horizontal blanking for TPG active format
  * @v_blank: vertical blanking for TPG active format
+ * @mipi: mipi device for corresponding csi channel pads
  */
 struct tegra_csi_channel {
 	struct list_head list;
@@ -65,6 +66,7 @@ struct tegra_csi_channel {
 	unsigned int framerate;
 	unsigned int h_blank;
 	unsigned int v_blank;
+	struct tegra_mipi_device *mipi;
 };
 
 /**
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 676e24e2..58ad992 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -191,6 +191,7 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
 {
 	struct v4l2_subdev *subdev, *csi_subdev, *src_subdev;
+	struct tegra_csi_channel *csi_chan;
 	int ret;
 
 	csi_subdev = tegra_channel_get_remote_csi_subdev(chan);
@@ -213,6 +214,21 @@ int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
 
+	/*
+	 * CSI subdev stream-on triggers start of MIPI pads calibration.
+	 * Calibration results are latched and applied to the pads when
+	 * link is in LP11 state which will happen during sensor stream-on.
+	 * So, wait for pads calibration to complete here.
+	 */
+	csi_chan = v4l2_get_subdevdata(csi_subdev);
+	if (on && csi_chan->mipi) {
+		ret = tegra_mipi_wait(csi_chan->mipi);
+		if (ret < 0)
+			dev_err(csi_chan->csi->dev,
+				"MIPI calibration failed: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.7.4

