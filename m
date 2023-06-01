Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05BA71916F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 05:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjFADkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 23:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjFADkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 23:40:18 -0400
X-Greylist: delayed 345 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 31 May 2023 20:40:13 PDT
Received: from mail-m11878.qiye.163.com (mail-m11878.qiye.163.com [115.236.118.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1A9128;
        Wed, 31 May 2023 20:40:13 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11878.qiye.163.com (Hmail) with ESMTPA id F1464740464;
        Thu,  1 Jun 2023 11:34:24 +0800 (CST)
From:   David Wu <david.wu@rock-chips.com>
To:     wsa@kernel.org, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Zhang aihui <zah@rock-chips.com>,
        David Wu <david.wu@rock-chips.com>
Subject: [PATCH] i2c: Devices which have some i2c addr can work in same i2c bus
Date:   Thu,  1 Jun 2023 11:34:23 +0800
Message-Id: <20230601033423.172021-1-david.wu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5IGFZMQ0MfTx1NSx5OHx1VEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSkpLQ0hJVUpLS1VLWQ
        Y+
X-HM-Tid: 0a8875055a412eb4kusnf1464740464
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ny46Szo6Lz1DIjhLGRcsHz8x
        EEkwCw5VSlVKTUNOTkJLT01OTU5IVTMWGhIXVR8aDRIfVQwOOwkUGBBWGBMSCwhVGBQWRVlXWRIL
        WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0xDSTcG
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Zhang aihui <zah@rock-chips.com>

If i2c slave devices don't work at the same time, which have
the same i2c addr, it would register two devices, can make them
working.

Change-Id: I1bfb7783924b08bdc6e12bf47c2de01bdac7c2e2
Signed-off-by: Zhang aihui <zah@rock-chips.com>
Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 drivers/i2c/i2c-core-base.c | 51 +++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae3af738b03f..53a8141e6238 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -62,6 +62,7 @@
 static DEFINE_MUTEX(core_lock);
 static DEFINE_IDR(i2c_adapter_idr);
 
+static int i2c_check_addr_ex(struct i2c_adapter *adapter, int addr);
 static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver);
 
 static DEFINE_STATIC_KEY_FALSE(i2c_trace_msg_key);
@@ -849,7 +850,8 @@ static void i2c_adapter_unlock_bus(struct i2c_adapter *adapter,
 
 static void i2c_dev_set_name(struct i2c_adapter *adap,
 			     struct i2c_client *client,
-			     struct i2c_board_info const *info)
+			     struct i2c_board_info const *info,
+			     int status)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 
@@ -863,8 +865,12 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
 		return;
 	}
 
-	dev_set_name(&client->dev, "%d-%04x", i2c_adapter_id(adap),
-		     i2c_encode_flags_to_addr(client));
+	if (status == 0)
+		dev_set_name(&client->dev, "%d-%04x", i2c_adapter_id(adap),
+			i2c_encode_flags_to_addr(client));
+	else
+		dev_set_name(&client->dev, "%d-%04x-%01x", i2c_adapter_id(adap),
+			i2c_encode_flags_to_addr(client), status);
 }
 
 int i2c_dev_irq_from_resources(const struct resource *resources,
@@ -940,9 +946,11 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	}
 
 	/* Check for address business */
-	status = i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
+	status = i2c_check_addr_ex(adap, i2c_encode_flags_to_addr(client));
 	if (status)
-		goto out_err;
+		dev_err(&adap->dev,
+			"%d i2c clients have been registered at 0x%02x",
+			status, client->addr);
 
 	client->dev.parent = &client->adapter->dev;
 	client->dev.bus = &i2c_bus_type;
@@ -951,7 +959,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.fwnode = info->fwnode;
 
 	device_enable_async_suspend(&client->dev);
-	i2c_dev_set_name(adap, client, info);
+	i2c_dev_set_name(adap, client, info, status);
 
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
@@ -976,10 +984,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	device_remove_software_node(&client->dev);
 out_err_put_of_node:
 	of_node_put(info->of_node);
-out_err:
-	dev_err(&adap->dev,
-		"Failed to register i2c client %s at 0x%02x (%d)\n",
-		client->name, client->addr, status);
 out_err_silent:
 	kfree(client);
 	return ERR_PTR(status);
@@ -1988,6 +1992,33 @@ EXPORT_SYMBOL(i2c_del_driver);
 
 /* ------------------------------------------------------------------------- */
 
+struct i2c_addr_cnt {
+	int addr;
+	int cnt;
+};
+
+static int __i2c_check_addr_ex(struct device *dev, void *addrp)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	struct i2c_addr_cnt *addrinfo = (struct i2c_addr_cnt *)addrp;
+	int addr = addrinfo->addr;
+
+	if (client && client->addr == addr)
+		addrinfo->cnt++;
+
+	return 0;
+}
+
+static int i2c_check_addr_ex(struct i2c_adapter *adapter, int addr)
+{
+	struct i2c_addr_cnt addrinfo;
+
+	addrinfo.addr = addr;
+	addrinfo.cnt = 0;
+	device_for_each_child(&adapter->dev, &addrinfo, __i2c_check_addr_ex);
+	return addrinfo.cnt;
+}
+
 struct i2c_cmd_arg {
 	unsigned	cmd;
 	void		*arg;
-- 
2.25.1

