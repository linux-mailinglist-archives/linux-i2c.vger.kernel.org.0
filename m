Return-Path: <linux-i2c+bounces-10860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4969AAD7BF
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 09:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 948D93A5C3B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 07:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D10E22F74D;
	Wed,  7 May 2025 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LOimcVYn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBCB22DFAC;
	Wed,  7 May 2025 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602061; cv=none; b=U50ruHPegvY1G11XJSccDoAo3OIHCyK/vh/Vhd7nMChR5uL/v1q2xmAFtFPjHq8iW6DPglKDQpWz3JeO1f6szk6GbsYNtTomZgP+OPGQgj0+o/eyVU5ZhVD6OtApp62olLhsa0Qr8LoogY4d7jEroU1t5qQF3Ep9yhsBAuCtw+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602061; c=relaxed/simple;
	bh=A12RRIN7ip0jBZdP84vbKkerLzE0J1jMtujI4B/FqYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uv7P/VcE52Ontoiqi+0itRz2CZ+/hohjSS0DGmY3U1IVbxTjvwqCn/Cc+fdHRL1rli/eZLySPY8d/iDHEbL48IcFb1M7WSvmiwMEEeZFXJK0fiFTkGGvDWK5/sPYKQoE+AM2TOaVVAHt0Aplxrf0K80U9I7WHsbYfJu02gm5lTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LOimcVYn; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 9286C43B5B;
	Wed,  7 May 2025 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+1aqAxLbgbnjVNg9/XseYnsFvwJaCJrLx5Hk31Zdi0=;
	b=LOimcVYn0kOo1b/3vErZdzidOHNjG4Dl05jEXr+wQ1ZiAvOxr5viR5sDQv4g0IwWrIRn7+
	xEdLsQEhW3v/UATxX8XdzR5m3WsxjsnyMMgTA6bSj3zasYakndAMgf44bxQJxpCuTPF6ef
	QV7ITlW2J5q8cGBxk+vfDJJbSGN0FEhVRcImiaI5ojKHHNdfTDI+u0x3ivM40O+Splehzi
	4llIjTlWgM4oNaP+aW0YqCP5FPdjVhXNVGuthI+Tc4CTet701ul+DAiwlxPk5CBWP6rcv/
	+D4uNxPsKFT54XvMq9Wpv4s8PjIWIpjxBGZbMHmko+wRNmFdqcwzLrMN26UsGg==
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
Subject: [PATCH v2 25/26] misc: lan966x_pci: Sort the drivers list in Kconfig help
Date: Wed,  7 May 2025 09:13:07 +0200
Message-ID: <20250507071315.394857-26-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsr
 dhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

The LAN966X Kconfig help section mentions drivers related to
devices.

Sort this list alphabetically.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 6b37d61150ee..469044b2256b 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -624,13 +624,13 @@ config MCHP_LAN966X_PCI
 	  Even if this driver does not depend on those other drivers, in order
 	  to have a fully functional board, the following drivers are needed:
 	    - fixed-clock (COMMON_CLK)
-	    - lan966x-oic (LAN966X_OIC)
 	    - lan966x-cpu-syscon (MFD_SYSCON)
-	    - lan966x-switch-reset (RESET_MCHP_SPARX5)
+	    - lan966x-miim (MDIO_MSCC_MIIM)
+	    - lan966x-oic (LAN966X_OIC)
 	    - lan966x-pinctrl (PINCTRL_OCELOT)
 	    - lan966x-serdes (PHY_LAN966X_SERDES)
-	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-switch (LAN966X_SWITCH)
+	    - lan966x-switch-reset (RESET_MCHP_SPARX5)
 
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
-- 
2.49.0


