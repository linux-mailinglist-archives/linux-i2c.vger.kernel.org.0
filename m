Return-Path: <linux-i2c+bounces-1313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75E82DD67
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53363282EA1
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E64F19BA9;
	Mon, 15 Jan 2024 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XGvUOA+e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27B618E34;
	Mon, 15 Jan 2024 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26252C0010;
	Mon, 15 Jan 2024 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZG2Pox00yczUKsAlTmAE1lwg+/Kk7l0gD46+mEZfvAE=;
	b=XGvUOA+e6WdCR5PyqrZfuF3SK/PbCfdr6CrX72v2I0IcCGz6htsbkE35DqpOh78dCB30vx
	VmFbjwqxVuXofkTBoLio5wn+Osd0rYWMUhLDcrcdGQWTYKBf40QT8yDgCq+tZlbEUziIDf
	cvIITxE0+8Q9SQNpINfr3+L7LLsYBXMBKsqbthuzb85zrjiN8Q8aZHbWrsh0gqE6C6vpfF
	/FbHjbC8TGebFkQyb7tSjXBBq5QRt6ttYsD0fuZcjzEAi6fJCkjskscR8YBQuhHD9VKnfR
	GdU01PLTUzSM0c/Bo6VKZRp5iyooUBB62UGPMuBLkxyop3kw1iTa7PznPYj/hQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:52 +0100
Subject: [PATCH 11/14] phy: cadence-torrent: add suspend and resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v1-11-84e55da52400@bootlin.com>
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

Add suspend and resume support.
The alread_configured flag is cleared during suspend stage to force the
phy initialization during the resume stage.

Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 70413fca5776..31b2594e5942 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -3006,6 +3006,62 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
 	cdns_torrent_clk_cleanup(cdns_phy);
 }
 
+#ifdef CONFIG_PM
+static int cdns_torrent_phy_suspend_noirq(struct device *dev)
+{
+	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
+	int i;
+
+	reset_control_assert(cdns_phy->phy_rst);
+	reset_control_assert(cdns_phy->apb_rst);
+	for (i = 0; i < cdns_phy->nsubnodes; i++)
+		reset_control_assert(cdns_phy->phys[i].lnk_rst);
+
+	if (!cdns_phy->already_configured)
+		clk_disable_unprepare(cdns_phy->clk);
+	else
+		cdns_phy->already_configured = 0;
+
+	return 0;
+}
+
+static int cdns_torrent_phy_resume_noirq(struct device *dev)
+{
+	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
+	int node = cdns_phy->nsubnodes;
+	int ret, i;
+
+	ret = cdns_torrent_clk(cdns_phy);
+	if (ret)
+		goto clk_cleanup;
+
+	/* Enable APB */
+	reset_control_deassert(cdns_phy->apb_rst);
+
+	if (cdns_phy->nsubnodes > 1) {
+		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
+		if (ret)
+			goto put_lnk_rst;
+	}
+
+	return 0;
+
+put_lnk_rst:
+	for (i = 0; i < node; i++)
+		reset_control_put(cdns_phy->phys[i].lnk_rst);
+	reset_control_assert(cdns_phy->apb_rst);
+	clk_disable_unprepare(cdns_phy->clk);
+clk_cleanup:
+	cdns_torrent_clk_cleanup(cdns_phy);
+	return ret;
+}
+
+static const struct dev_pm_ops cdns_torrent_phy_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(cdns_torrent_phy_suspend_noirq,
+				      cdns_torrent_phy_resume_noirq)
+};
+#endif
+
 /* USB and DP link configuration */
 static struct cdns_reg_pairs usb_dp_link_cmn_regs[] = {
 	{0x0002, PHY_PLL_CFG},
@@ -4577,6 +4633,7 @@ static struct platform_driver cdns_torrent_phy_driver = {
 	.driver = {
 		.name	= "cdns-torrent-phy",
 		.of_match_table	= cdns_torrent_phy_of_match,
+		.pm	= pm_ptr(&cdns_torrent_phy_pm_ops),
 	}
 };
 module_platform_driver(cdns_torrent_phy_driver);

-- 
2.39.2


