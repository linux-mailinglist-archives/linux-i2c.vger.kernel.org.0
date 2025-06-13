Return-Path: <linux-i2c+bounces-11435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA115AD8DB6
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE2201E49B3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AFF2E2F04;
	Fri, 13 Jun 2025 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HZ36IoB/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2DE20DD4B;
	Fri, 13 Jun 2025 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822539; cv=none; b=Kvy7vgPUBAy5pIeifoG9yn2XGWnvNxoVE0tHbfM2VKVu74AxX2kiHRSgcqHsTWJUpgs40MW4mi7P5X2Y4wZhrOsSXGqS0d38HdVnexqGu/rLDio87e88Mh10BWgmZDfd5g3g/1qU977LpvDwl/71iz5kR6fF2UGy52RFFSBl+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822539; c=relaxed/simple;
	bh=DD9zU1ZK8lOkS628EPePxJoLvx3V/DqgYZG1U4kxqGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgjrp8BgFDjz9FIz2jKJJ+E9jIWiuvSHBDCq5iC4i55uExXFxjUkLtyam7Wms62QPWhsGYEs/CWXB9mZksxlWsNLFIrLFuAsjJ1fEr45g7ZhKrNP2Kv3wYJMF2y/S/YKb09Zu8aNSM1EJcz9TVD1Y8EEp5mPdZWnBmDOzkg8JHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HZ36IoB/; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 291AF442C8;
	Fri, 13 Jun 2025 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKhGf/QJQpZzz9XDmJmiYvWYjQMvBbB+K2PYVqMHzA0=;
	b=HZ36IoB/e1T643VwutZnR3mM0Rw10AMTL7VH9vAtrmlDKNYa5IoMmfEey56m35T00Ava5f
	BUHgF2snG4YJMIPvWut5m0flpXnww+wQOhHkGmDFmluUnWAOk1R6iji45ZntTIG55G+2+N
	jgKmk0Bz1MdxDXjYjbJ1A9d8KU1RxSxouVtGsaM7HfQmq5t7fcL09aoEzu7jema9GQ76PP
	oAky33JKc5kN5pPc5PE6sVBKJ3i1yVOqJ+rd8XbVHbPwQXp46hMF6ccCppXDBzNLcp7oOn
	yWdus2ch9Yi82V4YJBSHdkfw3PxtV8rArMRFlgVcYEDu2Qprr0K+Q6ixGrq/7Q==
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
Subject: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode() wrapper to get_device_from_fwnode()
Date: Fri, 13 Jun 2025 15:47:42 +0200
Message-ID: <20250613134817.681832-3-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelffduleduffelvdeiffettdffffejhefhieffleetjedtuefggffgffduffehgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

get_dev_from_fwnode() calls get_device() and so it acquires a reference
on the device returned.

In order to be more obvious that this wrapper is a get_device() variant,
rename it to get_device_from_fwnode().

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/base/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbc0099d8ef2..36ccee91ba9a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
+#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
 
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
@@ -1891,7 +1891,7 @@ static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 	if (!(fwnode->flags & FWNODE_FLAG_INITIALIZED))
 		return false;
 
-	dev = get_dev_from_fwnode(fwnode);
+	dev = get_device_from_fwnode(fwnode);
 	ret = !dev || dev->links.status == DL_DEV_NO_DRIVER;
 	put_device(dev);
 
@@ -1960,7 +1960,7 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
 	struct device *dev;
 
 	fwnode_for_each_parent_node(fwnode, parent) {
-		dev = get_dev_from_fwnode(parent);
+		dev = get_device_from_fwnode(parent);
 		if (dev) {
 			fwnode_handle_put(parent);
 			return dev;
@@ -2016,8 +2016,8 @@ static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
 		goto out;
 	}
 
-	sup_dev = get_dev_from_fwnode(sup_handle);
-	con_dev = get_dev_from_fwnode(con_handle);
+	sup_dev = get_device_from_fwnode(sup_handle);
+	con_dev = get_device_from_fwnode(con_handle);
 	/*
 	 * If sup_dev is bound to a driver and @con hasn't started binding to a
 	 * driver, sup_dev can't be a consumer of @con. So, no need to check
@@ -2156,7 +2156,7 @@ static int fw_devlink_create_devlink(struct device *con,
 	if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
 		sup_dev = fwnode_get_next_parent_dev(sup_handle);
 	else
-		sup_dev = get_dev_from_fwnode(sup_handle);
+		sup_dev = get_device_from_fwnode(sup_handle);
 
 	if (sup_dev) {
 		/*
@@ -2225,7 +2225,7 @@ static void __fw_devlink_link_to_consumers(struct device *dev)
 		bool own_link = true;
 		int ret;
 
-		con_dev = get_dev_from_fwnode(link->consumer);
+		con_dev = get_device_from_fwnode(link->consumer);
 		/*
 		 * If consumer device is not available yet, make a "proxy"
 		 * SYNC_STATE_ONLY link from the consumer's parent device to
-- 
2.49.0


