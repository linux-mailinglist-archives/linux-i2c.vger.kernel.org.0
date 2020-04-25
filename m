Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027071B8652
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 13:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgDYLv5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 07:51:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:4824 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgDYLv4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 07:51:56 -0400
IronPort-SDR: FhiYTYEPRWwImhLdGULL4Ahs7QfB3rcrYedZHcbF6qWrzbhvk6meli5qDGW0Lxxs9aMbOsuGxp
 jT9mYIXvep3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 04:51:55 -0700
IronPort-SDR: uskw4RkIFXAHQ6snvBDVp7rIjFDyCkXXOagy6dHo4+7XdlvWlCvW2+W/J5FNtVNKTr56rgOWU7
 tjpGN9Oc4CIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="281149298"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 25 Apr 2020 04:51:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CDF4172; Sat, 25 Apr 2020 14:51:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/4] i2c: mux: pca954x: Make use of device properties
Date:   Sat, 25 Apr 2020 14:51:50 +0300
Message-Id: <20200425115152.29475-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Device property API allows to gather device resources from different sources,
such as ACPI. Convert the drivers to unleash the power of device property API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: rebase on top of latest rc

 drivers/i2c/muxes/i2c-mux-pca954x.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index b764c7c746e96..928c6f5ceac70 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -43,10 +43,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/mux/mux.h>
@@ -198,7 +196,6 @@ static const struct i2c_device_id pca954x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pca954x_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id pca954x_of_match[] = {
 	{ .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
 	{ .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
@@ -215,7 +212,6 @@ static const struct of_device_id pca954x_of_match[] = {
 	{}
 };
 MODULE_DEVICE_TABLE(of, pca954x_of_match);
-#endif
 
 /* Write to mux register. Don't use i2c_transfer()/i2c_smbus_xfer()
    for this as they will try to lock adapter a second time */
@@ -426,7 +422,6 @@ static int pca954x_probe(struct i2c_client *client,
 {
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
-	struct device_node *np = dev->of_node;
 	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
@@ -456,7 +451,7 @@ static int pca954x_probe(struct i2c_client *client,
 		udelay(1);
 	}
 
-	data->chip = of_device_get_match_data(dev);
+	data->chip = device_get_match_data(dev);
 	if (!data->chip)
 		data->chip = &chips[id->driver_data];
 
@@ -478,8 +473,8 @@ static int pca954x_probe(struct i2c_client *client,
 	}
 
 	data->idle_state = MUX_IDLE_AS_IS;
-	if (of_property_read_u32(np, "idle-state", &data->idle_state)) {
-		if (np && of_property_read_bool(np, "i2c-mux-idle-disconnect"))
+	if (device_property_read_u32(dev, "idle-state", &data->idle_state)) {
+		if (device_property_read_bool(dev, "i2c-mux-idle-disconnect"))
 			data->idle_state = MUX_IDLE_DISCONNECT;
 	}
 
@@ -562,7 +557,7 @@ static struct i2c_driver pca954x_driver = {
 	.driver		= {
 		.name	= "pca954x",
 		.pm	= &pca954x_pm,
-		.of_match_table = of_match_ptr(pca954x_of_match),
+		.of_match_table = pca954x_of_match,
 	},
 	.probe		= pca954x_probe,
 	.remove		= pca954x_remove,
-- 
2.26.2

