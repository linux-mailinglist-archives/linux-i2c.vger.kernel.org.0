Return-Path: <linux-i2c+bounces-1307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9A82DD4A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9274CB21596
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28CE182DA;
	Mon, 15 Jan 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Nyn6Z7nS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2717BA0;
	Mon, 15 Jan 2024 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A97BC0014;
	Mon, 15 Jan 2024 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwKGf7qwzlJSl38EGsWN6oKmN7+Z3kA3VFlKRRwxvC0=;
	b=Nyn6Z7nS4rpPrtcLEUkTF9AAgHB7htljXQCy+nyVz7Y/WDZKFIZ+B9Ry1SSldbMdvKl+ib
	AJcGsDJnar6WP+Nu5EVq49AY9dZ51z4Sydg6D6lWZFsLxozf+d6OliKbMCKVQYPSvM6yYD
	ztNFRagdPrThYH6N3QYZPRIifO90got8tY1XwISASqORDilOCeevf0nysbCbYro5OarwFY
	k3uy5zRU3eHZx90T+1ENgPQkW5TpzwfXbUjJWV82BamdC3HBiEuRuWx+Wqo2seucK8I8/8
	iFuZnSkdpejBFw5Y0p7k5A5xv2VI9sO+JFnQKQYkqEaLgt57sxDDiJ48qrPR0g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:48 +0100
Subject: [PATCH 07/14] phy: cadence-torrent: extract calls to clk_get from
 cdns_torrent_clk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v1-7-84e55da52400@bootlin.com>
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
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

Extract calls to clk_get from cdns_torrent_clk into a separate function.
It needs to call cdns_torrent_clk at resume without looking up the clock.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index a75c96385c57..94298ad9f875 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -2681,18 +2681,22 @@ static int cdns_torrent_reset(struct cdns_torrent_phy *cdns_phy)
 	return 0;
 }
 
-static int cdns_torrent_clk(struct cdns_torrent_phy *cdns_phy)
+static int cdns_torrent_of_get_clk(struct cdns_torrent_phy *cdns_phy)
 {
-	struct device *dev = cdns_phy->dev;
-	unsigned long ref_clk_rate;
-	int ret;
-
-	cdns_phy->clk = devm_clk_get(dev, "refclk");
+	cdns_phy->clk = devm_clk_get(cdns_phy->dev, "refclk");
 	if (IS_ERR(cdns_phy->clk)) {
-		dev_err(dev, "phy ref clock not found\n");
+		dev_err(cdns_phy->dev, "phy ref clock not found\n");
 		return PTR_ERR(cdns_phy->clk);
 	}
 
+	return 0;
+}
+
+static int cdns_torrent_clk(struct cdns_torrent_phy *cdns_phy)
+{
+	unsigned long ref_clk_rate;
+	int ret;
+
 	ret = clk_prepare_enable(cdns_phy->clk);
 	if (ret) {
 		dev_err(cdns_phy->dev, "Failed to prepare ref clock\n");
@@ -2776,6 +2780,10 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
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


