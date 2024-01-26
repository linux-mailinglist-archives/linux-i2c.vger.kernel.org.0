Return-Path: <linux-i2c+bounces-1471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCDB83DC86
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CE54284707
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D29921370;
	Fri, 26 Jan 2024 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XDC7cnmS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E921107;
	Fri, 26 Jan 2024 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279895; cv=none; b=rW/5SSd98+mk0fP3ML3hcaBmNwzD6QIepztaQ9W6kKza+UtTWxFXuHx1wF9+m6PigO5V+Oozzgx1gv/u7Lf3T4qq79imx47IymInxtg3KGxKMxPkHtz7GkIjPloHeCMsGJhSjLDhYbvflEDcwkaJ4zIPgHCOCQsh9itZ9ekPfhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279895; c=relaxed/simple;
	bh=nojq5nYUo0DZ/hdPX7i/iFjXrH0M0NPWbBoCjfRlmNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adCHHb4yMNuP8miiA3dqF+Yufu4B0UGTPrUkJ7R9l7wbyTaerbs5FpNmY61Dr4ai4LNVvpW/gPdQhbQvbIT+lZ04Ra7w8kkVcsSad9bVI2C31/Qh8h840o8306PB4NanLgNXiGrHiObtfmwrWzDR6tME85p70zU7HZdFTKVihoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XDC7cnmS; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A193640010;
	Fri, 26 Jan 2024 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0in7eUMCy1CUgdfa3NkgNoUarIRy00PjQmN5k2XOfW8=;
	b=XDC7cnmSoyMATdXpU1tgJyrpCGrrYHdLBskthJV5CEbt+4EavYPPm6csGnBGXzgYekdVL8
	E0BQ3R6CohJrEbsZ5/Jp78XV1Kf0+VloyBOdyiDXrEelIyOKn8DSXyzfCCF4ZoJy82Nsnc
	DLJQ726Avyas/qGdXAwuyxPzCSkeApHT20xNdPNcMKgnhn93AvbfW7dMDNouZTS3eG2ePZ
	818Qvb7yNhR2wLyxK3JucldVg7POKnMmQGAx4CB6NhbIN5+Lq0Vq/Tw6YEM7MTx3tsXUUw
	DgvTId9KkB9BrkLAqWPBWdQarOBiBKqUq9Tie7n6H7+0gG4lqaM/sBOq1xWR7g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:56 +0100
Subject: [PATCH v2 14/15] PCI: j721e: add reset GPIO to struct j721e_pcie
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v2-14-8e4f7d228ec2@bootlin.com>
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

From: Théo Lebrun <theo.lebrun@bootlin.com>

Add reset GPIO to struct j721e_pcie, so it can be used at suspend and
resume stages.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 9b343a46da11..477275d72257 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -54,6 +54,7 @@ struct j721e_pcie {
 	struct clk		*refclk;
 	u32			mode;
 	u32			num_lanes;
+	struct gpio_desc	*reset_gpio;
 	void __iomem		*user_cfg_base;
 	void __iomem		*intd_cfg_base;
 	u32			linkdown_irq_regfield;
@@ -359,7 +360,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct j721e_pcie *pcie;
 	struct cdns_pcie_rc *rc = NULL;
 	struct cdns_pcie_ep *ep = NULL;
-	struct gpio_desc *gpiod;
 	void __iomem *base;
 	struct clk *clk;
 	u32 num_lanes;
@@ -468,9 +468,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 	switch (mode) {
 	case PCI_MODE_RC:
-		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			ret = PTR_ERR(gpiod);
+		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(pcie->reset_gpio)) {
+			ret = PTR_ERR(pcie->reset_gpio);
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get reset GPIO\n");
 			goto err_get_sync;
@@ -504,9 +504,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		 * mode is selected while enabling the PHY. So deassert PERST#
 		 * after 100 us.
 		 */
-		if (gpiod) {
+		if (pcie->reset_gpio) {
 			usleep_range(100, 200);
-			gpiod_set_value_cansleep(gpiod, 1);
+			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
 		}
 
 		ret = cdns_pcie_host_setup(rc, true);

-- 
2.39.2


