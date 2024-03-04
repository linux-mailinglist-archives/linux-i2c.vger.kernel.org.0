Return-Path: <linux-i2c+bounces-2169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5EA8705E5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A2D1C22428
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B073D5733D;
	Mon,  4 Mar 2024 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OYOTK8bo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C1754916;
	Mon,  4 Mar 2024 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566597; cv=none; b=J1lXi+y0DQNDRmkNNstz+VZSxR/SEPM7WtWPE+Vi83aHetxLApjRmWatHqZLMWgwGvIjzz8l/0IqGvuQS4WcckHvwV+hiDA+SSJT3ILBLBOaOmOVGhslumfbARPbv4m47TYweu3KIMX77HT/JDZXqvSEkTc1JDx+cEWre/6cgG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566597; c=relaxed/simple;
	bh=QGCbotRiQdOgnWzi1oFs9U8XPApR4DcBOUsWj+1+Pgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqpt4/3sldsh3zhWx+tGDaqFWF7hFhBOmx8B4qS2v3LGAE8zF7z3JWqI6n7WKNxGZW3WaO5lYk6zFWciyij97mnpCMlAYmilMRzC93966O0OnuHR5kZlH1FjEmlj1ZUe2p6gGlkDsOov1b3U6ouX4af+Yysv1UI0tk8CJHK1wRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OYOTK8bo; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 865931BF216;
	Mon,  4 Mar 2024 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcbAmu4dmEBPFqimSZPh3yEPPq1ape6wFi34dJc4ne4=;
	b=OYOTK8boA3wSOeBGMzlrYVBUR9aW9TAdg4WSIxbjoRSEvtuaNf3OVnimXwUEVR2m+g+60V
	g48l7l/BeSQJd00hnTI9Bs9ZDP/SG2wWhAoeAxaXAi59KsD12vbclhui7/fCyrRa6Y0rSa
	u6obxZ0hZdmtn3WwNDZf1yVpNeiVfb7cZgt3RdiDcecGrVHuOZU0sFhVqaLEhQjQh5btSb
	om/h4Qf7eG/OWOyb/yaJ7x9bnkMQU7gDfBtHJ0y9+t4v1vnJ+eSPUQzjF0wM7dYcotnzF+
	+iawwIgWi9DzikK9K8x1kcZkn9Q1DTGLrDS0ozAV1x71MwuDcquxfbIq9Dy6lA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:56 +0100
Subject: [PATCH v4 13/18] phy: cadence-torrent: add suspend and resume
 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v4-13-6f1f53390c85@bootlin.com>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
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

The already_configured flag is cleared during the suspend stage to force
the PHY initialization during the resume stage.

Co-developed-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 53 +++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 52cadca4c07b..b4245c088760 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -3005,6 +3005,58 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
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
+	if (cdns_phy->already_configured)
+		cdns_phy->already_configured = 0;
+	else
+		clk_disable_unprepare(cdns_phy->clk);
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
+		return ret;
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
+
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
@@ -4576,6 +4628,7 @@ static struct platform_driver cdns_torrent_phy_driver = {
 	.driver = {
 		.name	= "cdns-torrent-phy",
 		.of_match_table	= cdns_torrent_phy_of_match,
+		.pm	= pm_sleep_ptr(&cdns_torrent_phy_pm_ops),
 	}
 };
 module_platform_driver(cdns_torrent_phy_driver);

-- 
2.39.2


