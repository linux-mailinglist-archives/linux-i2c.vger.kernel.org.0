Return-Path: <linux-i2c+bounces-1469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A37FE83DC79
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AC861F29BA7
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C4620DD4;
	Fri, 26 Jan 2024 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JrLwE1Yh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511DF20B09;
	Fri, 26 Jan 2024 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279889; cv=none; b=kEItzJVYU/6mccbHzvuinPDuKK4u7H7Iu8v9yCQnbKkmlnej01TQjx1VOGjNs6SB6/GsypX/URzzLUIANmQIICQafLhGA0qPrShhfO/dr+i108drnVPZywGtLut+hHKvzdR34GqslqalXSsR1jxeq3PNvLzKMZr5oSXWWlow9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279889; c=relaxed/simple;
	bh=N5GNsjjoLnYF5yXRjNxB9YLN8O7X9FCTQwNNwXBMd/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPvJArIZzrpmEMR73maixicJJyMXYgxHJvwoIKme1IW04AkDmOVxMGnLDz5idV5vrGBL2s52Ic14bFymAmwWBaVQAvqEFPlzqBBnEDCIPeSJlRoqkyZ+H5zgjzjDWWUGuaGIVo7JrdSPFjdo+X57/VrNcXTBGdoIwoVzUbL6vbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JrLwE1Yh; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A4CC40006;
	Fri, 26 Jan 2024 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1Wa2mY0ZsxjqXg85U4q4TJn+2bPk0WDE8ok1dd694Q=;
	b=JrLwE1YhIpUGiROfu5Z8MPi46E2d+RrF/zQoKlXIwnH2k9kF57QC6Uex4mY2QvRtCzjED1
	h8ga3G6Ua8bxI+VSx31SrVOL5Gb37K4odJvfa2R5S6UmyIBQJufg0s7rvzG7gqyKa1QLRO
	N8mOLdwusdyTbNFpSi2qjD1d1CK5Nmvyo1g6u7ygIBAWknlBtu4FZDIaXwc0pE7H9KUcBn
	Dnj2eyJNAAGWM6BanbHn9JmlVfO1XTMPgP2c+I4rKwCcjmRn+mXkA2yvsE0QvImileV9zB
	YEDcQlpKKu1W105qqUHJ59nYkHSZBsN2Xpqzg3BJCk1CPJukul03PadoC5w68w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:54 +0100
Subject: [PATCH v2 12/15] phy: cadence-torrent: add suspend and resume
 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v2-12-8e4f7d228ec2@bootlin.com>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Add suspend and resume support.

The already_configured flag is cleared during suspend stage to force the
PHY initialization during the resume stage.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 54 +++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 70413fca5776..5f4ecf371030 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -3006,6 +3006,59 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
 	cdns_torrent_clk_cleanup(cdns_phy);
 }
 
+static int cdns_torrent_phy_suspend_noirq(struct device *dev)
+{
+	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
+	int i;
+
+	reset_control_assert(cdns_phy->phy_rst);
+	reset_control_assert(cdns_phy->apb_rst);
+	for (i = 0; i < cdns_phy->nsubnodes; i++)
+		reset_control_assert(cdns_phy->phys[i].lnk_rst);
+
+	if (!cdns_phy->already_configured)
+		clk_disable_unprepare(cdns_phy->clk);
+	else
+		cdns_phy->already_configured = 0;
+
+	return 0;
+}
+
+static int cdns_torrent_phy_resume_noirq(struct device *dev)
+{
+	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
+	int node = cdns_phy->nsubnodes;
+	int ret, i;
+
+	ret = cdns_torrent_clk(cdns_phy);
+	if (ret)
+		goto clk_cleanup;
+
+	/* Enable APB */
+	reset_control_deassert(cdns_phy->apb_rst);
+
+	if (cdns_phy->nsubnodes > 1) {
+		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
+		if (ret)
+			goto put_lnk_rst;
+	}
+
+	return 0;
+
+put_lnk_rst:
+	for (i = 0; i < node; i++)
+		reset_control_assert(cdns_phy->phys[i].lnk_rst);
+	reset_control_assert(cdns_phy->apb_rst);
+	clk_disable_unprepare(cdns_phy->clk);
+clk_cleanup:
+	cdns_torrent_clk_cleanup(cdns_phy);
+	return ret;
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(cdns_torrent_phy_pm_ops,
+			       cdns_torrent_phy_suspend_noirq,
+			       cdns_torrent_phy_resume_noirq);
+
 /* USB and DP link configuration */
 static struct cdns_reg_pairs usb_dp_link_cmn_regs[] = {
 	{0x0002, PHY_PLL_CFG},
@@ -4577,6 +4630,7 @@ static struct platform_driver cdns_torrent_phy_driver = {
 	.driver = {
 		.name	= "cdns-torrent-phy",
 		.of_match_table	= cdns_torrent_phy_of_match,
+		.pm	= pm_sleep_ptr(&cdns_torrent_phy_pm_ops),
 	}
 };
 module_platform_driver(cdns_torrent_phy_driver);

-- 
2.39.2


