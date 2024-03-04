Return-Path: <linux-i2c+bounces-2165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE448705CC
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39CB428AF49
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E43548FA;
	Mon,  4 Mar 2024 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XhUhcsxz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA95535D1;
	Mon,  4 Mar 2024 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566589; cv=none; b=MGUO5/Np5LjEscrvL3+Mlt4xR5rurzHFsSwW10e0h9YHJfCKN620Ht5JXcFMu8IAyD6Gv3tXRYFZV8Vcq76Z0h+kPmtfhIgY7HREfwWLhLTAm/ezvHisvkCGyVa6gPUUpscFyo+msOyIC281e+sk+toy3cu7cFmaxMWhCP5ijxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566589; c=relaxed/simple;
	bh=qXrncApu3ZH2u++c1fiMA0V7EGCJUkhdKcLX17WxyVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9ASO3ChamqT4DOzqEsZJd8sk18R+jMHHqvTNhQqFHikJBvotWR1v4jO0ZOKBTpJFj/sc+qPmBHD6BIuQOaojZ4JU7syFEmIJ8B4NbAARiT957yy3KyF1ol/VR6cdl2OqsRKV2VJluGtFHVfmEon6sGrRGfSchLCp1gpB2nnB6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XhUhcsxz; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B7AE1BF20A;
	Mon,  4 Mar 2024 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sztGcTF1zNnT//0yUibe2G7ihiKGeSnHpVbJVpHAUPU=;
	b=XhUhcsxz5kqKybZ+IslbKDjzFBEMPd3pYU8SMD9mtQJOmvIF2Oe4kdsywdRL7c0/txh+OT
	C1VUnu18E7+RX/0hxOvd7tTkBa5fsBOpPAXi/ur7w34iqzsnK/fYQVGEpnGEfZR6Xh2g3x
	1BLQiJz2eAzdKGP4TtbpEI4+Z5mDW5CaCLRUnUWRkzIbXxVSgBAjgyLZ8tjrw43qgDXS4o
	gUwlLOag6tSHf56Nu8f4idZeMEIMCTTPD4dZLfpxJBI69kbqULvWheg6kkm/Q2GIVQj+ne
	XetoYoxbYZmJtYFW2zNH3eyDpy1+0efrvgWEgg4IqAcXoraaRAH+xl9xIACw2g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:52 +0100
Subject: [PATCH v4 09/18] phy: cadence-torrent: extract calls to clk_get
 from cdns_torrent_clk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v4-9-6f1f53390c85@bootlin.com>
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

Extract calls to clk_get from cdns_torrent_clk into a separate function.
It needs to call cdns_torrent_clk at resume without looking up the clock.

Co-developed-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index a75c96385c57..803a76acf2fd 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -2681,18 +2681,21 @@ static int cdns_torrent_reset(struct cdns_torrent_phy *cdns_phy)
 	return 0;
 }
 
+static int cdns_torrent_of_get_clk(struct cdns_torrent_phy *cdns_phy)
+{
+	cdns_phy->clk = devm_clk_get(cdns_phy->dev, "refclk");
+	if (IS_ERR(cdns_phy->clk))
+		return dev_err_probe(cdns_phy->dev, PTR_ERR(cdns_phy->clk),
+				     "phy ref clock not found\n");
+
+	return 0;
+}
+
 static int cdns_torrent_clk(struct cdns_torrent_phy *cdns_phy)
 {
-	struct device *dev = cdns_phy->dev;
 	unsigned long ref_clk_rate;
 	int ret;
 
-	cdns_phy->clk = devm_clk_get(dev, "refclk");
-	if (IS_ERR(cdns_phy->clk)) {
-		dev_err(dev, "phy ref clock not found\n");
-		return PTR_ERR(cdns_phy->clk);
-	}
-
 	ret = clk_prepare_enable(cdns_phy->clk);
 	if (ret) {
 		dev_err(cdns_phy->dev, "Failed to prepare ref clock\n");
@@ -2776,6 +2779,10 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = cdns_torrent_of_get_clk(cdns_phy);
+	if (ret)
+		goto clk_cleanup;
+
 	regmap_field_read(cdns_phy->phy_pma_cmn_ctrl_1, &already_configured);
 
 	if (!already_configured) {

-- 
2.39.2


