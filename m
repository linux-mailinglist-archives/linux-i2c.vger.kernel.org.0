Return-Path: <linux-i2c+bounces-10838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6CDAAD70E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 09:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642C01C00F29
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 07:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466EB21FF4E;
	Wed,  7 May 2025 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aS105vZL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF8E21ABB0;
	Wed,  7 May 2025 07:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602016; cv=none; b=VtZeomU4vFfZt1C8f9SCZXBWymTwLwPzJil27D/fHoyT1krBYRRdRjhPgDul689KdZd1lFb7UMvuj8tLXNkFYdatEJqVWaqhlfKQ9RjBSUn7LBZva6Mw/hRH7CnNQZimRAgueysC8reMO8DBak5Or4eIOq0Fu/W4Yei4OJ//L24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602016; c=relaxed/simple;
	bh=qZ78TUKEWIg9YE+oUUo6zuNuFzRhOb4mpFjc449RH3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKm94wVlsHgOC3tEUeVm3m3k5HHjdiIXqAe0z30gMpjn7142set9eMqpJWHQPalCZnJc/I5122vZjgojdtAnQWIoip58d0OX1kuV0nxQXGjl/+XdVrcVNwhBPSipHuTxaeeuXsFKIFPRSGtQLZ+l4baoUaw4iUrXp3mDIxopLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aS105vZL; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 88C4E43B57;
	Wed,  7 May 2025 07:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28hcVxWFjrxL6Y3fGAa6zwNv9etqDkyrLTOnTtTmdms=;
	b=aS105vZLck3hFSy8xMkVgQVsg0lRw4qGUsryo1vZYmOrc1wJwEWeBlQOrGKC/bXLKOcN+V
	JbboAJ0vLWitwQ8uQ4rohwVeWOgkERzOfA5qMsNPVPqvi3jmQ236nINa0/87InZuI9uTGo
	MsehcHLUVESBfenZZg2ReYHJt+jyohGDV4WccahrrHQY3ALqArc1HIJKEvcAWYf51igqP0
	yBkljh6khb7t+CfY3PvczZNlnOLIfeerhaB9dzO5WwyxqN9OzwZynfbIwUmoHuPspxEmxK
	KDMHv2Lv4MUhDeDt0t+JHGS+DcOT6Y7Cc7YegkAa0xyG7oe2Aq2bG+vx4u2Rjw==
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
Subject: [PATCH v2 03/26] of: dynamic: Fix overlayed devices not probing because of fw_devlink
Date: Wed,  7 May 2025 09:12:45 +0200
Message-ID: <20250507071315.394857-4-herve.codina@bootlin.com>
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

When an overlay is applied, if the target device has already probed
successfully and bound to a device, then some of the fw_devlink logic
that ran when the device was probed needs to be rerun. This allows newly
created dangling consumers of the overlayed device tree nodes to be
moved to become consumers of the target device.

Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
Reported-by: Herve Codina <herve.codina@bootlin.com>
Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@google.com/
[Herve: Rebase on top of recent kernel and use get_device_from_fwnode()]
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/base/core.c    | 78 ++++++++++++++++++++++++++++++++++++------
 drivers/of/overlay.c   | 15 ++++++++
 include/linux/fwnode.h |  1 +
 3 files changed, 83 insertions(+), 11 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f30260fd3031..5d6687f38d00 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -47,6 +47,8 @@ static bool fw_devlink_drv_reg_done;
 static bool fw_devlink_best_effort;
 static struct workqueue_struct *device_link_wq;
 
+#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
+
 /**
  * __fwnode_link_add - Create a link between two fwnode_handles.
  * @con: Consumer end of the link.
@@ -235,6 +237,70 @@ static void __fw_devlink_pickup_dangling_consumers(struct fwnode_handle *fwnode,
 		__fw_devlink_pickup_dangling_consumers(child, new_sup);
 }
 
+static void fw_devlink_pickup_dangling_consumers(struct device *dev)
+{
+	struct fwnode_handle *child;
+
+	guard(mutex)(&fwnode_link_lock);
+
+	fwnode_for_each_available_child_node(dev->fwnode, child)
+		__fw_devlink_pickup_dangling_consumers(child, dev->fwnode);
+	__fw_devlink_link_to_consumers(dev);
+}
+
+/**
+ * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
+ * @fwnode: The fwnode under which the fwnode tree has changed
+ *
+ * This function is mainly meant to adjust the supplier/consumer dependencies
+ * after a fwnode tree overlay has occurred.
+ */
+void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
+{
+	struct device *dev;
+
+	/*
+	 * Find the closest ancestor fwnode that has been converted to a device
+	 * that can bind to a driver (bus device).
+	 */
+	fwnode_handle_get(fwnode);
+	do {
+		if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
+			continue;
+
+		dev = get_device_from_fwnode(fwnode);
+		if (!dev)
+			continue;
+
+		if (dev->bus)
+			break;
+
+		put_device(dev);
+	} while ((fwnode = fwnode_get_next_parent(fwnode)));
+
+	/*
+	 * If none of the ancestor fwnodes have (yet) been converted to a device
+	 * that can bind to a driver, there's nothing to fix up.
+	 */
+	if (!fwnode)
+		return;
+
+	WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
+	     "Don't multithread overlaying and probing the same device!\n");
+
+	/*
+	 * If the device has already bound to a driver, then we need to redo
+	 * some of the work that was done after the device was bound to a
+	 * driver. If the device hasn't bound to a driver, running thing too
+	 * soon would incorrectly pick up consumers that it shouldn't.
+	 */
+	if (dev->links.status == DL_DEV_DRIVER_BOUND)
+		fw_devlink_pickup_dangling_consumers(dev);
+
+	put_device(dev);
+	fwnode_handle_put(fwnode);
+}
+
 static DEFINE_MUTEX(device_links_lock);
 DEFINE_STATIC_SRCU(device_links_srcu);
 
@@ -1313,16 +1379,8 @@ void device_links_driver_bound(struct device *dev)
 	 * child firmware node.
 	 */
 	if (dev->fwnode && dev->fwnode->dev == dev) {
-		struct fwnode_handle *child;
-
 		fwnode_links_purge_suppliers(dev->fwnode);
-
-		guard(mutex)(&fwnode_link_lock);
-
-		fwnode_for_each_available_child_node(dev->fwnode, child)
-			__fw_devlink_pickup_dangling_consumers(child,
-							       dev->fwnode);
-		__fw_devlink_link_to_consumers(dev);
+		fw_devlink_pickup_dangling_consumers(dev);
 	}
 	device_remove_file(dev, &dev_attr_waiting_for_supplier);
 
@@ -1881,8 +1939,6 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
-
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
 	struct device *dev;
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 1af6f52d0708..6bd93153d695 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -185,6 +185,15 @@ static int overlay_notify(struct overlay_changeset *ovcs,
 	return 0;
 }
 
+static void overlay_fw_devlink_refresh(struct overlay_changeset *ovcs)
+{
+	for (int i = 0; i < ovcs->count; i++) {
+		struct device_node *np = ovcs->fragments[i].target;
+
+		fw_devlink_refresh_fwnode(of_fwnode_handle(np));
+	}
+}
+
 /*
  * The values of properties in the "/__symbols__" node are paths in
  * the ovcs->overlay_root.  When duplicating the properties, the paths
@@ -951,6 +960,12 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
 		pr_err("overlay apply changeset entry notify error %d\n", ret);
 	/* notify failure is not fatal, continue */
 
+	/*
+	 * Needs to happen after changeset notify to give the listeners a chance
+	 * to finish creating all the devices they need to create.
+	 */
+	overlay_fw_devlink_refresh(ovcs);
+
 	ret_tmp = overlay_notify(ovcs, OF_OVERLAY_POST_APPLY);
 	if (ret_tmp)
 		if (!ret)
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 6fa0a268d538..af76de93bee2 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -223,6 +223,7 @@ int fwnode_link_add(struct fwnode_handle *con, struct fwnode_handle *sup,
 		    u8 flags);
 void fwnode_links_purge(struct fwnode_handle *fwnode);
 void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
+void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
 bool fw_devlink_is_strict(void);
 
 #endif
-- 
2.49.0


