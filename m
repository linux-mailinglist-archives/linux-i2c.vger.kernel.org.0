Return-Path: <linux-i2c+bounces-13530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BF2BDD112
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5724019C27B3
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E7F321F51;
	Wed, 15 Oct 2025 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RDFyXbMY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F231A542;
	Wed, 15 Oct 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512880; cv=none; b=dHLuytHgJsBGiN4AxvGVv3rHC+ANN6FsdmNc4wohnPzjw4g5x1j2IN4U7nlrxWiB3hTle6UvGmoqqdl2JbGliricN8TaejAabGCAPqbromSeEX94MqOVmCYF10mpQSxSHS3vEsP6KUB2rK5psqZ7N6YhIzIRJhtP5Bk8A0hgBl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512880; c=relaxed/simple;
	bh=ZuHXcIHNvq0FaC27E+Cf07iw95k61K7y0X7fZfDDxPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkAkYT/GtJwzLWNDe7+NCEKNosPe0oOFxkRO9L+urw3aA3pByN+oqnTdNIhh8Hc6dYBa2HBW6ufJcWFzcW1+gWLTLEJag1abzm1bPCVALHiUzMomJtBlq2+1BoZ6R6QxdAIDSsFQj1QQZQRe6oXw1GNUM2PPyFD5m+ssNZ8h2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RDFyXbMY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BEF3C4E410C3;
	Wed, 15 Oct 2025 07:21:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96969606F9;
	Wed, 15 Oct 2025 07:21:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E965102F22BB;
	Wed, 15 Oct 2025 09:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512873; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9JXZvba91OCi6kDIuwHaUoggqvl4xIOcDR9HZtTRqa4=;
	b=RDFyXbMYdDG0XXMjUn/oAMMzuFPSpe4jKPArXKk6Zd3uAUrjmXxMVnB/WOGPuHiQkJy2gW
	nSuh57o23ptATBWP4xHWS9TGnbF4+Rgi84LQbeQj1SVD5KamFuA1rTJ8LINHxRnPkWZpvC
	DH1EFwFHVYI6UOFDmmKPo3xL9c/OaHgwmiHLVx24xuBRwB9V9y1r3xcVO097sZKcjjtO1N
	+Gh8dJp517EG5oHjIiV6zNpDVNuVwL3vTR2+xTM7jwOFa4D61Du9lPV+WT/FzXWNGJ2RMB
	YwyUg8RJUy56J/SmX9hOOTdQTpPwBRG2jEr5O/fqWPtUuzE8FcxVs3ZwEEChVw==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 26/29] misc: lan966x_pci: Introduce board specific data
Date: Wed, 15 Oct 2025 09:14:13 +0200
Message-ID: <20251015071420.1173068-27-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015071420.1173068-1-herve.codina@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
and this overlay is directly referenced in lan966x_pci_load_overlay().

This avoid to use the code for an other board.

In order to be more generic and to allow support for other boards (PCI
Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
it to PCI Vendor/Device IDs handled by the driver.

This structure contains information related to the PCI board such as
information related to the dtbo describing the board we have to load.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/misc/lan966x_pci.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
index e60ab662b8f3..5fa6af531a53 100644
--- a/drivers/misc/lan966x_pci.c
+++ b/drivers/misc/lan966x_pci.c
@@ -18,10 +18,6 @@
 #include <linux/pci_ids.h>
 #include <linux/slab.h>
 
-/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
-extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
-extern char __dtbo_lan966x_evb_lan9662_nic_end[];
-
 struct pci_dev_intr_ctrl {
 	struct pci_dev *pci_dev;
 	struct irq_domain *irq_domain;
@@ -118,17 +114,23 @@ static int devm_pci_dev_create_intr_ctrl(struct pci_dev *pdev)
 	return devm_add_action_or_reset(&pdev->dev, devm_pci_dev_remove_intr_ctrl, intr_ctrl);
 }
 
+struct lan966x_pci_info {
+	void *dtbo_begin;
+	void *dtbo_end;
+};
+
 struct lan966x_pci {
 	struct device *dev;
 	int ovcs_id;
+	const struct lan966x_pci_info *info;
 };
 
 static int lan966x_pci_load_overlay(struct lan966x_pci *data)
 {
-	u32 dtbo_size = __dtbo_lan966x_evb_lan9662_nic_end - __dtbo_lan966x_evb_lan9662_nic_begin;
-	void *dtbo_start = __dtbo_lan966x_evb_lan9662_nic_begin;
+	const struct lan966x_pci_info *info = data->info;
 
-	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
+	return of_overlay_fdt_apply(info->dtbo_begin, info->dtbo_end - info->dtbo_begin,
+				    &data->ovcs_id, dev_of_node(data->dev));
 }
 
 static void lan966x_pci_unload_overlay(struct lan966x_pci *data)
@@ -169,6 +171,9 @@ static int lan966x_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	pci_set_drvdata(pdev, data);
 	data->dev = dev;
+	data->info = (const struct lan966x_pci_info *)id->driver_data;
+	if (!data->info)
+		return -EINVAL;
 
 	ret = lan966x_pci_load_overlay(data);
 	if (ret)
@@ -196,8 +201,17 @@ static void lan966x_pci_remove(struct pci_dev *pdev)
 	lan966x_pci_unload_overlay(data);
 }
 
+/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
+extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
+extern char __dtbo_lan966x_evb_lan9662_nic_end[];
+
+static struct lan966x_pci_info evb_lan9662_nic_info = {
+	.dtbo_begin = __dtbo_lan966x_evb_lan9662_nic_begin,
+	.dtbo_end = __dtbo_lan966x_evb_lan9662_nic_end,
+};
+
 static struct pci_device_id lan966x_pci_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_LAN9662) },
+	{ PCI_DEVICE_DATA(EFAR, LAN9662, &evb_lan9662_nic_info) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, lan966x_pci_ids);
-- 
2.51.0


