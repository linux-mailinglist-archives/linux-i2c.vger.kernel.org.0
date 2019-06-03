Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE8632AB8
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 10:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfFCIZo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 04:25:44 -0400
Received: from sauhun.de ([88.99.104.3]:35882 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfFCIZo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 04:25:44 -0400
Received: from localhost (unknown [88.128.80.57])
        by pokefinder.org (Postfix) with ESMTPSA id 8F9532CF690;
        Mon,  3 Jun 2019 10:25:41 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 2/5] i2c: headers: always have a named variable in arguments
Date:   Mon,  3 Jun 2019 10:25:32 +0200
Message-Id: <20190603082535.1566-3-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190603082535.1566-1-wsa@the-dreams.de>
References: <20190603082535.1566-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Much better to read and understand. Naming for i2c_adapter is not
consistent (yet), so use the name which is also used in core code.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 include/linux/i2c.h | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 6bd199cfe61f..14e04fb4f46f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -40,7 +40,8 @@ struct i2c_device_identity;
 union i2c_smbus_data;
 struct i2c_board_info;
 enum i2c_slave_event;
-typedef int (*i2c_slave_cb_t)(struct i2c_client *, enum i2c_slave_event, u8 *);
+typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
+			      enum i2c_slave_event event, u8 *val);
 
 struct module;
 struct property_entry;
@@ -257,16 +258,16 @@ struct i2c_driver {
 	unsigned int class;
 
 	/* Standard driver model interfaces */
-	int (*probe)(struct i2c_client *, const struct i2c_device_id *);
-	int (*remove)(struct i2c_client *);
+	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
+	int (*remove)(struct i2c_client *client);
 
 	/* New driver model interface to aid the seamless removal of the
 	 * current probe()'s, more commonly unused than used second parameter.
 	 */
-	int (*probe_new)(struct i2c_client *);
+	int (*probe_new)(struct i2c_client *client);
 
 	/* driver model interfaces that don't relate to enumeration  */
-	void (*shutdown)(struct i2c_client *);
+	void (*shutdown)(struct i2c_client *client);
 
 	/* Alert callback, for example for the SMBus alert protocol.
 	 * The format and meaning of the data value depends on the protocol.
@@ -275,7 +276,7 @@ struct i2c_driver {
 	 * For the SMBus Host Notify protocol, the data corresponds to the
 	 * 16-bit payload data reported by the slave device acting as master.
 	 */
-	void (*alert)(struct i2c_client *, enum i2c_alert_protocol protocol,
+	void (*alert)(struct i2c_client *client, enum i2c_alert_protocol protocol,
 		      unsigned int data);
 
 	/* a ioctl like command that can be used to perform specific functions
@@ -287,7 +288,7 @@ struct i2c_driver {
 	const struct i2c_device_id *id_table;
 
 	/* Device detection callback for automatic device creation */
-	int (*detect)(struct i2c_client *, struct i2c_board_info *);
+	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
 	const unsigned short *address_list;
 	struct list_head clients;
 
@@ -447,10 +448,10 @@ extern struct i2c_client *
 i2c_new_probed_device(struct i2c_adapter *adap,
 		      struct i2c_board_info *info,
 		      unsigned short const *addr_list,
-		      int (*probe)(struct i2c_adapter *, unsigned short addr));
+		      int (*probe)(struct i2c_adapter *adap, unsigned short addr));
 
 /* Common custom probe functions */
-extern int i2c_probe_func_quick_read(struct i2c_adapter *, unsigned short addr);
+extern int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr);
 
 /* For devices that use several addresses, use i2c_new_dummy() to make
  * client handles for the extra addresses.
@@ -466,7 +467,7 @@ i2c_new_secondary_device(struct i2c_client *client,
 				const char *name,
 				u16 default_addr);
 
-extern void i2c_unregister_device(struct i2c_client *);
+extern void i2c_unregister_device(struct i2c_client *client);
 #endif /* I2C */
 
 /* Mainboard arch_initcall() code should register all its I2C devices.
@@ -551,9 +552,9 @@ struct i2c_algorithm {
  * The main operations are wrapped by i2c_lock_bus and i2c_unlock_bus.
  */
 struct i2c_lock_operations {
-	void (*lock_bus)(struct i2c_adapter *, unsigned int flags);
-	int (*trylock_bus)(struct i2c_adapter *, unsigned int flags);
-	void (*unlock_bus)(struct i2c_adapter *, unsigned int flags);
+	void (*lock_bus)(struct i2c_adapter *adapter, unsigned int flags);
+	int (*trylock_bus)(struct i2c_adapter *adapter, unsigned int flags);
+	void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
 };
 
 /**
@@ -726,7 +727,7 @@ i2c_parent_is_i2c_adapter(const struct i2c_adapter *adapter)
 		return NULL;
 }
 
-int i2c_for_each_dev(void *data, int (*fn)(struct device *, void *));
+int i2c_for_each_dev(void *data, int (*fn)(struct device *dev, void *data));
 
 /* Adapter locking functions, exported for shared pin cases */
 #define I2C_LOCK_ROOT_ADAPTER BIT(0)
@@ -832,12 +833,12 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
 /* administration...
  */
 #if IS_ENABLED(CONFIG_I2C)
-extern int i2c_add_adapter(struct i2c_adapter *);
-extern void i2c_del_adapter(struct i2c_adapter *);
-extern int i2c_add_numbered_adapter(struct i2c_adapter *);
+extern int i2c_add_adapter(struct i2c_adapter *adap);
+extern void i2c_del_adapter(struct i2c_adapter *adap);
+extern int i2c_add_numbered_adapter(struct i2c_adapter *adap);
 
-extern int i2c_register_driver(struct module *, struct i2c_driver *);
-extern void i2c_del_driver(struct i2c_driver *);
+extern int i2c_register_driver(struct module *owner, struct i2c_driver *driver);
+extern void i2c_del_driver(struct i2c_driver *driver);
 
 /* use a define to avoid include chaining to get THIS_MODULE */
 #define i2c_add_driver(driver) \
-- 
2.19.1

