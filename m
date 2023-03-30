Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A63A6D0698
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 15:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjC3N0n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 09:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjC3N0i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 09:26:38 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A74AAD3B
        for <linux-i2c@vger.kernel.org>; Thu, 30 Mar 2023 06:26:28 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by xavier.telenet-ops.be with bizsmtp
        id edSF2900D1C8whw01dSFSm; Thu, 30 Mar 2023 15:26:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1phsHS-00FKfy-71;
        Thu, 30 Mar 2023 15:26:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1phsIB-007ycS-40;
        Thu, 30 Mar 2023 15:26:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Ivan Bornyakov <i.bornyakov@metrotek.ru>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] treewide: Fix probing of devices in DT overlays
Date:   Thu, 30 Mar 2023 15:26:13 +0200
Message-Id: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When loading a DT overlay that creates a device, the device is not
probed, unless the DT overlay is unloaded and reloaded again.

After the recent refactoring to improve fw_devlink, it no longer depends
on the "compatible" property to identify which device tree nodes will
become struct devices.   fw_devlink now picks up dangling consumers
(consumers pointing to descendent device tree nodes of a device that
aren't converted to child devices) when a device is successfully bound
to a driver.  See __fw_devlink_pickup_dangling_consumers().

However, during DT overlay, a device's device tree node can have
sub-nodes added/removed without unbinding/rebinding the driver.  This
difference in behavior between the normal device instantiation and
probing flow vs. the DT overlay flow has a bunch of implications that
are pointed out elsewhere[1].  One of them is that the fw_devlink logic
to pick up dangling consumers is never exercised.

This patch solves the fw_devlink issue by marking all DT nodes added by
DT overlays with FWNODE_FLAG_NOT_DEVICE (fwnode that won't become
device), and by clearing the flag when a struct device is actually
created for the DT node.  This way, fw_devlink knows not to have
consumers waiting on these newly added DT nodes, and to propagate the
dependency to an ancestor DT node that has the corresponding struct
device.

Based on a patch by Saravana Kannan, which covered only platform and spi
devices.

[1] https://lore.kernel.org/r/CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=9e881qmK=vx3hBMyg@mail.gmail.com

Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=rWYnkCZ6z5bGX-wj4w@mail.gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
---
v3:
  - Add Acked-by,
  - s/instantiate/probe/,
  - Improve commit description,
  - Add comment before clearing FWNODE_FLAG_NOT_DEVICE,

v2:
  - Add Acked-by,
  - Drop RFC.
---
 drivers/bus/imx-weim.c    | 6 ++++++
 drivers/i2c/i2c-core-of.c | 5 +++++
 drivers/of/dynamic.c      | 1 +
 drivers/of/platform.c     | 5 +++++
 drivers/spi/spi.c         | 5 +++++
 5 files changed, 22 insertions(+)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 36d42484142aede2..cf463c1d2102c6fb 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -329,6 +329,12 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
 				 "Failed to setup timing for '%pOF'\n", rd->dn);
 
 		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
+			/*
+			 * Clear the flag before adding the device so that
+			 * fw_devlink doesn't skip adding consumers to this
+			 * device.
+			 */
+			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
 				dev_err(&pdev->dev,
 					"Failed to create child device '%pOF'\n",
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index aa93467784c29c89..5c137638689799c8 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -178,6 +178,11 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
+		/*
+		 * Clear the flag before adding the device so that fw_devlink
+		 * doesn't skip adding consumers to this device.
+		 */
+		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
 			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 07d93753b12f5f4d..e311d406b1705306 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -226,6 +226,7 @@ static void __of_attach_node(struct device_node *np)
 	np->sibling = np->parent->child;
 	np->parent->child = np;
 	of_node_clear_flag(np, OF_DETACHED);
+	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
 }
 
 /**
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b2bd2e783445dd78..78ae8418744905c9 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -737,6 +737,11 @@ static int of_platform_notify(struct notifier_block *nb,
 		if (of_node_check_flag(rd->dn, OF_POPULATED))
 			return NOTIFY_OK;
 
+		/*
+		 * Clear the flag before adding the device so that fw_devlink
+		 * doesn't skip adding consumers to this device.
+		 */
+		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		/* pdev_parent may be NULL when no bus platform device */
 		pdev_parent = of_find_device_by_node(rd->dn->parent);
 		pdev = of_platform_device_create(rd->dn, NULL,
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 37a7be6c5a44c8f9..a12420e28640bbd4 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4504,6 +4504,11 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
+		/*
+		 * Clear the flag before adding the device so that fw_devlink
+		 * doesn't skip adding consumers to this device.
+		 */
+		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		spi = of_register_spi_device(ctlr, rd->dn);
 		put_device(&ctlr->dev);
 
-- 
2.34.1

