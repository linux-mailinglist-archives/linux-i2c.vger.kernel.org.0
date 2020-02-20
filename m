Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 057F31664BD
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2020 18:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgBTR02 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Feb 2020 12:26:28 -0500
Received: from sauhun.de ([88.99.104.3]:35070 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728730AbgBTRZy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Feb 2020 12:25:54 -0500
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
        by pokefinder.org (Postfix) with ESMTPSA id 80B0D2C1EBB;
        Thu, 20 Feb 2020 18:25:51 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/7] i2c: use DEFINE for the dummy driver name
Date:   Thu, 20 Feb 2020 18:23:58 +0100
Message-Id: <20200220172403.26062-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We use it in multiple places, so make sure it is consistent whenever we
need to change it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 8 ++++----
 drivers/i2c/i2c-core.h      | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8f46d1bb8c62..8df2fa10c48a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -853,7 +853,7 @@ EXPORT_SYMBOL_GPL(i2c_unregister_device);
 
 
 static const struct i2c_device_id dummy_id[] = {
-	{ "dummy", 0 },
+	{ I2C_DUMMY_DRV_NAME, 0 },
 	{ },
 };
 
@@ -869,7 +869,7 @@ static int dummy_remove(struct i2c_client *client)
 }
 
 static struct i2c_driver dummy_driver = {
-	.driver.name	= "dummy",
+	.driver.name	= I2C_DUMMY_DRV_NAME,
 	.probe		= dummy_probe,
 	.remove		= dummy_remove,
 	.id_table	= dummy_id,
@@ -896,7 +896,7 @@ static struct i2c_driver dummy_driver = {
 struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
 {
 	struct i2c_board_info info = {
-		I2C_BOARD_INFO("dummy", address),
+		I2C_BOARD_INFO(I2C_DUMMY_DRV_NAME, address),
 	};
 
 	return i2c_new_client_device(adapter, &info);
@@ -1487,7 +1487,7 @@ static void i2c_do_del_adapter(struct i2c_driver *driver,
 static int __unregister_client(struct device *dev, void *dummy)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
-	if (client && strcmp(client->name, "dummy"))
+	if (client && strcmp(client->name, I2C_DUMMY_DRV_NAME))
 		i2c_unregister_device(client);
 	return 0;
 }
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 517d98be68d2..fb89fabf84d3 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -22,6 +22,8 @@ int i2c_check_7bit_addr_validity_strict(unsigned short addr);
 int i2c_dev_irq_from_resources(const struct resource *resources,
 			       unsigned int num_resources);
 
+#define I2C_DUMMY_DRV_NAME "dummy"
+
 /*
  * We only allow atomic transfers for very late communication, e.g. to send
  * the powerdown command to a PMIC. Atomic transfers are a corner case and not
-- 
2.20.1

