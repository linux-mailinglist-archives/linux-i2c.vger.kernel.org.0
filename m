Return-Path: <linux-i2c+bounces-11449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E1AD8DF3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01AFD7AB074
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9BC2ECE9E;
	Fri, 13 Jun 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XnM39ycK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E52EBDDE;
	Fri, 13 Jun 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822574; cv=none; b=OcPZpQeuSVCaZFy/9lJmRqdFGcfu35s6E92DLiJIBoszTDehXELbQUvJravqgh2N+6d9HInDKQ6b8WQq077WhW186egEjqxKrIx73NvOxfNsem/Pbc6/yLLXiQ5RsYJ4cFhPLE/pEz5Cj0+Utw6KuCVlqRxtyjPwOWNAH4YM4qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822574; c=relaxed/simple;
	bh=hkfd6Gh/wEI+E/rejW4nRR6uvwD9wpr+kq7Q4MDtZoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXctlJKez3euBf8sfZr3TNaQL9fdIXB5kznqhO23dltwSCvnuBd28ZxAXBC4iWPVjFvwbNiudIVbunR8FNtk1la20Ya5clQb4qyuAHnHHG9RVugte/WyTngMIlyMM5Jfc0j86OUJyz9MQyDbZ5oSOsJZ8uVaOcg5WhUuz3RsCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XnM39ycK; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 3700C44288;
	Fri, 13 Jun 2025 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ENkYJtSSz11PHbWU+IQIKoCc5oQ5nWPLWyZhqyIoyE=;
	b=XnM39ycKxN8idtJEZv1bhoHy7/ipo2La6nKjDzN2WKME3lorJMj4cGq2dHw8zaCxwIjv+o
	WTBU32mzTTCcuvyBhCaWfGkPZi0oTgJxQKwL5LUuFwEXlY670CF+E/RPHQa++PT/PjT+Zt
	zM2/2+3q5JE4wINFNvHvValmYzBPOW7zhWoKyp4kW7x9I71Sq3X0379+AblIZ0uCaDBN0L
	UEPtl6D7jOLjQIwrbf0wrgykkfM+RSRx/eSQcb6goSKMtjDCAJdDTayxyYPILlWkXvV5Ld
	jtnNCawawNuh154aYKU3syEdrYU6t/6Dx5LfIOPP8c/w3UuszgWBUzLOUT5OGg==
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on x86 when PCI device-tree node creation is enabled
Date: Fri, 13 Jun 2025 15:47:58 +0200
Message-ID: <20250613134817.681832-19-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelffduleduffelvdeiffettdffffejhefhieffleetjedtuefggffgffduffehgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

PCI drivers can use a device-tree overlay to describe the hardware
available on the PCI board. This is the case, for instance, of the
LAN966x PCI device driver.

Adding some more nodes in the device-tree overlay adds some more
consumer/supplier relationship between devices instantiated from this
overlay.

Those fw_node consumer/supplier relationships are handled by fw_devlink
and are created based on the device-tree parsing done by the
of_fwnode_add_links() function.

Those consumer/supplier links are needed in order to ensure a correct PM
runtime management and a correct removal order between devices.

For instance, without those links a supplier can be removed before its
consumers is removed leading to all kind of issue if this consumer still
want the use the already removed supplier.

The support for the usage of an overlay from a PCI driver has been added
on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
host bridge node").

In the past, support for fw_devlink on x86 had been tried but this
support has been removed in commit 4a48b66b3f52 ("of: property: Disable
fw_devlink DT support for X86"). Indeed, this support was breaking some
x86 systems such as OLPC system and the regression was reported in [0].

Instead of disabling this support for all x86 system, a first approach
would be to use a finer grain and disable this support only for the
possible problematic subset of x86 systems (at least OLPC and CE4100).

This first approach could still leads to issues. Indeed, the list of
possible problematic system and the way to identify them using Kconfig
symbols is not well defined and so some system can be missed leading to
kernel regressions on those missing systems.

Use an other way and enable the support on x86 system only when this
support is needed by some specific feature. The usage of a device-tree
overlay by a PCI driver and thus the creation of PCI device-tree nodes
is a feature that needs it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..8b5cfee696e2 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1605,7 +1605,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 	const struct property *p;
 	struct device_node *con_np = to_of_node(fwnode);
 
-	if (IS_ENABLED(CONFIG_X86))
+	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))
 		return 0;
 
 	if (!con_np)
-- 
2.49.0


