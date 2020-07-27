Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85CC22FAA3
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgG0Uwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:52:46 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16193 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgG0Uvz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 16:51:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3e3e0000>; Mon, 27 Jul 2020 13:51:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:51:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:51:54 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:51:54 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 27 Jul 2020 20:51:54 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1f3e690005>; Mon, 27 Jul 2020 13:51:54 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v5 06/14] media: tegra-video: Fix channel format alignment
Date:   Mon, 27 Jul 2020 13:57:24 -0700
Message-ID: <1595883452-17343-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883070; bh=8GJbUvoTqNXQhoilqMQO06MgCPv5IgO6eahUeR7/0ig=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=I5YHLPDx8zo3LY1iGFi+lsO7PN80Kne66p5USHsAt5pkt3f5FO8RAoEkPjDUS1QQX
         gMQqZfQENPh2SkDt8i62wrtA27SWiDT0z+soOt82kezRRMxYZToB8QMm5IOUCWA29N
         hgJ8zV/OeCqDa5dXs6AtVlxL7aHcHWLsbm8YA3T09Ocu+ML2gljedksdL6fkpK07U8
         cDC6qdOB9N2vQP1ClvWBLatov/10TkJ3IWnFMosqJjuYg6bgjBdW3xfie/syhyXH+k
         gWzF2WnBri9JoWR18AlOOw1e5h66dhzxn3b+8XpfiOFyRmBldHHPWX90ZfbjKbOD0g
         608kYLCLIevcw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Pixel format width is mistakenly aligned to surface align bytes
and altering width to aligned value may force sensor mode change
other than the requested one and also cause mismatch in width
programmed between sensor and vi which can lead to capture errors.

This patch removes width alignment and clamps width as per Tegra
minimum and maximum limits.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 1b5e660..d621ebc 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -359,25 +359,15 @@ static void tegra_channel_fmt_align(struct tegra_vi_channel *chan,
 				    struct v4l2_pix_format *pix,
 				    unsigned int bpp)
 {
-	unsigned int align;
-	unsigned int min_width;
-	unsigned int max_width;
-	unsigned int width;
 	unsigned int min_bpl;
 	unsigned int max_bpl;
 	unsigned int bpl;
 
 	/*
-	 * The transfer alignment requirements are expressed in bytes. Compute
-	 * minimum and maximum values, clamp the requested width and convert
-	 * it back to pixels. Use bytesperline to adjust the width.
+	 * The transfer alignment requirements are expressed in bytes.
+	 * Clamp the requested width and height to the limits.
 	 */
-	align = lcm(SURFACE_ALIGN_BYTES, bpp);
-	min_width = roundup(TEGRA_MIN_WIDTH, align);
-	max_width = rounddown(TEGRA_MAX_WIDTH, align);
-	width = roundup(pix->width * bpp, align);
-
-	pix->width = clamp(width, min_width, max_width) / bpp;
+	pix->width = clamp(pix->width, TEGRA_MIN_WIDTH, TEGRA_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
 
 	/* Clamp the requested bytes per line value. If the maximum bytes per
-- 
2.7.4

