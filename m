Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A465311288D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2019 10:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfLDJx5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Dec 2019 04:53:57 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49297 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfLDJx5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Dec 2019 04:53:57 -0500
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1icRM3-00048G-6Q; Wed, 04 Dec 2019 10:53:55 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1icRM2-00037B-Aa; Wed, 04 Dec 2019 10:53:54 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, Biwen Li <biwen.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave support
Date:   Wed,  4 Dec 2019 10:53:48 +0100
Message-Id: <20191204095348.9192-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Always add the (un)reg_slave hooks to struct i2c_algorithm, even when
I2C slave support is disabled. With the cost of some binary space I2C
drivers with optional I2C slave support no longer have to #ifdef
the hooks. For the same reason add a stub for i2c_slave_event and make
enum i2c_slave_event present without I2C slave support.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/linux/i2c.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index d2f786706657..74ebfcb43dd2 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -359,7 +359,6 @@ static inline void i2c_set_clientdata(struct i2c_client *dev, void *data)
 
 /* I2C slave support */
 
-#if IS_ENABLED(CONFIG_I2C_SLAVE)
 enum i2c_slave_event {
 	I2C_SLAVE_READ_REQUESTED,
 	I2C_SLAVE_WRITE_REQUESTED,
@@ -368,6 +367,7 @@ enum i2c_slave_event {
 	I2C_SLAVE_STOP,
 };
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
 extern int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
 extern int i2c_slave_unregister(struct i2c_client *client);
 extern bool i2c_detect_slave_mode(struct device *dev);
@@ -379,6 +379,11 @@ static inline int i2c_slave_event(struct i2c_client *client,
 }
 #else
 static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
+static inline int i2c_slave_event(struct i2c_client *client,
+				  enum i2c_slave_event event, u8 *val)
+{
+	return -EINVAL;
+}
 #endif
 
 /**
@@ -553,10 +558,8 @@ struct i2c_algorithm {
 	/* To determine what the adapter supports */
 	u32 (*functionality)(struct i2c_adapter *adap);
 
-#if IS_ENABLED(CONFIG_I2C_SLAVE)
 	int (*reg_slave)(struct i2c_client *client);
 	int (*unreg_slave)(struct i2c_client *client);
-#endif
 };
 
 /**
-- 
2.24.0

