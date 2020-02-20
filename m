Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2981664AF
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2020 18:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728857AbgBTR0J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Feb 2020 12:26:09 -0500
Received: from sauhun.de ([88.99.104.3]:35160 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728706AbgBTRZ4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Feb 2020 12:25:56 -0500
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
        by pokefinder.org (Postfix) with ESMTPSA id E09212C1EC3;
        Thu, 20 Feb 2020 18:25:53 +0100 (CET)
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
Subject: [RFC PATCH 6/7] i2c: of: mark a whole array of regs as reserved
Date:   Thu, 20 Feb 2020 18:24:02 +0100
Message-Id: <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Back then, 'reg' properties in I2C DT bindings only contained one
address and this address was assigned a device and, thus, blocked.
Meanwhile, chips using multiple addresses are common and the 'reg'
property can be an array described by 'reg-names'. This code enhances
I2C DT parsing, so it will reserve all addresses described in an array.
They will be bound to the 'dummy' driver as 'reserved' iff the first
address can be assigned successfully. If that is not the case, the array
is not further considered. If one later address of the array can not be
assigned, it will be reported but we don't bail out. The driver has to
decide if that address is critical or not.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-of.c | 68 +++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 74b9f3fbb5ef..316db0c3b3c8 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -21,20 +21,12 @@
 
 #include "i2c-core.h"
 
-int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
+static void of_i2c_decode_board_info(struct device_node *node, u32 addr,
+				     bool first_addr, struct i2c_board_info *info)
 {
-	u32 addr;
-	int ret;
-
 	memset(info, 0, sizeof(*info));
 
-	ret = of_property_read_u32(node, "reg", &addr);
-	if (ret) {
-		pr_err("invalid reg on %pOF\n", node);
-		return ret;
-	}
-
-	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
+	if (!first_addr || of_modalias_node(node, info->type, sizeof(info->type)) < 0)
 		strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
 
 	if (addr & I2C_TEN_BIT_ADDRESS) {
@@ -51,11 +43,27 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
 	info->of_node = node;
 	info->fwnode = of_fwnode_handle(node);
 
-	if (of_property_read_bool(node, "host-notify"))
-		info->flags |= I2C_CLIENT_HOST_NOTIFY;
+	if (first_addr) {
+		if (of_property_read_bool(node, "host-notify"))
+			info->flags |= I2C_CLIENT_HOST_NOTIFY;
+
+		if (of_get_property(node, "wakeup-source", NULL))
+			info->flags |= I2C_CLIENT_WAKE;
+	}
+}
+
+int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
+{
+	u32 addr;
+	int ret;
+
+	ret = of_property_read_u32(node, "reg", &addr);
+	if (ret) {
+		pr_err("invalid reg on %pOF\n", node);
+		return ret;
+	}
 
-	if (of_get_property(node, "wakeup-source", NULL))
-		info->flags |= I2C_CLIENT_WAKE;
+	of_i2c_decode_board_info(node, addr, true, info);
 
 	return 0;
 }
@@ -64,21 +72,33 @@ EXPORT_SYMBOL_GPL(of_i2c_get_board_info);
 static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 						 struct device_node *node)
 {
-	struct i2c_client *client;
+	struct i2c_client *client, *first_client = ERR_PTR(-ENOENT);
 	struct i2c_board_info info;
-	int ret;
+	bool first_reg = true;
+	struct property *prop;
+	const __be32 *cur;
+	u32 reg;
 
 	pr_debug("register %pOF\n", node);
 
-	ret = of_i2c_get_board_info(node, &info);
-	if (ret)
-		return ERR_PTR(ret);
+	of_property_for_each_u32(node, "reg", prop, cur, reg) {
+		of_i2c_decode_board_info(node, reg, first_reg, &info);
+
+		client = i2c_new_client_device(adap, &info);
+		if (IS_ERR(client)) {
+			pr_err("failure registering addr 0x%02x for %pOF\n",
+				reg, node);
+			if (first_reg)
+				return client;
+		}
 
-	client = i2c_new_client_device(adap, &info);
-	if (IS_ERR(client))
-		pr_err("failure registering %pOF\n", node);
+		if (first_reg) {
+			first_client = client;
+			first_reg = false;
+		}
+	}
 
-	return client;
+	return first_client;
 }
 
 void of_i2c_register_devices(struct i2c_adapter *adap)
-- 
2.20.1

