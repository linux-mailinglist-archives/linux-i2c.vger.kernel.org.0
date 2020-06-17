Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3083B1FC3C1
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgFQBke (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:40:34 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13811 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgFQBjm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee974500000>; Tue, 16 Jun 2020 18:39:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jun 2020 18:39:41 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:40 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:40 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee9745b0001>; Tue, 16 Jun 2020 18:39:40 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 11/18] media: tegra-video: Add support for external sensor capture
Date:   Tue, 16 Jun 2020 18:41:27 -0700
Message-ID: <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357968; bh=bHsUvS/CHxdInwyGZjqZfD/1xwOeDhsYPrqVzf9pCLY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=BQqe1sEBgIVe9pNi6jwvZsnVKISVIW1oDufSZq524FZtpQk8olezQz6e6DpmcPlBV
         VSqLF+rfS2B0UFZBHMtQGYvZINvvvIdBVWu2fiomC2W+C9r+oNojlK7WLNUbATKDM1
         c/klh4o52aUM9kuMOKy6i+MTqCKB2ni9+67vlepbyJOr23cYl+xrHJLl5zmM43vLT9
         zJoUIZMUu0XBEkpnuKYDnDSSgDH2deNWZgDu5hGWpNYubln5ly0IZ4VMbMUhC6eRc3
         zGC2pG3cnkhOiPxEbreQafhgq1OU8HVutp2S4xA74ZeSqpebTee9YWAUXiyfNAag+L
         cQOnCjE8Skyzw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds support to capture from the external sensor
based on device graph in the device tree.

Driver walks through the device graph to create media links
between the entities and registers and unregisters video devices
when the corresponding sub-devices are bound and unbound.

Channel formats are enumerated based on available formats from
the sensor and the corresponding matched formats from the Tegra
supported video formats list.

Each Tegra CSI instance can be configured as 4-lane or 2-lane
based on supported lane configuration from the sensor through
the device tree.

Currently this driver supports V4L2 video node centric only.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/Kconfig    |   1 +
 drivers/staging/media/tegra-video/csi.c      | 128 +++++-
 drivers/staging/media/tegra-video/csi.h      |   1 +
 drivers/staging/media/tegra-video/tegra210.c |   2 +-
 drivers/staging/media/tegra-video/vi.c       | 623 +++++++++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h       |  23 +-
 6 files changed, 726 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index 566da62..1f35da4 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_TEGRA
 	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index fb667df..3959d17 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -9,10 +9,13 @@
 #include <linux/host1x.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <media/v4l2-fwnode.h>
+
 #include "csi.h"
 #include "video.h"
 
@@ -285,26 +288,99 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+static int tegra_csi_channel_alloc(struct tegra_csi *csi,
+				   struct device_node *node,
+				   unsigned int port_num, unsigned int lanes,
+				   unsigned int num_pads)
+{
+	struct tegra_csi_channel *chan;
+
+	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
+
+	list_add_tail(&chan->list, &csi->csi_chans);
+	chan->csi = csi;
+	chan->csi_port_num = port_num;
+	chan->numlanes = lanes;
+	chan->of_node = node;
+	chan->numpads = num_pads;
+	if (num_pads & 0x2) {
+		chan->pads[0].flags = MEDIA_PAD_FL_SINK;
+		chan->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	} else {
+		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
+	}
+
+	return 0;
+}
+
 static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
 {
 	struct device_node *node = csi->dev->of_node;
 	unsigned int port_num;
-	struct tegra_csi_channel *chan;
 	unsigned int tpg_channels = csi->soc->csi_max_channels;
+	int ret;
 
 	/* allocate CSI channel for each CSI x2 ports */
 	for (port_num = 0; port_num < tpg_channels; port_num++) {
-		chan = kzalloc(sizeof(*chan), GFP_KERNEL);
-		if (!chan)
-			return -ENOMEM;
-
-		list_add_tail(&chan->list, &csi->csi_chans);
-		chan->csi = csi;
-		chan->csi_port_num = port_num;
-		chan->numlanes = 2;
-		chan->of_node = node;
-		chan->numpads = 1;
-		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
+		ret = tegra_csi_channel_alloc(csi, node, port_num, 2, 1);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tegra_csi_channels_alloc(struct tegra_csi *csi)
+{
+	struct device_node *node = csi->dev->of_node;
+	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
+	struct fwnode_handle *fwh;
+	struct device_node *channel;
+	struct device_node *ep;
+	unsigned int lanes, portno, num_pads;
+	int ret;
+
+	for_each_child_of_node(node, channel) {
+		if (!of_node_name_eq(channel, "channel"))
+			continue;
+
+		ret = of_property_read_u32(channel, "reg", &portno);
+		if (ret < 0)
+			continue;
+
+		if (portno >= csi->soc->csi_max_channels) {
+			dev_err(csi->dev, "invalid port num %d\n", portno);
+			return -EINVAL;
+		}
+
+		ep = of_graph_get_endpoint_by_regs(channel, 0, 0);
+		if (!ep)
+			continue;
+
+		fwh = of_fwnode_handle(ep);
+		ret = v4l2_fwnode_endpoint_parse(fwh, &v4l2_ep);
+		of_node_put(ep);
+		if (ret) {
+			dev_err(csi->dev,
+				"failed to parse v4l2 endpoint: %d\n", ret);
+			return ret;
+		}
+
+		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
+		if (!lanes || ((lanes & (lanes - 1)) != 0)) {
+			dev_err(csi->dev, "invalid data-lanes %d\n", lanes);
+			return -EINVAL;
+		}
+
+		num_pads = of_graph_get_endpoint_count(channel);
+		if (num_pads == TEGRA_CSI_PADS_NUM) {
+			ret = tegra_csi_channel_alloc(csi, channel, portno,
+						      lanes, num_pads);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return 0;
@@ -350,6 +426,15 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 		return ret;
 	}
 
+	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
+		ret = v4l2_async_register_subdev(subdev);
+		if (ret < 0) {
+			dev_err(csi->dev,
+				"failed to register subdev: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -389,8 +474,12 @@ static void tegra_csi_channels_cleanup(struct tegra_csi *csi)
 
 	list_for_each_entry_safe(chan, tmp, &csi->csi_chans, list) {
 		subdev = &chan->subdev;
-		if (subdev->dev)
+		if (subdev->dev) {
+			if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+				v4l2_async_unregister_subdev(subdev);
 			media_entity_cleanup(&subdev->entity);
+		}
+
 		list_del(&chan->list);
 		kfree(chan);
 	}
@@ -427,13 +516,14 @@ static int tegra_csi_init(struct host1x_client *client)
 
 	INIT_LIST_HEAD(&csi->csi_chans);
 
-	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		ret = tegra_csi_tpg_channels_alloc(csi);
-		if (ret < 0) {
-			dev_err(csi->dev,
-				"failed to allocate tpg channels: %d\n", ret);
-			goto cleanup;
-		}
+	else
+		ret = tegra_csi_channels_alloc(csi);
+	if (ret < 0) {
+		dev_err(csi->dev,
+			"failed to allocate channels: %d\n", ret);
+		goto cleanup;
 	}
 
 	ret = tegra_csi_channels_init(csi);
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 93bd2a0..78a5110 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -7,6 +7,7 @@
 #define __TEGRA_CSI_H__
 
 #include <media/media-entity.h>
+#include <media/v4l2-async.h>
 #include <media/v4l2-subdev.h>
 
 /*
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 3492a8a..4f5080a 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -230,7 +230,7 @@ static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan)
 	tegra_channel_capture_setup(chan);
 
 	/* recover CSI block */
-	subdev = tegra_channel_get_remote_subdev(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, false);
 	tegra_csi_error_recover(subdev);
 }
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 52d751f..506c263 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
@@ -52,6 +53,12 @@ to_tegra_channel_buffer(struct vb2_v4l2_buffer *vb)
 	return container_of(vb, struct tegra_channel_buffer, buf);
 }
 
+static inline struct tegra_vi_graph_entity *
+to_tegra_vi_graph_entity(struct v4l2_async_subdev *asd)
+{
+	return container_of(asd, struct tegra_vi_graph_entity, asd);
+}
+
 static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 					unsigned int code,
 					unsigned int offset)
@@ -146,7 +153,7 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 }
 
 struct v4l2_subdev *
-tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan)
+tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan, bool sensor)
 {
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
@@ -156,6 +163,24 @@ tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan)
 	entity = pad->entity;
 	subdev = media_entity_to_v4l2_subdev(entity);
 
+	if (sensor) {
+		while (1) {
+			if ((pad->index - 1) < 0)
+				break;
+
+			pad = &entity->pads[pad->index - 1];
+			if (!(pad->flags & MEDIA_PAD_FL_SINK))
+				break;
+
+			pad = media_entity_remote_pad(pad);
+			if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+				break;
+
+			entity = pad->entity;
+			subdev = media_entity_to_v4l2_subdev(entity);
+		}
+	}
+
 	return subdev;
 }
 
@@ -165,7 +190,15 @@ int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
 	int ret;
 
 	/* stream CSI */
-	subdev = tegra_channel_get_remote_subdev(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, !on);
+	ret = v4l2_subdev_call(subdev, video, s_stream, on);
+	if (on && ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		return 0;
+
+	subdev = tegra_channel_get_remote_subdev(chan, on);
 	ret = v4l2_subdev_call(subdev, video, s_stream, on);
 	if (on && ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -252,7 +285,7 @@ static int tegra_channel_g_parm(struct file *file, void *fh,
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	struct v4l2_subdev *subdev;
 
-	subdev = tegra_channel_get_remote_subdev(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, true);
 	return v4l2_g_parm_cap(&chan->video, subdev, a);
 }
 
@@ -262,7 +295,7 @@ static int tegra_channel_s_parm(struct file *file, void *fh,
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	struct v4l2_subdev *subdev;
 
-	subdev = tegra_channel_get_remote_subdev(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, true);
 	return v4l2_s_parm_cap(&chan->video, subdev, a);
 }
 
@@ -284,7 +317,7 @@ static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 
 	fse.code = fmtinfo->code;
 
-	subdev = tegra_channel_get_remote_subdev(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, true);
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
 	if (ret)
 		return ret;
@@ -316,7 +349,7 @@ static int tegra_channel_enum_frameintervals(struct file *file, void *fh,
 
 	fie.code = fmtinfo->code;
 
-	subdev = tegra_channel_get_remote_subdev(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, true);
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_interval, NULL, &fie);
 	if (ret)
 		return ret;
@@ -335,6 +368,9 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	unsigned int index = 0, i;
 	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
 
+	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		fmts_bitmap = chan->fmts_bitmap;
+
 	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
 		return -EINVAL;
 
@@ -391,8 +427,9 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	struct v4l2_subdev *subdev;
 	struct v4l2_subdev_format fmt;
 	struct v4l2_subdev_pad_config *pad_cfg;
+	int ret;
 
-	subdev = tegra_channel_get_remote_subdev(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, true);
 	pad_cfg = v4l2_subdev_alloc_pad_config(subdev);
 	if (!pad_cfg)
 		return -ENOMEM;
@@ -412,7 +449,10 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
 	fmt.pad = 0;
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-	v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
+	if (ret < 0)
+		return ret;
+
 	v4l2_fill_pix_format(pix, &fmt.format);
 	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
 
@@ -452,8 +492,11 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	fmt.pad = 0;
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-	subdev = tegra_channel_get_remote_subdev(chan);
-	v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
+	subdev = tegra_channel_get_remote_subdev(chan, true);
+	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret;
+
 	v4l2_fill_pix_format(pix, &fmt.format);
 	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
 
@@ -463,15 +506,52 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 	return 0;
 }
 
+static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
+{
+	int ret, index;
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev *subdev;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	/*
+	 * Initialize channel format to the sub-device active format if there
+	 * is corresponding match in the Tegra supported video formats.
+	 */
+	subdev = tegra_channel_get_remote_subdev(chan, true);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret)
+		return ret;
+
+	index = tegra_get_format_idx_by_code(chan->vi, fmt.format.code, 0);
+	fmtinfo = &chan->vi->soc->video_formats[index];
+	if (!fmtinfo)
+		return -EINVAL;
+
+	chan->fmtinfo = fmtinfo;
+	v4l2_fill_pix_format(&chan->format, &fmt.format);
+	chan->format.pixelformat = chan->fmtinfo->fourcc;
+	chan->format.bytesperline = chan->format.width * chan->fmtinfo->bpp;
+	chan->format.sizeimage = chan->format.bytesperline *
+				 chan->format.height;
+	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
+
+	return 0;
+}
+
 static int tegra_channel_enum_input(struct file *file, void *fh,
 				    struct v4l2_input *inp)
 {
-	/* currently driver supports internal TPG only */
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
 	if (inp->index)
 		return -EINVAL;
 
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
+	subdev = tegra_channel_get_remote_subdev(chan, true);
+	strscpy(inp->name, subdev->name, sizeof(inp->name));
 
 	return 0;
 }
@@ -578,6 +658,19 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		v4l2_ctrl_handler_free(&chan->ctrl_handler);
 		return chan->ctrl_handler.error;
 	}
+#else
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_subdev(chan, true);
+	ret = v4l2_ctrl_add_handler(&chan->ctrl_handler, subdev->ctrl_handler,
+				    NULL, true);
+	if (ret < 0) {
+		dev_err(chan->vi->dev,
+			"failed to add subdev %s ctrl handler: %d\n",
+			subdev->name, ret);
+		v4l2_ctrl_handler_free(&chan->ctrl_handler);
+		return ret;
+	}
 #endif
 
 	/* setup the controls */
@@ -608,6 +701,57 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
+static void vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
+{
+	int index, ret, match_code = 0;
+	struct v4l2_subdev *subdev;
+	struct v4l2_subdev_mbus_code_enum code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	bitmap_zero(chan->fmts_bitmap, MAX_FORMAT_NUM);
+
+	/*
+	 * Set the bitmap bits based on all the matched formats between the
+	 * available media bus formats of sub-device and the pre-defined Tegra
+	 * supported video formats.
+	 */
+	subdev = tegra_channel_get_remote_subdev(chan, true);
+	while (1) {
+		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
+				       NULL, &code);
+		if (ret < 0)
+			break;
+
+		index = tegra_get_format_idx_by_code(chan->vi, code.code, 0);
+		while (index >= 0) {
+			bitmap_set(chan->fmts_bitmap, index, 1);
+			if (!match_code)
+				match_code = code.code;
+			/* look for other formats with same mbus code */
+			index = tegra_get_format_idx_by_code(chan->vi,
+							     code.code,
+							     index + 1);
+		}
+
+		code.index++;
+	}
+
+	/*
+	 * Set the bitmap bit corresponding to default tegra video format if
+	 * there are no matched formats.
+	 */
+	if (!match_code) {
+		match_code = tegra_default_format.code;
+		index = tegra_get_format_idx_by_code(chan->vi, match_code, 0);
+		if (index >= 0)
+			bitmap_set(chan->fmts_bitmap, index, 1);
+	}
+
+	/* initialize channel format to the sub-device active format */
+	tegra_channel_set_subdev_active_fmt(chan);
+}
+
 static void tegra_channel_cleanup(struct tegra_vi_channel *chan)
 {
 	v4l2_ctrl_handler_free(&chan->ctrl_handler);
@@ -720,6 +864,9 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 		goto free_v4l2_ctrl_hdl;
 	}
 
+	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		v4l2_async_notifier_init(&chan->notifier);
+
 	return 0;
 
 free_v4l2_ctrl_hdl:
@@ -733,28 +880,84 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	return ret;
 }
 
-static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
+static int tegra_vi_channel_alloc(struct tegra_vi *vi, unsigned int port_num,
+				  struct device_node *node)
 {
 	struct tegra_vi_channel *chan;
+
+	/*
+	 * Do not use devm_kzalloc as memory is freed immediately
+	 * when device instance is unbound but application might still
+	 * be holding the device node open. Channel memory allocated
+	 * with kzalloc is freed during video device release callback.
+	 */
+	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
+
+	chan->vi = vi;
+	chan->portno = port_num;
+	chan->of_node = node;
+	list_add_tail(&chan->list, &vi->vi_chans);
+
+	return 0;
+}
+
+static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
+{
 	unsigned int port_num;
 	unsigned int nchannels = vi->soc->vi_max_channels;
+	int ret;
 
 	for (port_num = 0; port_num < nchannels; port_num++) {
-		/*
-		 * Do not use devm_kzalloc as memory is freed immediately
-		 * when device instance is unbound but application might still
-		 * be holding the device node open. Channel memory allocated
-		 * with kzalloc is freed during video device release callback.
-		 */
-		chan = kzalloc(sizeof(*chan), GFP_KERNEL);
-		if (!chan)
-			return -ENOMEM;
+		ret = tegra_vi_channel_alloc(vi, port_num, vi->dev->of_node);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tegra_vi_channels_alloc(struct tegra_vi *vi)
+{
+	struct device_node *node = vi->dev->of_node;
+	struct device_node *ep = NULL;
+	struct device_node *ports;
+	struct device_node *port;
+	unsigned int port_num;
+	int ret;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (!ports)
+		return -ENODEV;
+
+	for_each_child_of_node(ports, port) {
+		if (!of_node_name_eq(port, "port"))
+			continue;
+
+		ret = of_property_read_u32(port, "reg", &port_num);
+		if (ret < 0)
+			continue;
+
+		if (port_num > vi->soc->vi_max_channels) {
+			of_node_put(ports);
+			dev_err(vi->dev, "invalid port num %d\n", port_num);
+			return -EINVAL;
+		}
+
+		ep = of_get_child_by_name(port, "endpoint");
+		if (!ep)
+			continue;
 
-		chan->vi = vi;
-		chan->portno = port_num;
-		list_add_tail(&chan->list, &vi->vi_chans);
+		of_node_put(ep);
+		ret = tegra_vi_channel_alloc(vi, port_num, port);
+		if (ret < 0) {
+			of_node_put(ports);
+			return ret;
+		}
 	}
 
+	of_node_put(ports);
 	return 0;
 }
 
@@ -909,6 +1112,352 @@ static int __maybe_unused vi_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+/*
+ * Graph Management
+ */
+static struct tegra_vi_graph_entity *
+tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
+			   const struct fwnode_handle *fwnode)
+{
+	struct tegra_vi_graph_entity *entity;
+	struct v4l2_async_subdev *asd;
+
+	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+		entity = to_tegra_vi_graph_entity(asd);
+		if (entity->asd.match.fwnode == fwnode)
+			return entity;
+	}
+
+	return NULL;
+}
+
+static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
+				struct tegra_vi_graph_entity *entity)
+{
+	struct tegra_vi *vi = chan->vi;
+	struct tegra_vi_graph_entity *ent;
+	struct fwnode_handle *ep = NULL;
+	struct v4l2_fwnode_link link;
+	struct media_entity *local = entity->entity;
+	struct media_entity *remote;
+	struct media_pad *local_pad;
+	struct media_pad *remote_pad;
+	u32 link_flags = MEDIA_LNK_FL_ENABLED;
+	int ret = 0;
+
+	dev_dbg(vi->dev, "creating links for entity %s\n", local->name);
+
+	while (1) {
+		ep = fwnode_graph_get_next_endpoint(entity->asd.match.fwnode,
+						    ep);
+		if (!ep)
+			break;
+
+		ret = v4l2_fwnode_parse_link(ep, &link);
+		if (ret < 0) {
+			dev_err(vi->dev, "failed to parse link for %pOF: %d\n",
+				to_of_node(ep), ret);
+			continue;
+		}
+
+		if (link.local_port >= local->num_pads) {
+			dev_err(vi->dev, "invalid port number %u on %pOF\n",
+				link.local_port, to_of_node(link.local_node));
+			v4l2_fwnode_put_link(&link);
+			ret = -EINVAL;
+			break;
+		}
+
+		local_pad = &local->pads[link.local_port];
+		/* Remote node is vi node. So use channel video entity and pad
+		 * as remote/sink.
+		 */
+		if (link.remote_node == of_fwnode_handle(vi->dev->of_node)) {
+			remote = &chan->video.entity;
+			remote_pad = &chan->pad;
+			goto create_link;
+		}
+
+		/*
+		 * Skip sink ports, they will be processed from the other end
+		 * of the link.
+		 */
+		if (local_pad->flags & MEDIA_PAD_FL_SINK) {
+			dev_dbg(vi->dev, "skipping sink port %pOF:%u\n",
+				to_of_node(link.local_node), link.local_port);
+			v4l2_fwnode_put_link(&link);
+			continue;
+		}
+
+		/* find the remote entity from notifier list */
+		ent = tegra_vi_graph_find_entity(chan, link.remote_node);
+		if (!ent) {
+			dev_err(vi->dev, "no entity found for %pOF\n",
+				to_of_node(link.remote_node));
+			v4l2_fwnode_put_link(&link);
+			ret = -ENODEV;
+			break;
+		}
+
+		remote = ent->entity;
+		if (link.remote_port >= remote->num_pads) {
+			dev_err(vi->dev, "invalid port number %u on %pOF\n",
+				link.remote_port,
+				to_of_node(link.remote_node));
+			v4l2_fwnode_put_link(&link);
+			ret = -EINVAL;
+			break;
+		}
+
+		remote_pad = &remote->pads[link.remote_port];
+
+create_link:
+		dev_dbg(vi->dev, "creating %s:%u -> %s:%u link\n",
+			local->name, local_pad->index,
+			remote->name, remote_pad->index);
+
+		ret = media_create_pad_link(local, local_pad->index,
+					    remote, remote_pad->index,
+					    link_flags);
+		v4l2_fwnode_put_link(&link);
+		if (ret < 0) {
+			dev_err(vi->dev,
+				"failed to create %s:%u -> %s:%u link: %d\n",
+				local->name, local_pad->index,
+				remote->name, remote_pad->index, ret);
+			break;
+		}
+	}
+
+	fwnode_handle_put(ep);
+	return ret;
+}
+
+static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct tegra_vi_graph_entity *entity;
+	struct v4l2_async_subdev *asd;
+	struct v4l2_subdev *subdev;
+	struct tegra_vi_channel *chan;
+	struct tegra_vi *vi;
+	int ret;
+
+	chan = container_of(notifier, struct tegra_vi_channel, notifier);
+	vi = chan->vi;
+
+	dev_dbg(vi->dev, "notify complete, all subdevs registered\n");
+
+	ret = video_register_device(&chan->video, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_err(vi->dev,
+			"failed to register video device: %d\n", ret);
+		goto unregister_video;
+	}
+
+	/* create links between the entities */
+	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
+		entity = to_tegra_vi_graph_entity(asd);
+		ret = tegra_vi_graph_build(chan, entity);
+		if (ret < 0)
+			goto unregister_video;
+	}
+
+	ret = tegra_channel_setup_ctrl_handler(chan);
+	if (ret < 0) {
+		dev_err(vi->dev,
+			"failed to setup channel controls: %d\n", ret);
+		goto unregister_video;
+	}
+
+	vi_fmts_bitmap_init(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, false);
+	v4l2_set_subdev_hostdata(subdev, chan);
+
+	return 0;
+
+unregister_video:
+	video_unregister_device(&chan->video);
+	return ret;
+}
+
+static int tegra_vi_graph_notify_bound(struct v4l2_async_notifier *notifier,
+				       struct v4l2_subdev *subdev,
+				       struct v4l2_async_subdev *asd)
+{
+	struct tegra_vi_graph_entity *entity;
+	struct tegra_vi *vi;
+	struct tegra_vi_channel *chan;
+
+	chan = container_of(notifier, struct tegra_vi_channel, notifier);
+	vi = chan->vi;
+
+	/*
+	 * Locate the entity corresponding to the bound subdev and store the
+	 * subdev pointer.
+	 */
+	entity = tegra_vi_graph_find_entity(chan, subdev->fwnode);
+	if (!entity) {
+		dev_err(vi->dev, "no entity for subdev %s\n", subdev->name);
+		return -EINVAL;
+	}
+
+	if (entity->subdev) {
+		dev_err(vi->dev, "duplicate subdev for node %pOF\n",
+			to_of_node(entity->asd.match.fwnode));
+		return -EINVAL;
+	}
+
+	dev_dbg(vi->dev, "subdev %s bound\n", subdev->name);
+	entity->entity = &subdev->entity;
+	entity->subdev = subdev;
+
+	return 0;
+}
+
+static void tegra_vi_graph_notify_unbind(struct v4l2_async_notifier *notifier,
+					 struct v4l2_subdev *subdev,
+					 struct v4l2_async_subdev *asd)
+{
+	struct tegra_vi_graph_entity *entity;
+	struct tegra_vi *vi;
+	struct tegra_vi_channel *chan;
+
+	chan = container_of(notifier, struct tegra_vi_channel, notifier);
+	vi = chan->vi;
+
+	video_unregister_device(&chan->video);
+
+	media_entity_remove_links(&chan->video.entity);
+	entity = tegra_vi_graph_find_entity(chan, subdev->fwnode);
+	if (entity) {
+		if (entity->entity)
+			media_entity_remove_links(entity->entity);
+		entity->entity = NULL;
+		entity->subdev = NULL;
+	}
+
+	dev_dbg(vi->dev, "subdev %s unbind\n", subdev->name);
+}
+
+static const struct v4l2_async_notifier_operations tegra_vi_async_ops = {
+	.bound = tegra_vi_graph_notify_bound,
+	.complete = tegra_vi_graph_notify_complete,
+	.unbind = tegra_vi_graph_notify_unbind,
+};
+
+static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
+				    struct fwnode_handle *fwnode)
+{
+	struct tegra_vi *vi = chan->vi;
+	struct fwnode_handle *ep = NULL;
+	struct fwnode_handle *remote = NULL;
+	struct v4l2_async_subdev *asd;
+	struct device_node *node = NULL;
+	int ret;
+
+	dev_dbg(vi->dev, "parsing node %pOF\n", to_of_node(fwnode));
+
+	/* parse all the remote entities and put them into the list */
+	for_each_endpoint_of_node(to_of_node(fwnode), node) {
+		ep = of_fwnode_handle(node);
+		remote = fwnode_graph_get_remote_port_parent(ep);
+		if (!remote) {
+			dev_err(vi->dev,
+				"remote device at %pOF not found\n", node);
+			ret = -EINVAL;
+			goto cleanup;
+		}
+
+		/* skip entities that are already processed */
+		if (remote == dev_fwnode(vi->dev) ||
+		    tegra_vi_graph_find_entity(chan, remote)) {
+			fwnode_handle_put(remote);
+			continue;
+		}
+
+		asd = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier,
+				remote, sizeof(struct tegra_vi_graph_entity));
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
+			dev_err(vi->dev,
+				"failed to add subdev to notifier: %d\n", ret);
+			fwnode_handle_put(remote);
+			goto cleanup;
+		}
+
+		ret = tegra_vi_graph_parse_one(chan, remote);
+		if (ret < 0) {
+			fwnode_handle_put(remote);
+			goto cleanup;
+		}
+
+		fwnode_handle_put(remote);
+	}
+
+	return 0;
+
+cleanup:
+	dev_err(vi->dev, "failed parsing the graph: %d\n", ret);
+	v4l2_async_notifier_cleanup(&chan->notifier);
+	of_node_put(node);
+	return ret;
+}
+
+static int tegra_vi_graph_init(struct tegra_vi *vi)
+{
+	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
+	struct tegra_vi_channel *chan;
+	struct fwnode_handle *fwnode = dev_fwnode(vi->dev);
+	int ret;
+	struct fwnode_handle *remote = NULL;
+
+	/*
+	 * Walk the links to parse the full graph. Each channel will have
+	 * one endpoint of the composite node. Start by parsing the
+	 * composite node and parse the remote entities in turn.
+	 * Each channel will register v4l2 async notifier to make the graph
+	 * independent between the channels so we can the current channel
+	 * in case of something wrong during graph parsing and continue with
+	 * next channels.
+	 */
+	list_for_each_entry(chan, &vi->vi_chans, list) {
+		remote = fwnode_graph_get_remote_node(fwnode, chan->portno, 0);
+		if (!remote)
+			continue;
+
+		ret = tegra_vi_graph_parse_one(chan, remote);
+		fwnode_handle_put(remote);
+		if (ret < 0 || list_empty(&chan->notifier.asd_list))
+			continue;
+
+		chan->notifier.ops = &tegra_vi_async_ops;
+		ret = v4l2_async_notifier_register(&vid->v4l2_dev,
+						   &chan->notifier);
+		if (ret < 0) {
+			dev_err(vi->dev,
+				"failed to register channel %d notifier: %d\n",
+				chan->portno, ret);
+			v4l2_async_notifier_cleanup(&chan->notifier);
+		}
+	}
+
+	return 0;
+}
+
+static void tegra_vi_graph_cleanup(struct tegra_vi *vi)
+{
+	struct tegra_vi_channel *chan;
+
+	list_for_each_entry(chan, &vi->vi_chans, list) {
+		video_unregister_device(&chan->video);
+		mutex_lock(&chan->video_lock);
+		vb2_queue_release(&chan->queue);
+		mutex_unlock(&chan->video_lock);
+		v4l2_async_notifier_unregister(&chan->notifier);
+		v4l2_async_notifier_cleanup(&chan->notifier);
+	}
+}
+
 static int tegra_vi_init(struct host1x_client *client)
 {
 	struct tegra_video_device *vid = dev_get_drvdata(client->host);
@@ -922,13 +1471,14 @@ static int tegra_vi_init(struct host1x_client *client)
 
 	INIT_LIST_HEAD(&vi->vi_chans);
 
-	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		ret = tegra_vi_tpg_channels_alloc(vi);
-		if (ret < 0) {
-			dev_err(vi->dev,
-				"failed to allocate tpg channels: %d\n", ret);
-			goto free_chans;
-		}
+	else
+		ret = tegra_vi_channels_alloc(vi);
+	if (ret < 0) {
+		dev_err(vi->dev,
+			"failed to allocate vi channels: %d\n", ret);
+		goto free_chans;
 	}
 
 	ret = tegra_vi_channels_init(vi);
@@ -937,6 +1487,12 @@ static int tegra_vi_init(struct host1x_client *client)
 
 	vid->vi = vi;
 
+	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
+		ret = tegra_vi_graph_init(vi);
+		if (ret < 0)
+			goto free_chans;
+	}
+
 	return 0;
 
 free_chans:
@@ -950,6 +1506,8 @@ static int tegra_vi_init(struct host1x_client *client)
 
 static int tegra_vi_exit(struct host1x_client *client)
 {
+	struct tegra_vi *vi = host1x_client_to_vi(client);
+
 	/*
 	 * Do not cleanup the channels here as application might still be
 	 * holding video device nodes. Channels cleanup will happen during
@@ -957,6 +1515,9 @@ static int tegra_vi_exit(struct host1x_client *client)
 	 * device nodes are released.
 	 */
 
+	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		tegra_vi_graph_cleanup(vi);
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 6272c9a..98f6d575 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -14,6 +14,7 @@
 #include <linux/wait.h>
 
 #include <media/media-entity.h>
+#include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-dev.h>
@@ -93,6 +94,19 @@ struct tegra_vi {
 };
 
 /**
+ * struct tegra_vi_graph_entity - Entity in the video graph
+ *
+ * @asd: subdev asynchronous registration information
+ * @entity: media entity from the corresponding V4L2 subdev
+ * @subdev: V4L2 subdev
+ */
+struct tegra_vi_graph_entity {
+	struct v4l2_async_subdev asd;
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+};
+
+/**
  * struct tegra_vi_channel - Tegra video channel
  *
  * @list: list head for this entry
@@ -138,10 +152,13 @@ struct tegra_vi {
  * @done_lock: protects the capture done queue list
  *
  * @portno: VI channel port number
+ * @of_node: device node of VI channel
  *
  * @ctrl_handler: V4L2 control handler of this video channel
+ * @fmts_bitmap: a bitmap for supported formats matching v4l2 subdev formats
  * @tpg_fmts_bitmap: a bitmap for supported TPG formats
  * @pg_mode: test pattern generator mode (disabled/direct/patch)
+ * @notifier: V4L2 asynchronous subdevs notifier
  */
 struct tegra_vi_channel {
 	struct list_head list;
@@ -174,10 +191,14 @@ struct tegra_vi_channel {
 	spinlock_t done_lock;
 
 	unsigned char portno;
+	struct device_node *of_node;
 
 	struct v4l2_ctrl_handler ctrl_handler;
+	DECLARE_BITMAP(fmts_bitmap, MAX_FORMAT_NUM);
 	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
 	enum tegra_vi_pg_mode pg_mode;
+
+	struct v4l2_async_notifier notifier;
 };
 
 /**
@@ -249,7 +270,7 @@ extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
 
 struct v4l2_subdev *
-tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan);
+tegra_channel_get_remote_subdev(struct tegra_vi_channel *chan, bool sensor);
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
 void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
 				   enum vb2_buffer_state state);
-- 
2.7.4

