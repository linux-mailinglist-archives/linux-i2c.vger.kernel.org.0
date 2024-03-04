Return-Path: <linux-i2c+bounces-2166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBBE8705D3
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29D801F2311A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD1C54BEB;
	Mon,  4 Mar 2024 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q+he/qon"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE1548E5;
	Mon,  4 Mar 2024 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709566591; cv=none; b=QfJ/J9F1gMUqS5hB5YxmP4Jir2MnzHTsDFIJIbWCetNNS4xKHQSwfM0JIDShkH1MKhZCwWYFvrHbsW/36U5uJNed6mL3jg52ndaT57KBM/BCJREj0xo3RGf2cW90Twu7EpmOqc3PmwMGxZ5VmJ1ggXDQrrZuEG3ZW8FOEh3xLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709566591; c=relaxed/simple;
	bh=58Rx/Fpi5lkN1ZhQHKIMYHT21sc+k4stqHUV7CqcV3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCbjKiPjEz95oTntah9431QcLtbZx1Gp7nm9iEmGOGh9kc0FegDwTJI08Vvff9gI+QckuN4uW2A5VJ+tOwZN1sRoiIAEFy5mwSQidMnWjSFIg6irClhcC9MOAC9iGEnDV71mzUls2x3yd6grJ8KzdXjBGiwu1iUnDjghg9ulJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q+he/qon; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 203261BF20E;
	Mon,  4 Mar 2024 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709566587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZY4zwQDv37yWJBGtlc4HVZQiyWGnejxAqR+BxRsb2To=;
	b=Q+he/qonM7ce+3DcO7pg2cLmmB2q17k26lCCSFkwtjGa5ylJuU59mevM2Qvtcb8PVuFEHy
	Q1sTqNqifckyCGoQuPW1izOlHIMCR4bbcsOOv/NcRFU3eM7iS8eMFBNC14VMGrfxr4R9n/
	ZvchPop/U9fSn4YT3Gr6Ebjj22hiRGuGiuq90/oQ8NZXHdM1Ul17kDCjfyR6UWJtqBLmrs
	rtZp6uR83vPpeH5ZqPf+eDnjPPMPt2EDVQd7ZhVlProjbqimFEnUX64LZ8Q/KKk6YmALdy
	6AARmY9OozTj8oklubGUHFRfiibRXsDrBr9hUDQaQ+CZtHolyXzZ3q0TMMJTmg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Mar 2024 16:35:53 +0100
Subject: [PATCH v4 10/18] phy: cadence-torrent: register resets even if the
 phy is already configured
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v4-10-6f1f53390c85@bootlin.com>
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

Resets are needed during suspend and resume stages.
So they shall be registered during the probe even the phy is already
initialized.

The function cdns_torrent_reset is renamed cdns_torrent_of_get_reset() to
make it clear.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 803a76acf2fd..bba10ca0bfdd 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -2660,7 +2660,7 @@ static int cdns_torrent_clk_register(struct cdns_torrent_phy *cdns_phy)
 	return 0;
 }
 
-static int cdns_torrent_reset(struct cdns_torrent_phy *cdns_phy)
+static int cdns_torrent_of_get_reset(struct cdns_torrent_phy *cdns_phy)
 {
 	struct device *dev = cdns_phy->dev;
 
@@ -2779,6 +2779,10 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = cdns_torrent_of_get_reset(cdns_phy);
+	if (ret)
+		goto clk_cleanup;
+
 	ret = cdns_torrent_of_get_clk(cdns_phy);
 	if (ret)
 		goto clk_cleanup;
@@ -2786,10 +2790,6 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	regmap_field_read(cdns_phy->phy_pma_cmn_ctrl_1, &already_configured);
 
 	if (!already_configured) {
-		ret = cdns_torrent_reset(cdns_phy);
-		if (ret)
-			goto clk_cleanup;
-
 		ret = cdns_torrent_clk(cdns_phy);
 		if (ret)
 			goto clk_cleanup;

-- 
2.39.2


