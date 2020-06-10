Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DF81F4DAF
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgFJGD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:03:58 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10517 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgFJGCx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee0777f0000>; Tue, 09 Jun 2020 23:02:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jun 2020 23:02:53 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:52 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:52 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee0778c0000>; Tue, 09 Jun 2020 23:02:52 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 15/18] media: tegra-video: Add CSI MIPI pads calibration
Date:   Tue, 9 Jun 2020 23:02:37 -0700
Message-ID: <1591768960-31648-16-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768959; bh=AWSdGho3B6opMA0Fsj5eNKNr921zMuFJ1SGjzzkoGx4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=dWurmY7e/RIK7jLEzGvdkzDQTgwWXsvLr+DjO4v1sdCSmveULTytMCj6X0zCWetCW
         h4sXTIzz/XiwbO38V3PDe+NbwQJlI+MLbhAeEm+sz1d8ldCEvhS2rch/AaFuTQV+73
         rNnVJSeSzGaiCfECSfL1SilJnKPP1CS1VX1td9n6EPUROezmSWe00WRdmylUhNwRzY
         PUQbAv8ZDXxWVZ/Dxdf0vy7STIXE3vlwtUxclMO4OqAohhKh1j5KpVKbC/1smJYNAr
         rB184zcSnWJMTijAAMQHSWRMgpSnYoyxlPzfQPoFqa2NW5+bJNXDl+/1Ozmk2T3WIs
         Dhnmq+5iNCGfg==
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
 drivers/staging/media/tegra-video/vi.c  | 18 ++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 14e9050..82e340a 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -249,15 +249,42 @@ static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
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
@@ -291,6 +318,7 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   unsigned int num_pads)
 {
 	struct tegra_csi_channel *chan;
+	int ret = 0;
 
 	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
 	if (!chan)
@@ -309,7 +337,16 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	}
 
-	return 0;
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		return 0;
+
+	chan->mipi = of_tegra_mipi_request(csi->dev, node);
+	if (IS_ERR(chan->mipi)) {
+		ret = PTR_ERR(chan->mipi);
+		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+	}
+
+	return ret;
 }
 
 static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
@@ -473,6 +510,9 @@ static void tegra_csi_channels_cleanup(struct tegra_csi *csi)
 	struct tegra_csi_channel *chan, *tmp;
 
 	list_for_each_entry_safe(chan, tmp, &csi->csi_chans, list) {
+		if (chan->mipi)
+			tegra_mipi_free(chan->mipi);
+
 		subdev = &chan->subdev;
 		if (subdev->dev) {
 			if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index b7b754a..0e5a537 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -51,6 +51,7 @@ struct tegra_csi;
  * @framerate: active framerate for TPG
  * @h_blank: horizontal blanking for TPG active format
  * @v_blank: vertical blanking for TPG active format
+ * @mipi: mipi device for corresponding csi channel pads
  */
 struct tegra_csi_channel {
 	struct list_head list;
@@ -66,6 +67,7 @@ struct tegra_csi_channel {
 	unsigned int framerate;
 	unsigned int h_blank;
 	unsigned int v_blank;
+	struct tegra_mipi_device *mipi;
 };
 
 /**
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 03def26..337a19f 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -187,6 +187,7 @@ tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan, bool sensor)
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
 {
 	struct v4l2_subdev *subdev;
+	struct tegra_csi_channel *csi_chan;
 	int ret;
 
 	/* stream CSI */
@@ -198,11 +199,28 @@ int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
 	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return 0;
 
+	if (on)
+		csi_chan = v4l2_get_subdevdata(subdev);
+
 	subdev = tegra_channel_get_remote_subdev(chan, on);
 	ret = v4l2_subdev_call(subdev, video, s_stream, on);
 	if (on && ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
 
+	/*
+	 * CSI subdev stream on triggers start of MIPI pads calibration.
+	 * Calibration results are latched and applied to the pads when
+	 * link is in LP11 state which will hapen during sensor streaming.
+	 * So, wait for calibration to complete here.
+	 */
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

