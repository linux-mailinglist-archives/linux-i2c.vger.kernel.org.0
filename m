Return-Path: <linux-i2c+bounces-13515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB420BDCFAA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3196502681
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBAA31BC9E;
	Wed, 15 Oct 2025 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JRaO4bYz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7313168E5;
	Wed, 15 Oct 2025 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512714; cv=none; b=NXQBXa72fUxxaP4wqli78jzp3zmN36CaHRSbuDSdLz0muxow2EAFRMUhfdueAaL5W28+68wc5CoIkaGhlVTNHaxdUV9kv6CLhadB92XU/GDsqP0B5Ny3rV9kN2Zs53o02u3xuKgAdje1G2oVKYEPJE6U6R8mH4c5i2J0o4+ypWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512714; c=relaxed/simple;
	bh=fsEkA9sT0O+b3+lFDQVYTp2zMX1Y5xBEN9bjcddjg9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1phRM0CYSIPoVdI1Wmu5EdJbpPpeC+GcQeaWnt10h4N+XotuP3kt+6qnNynbLqNrbCl6D7AP14R0737r6B5CJFAcZgckGNIiXfdvNlS/tyQyLUr6OMwWg1e/vDGj4urO5Vi10gkzzg3fWFE5nDGELp0dDen3QIwe91Mp/JGdU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JRaO4bYz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6AAC3C09FAA;
	Wed, 15 Oct 2025 07:18:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80FC3606FA;
	Wed, 15 Oct 2025 07:18:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6408102F22AF;
	Wed, 15 Oct 2025 09:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512707; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XapR7WLR+LqYJDmtqOz+8aG2a7DE7pkUyNlWN34aPr0=;
	b=JRaO4bYzK+RZhbgcPZkteddx3T4MiiJJ2fig1PU9Scoucq3QZWFuSF28bxmU7k8Ie0ryXx
	4+m5jhquyqRjTXjVfK4d11p8Mj2qFwaYI9utyYJXeLmq/9a+wjFsBLQRILJbXGKLjkXYoP
	ZQJCxWNHK9J9m9kckj9s4xKcZxWkokm18hedF+tx1PSwOMrk+VAUB3HvzgCBZtCnO6MUjx
	HCEHJQ4xXRNLAFtaf/Sc0ChMDdA50700bh094JolnGN5aVvPAdv6YyvOb6vfrtnFV9pa02
	sNOEYJYgTBiGKAb+51IVXqawxJeZi/r7ggleRnXRTp3r4Ub1hOukueOqiq1mFQ==
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
Subject: [PATCH v4 11/29] cxl/test: Use device_set_node()
Date: Wed, 15 Oct 2025 09:13:58 +0200
Message-ID: <20251015071420.1173068-12-herve.codina@bootlin.com>
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

The code set directly dev->fwnode.

Use the dedicated helper to perform this operation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
---
 tools/testing/cxl/test/cxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
index 2d135ca533d0..eef6146a13d7 100644
--- a/tools/testing/cxl/test/cxl.c
+++ b/tools/testing/cxl/test/cxl.c
@@ -1124,7 +1124,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
 {
 	device_initialize(&adev->dev);
 	fwnode_init(&adev->fwnode, NULL);
-	dev->fwnode = &adev->fwnode;
+	device_set_node(dev, &adev->fwnode);
 	adev->fwnode.dev = dev;
 }
 
-- 
2.51.0


