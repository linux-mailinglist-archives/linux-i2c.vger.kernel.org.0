Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9168614B8C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKANU7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiKANU6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:20:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7711FD08;
        Tue,  1 Nov 2022 06:20:57 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD77D158A;
        Tue,  1 Nov 2022 14:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308854;
        bh=qqlP9y4CxrbgrpwUUQtSV2m4Q9RgrkWSjW1olrXBJFA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FX+7y83Onmb73XKFQVu26+/w/AMpXDmSGEgqA/GFV5gACoI/bRG40e1LyZtPvQlTL
         fXTZlotT1Ejspi4Rs4fZhQeyVAN6Nip7mx8ui1nmAQ0ig3tRhidjTxNv7inrBpCndm
         +Nmkx4oJU6L+E7DSogpobL/nG4Iu7IDFV8CZamV0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 1/8] i2c: core: let adapters be notified of client attach/detach
Date:   Tue,  1 Nov 2022 15:20:25 +0200
Message-Id: <20221101132032.1542416-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
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

