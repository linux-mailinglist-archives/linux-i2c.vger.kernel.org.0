Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734AA646D53
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 11:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiLHKno (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 05:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiLHKnT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 05:43:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD9BD4A;
        Thu,  8 Dec 2022 02:40:27 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE32B9D9;
        Thu,  8 Dec 2022 11:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670496025;
        bh=qqlP9y4CxrbgrpwUUQtSV2m4Q9RgrkWSjW1olrXBJFA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CQkedEqPUuFFPv87Gd/8wD85ZblpiG5JbFMhLP9siK7EJ62KJmi7fMpz1mdGnqrZz
         2kAWJltrhhHX5saJ8Kssqb/hB7dO1dlU5qS0FObnh+StI6kxHYXQ/6XN3wP4JuBmft
         vf+lkBlx+mfWiMrqu0Y4nZq5pfeqIyfkI0SlrHE4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 1/8] i2c: core: let adapters be notified of client attach/detach
Date:   Thu,  8 Dec 2022 12:39:59 +0200
Message-Id: <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca@lucaceresoli.net>

An adapter might need to know when a new device is about to be
added. This will soon bee needed to implement an "I2C address
translator" (ATR for short), a device that propagates I2C transactions
with a different slave address (an "alias" address). An ATR driver
needs to know when a slave is being added to find a suitable alias and
program the device translation map.

Add an attach/detach callback pair to allow adapter drivers to be
notified of clients being added and removed.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/i2c/i2c-core-base.c | 18 +++++++++++++++++-
 include/linux/i2c.h         | 16 ++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b4edf10e8fd0..c8bc71b1db82 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -966,15 +966,23 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	if (adap->attach_ops &&
+	    adap->attach_ops->attach_client &&
+	    adap->attach_ops->attach_client(adap, info, client) != 0)
+		goto out_remove_swnode;
+
 	status = device_register(&client->dev);
 	if (status)
-		goto out_remove_swnode;
+		goto out_detach_client;
 
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
 	return client;
 
+out_detach_client:
+	if (adap->attach_ops && adap->attach_ops->detach_client)
+		adap->attach_ops->detach_client(adap, client);
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
 out_err_put_of_node:
@@ -996,9 +1004,17 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
  */
 void i2c_unregister_device(struct i2c_client *client)
 {
+	struct i2c_adapter *adap;
+
 	if (IS_ERR_OR_NULL(client))
 		return;
 
+	adap = client->adapter;
+
+	if (adap->attach_ops &&
+	    adap->attach_ops->detach_client)
+		adap->attach_ops->detach_client(adap, client);
+
 	if (client->dev.of_node) {
 		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
 		of_node_put(client->dev.of_node);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f7c49bbdb8a1..9a385b6de388 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -584,6 +584,21 @@ struct i2c_lock_operations {
 	void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
 };
 
+/**
+ * struct i2c_attach_operations - callbacks to notify client attach/detach
+ * @attach_client: Notify of new client being attached
+ * @detach_client: Notify of new client being detached
+ *
+ * Both ops are optional.
+ */
+struct i2c_attach_operations {
+	int  (*attach_client)(struct i2c_adapter *adapter,
+			      const struct i2c_board_info *info,
+			      const struct i2c_client *client);
+	void (*detach_client)(struct i2c_adapter *adapter,
+			      const struct i2c_client *client);
+};
+
 /**
  * struct i2c_timings - I2C timing information
  * @bus_freq_hz: the bus frequency in Hz
@@ -726,6 +741,7 @@ struct i2c_adapter {
 
 	/* data fields that are valid for all devices	*/
 	const struct i2c_lock_operations *lock_ops;
+	const struct i2c_attach_operations *attach_ops;
 	struct rt_mutex bus_lock;
 	struct rt_mutex mux_lock;
 
-- 
2.34.1

