Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B115EB300
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 23:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbiIZVUd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 17:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiIZVUc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 17:20:32 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1373356F3;
        Mon, 26 Sep 2022 14:20:30 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1ocudL-003t0y-Az; Mon, 26 Sep 2022 22:23:19 +0200
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1ocudK-007Trr-UQ; Mon, 26 Sep 2022 22:23:18 +0200
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-input@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH v1 3/4] HID: mcp2221: protect shared data with spin lock
Date:   Mon, 26 Sep 2022 22:22:38 +0200
Message-Id: <20220926202239.16379-4-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
References: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Various fields of the driver's per instance data are read and written
both from process context during i2c or gpio processing and the HID
.raw_event callback. The .raw_event callback usually runs in softirq
context. Concurrent access to the shared fields is protected with
spin_{un}lock_bh().

Note: the higher level mutex to prevent user space calls from running
concurrently is still needed. The spin lock only addresses low level
consistency of eg. tx buffer contents and length.

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
---
 drivers/hid/hid-mcp2221.c | 61 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 5d8898f3f2e3..d17839e09ebc 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/hid.h>
@@ -88,6 +89,7 @@ struct mcp2221 {
 	struct hid_device *hdev;
 	struct i2c_adapter adapter;
 	struct mutex lock;
+	spinlock_t raw_event_lock;
 	struct completion wait_in_report;
 	u8 *rxbuf;
 	u8 txbuf[64];
@@ -153,8 +155,10 @@ static int mcp_send_data_req_status(struct mcp2221 *mcp,
 /* Check pass/fail for actual communication with i2c slave */
 static int mcp_chk_last_cmd_status(struct mcp2221 *mcp)
 {
+	spin_lock_bh(&mcp->raw_event_lock);
 	memset(mcp->txbuf, 0, 8);
 	mcp->txbuf[0] = MCP2221_I2C_PARAM_OR_STATUS;
+	spin_unlock_bh(&mcp->raw_event_lock);
 
 	return mcp_send_data_req_status(mcp, mcp->txbuf, 8);
 }
@@ -162,9 +166,11 @@ static int mcp_chk_last_cmd_status(struct mcp2221 *mcp)
 /* Cancels last command releasing i2c bus just in case occupied */
 static int mcp_cancel_last_cmd(struct mcp2221 *mcp)
 {
+	spin_lock_bh(&mcp->raw_event_lock);
 	memset(mcp->txbuf, 0, 8);
 	mcp->txbuf[0] = MCP2221_I2C_PARAM_OR_STATUS;
 	mcp->txbuf[2] = MCP2221_I2C_CANCEL;
+	spin_unlock_bh(&mcp->raw_event_lock);
 
 	return mcp_send_data_req_status(mcp, mcp->txbuf, 8);
 }
@@ -173,10 +179,12 @@ static int mcp_set_i2c_speed(struct mcp2221 *mcp)
 {
 	int ret;
 
+	spin_lock_bh(&mcp->raw_event_lock);
 	memset(mcp->txbuf, 0, 8);
 	mcp->txbuf[0] = MCP2221_I2C_PARAM_OR_STATUS;
 	mcp->txbuf[3] = MCP2221_I2C_SET_SPEED;
 	mcp->txbuf[4] = mcp->cur_i2c_clk_div;
+	spin_unlock_bh(&mcp->raw_event_lock);
 
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 8);
 	if (ret) {
@@ -209,12 +217,14 @@ static int mcp_i2c_write(struct mcp2221 *mcp,
 		len = 60;
 
 	do {
+		spin_lock_bh(&mcp->raw_event_lock);
 		mcp->txbuf[0] = type;
 		mcp->txbuf[1] = msg->len & 0xff;
 		mcp->txbuf[2] = msg->len >> 8;
 		mcp->txbuf[3] = (u8)(msg->addr << 1);
 
 		memcpy(&mcp->txbuf[4], &msg->buf[idx], len);
+		spin_unlock_bh(&mcp->raw_event_lock);
 
 		ret = mcp_send_data_req_status(mcp, mcp->txbuf, len + 4);
 		if (ret)
@@ -261,6 +271,7 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 	int ret;
 	u16 total_len;
 
+	spin_lock_bh(&mcp->raw_event_lock);
 	mcp->txbuf[0] = type;
 	if (msg) {
 		mcp->txbuf[1] = msg->len & 0xff;
@@ -275,16 +286,21 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 		total_len = smbus_len;
 		mcp->rxbuf = smbus_buf;
 	}
+	spin_unlock_bh(&mcp->raw_event_lock);
 
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 4);
 	if (ret)
 		return ret;
 
+	spin_lock_bh(&mcp->raw_event_lock);
 	mcp->rxbuf_idx = 0;
+	spin_unlock_bh(&mcp->raw_event_lock);
 
 	do {
+		spin_lock_bh(&mcp->raw_event_lock);
 		memset(mcp->txbuf, 0, 4);
 		mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
+		spin_unlock_bh(&mcp->raw_event_lock);
 
 		ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
 		if (ret)
@@ -365,6 +381,7 @@ static int mcp_smbus_write(struct mcp2221 *mcp, u16 addr,
 {
 	int data_len, ret;
 
+	spin_lock_bh(&mcp->raw_event_lock);
 	mcp->txbuf[0] = type;
 	mcp->txbuf[1] = len + 1; /* 1 is due to command byte itself */
 	mcp->txbuf[2] = 0;
@@ -391,6 +408,7 @@ static int mcp_smbus_write(struct mcp2221 *mcp, u16 addr,
 		memcpy(&mcp->txbuf[5], buf, len);
 		data_len = len + 5;
 	}
+	spin_unlock_bh(&mcp->raw_event_lock);
 
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, data_len);
 	if (ret)
@@ -479,9 +497,11 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 			if (ret)
 				goto exit;
 
+			spin_lock_bh(&mcp->raw_event_lock);
 			mcp->rxbuf_idx = 0;
 			mcp->rxbuf = data->block;
 			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
+			spin_unlock_bh(&mcp->raw_event_lock);
 			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
 			if (ret)
 				goto exit;
@@ -502,9 +522,11 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 			if (ret)
 				goto exit;
 
+			spin_lock_bh(&mcp->raw_event_lock);
 			mcp->rxbuf_idx = 0;
 			mcp->rxbuf = data->block;
 			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
+			spin_unlock_bh(&mcp->raw_event_lock);
 			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
 			if (ret)
 				goto exit;
@@ -573,12 +595,16 @@ static int mcp_gpio_get(struct gpio_chip *gc,
 	int ret;
 	struct mcp2221 *mcp = gpiochip_get_data(gc);
 
+	mutex_lock(&mcp->lock);
+
+	spin_lock_bh(&mcp->raw_event_lock);
 	mcp->txbuf[0] = MCP2221_GPIO_GET;
 
 	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].value);
+	spin_unlock_bh(&mcp->raw_event_lock);
 
-	mutex_lock(&mcp->lock);
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+
 	mutex_unlock(&mcp->lock);
 
 	return ret;
@@ -589,6 +615,9 @@ static void mcp_gpio_set(struct gpio_chip *gc,
 {
 	struct mcp2221 *mcp = gpiochip_get_data(gc);
 
+	mutex_lock(&mcp->lock);
+
+	spin_lock_bh(&mcp->raw_event_lock);
 	memset(mcp->txbuf, 0, 18);
 	mcp->txbuf[0] = MCP2221_GPIO_SET;
 
@@ -596,15 +625,17 @@ static void mcp_gpio_set(struct gpio_chip *gc,
 
 	mcp->txbuf[mcp->gp_idx - 1] = 1;
 	mcp->txbuf[mcp->gp_idx] = !!value;
+	spin_unlock_bh(&mcp->raw_event_lock);
 
-	mutex_lock(&mcp->lock);
 	mcp_send_data_req_status(mcp, mcp->txbuf, 18);
+
 	mutex_unlock(&mcp->lock);
 }
 
 static int mcp_gpio_dir_set(struct mcp2221 *mcp,
 				unsigned int offset, u8 val)
 {
+	spin_lock_bh(&mcp->raw_event_lock);
 	memset(mcp->txbuf, 0, 18);
 	mcp->txbuf[0] = MCP2221_GPIO_SET;
 
@@ -612,6 +643,7 @@ static int mcp_gpio_dir_set(struct mcp2221 *mcp,
 
 	mcp->txbuf[mcp->gp_idx - 1] = 1;
 	mcp->txbuf[mcp->gp_idx] = val;
+	spin_unlock_bh(&mcp->raw_event_lock);
 
 	return mcp_send_data_req_status(mcp, mcp->txbuf, 18);
 }
@@ -654,21 +686,31 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
 	int ret;
 	struct mcp2221 *mcp = gpiochip_get_data(gc);
 
+	mutex_lock(&mcp->lock);
+
+	spin_lock_bh(&mcp->raw_event_lock);
 	mcp->txbuf[0] = MCP2221_GPIO_GET;
 
 	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].direction);
+	spin_unlock_bh(&mcp->raw_event_lock);
 
-	mutex_lock(&mcp->lock);
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
-	mutex_unlock(&mcp->lock);
+
+	spin_lock_bh(&mcp->raw_event_lock);
 
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	if (mcp->gpio_dir == MCP2221_DIR_IN)
-		return GPIO_LINE_DIRECTION_IN;
+		ret = GPIO_LINE_DIRECTION_IN;
+	else
+		ret = GPIO_LINE_DIRECTION_OUT;
 
-	return GPIO_LINE_DIRECTION_OUT;
+out_unlock:
+	spin_unlock_bh(&mcp->raw_event_lock);
+	mutex_unlock(&mcp->lock);
+
+	return ret;
 }
 
 /* Gives current state of i2c engine inside mcp2221 */
@@ -716,6 +758,8 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 	u8 *buf;
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
+	spin_lock_bh(&mcp->raw_event_lock);
+
 	switch (data[0]) {
 
 	case MCP2221_I2C_WR_DATA:
@@ -821,6 +865,8 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 		complete(&mcp->wait_in_report);
 	}
 
+	spin_unlock_bh(&mcp->raw_event_lock);
+
 	return 1;
 }
 
@@ -857,6 +903,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 		goto err_hstop;
 	}
 
+	spin_lock_init(&mcp->raw_event_lock);
 	mutex_init(&mcp->lock);
 	init_completion(&mcp->wait_in_report);
 	hid_set_drvdata(hdev, mcp);
-- 
2.34.1

