Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3228C1FC39A
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgFQBkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:40:24 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18406 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgFQBjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:43 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee9742d0003>; Tue, 16 Jun 2020 18:38:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 16 Jun 2020 18:39:42 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:42 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:42 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee9745c0002>; Tue, 16 Jun 2020 18:39:41 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 12/18] media: tegra-video: Add support for selection ioctl ops
Date:   Tue, 16 Jun 2020 18:41:28 -0700
Message-ID: <1592358094-23459-13-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357933; bh=3DYnR/rs6pBg/FZT4cqF3ZrtjdDbvAyMg5GNwjvMoik=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=U4a15Jb2YbH64poO6Bz7iMwQpQfxY494AQX4xrOyEA4psPuEIckZpag/QO6lmq/6N
         Z55WBCiMPOVj8tVnHy5pWY1MIdfRu30gznMgwS25zp9Nrm/JxWyH5Y7NSf5soXxq6v
         RkCoGPKJ+EHvjeR7ELD+EMxgQ2Cg8qiMZPGNynNXefRt0c7zWQUXm4EBznVzqKUz85
         POB0Q0tIi0QCgLsZJ4tHlt2QQpR0zJgFCThaIMHGABF6kx+U3Ejq6x5qwRl/7hmiSj
         Cfxxm/NzBQ/E7ou+QM7CHbX2uRxDSb+0UThC3ID7shnBiqEtrlTfLoU+4hgOqA3TuM
         pb0GDKfi3ABYg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds selection v4l2 ioctl operations to allow configuring
a selection rectangle in the sensor through the Tegra video device
node.

Some sensor drivers supporting crop uses try_crop rectangle from
v4l2_subdev_pad_config during try format for computing binning.

So with selection ops support, this patch also updates try format
to use try crop rectangle either from subdev frame size enumeration
or from subdev crop boundary.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 106 +++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 506c263..f9eb96b 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -427,6 +427,13 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	struct v4l2_subdev *subdev;
 	struct v4l2_subdev_format fmt;
 	struct v4l2_subdev_pad_config *pad_cfg;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = V4L2_SEL_TGT_CROP_BOUNDS,
+	};
 	int ret;
 
 	subdev = tegra_channel_get_remote_subdev(chan, true);
@@ -449,6 +456,24 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
 	fmt.pad = 0;
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
+
+	/*
+	 * Attempt to obtain the format size from subdev.
+	 * If not available, try to get crop boundary from subdev.
+	 */
+	fse.code = fmtinfo->code;
+	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
+	if (ret) {
+		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+		if (ret)
+			return -EINVAL;
+		pad_cfg->try_crop.width = sdsel.r.width;
+		pad_cfg->try_crop.height = sdsel.r.height;
+	} else {
+		pad_cfg->try_crop.width = fse.max_width;
+		pad_cfg->try_crop.height = fse.max_height;
+	}
+
 	ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
 	if (ret < 0)
 		return ret;
@@ -540,6 +565,85 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	return 0;
 }
 
+static int tegra_channel_g_selection(struct file *file, void *priv,
+				     struct v4l2_selection *sel)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = sel->target,
+	};
+	int ret;
+
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		return -ENOTTY;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+	/*
+	 * Try the get selection operation and fallback to get format if not
+	 * implemented.
+	 */
+	subdev = tegra_channel_get_remote_subdev(chan, true);
+	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+	if (!ret)
+		sel->r = sdsel.r;
+	if (ret != -ENOIOCTLCMD)
+		return ret;
+
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret;
+
+	sel->r.left = 0;
+	sel->r.top = 0;
+	sel->r.width = fmt.format.width;
+	sel->r.height = fmt.format.height;
+
+	return 0;
+}
+
+static int tegra_channel_s_selection(struct file *file, void *fh,
+				     struct v4l2_selection *sel)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	int ret;
+	struct v4l2_subdev_selection sdsel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = sel->target,
+		.flags = sel->flags,
+		.r = sel->r,
+	};
+
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		return -ENOTTY;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (vb2_is_busy(&chan->queue))
+		return -EBUSY;
+
+	subdev = tegra_channel_get_remote_subdev(chan, true);
+	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
+	if (!ret) {
+		sel->r = sdsel.r;
+		/*
+		 * Subdev active format resolution may have changed during
+		 * set selection operation. So, update channel format to
+		 * the sub-device active format.
+		 */
+		return tegra_channel_set_subdev_active_fmt(chan);
+	}
+
+	return ret;
+}
+
 static int tegra_channel_enum_input(struct file *file, void *fh,
 				    struct v4l2_input *inp)
 {
@@ -597,6 +701,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
 	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+	.vidioc_g_selection		= tegra_channel_g_selection,
+	.vidioc_s_selection		= tegra_channel_s_selection,
 };
 
 /*
-- 
2.7.4

