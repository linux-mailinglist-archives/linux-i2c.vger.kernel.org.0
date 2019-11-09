Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C86BF61A0
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2019 22:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfKIV0c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Nov 2019 16:26:32 -0500
Received: from sauhun.de ([88.99.104.3]:47938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbfKIV0c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Nov 2019 16:26:32 -0500
Received: from localhost (p54B337EF.dip0.t-ipconnect.de [84.179.55.239])
        by pokefinder.org (Postfix) with ESMTPSA id C8F952C04F2;
        Sat,  9 Nov 2019 22:26:28 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: remove helpers for ref-counting clients
Date:   Sat,  9 Nov 2019 22:26:15 +0100
Message-Id: <20191109212615.9254-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are no in-tree users of these helpers anymore, and there
shouldn't. Most use cases went away once the driver model started to
refcount for us. There have been users like the media subsystem, but
they all switched to better refcounting methods meanwhile. Media did
this in 2008. Last user (IPMI) left 2018. Remove this cruft.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 32 --------------------------------
 include/linux/i2c.h         |  3 ---
 2 files changed, 35 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c55d24c7a30..5a44a92ed1fb 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1743,38 +1743,6 @@ EXPORT_SYMBOL(i2c_del_driver);
 
 /* ------------------------------------------------------------------------- */
 
-/**
- * i2c_use_client - increments the reference count of the i2c client structure
- * @client: the client being referenced
- *
- * Each live reference to a client should be refcounted. The driver model does
- * that automatically as part of driver binding, so that most drivers don't
- * need to do this explicitly: they hold a reference until they're unbound
- * from the device.
- *
- * A pointer to the client with the incremented reference counter is returned.
- */
-struct i2c_client *i2c_use_client(struct i2c_client *client)
-{
-	if (client && get_device(&client->dev))
-		return client;
-	return NULL;
-}
-EXPORT_SYMBOL(i2c_use_client);
-
-/**
- * i2c_release_client - release a use of the i2c client structure
- * @client: the client being no longer referenced
- *
- * Must be called when a user of a client is finished with it.
- */
-void i2c_release_client(struct i2c_client *client)
-{
-	if (client)
-		put_device(&client->dev);
-}
-EXPORT_SYMBOL(i2c_release_client);
-
 struct i2c_cmd_arg {
 	unsigned	cmd;
 	void		*arg;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 8f512b992acd..23583f76c6dc 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -861,9 +861,6 @@ static inline bool i2c_client_has_driver(struct i2c_client *client)
 	return !IS_ERR_OR_NULL(client) && client->dev.driver;
 }
 
-extern struct i2c_client *i2c_use_client(struct i2c_client *client);
-extern void i2c_release_client(struct i2c_client *client);
-
 /* call the i2c_client->command() of all attached clients with
  * the given arguments */
 extern void i2c_clients_command(struct i2c_adapter *adap,
-- 
2.20.1

