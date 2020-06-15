Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C411F90D2
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 09:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgFOH6j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 03:58:39 -0400
Received: from www.zeus03.de ([194.117.254.33]:49268 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728878AbgFOH6g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 03:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=L544mEjG3aL5/0
        34ANdVIlg9WBObk6nWQy0P1oUfcjs=; b=uEPFAeAM6xxRo8E+TVrae+0qOue1qP
        0BKLSNF5eyASLIfdhlhJtk9Bo52uvJtUubf7EwveIAZ20lQWUPA6HrUWSy1XPg7B
        Mdqbpn6QjxxW3CzTnWEVuWUAe41/RxaqORP31WiElPoWJFUGMRcz67ediXOQ2NIZ
        3G7afBJDSdFA4=
Received: (qmail 989328 invoked from network); 15 Jun 2020 09:58:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jun 2020 09:58:30 +0200
X-UD-Smtp-Session: l3s3148p1@2FruyhqoErYgAwDPXwRdAFnN6pRlEuNX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] i2c: remove deprecated i2c_new_device API
Date:   Mon, 15 Jun 2020 09:58:15 +0200
Message-Id: <20200615075816.2848-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All in-tree users have been converted to the new i2c_new_client_device
function, so remove this deprecated one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I'd like to push it via I2C for 5.8-rc2.

 drivers/i2c/i2c-core-base.c | 25 -------------------------
 include/linux/i2c.h         |  8 +++-----
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d1f278f73011..26f03a14a478 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -815,31 +815,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 }
 EXPORT_SYMBOL_GPL(i2c_new_client_device);
 
-/**
- * i2c_new_device - instantiate an i2c device
- * @adap: the adapter managing the device
- * @info: describes one I2C device; bus_num is ignored
- * Context: can sleep
- *
- * This deprecated function has the same functionality as
- * @i2c_new_client_device, it just returns NULL instead of an ERR_PTR in case of
- * an error for compatibility with current I2C API. It will be removed once all
- * users are converted.
- *
- * This returns the new i2c client, which may be saved for later use with
- * i2c_unregister_device(); or NULL to indicate an error.
- */
-struct i2c_client *
-i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
-{
-	struct i2c_client *ret;
-
-	ret = i2c_new_client_device(adap, info);
-	return IS_ERR(ret) ? NULL : ret;
-}
-EXPORT_SYMBOL_GPL(i2c_new_device);
-
-
 /**
  * i2c_unregister_device - reverse effect of i2c_new_*_device()
  * @client: value returned from i2c_new_*_device()
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index c10617bb980a..b8b8963f8bb9 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -408,7 +408,7 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * that are present.  This information is used to grow the driver model tree.
  * For mainboards this is done statically using i2c_register_board_info();
  * bus numbers identify adapters that aren't yet available.  For add-on boards,
- * i2c_new_device() does this dynamically with the adapter already known.
+ * i2c_new_client_device() does this dynamically with the adapter already known.
  */
 struct i2c_board_info {
 	char		type[I2C_NAME_SIZE];
@@ -439,13 +439,11 @@ struct i2c_board_info {
 
 
 #if IS_ENABLED(CONFIG_I2C)
-/* Add-on boards should register/unregister their devices; e.g. a board
+/*
+ * Add-on boards should register/unregister their devices; e.g. a board
  * with integrated I2C, a config eeprom, sensors, and a codec that's
  * used in conjunction with the primary hardware.
  */
-struct i2c_client *
-i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
-
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
 
-- 
2.27.0

