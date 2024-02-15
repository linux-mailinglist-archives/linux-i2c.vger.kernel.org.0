Return-Path: <linux-i2c+bounces-1735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF9856753
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4A6428BAEC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1EB136999;
	Thu, 15 Feb 2024 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l3I5opKm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56BB135A70;
	Thu, 15 Feb 2024 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010299; cv=none; b=PthWYVaIUtMuwv7k1iXx3vdakYv7PIWebFHkACS9cXia6sXsY/mseDeM5lWoV5Y3yCWmTQeL2WoGgWKEr/xC2YgPauZDzLV/7QaX9j4aFSjbq9EnqdoUnP/Cuyflevn13ovar7sgEZaqw/CbUZwMAlaMYWFBgi9MR1qpoIXhULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010299; c=relaxed/simple;
	bh=57NrSEphSAhIcAkGiRglqT77eN7Fa3WCZ9Iq4SoEB6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdW0lBCBESYGqNRzwRlHJQbKK5qKm/moUbRlGFOnLHuHUXH+1LEW1rngcNKzAw2A/UHtfy8AKAlsFkZsiy8KiekeKOMwUSkPLa22hUmi2w/KH8jmAHn5quAJpuFfBiYAqsMt1WJfDjONlpC6+M+t6VfLxxj/0qWmavHHpUEs8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l3I5opKm; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14ADC240010;
	Thu, 15 Feb 2024 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/n4B9LOnxLUUU5hzy10sFMmyfzqbPQwJ7bYymZxm6Y=;
	b=l3I5opKm97eEdSGimUZKWbPZ7j4nyfXC8xekOA6RNJorZoQZU1aNZ1i7LlRJODHPFcROAn
	RLVPqfOyjAybiSSn6fjgs1d3ooZn5lPeoOwBo8XThE93l2+ODfyeZnFwHLrkG8lp+cTdxL
	W9COtNdDor33jiWcSXCWVg3D3nvy8ixFe4kFgFYa1PvrHl+bOE4V6dvSmfAiwqoYW2EVCG
	nYIWXvrUfeZc+wtzJ0K78oF0NluedTd0yExPXEIn+ViF+pcSwGRQNbMZcMmI+oIidKy93i
	V+Sw1qcw3sSdBiUfd54tEfC9BuJKUbBBlux7vm3ccucA67rTy4tQ5KxIbmep5g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:59 +0100
Subject: [PATCH v3 14/18] phy: cadence-torrent: add suspend and resume
 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
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

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 54 +++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 52cadca4c07b..f8945a11e7ca 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -3005,6 +3005,59 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
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
@@ -4576,6 +4629,7 @@ static struct platform_driver cdns_torrent_phy_driver = {
 	.driver = {
 		.name	= "cdns-torrent-phy",
 		.of_match_table	= cdns_torrent_phy_of_match,
+		.pm	= pm_sleep_ptr(&cdns_torrent_phy_pm_ops),
 	}
 };
 module_platform_driver(cdns_torrent_phy_driver);

-- 
2.39.2


