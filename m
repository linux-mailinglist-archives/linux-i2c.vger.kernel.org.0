Return-Path: <linux-i2c+bounces-13533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8851BDD157
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 09:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709113A8A8C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 07:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C64322A08;
	Wed, 15 Oct 2025 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="13/95jD2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5957315D25;
	Wed, 15 Oct 2025 07:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512908; cv=none; b=HtFBxdKg2PVqcnLrHoQ9eDbJim9k4e4LRwTAOZ1vCasGtDQgeu1pV8hb3fMOoQBhZCze479lm4J1/e6LTlXlDuu6S/rMgXilKwbV+sUNu7Fmv5qaXsTYCzKb9pCd9NZuyIemCB5+ryeYYP10p8MQnSqlR0f4kndCBD9vUruCvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512908; c=relaxed/simple;
	bh=ZzdIgXkVyruSkkb124Jgkm0GwzeDNU9Cpoe/h8aUEvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwYwMV7iFuPhXRbEc3orRLn6QveRJ46CfsuXUS/udwDnvRl56unfGUL0sUew7vRuqWvzGfOiLwo9iTJ4NlYdKJXR27BNh8vlKyaXRGkl9Kak3PtPNug+a3DlOitJZoBDsjhpkF7yM1B/Iyg/3cFpb9zcjyzK9NPJ3qeIhKUoeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=13/95jD2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A9AB1A13B0;
	Wed, 15 Oct 2025 07:21:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C583606F9;
	Wed, 15 Oct 2025 07:21:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E343D102F22BC;
	Wed, 15 Oct 2025 09:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760512903; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=x4ZLGkOvm/oVigw1/rloRb4F3nzZJ1Eq9qAeVsAs4fw=;
	b=13/95jD25xlXmwc7R6cH5utrqLk/HydWkfUY5UAwRu+FW2yl+l+tf7aKeHHHXqhGa3Hh1g
	C7U5piDWXij4eAwMG3FcMRMZwHFx9KfJf2soJXvwVrFcC1HIt+jFMl8u58jqa+xvMyvycw
	/OMkrxOgHqBrrRbJYnf9FJhsvLy9LtU/n334Y0Jqzr2yMlD8i+mVYckXutUZApDiv3CGP8
	CgqY65Ogld37rs6/a29unDJxzrOX8xfqiD0iIFbEkLnPYzFWPtZChkTFRRhoDiDc83dCGN
	/ecyucff/4m9QfuIOxGqKSwkD68Nenwp720UITVnFX9MCEsPGgluSQvCOiWaFg==
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
Subject: [PATCH v4 29/29] misc: lan966x_pci: Add drivers needed to support SFPs in Kconfig help
Date: Wed, 15 Oct 2025 09:14:16 +0200
Message-ID: <20251015071420.1173068-30-herve.codina@bootlin.com>
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

Recently, new device-tree nodes were added in the overlay to add support
for SFPs on LAN966x PCI device.

The LAN966X Kconfig help section mentions drivers related to devices
added based on the overlay description.

Add drivers related to devices described by those new nodes in the
already existing driver list.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 3ca09d993a19..c4e6af87c977 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -636,13 +636,18 @@ config MCHP_LAN966X_PCI
 	  Even if this driver does not depend on those other drivers, in order
 	  to have a fully functional board, the following drivers are needed:
 	    - fixed-clock (COMMON_CLK)
+	    - i2c-mux-pinctrl (I2C_MUX_PINCTRL)
 	    - lan966x-cpu-syscon (MFD_SYSCON)
+	    - lan966x-gck (COMMON_CLK_LAN966X)
 	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-oic (LAN966X_OIC)
 	    - lan966x-pinctrl (PINCTRL_OCELOT)
 	    - lan966x-serdes (PHY_LAN966X_SERDES)
 	    - lan966x-switch (LAN966X_SWITCH)
 	    - lan966x-switch-reset (RESET_MCHP_SPARX5)
+	    - sam9x60-i2c (I2C_AT91)
+	    - sama5d2-flexcom (MFD_ATMEL_FLEXCOM)
+	    - sfp (SFP)
 
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
-- 
2.51.0


