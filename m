Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E64D112DA39
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 17:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfLaQOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 11:14:37 -0500
Received: from sauhun.de ([88.99.104.3]:51566 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbfLaQOg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Dec 2019 11:14:36 -0500
Received: from localhost (p5486C426.dip0.t-ipconnect.de [84.134.196.38])
        by pokefinder.org (Postfix) with ESMTPSA id 1B3F42C07CD;
        Tue, 31 Dec 2019 17:14:35 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 4/5] i2c: core: add simple caching to the 'alias' scanning
Date:   Tue, 31 Dec 2019 17:13:59 +0100
Message-Id: <20191231161400.1688-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add some simple caching of the last used alias to skip some unneeded
scanning of the I2C bus. When freeing the device, the cache will be set
back.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 15 ++++++++++++++-
 include/linux/i2c.h         |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a010e7e698f..0cc4a5c49a15 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -830,6 +830,8 @@ EXPORT_SYMBOL_GPL(i2c_new_device);
  */
 void i2c_unregister_device(struct i2c_client *client)
 {
+	struct i2c_adapter *adap = client->adapter;
+
 	if (IS_ERR_OR_NULL(client))
 		return;
 
@@ -840,6 +842,14 @@ void i2c_unregister_device(struct i2c_client *client)
 
 	if (ACPI_COMPANION(&client->dev))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
+
+	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
+
+	if (client->flags & I2C_CLIENT_ALIAS && client->addr < adap->alias_idx)
+		adap->alias_idx = client->addr;
+
+	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
+
 	device_unregister(&client->dev);
 }
 EXPORT_SYMBOL_GPL(i2c_unregister_device);
@@ -1297,6 +1307,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 		adap->lock_ops = &i2c_adapter_lock_ops;
 
 	adap->locked_flags = 0;
+	adap->alias_idx = 0x08;	/* first valid I2C address */
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
 	mutex_init(&adap->userspace_clients_lock);
@@ -2249,10 +2260,12 @@ struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
 
 	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
 
-	for (addr = 0x08; addr < 0x78; addr++) {
+	for (addr = adap->alias_idx; addr < 0x78; addr++) {
 		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
 		if (ret == -ENODEV) {
 			alias = i2c_new_dummy_device(adap, addr);
+			alias->flags |= I2C_CLIENT_ALIAS;
+			adap->alias_idx = addr + 1;
 			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
 			break;
 		}
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 583ca2aec022..6427c2db5ee0 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -309,6 +309,7 @@ struct i2c_driver {
 struct i2c_client {
 	unsigned short flags;		/* div., see below		*/
 #define I2C_CLIENT_PEC		0x04	/* Use Packet Error Checking */
+#define I2C_CLIENT_ALIAS	0x08	/* client is an alias */
 #define I2C_CLIENT_TEN		0x10	/* we have a ten bit chip address */
 					/* Must equal I2C_M_TEN below */
 #define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
@@ -715,6 +716,7 @@ struct i2c_adapter {
 	const struct i2c_adapter_quirks *quirks;
 
 	struct irq_domain *host_notify_domain;
+	u16 alias_idx;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.20.1

