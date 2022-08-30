Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 649A75A6BF5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 20:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiH3SUj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 14:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbiH3SUc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 14:20:32 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB0925C66
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 11:20:28 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1oT5Zg-0065Ia-5V; Tue, 30 Aug 2022 20:02:56 +0200
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1oT5Zg-009MqK-J1; Tue, 30 Aug 2022 20:02:55 +0200
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-i2c@vger.kernel.org
Cc:     linux-input@vger.kernel.or, Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH v1 4/4] HID: mcp2221: avoid stale rxbuf pointer
Date:   Tue, 30 Aug 2022 20:02:15 +0200
Message-Id: <20220830180215.31099-5-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830180215.31099-1-Enrik.Berkhan@inka.de>
References: <20220830180215.31099-1-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
 drivers/hid/hid-mcp2221.c | 44 +++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index d17839e09ebc..faccb3c03d33 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -94,6 +94,7 @@ struct mcp2221 {
 	u8 *rxbuf;
 	u8 txbuf[64];
 	int rxbuf_idx;
+	int rxbuf_len;
 	int status;
 	u8 cur_i2c_clk_div;
 	struct gpio_chip *gc;
@@ -286,15 +287,13 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 		total_len = smbus_len;
 		mcp->rxbuf = smbus_buf;
 	}
+	mcp->rxbuf_len = total_len;
+	mcp->rxbuf_idx = 0;
 	spin_unlock_bh(&mcp->raw_event_lock);
 
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 4);
 	if (ret)
-		return ret;
-
-	spin_lock_bh(&mcp->raw_event_lock);
-	mcp->rxbuf_idx = 0;
-	spin_unlock_bh(&mcp->raw_event_lock);
+		goto out_invalidate_rxbuf;
 
 	do {
 		spin_lock_bh(&mcp->raw_event_lock);
@@ -304,15 +303,22 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 
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
+	spin_lock_bh(&mcp->raw_event_lock);
+	mcp->rxbuf = NULL;
+	mcp->rxbuf_len = 0;
+	mcp->rxbuf_idx = 0;
+	spin_unlock_bh(&mcp->raw_event_lock);
+
 	return ret;
 }
 
@@ -500,9 +506,15 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 			spin_lock_bh(&mcp->raw_event_lock);
 			mcp->rxbuf_idx = 0;
 			mcp->rxbuf = data->block;
+			mcp->rxbuf_len = sizeof(data->block);
 			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
 			spin_unlock_bh(&mcp->raw_event_lock);
 			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+			spin_lock_bh(&mcp->raw_event_lock);
+			mcp->rxbuf_idx = 0;
+			mcp->rxbuf = NULL;
+			mcp->rxbuf_len = 0;
+			spin_unlock_bh(&mcp->raw_event_lock);
 			if (ret)
 				goto exit;
 		} else {
@@ -525,9 +537,15 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 			spin_lock_bh(&mcp->raw_event_lock);
 			mcp->rxbuf_idx = 0;
 			mcp->rxbuf = data->block;
+			mcp->rxbuf_len = sizeof(data->block);
 			mcp->txbuf[0] = MCP2221_I2C_GET_DATA;
 			spin_unlock_bh(&mcp->raw_event_lock);
 			ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+			spin_lock_bh(&mcp->raw_event_lock);
+			mcp->rxbuf_idx = 0;
+			mcp->rxbuf = NULL;
+			mcp->rxbuf_len = 0;
+			spin_unlock_bh(&mcp->raw_event_lock);
 			if (ret)
 				goto exit;
 		} else {
@@ -756,6 +774,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				struct hid_report *report, u8 *data, int size)
 {
 	u8 *buf;
+	int len;
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
 	spin_lock_bh(&mcp->raw_event_lock);
@@ -813,9 +832,15 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				break;
 			}
 			if (data[2] == MCP2221_I2C_READ_COMPL) {
+				if (mcp->rxbuf == NULL || mcp->rxbuf_idx >= mcp->rxbuf_len)
+					goto out; /* no complete() in this case */
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
@@ -865,6 +890,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 		complete(&mcp->wait_in_report);
 	}
 
+out:
 	spin_unlock_bh(&mcp->raw_event_lock);
 
 	return 1;
-- 
2.34.1

