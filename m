Return-Path: <linux-i2c+bounces-1731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36AE856744
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8D128CF97
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB93135403;
	Thu, 15 Feb 2024 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UDiws/Sj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539F0134CCC;
	Thu, 15 Feb 2024 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010295; cv=none; b=spH6XkeqqB6sv/6jRQwb3KHGDC75m1SU6ryeiSVucBEYF9PbNzLSyIq73UEnMt3+tuiOelY6bhpjip8VH/rB3HavIz1WBQVnqIefKBN9LMJ3KJ6aDutfkRG/d/MqYjW9DqqtUWnBb3bCHwi4O5XC+f+wYZlPiZhd+sSkAMgCxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010295; c=relaxed/simple;
	bh=oJ9NHVIeGASP4//4Yhvz3aSZx6p5bLAELnAcAKZPGic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozEB6NPq9ehEXuIgX6NntN97SMsONsCyzK3ZrpejvbAqsmOlGOFQzyUK2IopWl9mBKAZDwRGob8dUuyKyQJskf4oNWuxOC88ybV2ePuA/wKriKK1lWx/Z8gKGJUN4IxXLbnmyL9wehULedtr1trD4sryHHEeNCroLqzr31F07Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UDiws/Sj; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FE6E24000D;
	Thu, 15 Feb 2024 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQj8fkDqiCncYkbq3rqvKqeGNPNTXUz4lWxpr6Y6suo=;
	b=UDiws/SjWesPdNffMn2bHZI5uY7/Dr/iLgrz0mbUng6Y/CkR88vM9/q3/ROqauOm7USTx1
	8LvrR//w1kOPNTrulzu2HdHY+xUo+/FfplD/jj3YHb+N4AnwFHaygD68bejfY9RaToGIpi
	W6oLksh/lSnoIk/zrtcFbyYgturyDn0UZUoAy1NkIfgBIzfVlCjqkllOJLJeHELNC62F6w
	mUBrAB0bbyGxX36m/Km7D5yNI7BlkZiytRgVIz6RaAFY2hW9B2qCMddQNj17N10pscxamt
	X/yyuSpNXboa++2kJtw/gGTCpInol8oV82XaMCgz13kKsbXyGOO6J6KLmTbDEA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:55 +0100
Subject: [PATCH v3 10/18] phy: cadence-torrent: extract calls to clk_get
 from cdns_torrent_clk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v3-10-5c2e4a3fac1f@bootlin.com>
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

Extract calls to clk_get from cdns_torrent_clk into a separate function.
It needs to call cdns_torrent_clk at resume without looking up the clock.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

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


