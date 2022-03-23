Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC8C4E4F1F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 10:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243232AbiCWJV5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 05:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243187AbiCWJVd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 05:21:33 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744B875E7C;
        Wed, 23 Mar 2022 02:20:02 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 88FCCE000E;
        Wed, 23 Mar 2022 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648027201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4eDLu/2S0pER1wydEQfRnihBM7t30+ODzLZgZNZH6Fs=;
        b=Slcfg90L7zse1fdHC1cbToI+C6ptiFNPPwtNRh+sKwrkru7R4N454yhBxrMgNYitIqI9/Q
        OsT521a3zN21ONiX0jiJcvdO8sqBzkN6o1fy1gOz8zuK10ESAbkc4Gm0rx05/vOq26myJp
        Wl0DPwiayaTWQkXx1YV3iSfqudMaO51uiEzV1bP2BXIJyjYu3EKIiVZcSNOvxIki/UmwZR
        rQ67gaRuTsW57t/0qph6fw/EUka5OIjxL+vZzZLoNSIFrhaM31t/VGCmiAeGORuKmWCQpE
        /sXC/pH5vbHH8aN+4WGetZzcEoUnX4hbY9vFcuEIkw3HZXfP6HmU5G6k+0am7g==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Subject: [PATCH v2 5/7] i2c: of: use fwnode_get_i2c_adapter_by_node()
Date:   Wed, 23 Mar 2022 10:18:08 +0100
Message-Id: <20220323091810.329217-6-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323091810.329217-1-clement.leger@bootlin.com>
References: <20220323091810.329217-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since the new fwnode based fwnode_find_i2c_adapter_by_node() function
has the same behavior than of_get_i2c_adapter_by_node(), call it to
avoid code duplication.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/i2c/i2c-core-of.c | 30 ------------------------------
 include/linux/i2c.h       |  5 ++++-
 2 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 3ed74aa4b44b..be7d66aa0f49 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -113,17 +113,6 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 	of_node_put(bus);
 }
 
-static int of_dev_or_parent_node_match(struct device *dev, const void *data)
-{
-	if (dev->of_node == data)
-		return 1;
-
-	if (dev->parent)
-		return dev->parent->of_node == data;
-
-	return 0;
-}
-
 /* must call put_device() when done with returned i2c_client device */
 struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 {
@@ -142,25 +131,6 @@ struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 }
 EXPORT_SYMBOL(of_find_i2c_device_by_node);
 
-/* must call put_device() when done with returned i2c_adapter device */
-struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
-{
-	struct device *dev;
-	struct i2c_adapter *adapter;
-
-	dev = bus_find_device(&i2c_bus_type, NULL, node,
-			      of_dev_or_parent_node_match);
-	if (!dev)
-		return NULL;
-
-	adapter = i2c_verify_adapter(dev);
-	if (!adapter)
-		put_device(dev);
-
-	return adapter;
-}
-EXPORT_SYMBOL(of_find_i2c_adapter_by_node);
-
 /* must call i2c_put_adapter() when done with returned i2c_adapter device */
 struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 8dadf8c89fd9..982918fd0093 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -975,7 +975,10 @@ fwnode_find_i2c_adapter_by_node(struct fwnode_handle *fwnode);
 struct i2c_client *of_find_i2c_device_by_node(struct device_node *node);
 
 /* must call put_device() when done with returned i2c_adapter device */
-struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node);
+static inline struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
+{
+	return fwnode_find_i2c_adapter_by_node(of_fwnode_handle(node));
+}
 
 /* must call i2c_put_adapter() when done with returned i2c_adapter device */
 struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node);
-- 
2.34.1

