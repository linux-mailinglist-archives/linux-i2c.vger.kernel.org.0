Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBBC65EE43
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jan 2023 15:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbjAEODv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Jan 2023 09:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbjAEOD2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Jan 2023 09:03:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3F840863;
        Thu,  5 Jan 2023 06:03:26 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E26454AE;
        Thu,  5 Jan 2023 15:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672927405;
        bh=nzYI/InFnBKeKA+u3WNviBVDcVXlhGM1JMPGchLnOb0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kp+L0TlAtqg51LR37LO/3z6UT+3EhZWHv3Zozz7hDP8oUNXvN2G7BRqfJybPJHao6
         YgY8qNfi4xgE4Bv/OlWkl+z5+VvK+LdFuoqutG2F90+ckalIkHeIpUE0APU8vKrW+r
         5mgHxBYFRqWgIqZCUMxLmtPyE5c96m1UfspFXDmc=
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
Subject: [PATCH v6 1/8] i2c: core: let adapters be notified of client attach/detach
Date:   Thu,  5 Jan 2023 16:03:00 +0200
Message-Id: <20230105140307.272052-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
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
 drivers/i2c/i2c-core-base.c | 21 ++++++++++++++++++++-
 include/linux/i2c.h         | 16 ++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..8a0888ba89e5 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -916,6 +916,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	const struct i2c_attach_operations *attach_ops;
 	struct i2c_client	*client;
 	int			status;
 
@@ -967,15 +968,24 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	attach_ops = adap->attach_ops;
+
+	if (attach_ops && attach_ops->attach_client &&
+	    attach_ops->attach_client(adap, info, client))
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
+	if (attach_ops && attach_ops->detach_client)
+		attach_ops->detach_client(adap, client);
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
 out_err_put_of_node:
@@ -997,9 +1007,18 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
  */
 void i2c_unregister_device(struct i2c_client *client)
 {
+	const struct i2c_attach_operations *attach_ops;
+	struct i2c_adapter *adap;
+
 	if (IS_ERR_OR_NULL(client))
 		return;
 
+	adap = client->adapter;
+	attach_ops = adap->attach_ops;
+
+	if (attach_ops && attach_ops->detach_client)
+		attach_ops->detach_client(adap, client);
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

