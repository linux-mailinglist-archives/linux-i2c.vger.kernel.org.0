Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F021F4D71
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgFJGC4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:02:56 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10502 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgFJGCu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee0777c0000>; Tue, 09 Jun 2020 23:02:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jun 2020 23:02:49 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:49 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:48 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee077880000>; Tue, 09 Jun 2020 23:02:48 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 09/18] media: tegra-video: Update format lookup to offset based
Date:   Tue, 9 Jun 2020 23:02:31 -0700
Message-ID: <1591768960-31648-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768956; bh=5U56MbpoGgbizDY87xBQZF5BWeIIcAyUuev+l62V8Co=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=RNjlzi76Vn2q4JBEfvLU2osE/DD4dy8kMevQ9VmOOUByhQb4Z3inJI2VcMctdQF1I
         cI4WsINjdLOFjCsf7oPILdi52bjPkGtPpp07PQSlO0Q0wzzrNS5zMMWioBg3GraWs7
         9e8EmABejoCWgLXwVVWPT9XHdnf8+cG9YNz4PMke7iBJYBQw6655fUcjMWOndthYhw
         BTRP7V5mP4JpYkHhK3CNxV8G6DGToDA7VCwF8VKWnAgsWbbMtHCeXmYKL9OEYw8ry7
         gT8xcyNpJ0tVLGsYJiEe0ckE2jdpZeHLcswRU0N9etfrUa0D7AU+gkqspRrQrDQ+Ej
         yTt1d+IigWoiw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tegra VI supported video formats are more for non TPG and there
can be multiple pixel formats for the same media bus format.

This patch updates the helper function for format lookup based on
mbus code from pre-defined Tegra supported format list to look from
the specified list index offset.

Offset based look up is used with sensor device graph (non TPG)
where format enumeration can list all supported formats for the
specific sensor mbus codes.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 0197f4e..52d751f 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -53,11 +53,12 @@ to_tegra_channel_buffer(struct vb2_v4l2_buffer *vb)
 }
 
 static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
-					unsigned int code)
+					unsigned int code,
+					unsigned int offset)
 {
 	unsigned int i;
 
-	for (i = 0; i < vi->soc->nformats; ++i) {
+	for (i = offset; i < vi->soc->nformats; ++i) {
 		if (vi->soc->video_formats[i].code == code)
 			return i;
 	}
@@ -598,11 +599,12 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 	bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_SRGGB10_1X10);
+					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_RGB888_1X32_PADHI);
+					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+					     0);
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
-- 
2.7.4

