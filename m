Return-Path: <linux-i2c+bounces-2168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA68705DD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA6B328B75B
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A00D56757;
	Mon,  4 Mar 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L4Zzf4vI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96DA55784;
	Mon,  4 Mar 2024 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566595; cv=none; b=k9I+Ggp4NenmG2Ry47As05tskkecmZadrFsbW0Td2dco/qWbtCKMwv8wdyfHjQzVTpabXBDVyJtJ72+wsE67FQGkF14xVPtI6o8ALIkGUdRY9ak5FGk8ZbV+xrOx5NneHyQpQBABc2B8Cnbgx2YcSlk31DJKCISe0BNHGmDUjRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566595; c=relaxed/simple;
	bh=vN8vnshRL6hQY9u+MN7pyGYmpKbakAsxcQa8lsNHH2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uImqF/Zsrc7VCorQtEDcWdpi9cb0WCc3vsNlarggB4vXscYszF4KUydeGthzTPoEjiKLA9PdHU38Ii3mYG4x5FDWg4tV7mO5+TblYxu3OFdrk5fxkrsyJI/bPVIjtK3uP24SVbjIUPjOEAY5rMkMX93+1gNqTYvafEIdfQN8T78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L4Zzf4vI; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE0981BF204;
	Mon,  4 Mar 2024 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd9Oz4mdVW+hDLej27Xfdp5hp9Tma/hgJ2XUMzL0uAo=;
	b=L4Zzf4vINewbTLzOek8ywqdNRQTcMGgT1T78dNAvJ08wb1UOFzcnMRT3lboAucDV4zWxff
	oWdtgYF2g/GzqrBm6YyEvtxZPTrHS0tIu23sU2VVrTFodL4CqJ/EFZHB8IPYKivor/38SN
	L53+UVOCAES0QA6BpVlBCh5Owts47tgyrirQdAnyGLy77S+P889nWs1HjxeIMVNMzm7rcM
	TZLXnZbK3nZVFX4wq2etkQUWrpDV7k7d2BXMnjZxW4AH/gb+tJIB1BCNn7F0dvIk2mv3zP
	yNGljErCqNGOPns14qcLeQ8hLYQSFUUKJAGEsF5fe4L7Nl6XTNm2FmFUrLQs3w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:55 +0100
Subject: [PATCH v4 12/18] phy: cadence-torrent: remove noop_ops phy
 operations
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v4-12-6f1f53390c85@bootlin.com>
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


