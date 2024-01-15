Return-Path: <linux-i2c+bounces-1316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F0282DD76
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB8E283135
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7611A715;
	Mon, 15 Jan 2024 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cYFsUOgl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA961A282;
	Mon, 15 Jan 2024 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B13B1C0013;
	Mon, 15 Jan 2024 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705335391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xl/fBZ1aUKL0hWMZVIAmwRdTreoofQFnHKDzk938IBg=;
	b=cYFsUOgl6y7i2QuPpsxsXWBrOBwsQ90mM3tk+a1DxY/7dFN4h/eO7KKH3s1uiLM6iQv4KK
	04a/UkuS2hDma7uli8r7cwrd/YRBsweBdnep0Ox3XvjPj9dsvdV0+V8Dz/mBzypQ5Iqu9z
	HB+xGlK9bIWWSpoz4LZZvDOyYWdFJ8mISjZ7AsF/+karA/IsfPBU/T0SzhQQLhz03pnaWI
	nxu4Hd+kFzQ6zYEt+zZViZQSiFWITjkIdicyPh22QOS9CXNnLh7P6X0CKHiDvRccg7gwHC
	Ff5Z32FMODVnAQ963/KoO/YhyuurA4DFam8aB5kK61mZElvfDZSOG5C/qh8iDg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 15 Jan 2024 17:14:55 +0100
Subject: [PATCH 14/14] PCI: j721e: add suspend and resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v1-14-84e55da52400@bootlin.com>
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

From: Théo Lebrun <theo.lebrun@bootlin.com>

Add suspend and resume support for rc mode.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pci-j721e.c    | 72 +++++++++++++++++++++++++++
 drivers/pci/controller/cadence/pcie-cadence.h |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 477275d72257..51867a3f2499 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -6,6 +6,7 @@
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
  */
 
+#include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -554,6 +555,76 @@ static void j721e_pcie_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 }
 
+#ifdef CONFIG_PM
+static int j721e_pcie_suspend_noirq(struct device *dev)
+{
+	struct j721e_pcie *pcie = dev_get_drvdata(dev);
+
+	if (pcie->mode == PCI_MODE_RC) {
+		if (pcie->reset_gpio)
+			gpiod_set_value_cansleep(pcie->reset_gpio, 0);
+
+		clk_disable_unprepare(pcie->refclk);
+	}
+
+	cdns_pcie_disable_phy(pcie->cdns_pcie);
+
+	return 0;
+}
+
+static int j721e_pcie_resume_noirq(struct device *dev)
+{
+	struct j721e_pcie *pcie = dev_get_drvdata(dev);
+	struct cdns_pcie *cdns_pcie = pcie->cdns_pcie;
+	int ret;
+
+	ret = j721e_pcie_ctrl_init(pcie);
+	if (ret < 0) {
+		dev_err(dev, "j721e_pcie_ctrl_init failed\n");
+		return ret;
+	}
+
+	j721e_pcie_config_link_irq(pcie);
+
+	/*
+	 * This is not called explicitly in the probe, it is called by
+	 * cdns_pcie_init_phy.
+	 */
+	ret = cdns_pcie_enable_phy(pcie->cdns_pcie);
+	if (ret < 0) {
+		dev_err(dev, "cdns_pcie_enable_phy failed\n");
+		return -ENODEV;
+	}
+
+	if (pcie->mode == PCI_MODE_RC) {
+		struct cdns_pcie_rc *rc = cdns_pcie_to_rc(cdns_pcie);
+
+		ret = clk_prepare_enable(pcie->refclk);
+		if (ret < 0) {
+			dev_err(dev, "clk_prepare_enable failed\n");
+			return -ENODEV;
+		}
+
+		if (pcie->reset_gpio) {
+			usleep_range(100, 200);
+			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
+		}
+
+		ret = cdns_pcie_host_setup(rc, false);
+		if (ret < 0) {
+			clk_disable_unprepare(pcie->refclk);
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops j721e_pcie_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(j721e_pcie_suspend_noirq, j721e_pcie_resume_noirq)
+};
+#endif
+
 static struct platform_driver j721e_pcie_driver = {
 	.probe  = j721e_pcie_probe,
 	.remove_new = j721e_pcie_remove,
@@ -561,6 +632,7 @@ static struct platform_driver j721e_pcie_driver = {
 		.name	= "j721e-pcie",
 		.of_match_table = of_j721e_pcie_match,
 		.suppress_bind_attrs = true,
+		.pm	= pm_ptr(&j721e_pcie_pm_ops),
 	},
 };
 builtin_platform_driver(j721e_pcie_driver);
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 3b0da889ed64..05d4b96fc71d 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -331,6 +331,8 @@ struct cdns_pcie_rc {
 	unsigned int		quirk_detect_quiet_flag:1;
 };
 
+#define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
+
 /**
  * struct cdns_pcie_epf - Structure to hold info about endpoint function
  * @epf: Info about virtual functions attached to the physical function
@@ -381,7 +383,6 @@ struct cdns_pcie_ep {
 	unsigned int		quirk_disable_flr:1;
 };
 
-
 /* Register access */
 static inline void cdns_pcie_writel(struct cdns_pcie *pcie, u32 reg, u32 value)
 {

-- 
2.39.2


