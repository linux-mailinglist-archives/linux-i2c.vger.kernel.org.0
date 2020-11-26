Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BAF2C4F5A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Nov 2020 08:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388475AbgKZHXl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Nov 2020 02:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgKZHXl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Nov 2020 02:23:41 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA01C0613D4
        for <linux-i2c@vger.kernel.org>; Wed, 25 Nov 2020 23:23:40 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiBcw-0002cM-IE; Thu, 26 Nov 2020 08:23:38 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiBcv-0003vg-4j; Thu, 26 Nov 2020 08:23:37 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: [PATCH 1/2] i2c: Warn when device removing fails
Date:   Thu, 26 Nov 2020 08:23:30 +0100
Message-Id: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver core ignores the return value of struct bus_type::remove. So
warn if there is an error that went unnoticed before and return 0
unconditionally in i2c_device_remove().

This prepares changing struct bus_type::remove to return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-core-base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 573b5da145d1..86e43016ff85 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -551,15 +551,19 @@ static int i2c_device_remove(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
-	int status = 0;
 
 	if (!client || !dev->driver)
 		return 0;
 
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
+		int status = 0;
+
 		dev_dbg(dev, "remove\n");
+
 		status = driver->remove(client);
+		if (status)
+			dev_warn(dev, "remove failed (%pe), will be ignored\n", ERR_PTR(status));
 	}
 
 	dev_pm_domain_detach(&client->dev, true);
@@ -571,7 +575,7 @@ static int i2c_device_remove(struct device *dev)
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put(&client->adapter->dev);
 
-	return status;
+	return 0;
 }
 
 static void i2c_device_shutdown(struct device *dev)
-- 
2.29.2

