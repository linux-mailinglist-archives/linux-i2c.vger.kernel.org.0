Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC56A72156
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 23:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731744AbfGWVMK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 17:12:10 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:38497 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728921AbfGWVMK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 17:12:10 -0400
X-Greylist: delayed 2071 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Jul 2019 17:12:08 EDT
Received: from [88.149.224.16] (port=34022 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hq1XU-007idA-Tw; Tue, 23 Jul 2019 22:37:37 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: [RFC,v2 1/6] i2c: core: let adapters be notified of client attach/detach
Date:   Tue, 23 Jul 2019 22:37:18 +0200
Message-Id: <20190723203723.11730-2-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723203723.11730-1-luca@lucaceresoli.net>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

An adapter might need to know when a new device is about to be
added. This will soon bee needed to implement an "I2C address
translator" (ATR for short), a device that propagates I2C transactions
with a different slave address (an "alias" address). An ATR driver
needs to know when a slave is being added to find a suitable alias and
program the device translation map.

Add an attach/detach callback pair to allow adapter drivers to be
notified of clients being added and removed.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes RFCv1 -> RFCv2:

 - Document struct i2c_attach_operations
---
 drivers/i2c/i2c-core-base.c | 16 ++++++++++++++++
 include/linux/i2c.h         | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index f26ed495d384..c08ca4bca9c1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -776,6 +776,11 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	if (adap->attach_ops &&
+	    adap->attach_ops->attach_client &&
+	    adap->attach_ops->attach_client(adap, info, client) != 0)
+		goto err_attach_client;
+
 	status = device_register(&client->dev);
 	if (status)
 		goto out_free_props;
@@ -786,6 +791,9 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	return client;
 
 out_free_props:
+	if (adap->attach_ops && adap->attach_ops->detach_client)
+		adap->attach_ops->detach_client(adap, client);
+err_attach_client:
 	if (info->properties)
 		device_remove_properties(&client->dev);
 out_err_put_of_node:
@@ -832,9 +840,17 @@ EXPORT_SYMBOL_GPL(i2c_new_device);
  */
 void i2c_unregister_device(struct i2c_client *client)
 {
+	struct i2c_adapter *adap;
+
 	if (!client)
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
index fa5552c2307b..ebc372a0e537 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -567,6 +567,21 @@ struct i2c_lock_operations {
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
@@ -690,6 +705,7 @@ struct i2c_adapter {
 
 	/* data fields that are valid for all devices	*/
 	const struct i2c_lock_operations *lock_ops;
+	const struct i2c_attach_operations *attach_ops;
 	struct rt_mutex bus_lock;
 	struct rt_mutex mux_lock;
 
-- 
2.17.1

