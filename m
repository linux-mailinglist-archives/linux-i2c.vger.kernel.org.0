Return-Path: <linux-i2c+bounces-1467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA683DC6E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E67882868CF
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CA5208AF;
	Fri, 26 Jan 2024 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="omPugX1E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81120314;
	Fri, 26 Jan 2024 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279884; cv=none; b=ZqfsG/kZwUmp7tQv9iHpW/CNTQjAVEmW07GEUdtInmYPqnz1aHg+hnn45Sc6dX5H2wuPqNa2pgEE4DBdxtwIzySnZY8EBHawteQkw0jNCPFEcqzrxAd9IUtnibIxKXjYPRhz0jp/d83TCX/6EK7+HSmspV3fXHtriZv7+R/5bkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279884; c=relaxed/simple;
	bh=3tJNeBNRRDvogTja5FlQNmbvsqReFD6C67+HmzDNtOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaWbC9YuMSVR9EZJZUZ20sCMRmidaxjBpzq3m+AyGrep7PjTAx3KX3tcoKejs6cNAIsl8UuUMZJfUcTAS+ORyibt50pbhJG8sBQLHSE/aucBLQIFgXPT1iuqfKWHwnQlbEbNE9ESP1HtQ3cP2L5PlTvbf33fZxknfCiXArMCHgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=omPugX1E; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7AEC40004;
	Fri, 26 Jan 2024 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnJ23VCimbUGdQ0UqYdvjkkS5bTWXmYZASCtO+19bbI=;
	b=omPugX1EMe7mTs0frLWKo/wGBfGDaIEA1TfN/MRwstsklYAuD2hzuPBLSVCryf18B7O0PQ
	9CTOOCCXUKgSqTAwtXU1lsu6N6ygaxt/rvbHk7degfPkvAhqnJ2hgxvS/NWZzqL7AMHwiC
	8WBu6OC47A5RWIrHfPDW0p2NRhj+u2sq6uG1zXjMeTIGemppG31cP/2JWmO2J+w+jHqgIL
	FD/8Ks3A/lcndaGoZYZ4JRraL2PmemIHjiyOUHlY5OpY8SMYCqJsqxyYaubPA6lm2LMxrd
	fH59Ccb7zP2PGQVqu66GA0kLH99zn+lnM7Bd+Ok1XprhoVCtyVddRCKAFatGYg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:52 +0100
Subject: [PATCH v2 10/15] phy: cadence-torrent: add already_configured to
 struct cdns_torrent_phy
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v2-10-8e4f7d228ec2@bootlin.com>
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

Add already_configured to struct cdns_torrent_phy, so it can be used at
differents stages.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 100b58965558..a1e9d06453e6 100644
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
@@ -2741,7 +2742,6 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	struct device_node *child;
 	int ret, subnodes, node = 0, i;
 	u32 total_num_lanes = 0;
-	int already_configured;
 	u8 init_dp_regmap = 0;
 	u32 phy_type;
 
@@ -2788,9 +2788,9 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_cleanup;
 
-	regmap_field_read(cdns_phy->phy_pma_cmn_ctrl_1, &already_configured);
+	regmap_field_read(cdns_phy->phy_pma_cmn_ctrl_1, &cdns_phy->already_configured);
 
-	if (!already_configured) {
+	if (!cdns_phy->already_configured) {
 		ret = cdns_torrent_clk(cdns_phy);
 		if (ret)
 			goto clk_cleanup;
@@ -2870,7 +2870,7 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 		of_property_read_u32(child, "cdns,ssc-mode",
 				     &cdns_phy->phys[node].ssc_mode);
 
-		if (!already_configured)
+		if (!cdns_phy->already_configured)
 			gphy = devm_phy_create(dev, child, &cdns_torrent_phy_ops);
 		else
 			gphy = devm_phy_create(dev, child, &noop_ops);
@@ -2956,7 +2956,7 @@ static int cdns_torrent_phy_probe(struct platform_device *pdev)
 		goto put_lnk_rst;
 	}
 
-	if (cdns_phy->nsubnodes > 1 && !already_configured) {
+	if (cdns_phy->nsubnodes > 1 && !cdns_phy->already_configured) {
 		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
 		if (ret)
 			goto put_lnk_rst;

-- 
2.39.2


