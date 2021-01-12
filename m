Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FCC2F35FE
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 17:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389778AbhALQmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 11:42:21 -0500
Received: from www.zeus03.de ([194.117.254.33]:37384 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388663AbhALQmS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 11:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=CsQikiLEh7z44L
        KHTLDrKDuRYsf5V+chOq0ijqTAgJ4=; b=hJit5hJnfmEMXn9OMj6NsKv6CCVLA3
        J5lviJslZ9durafVrq+ZzkpLXBXZlL0/WCUIfL49xOt/7S/YMQET3OxwIeAvUhFb
        g4tbnbvw0Hbe37cxsZKKJ9oWATtSpDyJkgJlF0huLXUfZHzO06ZA5E6nP3xmpLQ1
        mg2E1/KJ9w40o=
Received: (qmail 2812505 invoked from network); 12 Jan 2021 17:41:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 17:41:36 +0100
X-UD-Smtp-Session: l3s3148p1@GLUwsra4TNEgAwDPXwxzAHrEwO71dOp2
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] ipmi: remove open coded version of SMBus block write
Date:   Tue, 12 Jan 2021 17:41:29 +0100
Message-Id: <20210112164130.47895-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The block-write function of the core was not used because there was no
client-struct to use. However, in this case it seems apropriate to use a
temporary client struct. Because we are answering a request we recieved
when being a client ourselves. So, convert the code to use a temporary
client and use the block-write function of the I2C core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/char/ipmi/ipmb_dev_int.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index 382b28f1cf2f..10d89886e5f3 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -137,7 +137,7 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 {
 	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
 	u8 rq_sa, netf_rq_lun, msg_len;
-	union i2c_smbus_data data;
+	struct i2c_client temp_client;
 	u8 msg[MAX_MSG_LEN];
 	ssize_t ret;
 
@@ -160,21 +160,16 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 	}
 
 	/*
-	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
-	 * i2c_smbus_xfer
+	 * subtract rq_sa and netf_rq_lun from the length of the msg. Fill the
+	 * temporary client. Note that its use is an exception for IPMI.
 	 */
 	msg_len = msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
-	if (msg_len > I2C_SMBUS_BLOCK_MAX)
-		msg_len = I2C_SMBUS_BLOCK_MAX;
+	memcpy(&temp_client, ipmb_dev->client, sizeof(temp_client));
+	temp_client.addr = rq_sa;
 
-	data.block[0] = msg_len;
-	memcpy(&data.block[1], msg + SMBUS_MSG_IDX_OFFSET, msg_len);
-	ret = i2c_smbus_xfer(ipmb_dev->client->adapter, rq_sa,
-			     ipmb_dev->client->flags,
-			     I2C_SMBUS_WRITE, netf_rq_lun,
-			     I2C_SMBUS_BLOCK_DATA, &data);
-
-	return ret ? : count;
+	ret = i2c_smbus_write_block_data(&temp_client, netf_rq_lun, msg_len,
+					 msg + SMBUS_MSG_IDX_OFFSET);
+	return ret < 0 ? ret : count;
 }
 
 static __poll_t ipmb_poll(struct file *file, poll_table *wait)
-- 
2.29.2

