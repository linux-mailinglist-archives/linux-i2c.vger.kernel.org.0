Return-Path: <linux-i2c+bounces-1733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C8E85674B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2207C283D30
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E83136649;
	Thu, 15 Feb 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cgq1Kikm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F51350FE;
	Thu, 15 Feb 2024 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010297; cv=none; b=frLDXMbopvP31oXlzbEqtq/l8vGtqAOkWOoE6IKM1joRnrK8KU2aQCDHlxLYY1pdVBlbkM56Yh2ukumfQNv4vrnAW49xkXiaqwdQtWh10PooiOjjhMV5tlT0orXLSU30B3N8mxtdGtPuPAtP/x+sic2uFtyZjqgkG4e+eHyAORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010297; c=relaxed/simple;
	bh=UqAZwTrAzmCyHsH2izjqH7bw1MyDaTQpcy6c25J6btU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBf+vPihoxR8MLj32vtf2JYvj6/JQ4wYVhFkJuuSshEoXvElyUGaY9254gtMdbXdCZwDIgt1gPyB/qQES23Mzv+5Ab+ikvOaOJBKP8XM/j8aBv7EW9OIiXgGju0CkEXZAtp0MnvYUlZHv1ShdEoAhESWBZEdxywxebUsPp45vgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cgq1Kikm; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B63B5240005;
	Thu, 15 Feb 2024 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pYylQruqGYeQlChK9yp+O0x5NERS4bDbicxfArQ0TLI=;
	b=cgq1KikmKWwRY3fHgpywpgJxAU8n6JrmIGAX1C1QLRJ0w3IDWjlwqtngjuY4VOB6DpFp+a
	t312R3t5G3xLbr8sQkqduzrN24tkUvPYBBVFqxQ4+TwfnOO3yfuXEUJhG1K4Kube7LuhqY
	NQVvf8//0/CUXqzEM60pZWc+5g8UEqDGnyW0MFfbU8W5NzyHbHGx6AswIUzLjzWTbfmZzG
	dlTzIx5E87Q7ZBaeNboPZ3FmT0INGxZ0b+mxGypxI7aC5qgaNTg1+MOqgRqLStaCXD0Ymo
	Z4UGrGtrP9cPm30L1PXF3aJXpPQ9E8YqGNJqVqRSuOSXvqGbjLmW9f6WuOjlEw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:57 +0100
Subject: [PATCH v3 12/18] phy: cadence-torrent: add already_configured to
 struct cdns_torrent_phy
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-12-5c2e4a3fac1f@bootlin.com>
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

Add already_configured to struct cdns_torrent_phy, so it can be used at
differents stages.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index bba10ca0bfdd..b35fbc8a60e5 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -358,6 +358,7 @@ struct cdns_torrent_phy {
 	enum cdns_torrent_ref_clk ref_clk_rate;
 	struct cdns_torrent_inst phys[MAX_NUM_LANES];
 	int nsubnodes;
+	int already_configured;
 	const struct cdns_torrent_data *init_data;
 	struct regmap *regmap_common_cdb;
 	struct regmap *regmap_phy_pcs_common_cdb;
@@ -2740,7 +2741,6 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	struct device_node *child;
 	int ret, subnodes, node = 0, i;
 	u32 total_num_lanes = 0;
-	int already_configured;
 	u8 init_dp_regmap = 0;
 	u32 phy_type;
 
@@ -2787,9 +2787,9 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_cleanup;
 
-	regmap_field_read(cdns_phy->phy_pma_cmn_ctrl_1, &already_configured);
+	regmap_field_read(cdns_phy->phy_pma_cmn_ctrl_1, &cdns_phy->already_configured);
 
-	if (!already_configured) {
+	if (!cdns_phy->already_configured) {
 		ret = cdns_torrent_clk(cdns_phy);
 		if (ret)
 			goto clk_cleanup;
@@ -2869,7 +2869,7 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 		of_property_read_u32(child, "cdns,ssc-mode",
 				     &cdns_phy->phys[node].ssc_mode);
 
-		if (!already_configured)
+		if (!cdns_phy->already_configured)
 			gphy = devm_phy_create(dev, child, &cdns_torrent_phy_ops);
 		else
 			gphy = devm_phy_create(dev, child, &noop_ops);
@@ -2955,7 +2955,7 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 		goto put_lnk_rst;
 	}
 
-	if (cdns_phy->nsubnodes > 1 && !already_configured) {
+	if (cdns_phy->nsubnodes > 1 && !cdns_phy->already_configured) {
 		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
 		if (ret)
 			goto put_lnk_rst;

-- 
2.39.2


