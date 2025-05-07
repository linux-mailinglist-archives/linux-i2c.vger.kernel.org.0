Return-Path: <linux-i2c+bounces-10836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA6AAD702
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 09:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D191D3BC972
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 07:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBC8218EBE;
	Wed,  7 May 2025 07:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GkSXHjAA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1324321480B;
	Wed,  7 May 2025 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602012; cv=none; b=k+iodP4J46XuqvYsSkyheicM96jLJ4fNunkRAGQElWEuryVtPBe7fNMuDg2Vm+T5CRnCudohIlH8I/+S2gfXnShKrE+o4iTPOsg4yl+fd4Wq0d43w7oY/WQz4BWxaClmIkufUKLx1yGQM0BCyQl6r2ms1uVkODjU3h1mtumLrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602012; c=relaxed/simple;
	bh=W+qh+DyAA0c6tv5WTVqEK2s32At7naacUZxbT9eKK2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CemcDCQyelQgdgRGKgM5GZSGHqqtO+xAwwxOHZkzuAypTTqnITt2haCuvTPtXkYo73GrzvgAMuSZzI9z2MxhyEqPR3DuwwsOstpFcjfKvxqrv6IyBnasvQvKaHM40BBAx3XwDbPsgYi4TlMrnU3HkPfKgCDgr0ursLcGk1LItAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GkSXHjAA; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id B5ED743B5B;
	Wed,  7 May 2025 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yl3Htaycup10wOCeHadslBez5QmFo+Ff63jFS2nHl5s=;
	b=GkSXHjAAOfSnKp8MKUABwcbrYZAhjkrw39uO6lUf/3yjxX25u0l3o4fgvOaUsA1j0s8ZUp
	WhPnJhDoDwSEseptp8NRmeJkpWseVPGv9vpy+Dx4aPIMNtcYpI5kxfqIrBuPGPD+IQWzWZ
	yztrWdbDtwo0wL/Ee+wgLzh88cdYBQb4V63lhILQ3AZ+N1fXc7HzA/vfuAPX4pd/8TLwrG
	DzIeUp5zjLRPnGoKn/w3MdxvEOqDvRU1N12S9oK6QJT423aQHOVZ9OJ3MvUOrOFXVgkEUR
	qqyut1a25ahD9yrFUsnBoYPRu9SPOllelJCYicdjUa+PmkBeC11YBcURrvhiKw==
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
Subject: [PATCH v2 01/26] Revert "treewide: Fix probing of devices in DT overlays"
Date: Wed,  7 May 2025 09:12:43 +0200
Message-ID: <20250507071315.394857-2-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleffudeludffledviefftedtffffjeehhfeiffelteejtdeugffggfffudffheegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

From: Saravana Kannan <saravanak@google.com>

This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.

While the commit fixed fw_devlink overlay handling for one case, it
broke it for another case. So revert it and redo the fix in a separate
patch.

Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
Reported-by: Herve Codina <herve.codina@bootlin.com>
Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@google.com/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/imx-weim.c    | 6 ------
 drivers/i2c/i2c-core-of.c | 5 -----
 drivers/of/dynamic.c      | 1 -
 drivers/of/platform.c     | 5 -----
 drivers/spi/spi.c         | 5 -----
 5 files changed, 22 deletions(-)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 83d623d97f5f..87070155b057 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -327,12 +327,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
 				 "Failed to setup timing for '%pOF'\n", rd->dn);
 
 		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
-			/*
-			 * Clear the flag before adding the device so that
-			 * fw_devlink doesn't skip adding consumers to this
-			 * device.
-			 */
-			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
 				dev_err(&pdev->dev,
 					"Failed to create child device '%pOF'\n",
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 02feee6c9ba9..2b8d02b496fa 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -177,11 +177,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
 			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 0aba760f7577..6a117e1b6798 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -225,7 +225,6 @@ static void __of_attach_node(struct device_node *np)
 	np->sibling = np->parent->child;
 	np->parent->child = np;
 	of_node_clear_flag(np, OF_DETACHED);
-	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
 
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f77cb19973a5..ef9445ba168b 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -739,11 +739,6 @@ static int of_platform_notify(struct notifier_block *nb,
 		if (of_node_check_flag(rd->dn, OF_POPULATED))
 			return NOTIFY_OK;
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		/* pdev_parent may be NULL when no bus platform device */
 		pdev_parent = of_find_device_by_node(parent);
 		pdev = of_platform_device_create(rd->dn, NULL,
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 90e27729ef6b..01a4e558a4fe 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4798,11 +4798,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		spi = of_register_spi_device(ctlr, rd->dn);
 		put_device(&ctlr->dev);
 
-- 
2.49.0


