Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2E1B186FA7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 17:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731976AbgCPQH2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 12:07:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:24610 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731933AbgCPQH2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 12:07:28 -0400
IronPort-SDR: m2J6oDLGIMEdDgmUenirhxUhHD4vNH2/BcNbOXDfYUTMJvImZSf+n3CU3uq1vPtIk7FIZXpwRt
 7lPeV/WiD6Jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:07:27 -0700
IronPort-SDR: 1kBKLAhkU2mu2Zk0YWKwVY9SZhFJ/RYDKsd39m7j/HBWuzcts58u0ue2pfSeqNM3Sr9glRli+L
 ghMN879SiV5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; 
   d="scan'208";a="267623740"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2020 09:07:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3B93576; Mon, 16 Mar 2020 18:07:25 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/4] i2c: mux: pca954x: Make use of device properties
Date:   Mon, 16 Mar 2020 18:07:22 +0200
Message-Id: <20200316160724.37596-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
References: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
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
v2: dropped I2C table ID changes (Peter)
 drivers/i2c/muxes/i2c-mux-pca954x.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index b764c7c746e9..928c6f5ceac7 100644
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
2.25.1

