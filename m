Return-Path: <linux-i2c+bounces-1465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F1E83DC62
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04567286889
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A551F947;
	Fri, 26 Jan 2024 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o4O7mnoU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A31EB49;
	Fri, 26 Jan 2024 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279879; cv=none; b=tgwDeDxwmdEdwqZy5mFK8gB2oTcR51B89anxXkcxHYx3tDWXstT5uAxxQTjnYgzqfuf6gxqlB27ZaDLRzk/A793pzqY7tOw06chJjvJKP6o9nJWwbRDjSusJ/vWPgZY9g22RdZXfvZ9Lo1XyY7L4b8JJM9dkGTmWbNC5jmq7+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279879; c=relaxed/simple;
	bh=Dk+XWEweUfX0F72hG59ByN7Y+QqMv2QuCtCnXlFa3pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRUzHfA5TsJA/uvn3OvUluuiRrh4+C2dNTipfYKLFoIOLZ3tKzZ5UGU1qev+XZaMsB/MVSuk6OwoghaUcqYxVxgaDJgxgQONwhJ9NgbCoJ7Ghf4GidWjfkyQLrpGQYmptGkpoYHsDQCCuXzQ9+6g0xzVYq14+7v00ad2ilzud/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o4O7mnoU; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE57940013;
	Fri, 26 Jan 2024 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwKGf7qwzlJSl38EGsWN6oKmN7+Z3kA3VFlKRRwxvC0=;
	b=o4O7mnoUq5A/6H+rHvxtjvciqbCFP15d6F6L6R5e1LnanZD8U3kKDuHisbUVzK3vKei3Ly
	rKMHdUOycj2B9TX483dMmKasyTHEnJJQs//vgQKRqio/mh30dDl0+mvZXXenU/CNf9a2FZ
	xBfbpIrePDnIVg80gEkcak9Wwnwkms0ZPb/NU7Ws5k2+qLXlUhh45kkBCHS7z0DmE0YJV7
	seB2w+FTCbp5YN62lN5dpI+of6GnAGCDHzHqzMvWB8GTFnZ7iOB3nOTl1v8jxZi7NFLM7D
	+I9P7ECX2KpIx+YTmSvyF2NiJIpmCM6IHLs11oeM+AXDTqJUhBrY8YlJTfVeMQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:50 +0100
Subject: [PATCH v2 08/15] phy: cadence-torrent: extract calls to clk_get
 from cdns_torrent_clk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v2-8-8e4f7d228ec2@bootlin.com>
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


