Return-Path: <linux-i2c+bounces-1466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CBA83DC69
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9270228661F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1878E20311;
	Fri, 26 Jan 2024 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TeN/aDnJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499A51F614;
	Fri, 26 Jan 2024 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279881; cv=none; b=DtbT8crtPsxNKmlmIXN2NaYuwcEdoNsNbiRXS0koP+QaAjhMCcpxLtN+4gt1SLdqzqhih7Gc/nBqb/vRdX/OT130cuE2e/VF5zlZd5MECmepzpDMWYMLv6sji3TthB3zPF4CVTu6nCDEUjUn3nK47kKV/7/8UPCMP2syJFdxtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279881; c=relaxed/simple;
	bh=9Z2wuCIorg2817mV5JXqNVCfBWuO41XKwGO64R06XCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=av8Q7TCXh+ji7lUBeCPoiYAjV5pmkIDGsp+3bADKg0URsQaJuVJRtAEToskaFRouXShZzfjAS6yjfWFrkvSpiadr6ig2/FsWIYUmCVTw1uBLj6L3PC81ox5hESFiOofIFbjvgGoi2SGUEjQcqfmgTiXOqVjWL7oDZ0Cuu62/s5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TeN/aDnJ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53AE940010;
	Fri, 26 Jan 2024 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4pB3p7l4Wmx1B5ikJiVEe+u1C2q0FduhxiC+T5adXA=;
	b=TeN/aDnJfTUIuoo9ivm9jVMsuO/VzY5HtvEAR7CtPNYbwre0S2xufDx1v4ZsqQWH/2dZeM
	fCIPcmyZFEJJ7ToNTW/PEKXq8Kbga6jQtXGrJjQ+JsmcXeNhJZQxP7+keT6Y7wGBAl6WuV
	HwgBbvlQ/ZKjDFPb24/n2VNyfXoZJnKjDZ5YueNMeiKKj3mLNiE/tP0tgdYaVrS/1+mxE/
	60asLrVla4YCkFaPdXr71TSE7713QC64S8tLbramUvYfxMCvxhCvFCcaFfPQbdCKcIyaIO
	g34ogRTUB7BTdUrSrrgtxy0PXFTAW4Lin9X6fI3X/ZCeD6k5QfILOeIZBKVjRA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:51 +0100
Subject: [PATCH v2 09/15] phy: cadence-torrent: register resets even if the
 phy is already configured
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v2-9-8e4f7d228ec2@bootlin.com>
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

Resets are needed during suspend and resume stages.
So they shall be registered during the probe even the phy is already
initialized.

The function cdns_torrent_reset is renamed cdns_torrent_of_get_reset to
make it clear.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 94298ad9f875..100b58965558 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -2660,7 +2660,7 @@ static int cdns_torrent_clk_register(struct cdns_torrent_phy *cdns_phy)
 	return 0;
 }
 
-static int cdns_torrent_reset(struct cdns_torrent_phy *cdns_phy)
+static int cdns_torrent_of_get_reset(struct cdns_torrent_phy *cdns_phy)
 {
 	struct device *dev = cdns_phy->dev;
 
@@ -2780,6 +2780,10 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = cdns_torrent_of_get_reset(cdns_phy);
+	if (ret)
+		goto clk_cleanup;
+
 	ret = cdns_torrent_of_get_clk(cdns_phy);
 	if (ret)
 		goto clk_cleanup;
@@ -2787,10 +2791,6 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
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


