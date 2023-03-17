Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95DF6BE6D4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 11:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjCQKdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 06:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjCQKdg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 06:33:36 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13B92A992
        for <linux-i2c@vger.kernel.org>; Fri, 17 Mar 2023 03:33:32 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by laurent.telenet-ops.be with bizsmtp
        id ZNZM290071C8whw01NZMKx; Fri, 17 Mar 2023 11:33:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pd7O5-00CXwE-E0;
        Fri, 17 Mar 2023 11:33:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pd7Oi-00FFZ4-Tm;
        Fri, 17 Mar 2023 11:33:20 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] treewide: Fix instantiation of devices in DT overlay
Date:   Fri, 17 Mar 2023 11:33:18 +0100
Message-Id: <328e557aaee9d3f5f1bcaf2b8ac2de0e04c4fbb8.1679049188.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When loading a DT overlay that creates a device, the device is not
instantiated, unless the DT overlay is unloaded and reloaded again.

Saravana explains:
  Basically for all overlays (I hope the function is only used for
  overlays) we assume all nodes are NOT devices until they actually
  get added as a device. Don't review the code, it's not meant to be :)

Based on a hacky patch by Saravana Kannan, which covered only platform
and spi devices.

Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
Link: https://lore.kernel.org/all/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=rWYnkCZ6z5bGX-wj4w@mail.gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Marked RFC as Saravana said this is an ugly hack.
Still, this is a regression in v6.3-rc1 that should be fixed.
---
 drivers/bus/imx-weim.c    | 1 +
 drivers/i2c/i2c-core-of.c | 1 +
 drivers/of/dynamic.c      | 1 +
 drivers/of/platform.c     | 1 +
 drivers/spi/spi.c         | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 2a6b4f676458612e..71d8807170fa9f29 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -329,6 +329,7 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
 				 "Failed to setup timing for '%pOF'\n", rd->dn);
 
 		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
+			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
 				dev_err(&pdev->dev,
 					"Failed to create child device '%pOF'\n",
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index bce6b796e04c2ca0..79a0d47010ba0b20 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -178,6 +178,7 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
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
index b2bd2e783445dd78..17c92cbfb62ee3ef 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -737,6 +737,7 @@ static int of_platform_notify(struct notifier_block *nb,
 		if (of_node_check_flag(rd->dn, OF_POPULATED))
 			return NOTIFY_OK;
 
+		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		/* pdev_parent may be NULL when no bus platform device */
 		pdev_parent = of_find_device_by_node(rd->dn->parent);
 		pdev = of_platform_device_create(rd->dn, NULL,
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1a65f96fe2aff591..7bd053a32fad1a3c 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4480,6 +4480,7 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
+		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		spi = of_register_spi_device(ctlr, rd->dn);
 		put_device(&ctlr->dev);
 
-- 
2.34.1

