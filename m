Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E582640FC
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 11:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgIJJLf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 05:11:35 -0400
Received: from www.zeus03.de ([194.117.254.33]:42550 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbgIJJL2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 05:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=kA4pqwHWPwBzhka+xE04iQmpuiD
        XaMQLHQxlKAzjSag=; b=Ck2w80ZmK9I0RTjzhVl4VzProFqmd0scDTs7ZkZqdD5
        r8BHMD8jaES57Pq9a5R6wDAeLeWr7p0ZyzcYUe+LsyH8N9MVEkNbVJsonFkP549p
        DmoGwjsUya64EMQ8wqXgW4pGmVa5H5c4EPsxnhOypECRFPzYwVv93iAeM0Py0Qp8
        =
Received: (qmail 591291 invoked from network); 10 Sep 2020 11:11:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2020 11:11:25 +0200
X-UD-Smtp-Session: l3s3148p1@itfZ8/GugrYgAwDPXw8CAOzs15PKmAQb
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: add HostNotify support
Date:   Thu, 10 Sep 2020 11:11:18 +0200
Message-Id: <20200910091118.13434-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C core can now utilize a slave interface to handle SMBus
HostNotify events. Enable it in this driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC:
	- adapted name of the binding and the core helpers to the latest
	  version which got upstream now
	- select 'I2C_SMBUS' because helper code was moved there
	  (it could be discussed if this is optional depending if
	   HostNotify is needed, but this is subsystem wide and, thus,
	   a seperate patch)
	- better var name for the used client
	- unregistration in 'remove' is now before deleting adapter

 drivers/i2c/busses/Kconfig    |  1 +
 drivers/i2c/busses/i2c-rcar.c | 31 ++++++++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 46a24faef352..2077ed8de681 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1181,6 +1181,7 @@ config I2C_RCAR
 	tristate "Renesas R-Car I2C Controller"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select I2C_SLAVE
+	select I2C_SMBUS
 	select RESET_CONTROLLER if ARCH_RCAR_GEN3
 	help
 	  If you say yes to this option, support will be included for the
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 41c3dbc641c0..217def2d7cb4 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -106,10 +107,11 @@
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
 /* persistent flags */
+#define ID_P_HOST_NOTIFY	BIT(28)
 #define ID_P_REP_AFTER_RD	BIT(29)
 #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED		BIT(31)
-#define ID_P_MASK		GENMASK(31, 29)
+#define ID_P_MASK		GENMASK(31, 28)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -141,6 +143,8 @@ struct rcar_i2c_priv {
 
 	struct reset_control *rstc;
 	int irq;
+
+	struct i2c_client *host_notify_client;
 };
 
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
@@ -876,14 +880,21 @@ static int rcar_unreg_slave(struct i2c_client *slave)
 
 static u32 rcar_i2c_func(struct i2c_adapter *adap)
 {
+	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
+
 	/*
 	 * This HW can't do:
 	 * I2C_SMBUS_QUICK (setting FSB during START didn't work)
 	 * I2C_M_NOSTART (automatically sends address after START)
 	 * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
 	 */
-	return I2C_FUNC_I2C | I2C_FUNC_SLAVE |
-		(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+	u32 func = I2C_FUNC_I2C | I2C_FUNC_SLAVE |
+		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+
+	if (priv->flags & ID_P_HOST_NOTIFY)
+		func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
+
+	return func;
 }
 
 static const struct i2c_algorithm rcar_i2c_algo = {
@@ -983,6 +994,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	else
 		pm_runtime_put(dev);
 
+	if (of_property_read_bool(dev->of_node, "smbus"))
+		priv->flags |= ID_P_HOST_NOTIFY;
 
 	priv->irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, 0, dev_name(dev), priv);
@@ -997,10 +1010,20 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_pm_disable;
 
+	if (priv->flags & ID_P_HOST_NOTIFY) {
+		priv->host_notify_client = i2c_new_slave_host_notify_device(adap);
+		if (IS_ERR(priv->host_notify_client)) {
+			ret = PTR_ERR(priv->host_notify_client);
+			goto out_del_device;
+		}
+	}
+
 	dev_info(dev, "probed\n");
 
 	return 0;
 
+ out_del_device:
+	i2c_del_adapter(&priv->adap);
  out_pm_put:
 	pm_runtime_put(dev);
  out_pm_disable:
@@ -1013,6 +1036,8 @@ static int rcar_i2c_remove(struct platform_device *pdev)
 	struct rcar_i2c_priv *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	if (priv->host_notify_client)
+		i2c_free_slave_host_notify_device(priv->host_notify_client);
 	i2c_del_adapter(&priv->adap);
 	rcar_i2c_release_dma(priv);
 	if (priv->flags & ID_P_PM_BLOCKED)
-- 
2.20.1

