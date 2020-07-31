Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53A12341D8
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 11:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbgGaJDD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 05:03:03 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17518 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732076AbgGaJDB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 05:03:01 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f23de160003>; Fri, 31 Jul 2020 02:02:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 02:03:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 02:03:01 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 09:03:00 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 31 Jul 2020 09:03:00 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f23de440000>; Fri, 31 Jul 2020 02:03:00 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v6 10/10] media: tegra-video: Compute settle times based on the clock rate
Date:   Fri, 31 Jul 2020 02:02:49 -0700
Message-ID: <1596186169-18729-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596186134; bh=xySsE7za0xO75KrkGetk9BUyrbtaRgHSf5U9ahjodHM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=U9tFsmt+xScoE4yNJYn+NAGvcMzXDbosXgTI+i7UE/ceXbVGEGBvtOXKmCqiUZ8NG
         Hta0DAk2zf05f7gbnhSrGqDFwChCYLtdgcfQfKsLMeavvqml2pOS7IZIKsCUaSxpS/
         mGqOKoB8pAT1C6YiRf1LDWekG2xCVEq5tpt6f04BTtxsR5cMRBPA7u08/eGELk6wu4
         huUlMDAS+nU3jUuCWcZArM9eS1VR7G4ecymLd+un8FTvnnwVoB6d4KMJwa0ycjuTUO
         nW3dLsVQo6rNCOVRggt2jfzav2PjJrFqa8VgkfJGnIgVsnVAGI8ZZ2O0nKj7hMsuyx
         uGTyHBgsQWxOw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Settle time determines the number of cil clock cyles to wait after
LP00 when moving from LP to HS.

This patch computes T-CLK-SETTLE and T-HS-SETTLE times based on cil
clock rate and pixel rate from the sensor and programs them during
streaming.

T-CLK-SETTLE time is the interval during which receiver will ignore
any HS transitions on clock lane starting from the beginning of
T-CLK-PREPARE.

T-HS-SETTLE time is the interval during which recevier will ignore
any HS transitions on data lane starting from the beginning of
T-HS-PREPARE.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/TODO       |  1 -
 drivers/staging/media/tegra-video/csi.c      | 55 ++++++++++++++++++++++++++++
 drivers/staging/media/tegra-video/csi.h      |  5 +++
 drivers/staging/media/tegra-video/tegra210.c | 17 ++++++++-
 4 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/staging/media/tegra-video/TODO
index 98d3c7d..c821081 100644
--- a/drivers/staging/media/tegra-video/TODO
+++ b/drivers/staging/media/tegra-video/TODO
@@ -1,5 +1,4 @@
 TODO list
-* Add MIPI clock Settle time computation based on the data rate.
 * Add support for Ganged mode.
 * Add RAW10 packed video format support to Tegra210 video formats.
 * Add support for suspend and resume.
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index ea0f941..1b24ebf 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -19,6 +19,8 @@
 #include "csi.h"
 #include "video.h"
 
+#define MHZ			1000000
+
 static inline struct tegra_csi *
 host1x_client_to_csi(struct host1x_client *client)
 {
@@ -235,6 +237,59 @@ static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
+{
+	struct tegra_vi_channel *chan;
+	struct v4l2_subdev *src_subdev;
+	struct v4l2_ctrl *ctrl;
+
+	chan = v4l2_get_subdev_hostdata(&csi_chan->subdev);
+	src_subdev = tegra_channel_get_remote_source_subdev(chan);
+	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (ctrl)
+		return v4l2_ctrl_g_ctrl_int64(ctrl);
+
+	return 0;
+}
+
+void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
+				u8 *clk_settle_time,
+				u8 *ths_settle_time)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int cil_clk_mhz;
+	unsigned int pix_clk_mhz;
+	int clk_idx = (csi_chan->csi_port_num >> 1) + 1;
+
+	cil_clk_mhz = clk_get_rate(csi->clks[clk_idx].clk) / MHZ;
+	pix_clk_mhz = csi_get_pixel_rate(csi_chan) / MHZ;
+
+	/*
+	 * CLK Settle time is the interval during which HS receiver should
+	 * ignore any clock lane HS transitions, starting from the beginning
+	 * of T-CLK-PREPARE.
+	 * Per DPHY specification, T-CLK-SETTLE should be between 95ns ~ 300ns
+	 *
+	 * 95ns < (clk-settle-programmed + 7) * lp clk period < 300ns
+	 * midpoint = 197.5 ns
+	 */
+	*clk_settle_time = ((95 + 300) * cil_clk_mhz - 14000) / 2000;
+
+	/*
+	 * THS Settle time is the interval during which HS receiver should
+	 * ignore any data lane HS transitions, starting from the beginning
+	 * of THS-PREPARE.
+	 *
+	 * Per DPHY specification, T-HS-SETTLE should be between 85ns + 6UI
+	 * and 145ns+10UI.
+	 * 85ns + 6UI < (Ths-settle-prog + 5) * lp_clk_period < 145ns + 10UI
+	 * midpoint = 115ns + 8UI
+	 */
+	if (pix_clk_mhz)
+		*ths_settle_time = (115 * cil_clk_mhz + 8000 * cil_clk_mhz
+				   / (2 * pix_clk_mhz) - 5000) / 1000;
+}
+
 static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 0d50fc3..c65ff73 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -51,6 +51,7 @@ struct tegra_csi;
  * @h_blank: horizontal blanking for TPG active format
  * @v_blank: vertical blanking for TPG active format
  * @mipi: mipi device for corresponding csi channel pads
+ * @pixel_rate: active pixel rate from the sensor on this channel
  */
 struct tegra_csi_channel {
 	struct list_head list;
@@ -67,6 +68,7 @@ struct tegra_csi_channel {
 	unsigned int h_blank;
 	unsigned int v_blank;
 	struct tegra_mipi_device *mipi;
+	unsigned int pixel_rate;
 };
 
 /**
@@ -147,4 +149,7 @@ extern const struct tegra_csi_soc tegra210_csi_soc;
 #endif
 
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
+void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
+				u8 *clk_settle_time,
+				u8 *ths_settle_time);
 #endif
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 253bf33..ac066c0 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -7,6 +7,7 @@
  * This source file contains Tegra210 supported video formats,
  * VI and CSI SoC specific data, operations and registers accessors.
  */
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/delay.h>
@@ -98,6 +99,8 @@
 #define   BRICK_CLOCK_B_4X				(0x2 << 16)
 #define TEGRA_CSI_CIL_PAD_CONFIG1                       0x004
 #define TEGRA_CSI_CIL_PHY_CONTROL                       0x008
+#define   CLK_SETTLE_MASK				GENMASK(13, 8)
+#define   THS_SETTLE_MASK				GENMASK(5, 0)
 #define TEGRA_CSI_CIL_INTERRUPT_MASK                    0x00c
 #define TEGRA_CSI_CIL_STATUS                            0x010
 #define TEGRA_CSI_CILX_STATUS                           0x014
@@ -770,8 +773,14 @@ static int tegra210_csi_start_streaming(struct tegra_csi_channel *csi_chan)
 {
 	struct tegra_csi *csi = csi_chan->csi;
 	unsigned int portno = csi_chan->csi_port_num;
+	u8 clk_settle_time = 0;
+	u8 ths_settle_time = 10;
 	u32 val;
 
+	if (!csi_chan->pg_mode)
+		tegra_csi_calc_settle_time(csi_chan, &clk_settle_time,
+					   &ths_settle_time);
+
 	csi_write(csi, portno, TEGRA_CSI_CLKEN_OVERRIDE, 0);
 
 	/* clean up status */
@@ -782,7 +791,9 @@ static int tegra210_csi_start_streaming(struct tegra_csi_channel *csi_chan)
 
 	/* CIL PHY registers setup */
 	cil_write(csi, portno, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
-	cil_write(csi, portno, TEGRA_CSI_CIL_PHY_CONTROL, 0xa);
+	cil_write(csi, portno, TEGRA_CSI_CIL_PHY_CONTROL,
+		  FIELD_PREP(CLK_SETTLE_MASK, clk_settle_time) |
+		  FIELD_PREP(THS_SETTLE_MASK, ths_settle_time));
 
 	/*
 	 * The CSI unit provides for connection of up to six cameras in
@@ -801,7 +812,9 @@ static int tegra210_csi_start_streaming(struct tegra_csi_channel *csi_chan)
 			  BRICK_CLOCK_A_4X);
 		cil_write(csi, portno + 1, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
 		cil_write(csi, portno + 1, TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
-		cil_write(csi, portno + 1, TEGRA_CSI_CIL_PHY_CONTROL, 0xa);
+		cil_write(csi, portno + 1, TEGRA_CSI_CIL_PHY_CONTROL,
+			  FIELD_PREP(CLK_SETTLE_MASK, clk_settle_time) |
+			  FIELD_PREP(THS_SETTLE_MASK, ths_settle_time));
 		csi_write(csi, portno, TEGRA_CSI_PHY_CIL_COMMAND,
 			  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENABLE);
 	} else {
-- 
2.7.4

