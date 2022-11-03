Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5416D618B6E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 23:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbiKCW1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 18:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbiKCW13 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 18:27:29 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C21F2127D;
        Thu,  3 Nov 2022 15:27:27 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1oqigI-005aIv-8o; Thu, 03 Nov 2022 23:27:26 +0100
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1oqigH-005Ggn-T5; Thu, 03 Nov 2022 23:27:25 +0100
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-input@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH v2 3/3] HID: mcp2221: avoid stale rxbuf pointer
Date:   Thu,  3 Nov 2022 23:27:14 +0100
Message-Id: <20221103222714.21566-4-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103222714.21566-1-Enrik.Berkhan@inka.de>
References: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
 <20221103222714.21566-1-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In case the MCP2221 driver receives an unexpected read complete report
from the device, the data should not be copied to mcp->rxbuf. The
pointer might be NULL or even stale, having been set during an earlier
transaction.

Further, some bounds checking has been added.

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
---
 drivers/hid/hid-mcp2221.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0705526231ec..471b29c3c501 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -98,6 +98,7 @@ struct mcp2221 {
 	u8 *rxbuf;
 	u8 txbuf[64];
 	int rxbuf_idx;
+	int rxbuf_len;
 	int status;
 	u8 cur_i2c_clk_div;
 	struct gpio_chip *gc;
@@ -294,11 +295,12 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 		mcp->rxbuf = smbus_buf;
 	}
 
+	mcp->rxbuf_len = total_len;
+	mcp->rxbuf_idx = 0;
+
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 4);
 	if (ret)
-		return ret;
-
-	mcp->rxbuf_idx = 0;
+		goto out_invalidate_rxbuf;
 
 	do {
 		memset(mcp->txbuf, 0, 4);
@@ -306,15 +308,20 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 
 		ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
 		if (ret)
-			return ret;
+			goto out_invalidate_rxbuf;
 
 		ret = mcp_chk_last_cmd_status(mcp);
 		if (ret)
-			return ret;
+			goto out_invalidate_rxbuf;
 
 		usleep_range(980, 1000);
 	} while (mcp->rxbuf_idx < total_len);
 
+out_invalidate_rxbuf:
+	mcp->rxbuf = NULL;
+	mcp->rxbuf_len = 0;
+	mcp->rxbuf_idx = 0;
+
 	return ret;
 }
 
@@ -499,8 +506,12 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 
 			mcp->rxbuf_idx = 0;
 			mcp->rxbuf = data->block;
+			mcp->rxbuf_len = sizeof(data->block);
 			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
 			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+			mcp->rxbuf_idx = 0;
+			mcp->rxbuf = NULL;
+			mcp->rxbuf_len = 0;
 			if (ret)
 				goto exit;
 		} else {
@@ -522,8 +533,12 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 
 			mcp->rxbuf_idx = 0;
 			mcp->rxbuf = data->block;
+			mcp->rxbuf_len = sizeof(data->block);
 			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
 			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+			mcp->rxbuf_idx = 0;
+			mcp->rxbuf = NULL;
+			mcp->rxbuf_len = 0;
 			if (ret)
 				goto exit;
 		} else {
@@ -734,6 +749,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				struct hid_report *report, u8 *data, int size)
 {
 	u8 *buf;
+	int len;
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
 	switch (data[0]) {
@@ -792,9 +808,15 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				break;
 			}
 			if (data[2] == MCP2221_I2C_READ_COMPL) {
+				if (mcp->rxbuf == NULL || mcp->rxbuf_idx >= mcp->rxbuf_len)
+					return 1; /* no complete() in this case */
+
 				buf = mcp->rxbuf;
-				memcpy(&buf[mcp->rxbuf_idx], &data[4], data[3]);
-				mcp->rxbuf_idx = mcp->rxbuf_idx + data[3];
+				len = data[3];
+				if (len > mcp->rxbuf_len - mcp->rxbuf_idx)
+					len = mcp->rxbuf_len - mcp->rxbuf_idx;
+				memcpy(&buf[mcp->rxbuf_idx], &data[4], len);
+				mcp->rxbuf_idx = mcp->rxbuf_idx + len;
 				mcp->status = 0;
 				break;
 			}
-- 
2.34.1

