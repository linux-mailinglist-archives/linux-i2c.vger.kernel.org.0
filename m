Return-Path: <linux-i2c+bounces-1734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B220C85674F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E52F21C22516
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742C3136679;
	Thu, 15 Feb 2024 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cIygT0Q8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23DD13541A;
	Thu, 15 Feb 2024 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010298; cv=none; b=CXSFXOnwrfUElfTRuZAWNovgciBPge6DfToT7MfJHNCKtQm/lbZOcF8gTEs64lHauz0K0zx6kRvy/F3Xup5/IBed9KPrU5X8jSHcplCL+x1E7aghs2HXX3W7wUCicL8WRsuBZ/Br5aULUHGB6+9D14MNn1SHuEm7zuUPloxrhTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010298; c=relaxed/simple;
	bh=vN8vnshRL6hQY9u+MN7pyGYmpKbakAsxcQa8lsNHH2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prsepn0kM5FEafijwy9L/tiVTTa2FbTaxzytuyyavLUNop/s1sELiGKoOgD7xaM4wOm8HUZjIiL6AbSdfNRChT53JAmdjcAsueoDXj/wuRNSm9xK9FZOHoB9Jh3gwaFts2O6010KftMEBz7FN0REkMjJGIlnmaUQTzxM+gsPHSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cIygT0Q8; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E44B324000F;
	Thu, 15 Feb 2024 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd9Oz4mdVW+hDLej27Xfdp5hp9Tma/hgJ2XUMzL0uAo=;
	b=cIygT0Q86qJunS1OuvA60AW3gXXgGTvGRVH9poRoSiiPPg8u5mfCYy01JrdkJJjFi3Z/W7
	wUJFSoETTLyxg8dOjuQzdFcnP6saU1FJCTS6TcBxL+vG0B4z6/eY35QmcwH8nTFJ/LQQ4m
	VMRicW70D/N/8OyIr/+/JUsXVMkayOxyyquUQCYJqmnggQHMTjbF6M2Evo+oZ0PnMxpZ15
	f1V4G1sZz0+SjCbWvg/4u2cP8tsV5/C2G5abtaoDiHVZ+rSqcvE/YG00sY07b8HhQLagy+
	u9c/n3eiBkSMgy+5QxBVr4BtTZRIbvYxgLWrFCW9J6VZe+wju5PJOhrN81w3DA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:58 +0100
Subject: [PATCH v3 13/18] phy: cadence-torrent: remove noop_ops phy
 operations
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-13-5c2e4a3fac1f@bootlin.com>
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

Even if a PHY is already configured, the PHY operations are needed during
resume stage, as the PHY is in reset state.
The noop_ops PHY operations is removed to always have PHY operations.
The already_configured flag is checked at the begening of init, configure
and poweron operations to keep the already_configured behaviour.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index b35fbc8a60e5..52cadca4c07b 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -1593,6 +1593,9 @@ static int cdns_torrent_dp_configure(struct phy *phy,
 	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
+	if (cdns_phy->already_configured)
+		return 0;
+
 	ret = cdns_torrent_dp_verify_config(inst, &opts->dp);
 	if (ret) {
 		dev_err(&phy->dev, "invalid params for phy configure\n");
@@ -1628,6 +1631,12 @@ static int cdns_torrent_phy_on(struct phy *phy)
 	u32 read_val;
 	int ret;
 
+	if (cdns_phy->already_configured) {
+		/* Give 5ms to 10ms delay for the PIPE clock to be stable */
+		usleep_range(5000, 10000);
+		return 0;
+	}
+
 	if (cdns_phy->nsubnodes == 1) {
 		/* Take the PHY lane group out of reset */
 		reset_control_deassert(inst->lnk_rst);
@@ -2306,6 +2315,9 @@ static int cdns_torrent_phy_init(struct phy *phy)
 	u32 num_regs;
 	int i, j;
 
+	if (cdns_phy->already_configured)
+		return 0;
+
 	if (cdns_phy->nsubnodes > 1) {
 		if (phy_type == TYPE_DP)
 			return cdns_torrent_dp_multilink_init(cdns_phy, inst, phy);
@@ -2443,19 +2455,6 @@ static const struct phy_ops cdns_torrent_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static int cdns_torrent_noop_phy_on(struct phy *phy)
-{
-	/* Give 5ms to 10ms delay for the PIPE clock to be stable */
-	usleep_range(5000, 10000);
-
-	return 0;
-}
-
-static const struct phy_ops noop_ops = {
-	.power_on	= cdns_torrent_noop_phy_on,
-	.owner		= THIS_MODULE,
-};
-
 static
 int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
 {
@@ -2869,10 +2868,7 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 		of_property_read_u32(child, "cdns,ssc-mode",
 				     &cdns_phy->phys[node].ssc_mode);
 
-		if (!cdns_phy->already_configured)
-			gphy = devm_phy_create(dev, child, &cdns_torrent_phy_ops);
-		else
-			gphy = devm_phy_create(dev, child, &noop_ops);
+		gphy = devm_phy_create(dev, child, &cdns_torrent_phy_ops);
 		if (IS_ERR(gphy)) {
 			ret = PTR_ERR(gphy);
 			goto put_child;

-- 
2.39.2


