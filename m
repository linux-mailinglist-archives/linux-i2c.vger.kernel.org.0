Return-Path: <linux-i2c+bounces-10840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB2AAD71F
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 09:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2F2D3BFB3D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 07:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C090220F4F;
	Wed,  7 May 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IrLVKz9A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D1220687;
	Wed,  7 May 2025 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602019; cv=none; b=l/y1I1hNQrIkHBgANIrkU9nfUBs4/Ptdj4zray1e8HJy4WW5Wgjv7sZZQbPG3z5lWYkpH5x5md320bbUgc1yzrXQpgGQrMvuyOHuJufh5SfRsMXKcOhdz7U43LRn2MppducC3SzSaQTqspr9onFzwcFvlVg7Y+jak98Rtr8L4J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602019; c=relaxed/simple;
	bh=fLzE27/3suP4hmOEW1zmKPVQsjlEg4bWnt3EcWvQMLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6kSwFyVQkhH6VGw6YnjzM0a2BqjsMJtwDx0BlF/MIm6Dbl0aRrLMAvCBMyCmIKZ0uRJQtOUOjV+O3vDXiLl2LGsswf6txU6+GX5kf+HynN3/JWvU+UKtvcIw8byKEcEMIBWYmLElTq4UgpbSKxN0QJaPQWC6bhCthkkd+6peSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IrLVKz9A; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 7A93943B61;
	Wed,  7 May 2025 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kD9ClAPkcPNvQ2iYHfbuGpRxSpQFRsp0tY1oJ6ehDRk=;
	b=IrLVKz9ApFkEBcaUD7jm7vLwcugsAixWhEIE7RCAxwW1aZJ49DUoi+9gCOr7LbMZQEvp0h
	BoruTTS6OggNeEvslXEzogdLPF5y4pXxkr9R0X2Q8eOCb5rOsrxjpL+YGY3sesWCGI1f6f
	0GUpwnPnL1OahD61aBeU2vmdrj+wU2Kpj2AJszY79G5AvSoOPZNDDC93b/9FYtb1l49eON
	jERIEoWjAsD+BV7AJc9BlTk2P+/81srv+bfQ8YN7rMpENTz+e5zBcWz2BNwWPNm7D0upEV
	c5maJJh400PM0UW0djm9WEd3G7Ed0zYi5b1iUZu4+skjsnjNWMmoOBsYi7BMBg==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
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
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at probe
Date: Wed,  7 May 2025 09:12:47 +0200
Message-ID: <20250507071315.394857-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrh
 hgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

The simple-pm-bus drivers handles several simple bus. When it is used
with busses other than a compatible "simple-pm-bus", it don't populate
its child devices during its probe.

This confuses fw_devlink and results in wrong or missing devlinks.

Once a driver is bound to a device and the probe() has been called,
device_links_driver_bound() is called.

This function performs operation based on the following assumption:
    If a child firmware node of the bound device is not added as a
    device, it will never be added.

Among operations done on fw_devlinks of those "never be added" devices,
device_links_driver_bound() changes their supplier.

With devices attached to a simple-bus compatible device, this change
leads to wrong devlinks where supplier of devices points to the device
parent (i.e. simple-bus compatible device) instead of the device itself
(i.e. simple-bus child).

When the device attached to the simple-bus is removed, because devlinks
are not correct, its consumers are not removed first.

In order to have correct devlinks created, make the simple-pm-bus driver
compliant with the devlink assumption and create its child devices
during its probe.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index d8e029e7e53f..93c6ba605d7a 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -42,14 +42,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	match = of_match_device(dev->driver->of_match_table, dev);
 	/*
 	 * These are transparent bus devices (not simple-pm-bus matches) that
-	 * have their child nodes populated automatically.  So, don't need to
-	 * do anything more. We only match with the device if this driver is
-	 * the most specific match because we don't want to incorrectly bind to
-	 * a device that has a more specific driver.
+	 * have their child nodes populated automatically. So, don't need to
+	 * do anything more except populate child nodes. We only match with the
+	 * device if this driver is the most specific match because we don't
+	 * want to incorrectly bind to a device that has a more specific driver.
 	 */
 	if (match && match->data) {
 		if (of_property_match_string(np, "compatible", match->compatible) == 0)
-			return 0;
+			goto populate;
 		else
 			return -ENODEV;
 	}
@@ -64,13 +64,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, bus);
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-
 	pm_runtime_enable(&pdev->dev);
 
+populate:
 	if (np)
 		of_platform_populate(np, NULL, lookup, &pdev->dev);
 
+	dev_dbg(&pdev->dev, "%s\n", __func__);
+
 	return 0;
 }
 
@@ -78,12 +79,16 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
 {
 	const void *data = of_device_get_match_data(&pdev->dev);
 
-	if (pdev->driver_override || data)
+	if (pdev->driver_override)
 		return;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
-	pm_runtime_disable(&pdev->dev);
+	if (pdev->dev.of_node)
+		of_platform_depopulate(&pdev->dev);
+
+	if (!data)
+		pm_runtime_disable(&pdev->dev);
 }
 
 static int simple_pm_bus_runtime_suspend(struct device *dev)
-- 
2.49.0


