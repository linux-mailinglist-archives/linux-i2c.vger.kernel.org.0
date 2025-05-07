Return-Path: <linux-i2c+bounces-10857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AAAAD790
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 09:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3BAD1BA2723
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 07:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5344122D4E2;
	Wed,  7 May 2025 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BYmC9g2I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F29722CBF9;
	Wed,  7 May 2025 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602055; cv=none; b=kvdKdaxd5QpS1alZMkc2HulgeQG2RKei2LqHU2UG07sMs+mKfTbWgII5BAKMxxt/uR5mrMyp8KIPA9rk7cOnYULcKFanSUpdRyRPuVBqrcAj7nA/oV2PLvGvKoKSL2jft/kV9CunZMgM3vpuIuL7xuzgarI4xNXlQwzFlUJtkD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602055; c=relaxed/simple;
	bh=tPQz64fedXaX0i+YLmW/VkESWufumA6+0meAcXLkTGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skrgh93SftgzC3zPgD4lz770VuUoKhZHyZcn7g5iz4ZW9DY3LGYK0TwAVRkG1V/mXDAm3ICv0kCRCXlfQFoWK4MQwUQyA4xrHc9blbtMrgSyO0HjCjndovavp2NSSR/+pIZvD4gEkALj6+iC+aHgc4hrtguGXmm2JNJqOPqVJoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BYmC9g2I; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id F05AD43409;
	Wed,  7 May 2025 07:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=755kpgsraEp2tBtZBZZ+v2dmL4b1o2Ua8bVQPPvDfko=;
	b=BYmC9g2I7rrrY4zyiPdJUAxMqOQeqsXTQDJjE38lUgl9ofAeXb6E40KMdnX3Cl0/R/DEWQ
	dnPX1nc/xE4k4d5SyYlVjWoDNoyhyfsjis4rM6ofJN905bTbG9+W5Z9pnLZljjEEJbRkZA
	8FU5RBseZNYVqSvPyjJpW3kBvtb9Via38/G3mGAtLaio6YwrvOHlDayv7MQJzweJi6re32
	BE7Oh7ytY1P99bdw25shuqM5sMzMEy88H35N7ljDs4C+Y7y0uJT5yT29GtDqbd9Q16LJxH
	v4LZi612SM8DdMLWM/U+C9j+d7m8doYpBcjkHoUGZqUXCFfJMZ2Fo2DE9KAGRQ==
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
Subject: [PATCH v2 22/26] misc: lan966x_pci: Rename lan966x_pci.dtso to lan966x_evb_lan9662_nic.dtso
Date: Wed,  7 May 2025 09:13:04 +0200
Message-ID: <20250507071315.394857-23-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptefgiefhuddukeelgffhkeeftdeikeevtddtgffhveelgffftdejgedvffejgfeinecuffhomhgrihhnpehmihgtrhhotghhihhprdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuo
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

The lan966x_pci.dtso describes the Microchip EVB-LAN9662-NIC board [0]

This PCI board embeds a LAN9962 PCI device chip, part of the LAN966x
family.

Rename the lan966x_pci.dtso accordingly.

Link: https://www.microchip.com/en-us/development-tool/EV53U25A [0]
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS                                               | 2 +-
 drivers/misc/Makefile                                     | 2 +-
 .../{lan966x_pci.dtso => lan966x_evb_lan9662_nic.dtso}    | 0
 drivers/misc/lan966x_pci.c                                | 8 ++++----
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/misc/{lan966x_pci.dtso => lan966x_evb_lan9662_nic.dtso} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b985f34bcde8..537ecac86d25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15812,9 +15812,9 @@ F:	drivers/irqchip/irq-lan966x-oic.c
 MICROCHIP LAN966X PCI DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 S:	Maintained
+F:	drivers/misc/lan966x_evb_lan9662_nic.dtso
 F:	drivers/misc/lan966x_pci.c
 F:	drivers/misc/lan966x_pci.dtsi
-F:	drivers/misc/lan966x_pci.dtso
 
 MICROCHIP LAN969X ETHERNET DRIVER
 M:	Daniel Machon <daniel.machon@microchip.com>
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index d6c917229c45..a3c6687ea15f 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -71,6 +71,6 @@ obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
 obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
 lan966x-pci-objs		:= lan966x_pci.o
-lan966x-pci-objs		+= lan966x_pci.dtbo.o
+lan966x-pci-objs		+= lan966x_evb_lan9662_nic.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_evb_lan9662_nic.dtso
similarity index 100%
rename from drivers/misc/lan966x_pci.dtso
rename to drivers/misc/lan966x_evb_lan9662_nic.dtso
diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
index 9c79b58137e5..b28066c96534 100644
--- a/drivers/misc/lan966x_pci.c
+++ b/drivers/misc/lan966x_pci.c
@@ -19,8 +19,8 @@
 #include <linux/slab.h>
 
 /* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
-extern char __dtbo_lan966x_pci_begin[];
-extern char __dtbo_lan966x_pci_end[];
+extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
+extern char __dtbo_lan966x_evb_lan9662_nic_end[];
 
 struct pci_dev_intr_ctrl {
 	struct pci_dev *pci_dev;
@@ -125,8 +125,8 @@ struct lan966x_pci {
 
 static int lan966x_pci_load_overlay(struct lan966x_pci *data)
 {
-	u32 dtbo_size = __dtbo_lan966x_pci_end - __dtbo_lan966x_pci_begin;
-	void *dtbo_start = __dtbo_lan966x_pci_begin;
+	u32 dtbo_size = __dtbo_lan966x_evb_lan9662_nic_end - __dtbo_lan966x_evb_lan9662_nic_begin;
+	void *dtbo_start = __dtbo_lan966x_evb_lan9662_nic_begin;
 
 	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
 }
-- 
2.49.0


