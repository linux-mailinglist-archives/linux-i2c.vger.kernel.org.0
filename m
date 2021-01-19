Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9398F2FB99F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387587AbhASOgQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:16 -0500
Received: from www.zeus03.de ([194.117.254.33]:55106 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387712AbhASJkZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 04:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=7oj9WQno7QEpA1
        XamLc4MgaH1m7rUqRR3GpKdU/K1M0=; b=lFqM8BxbfRkKtAIH+OAQCIBqJ/edPp
        JDKwf35ERefl3U+wvK83fIYZpnHZyz/s20k7uUNgt28icomNL6aOPYiQYsqwm1s1
        bohjfIVCxb3R+hPN86P5QcokI9CG8yqb8p3Gkza8tfz+tcAnnLyUJR7ZYjy1yftS
        viVYfXxUrMUNU=
Received: (qmail 1003573 invoked from network); 19 Jan 2021 10:39:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jan 2021 10:39:21 +0100
X-UD-Smtp-Session: l3s3148p1@Gm/3nD258tkgAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ipmi: remove open coded version of SMBus block write
Date:   Tue, 19 Jan 2021 10:39:10 +0100
Message-Id: <20210119093912.1838-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
References: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
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

Changes since RFC:
* don't use stack but kmemdup. No complaints from buildbots

 drivers/char/ipmi/ipmb_dev_int.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
index 382b28f1cf2f..49b8f22fdcf0 100644
--- a/drivers/char/ipmi/ipmb_dev_int.c
+++ b/drivers/char/ipmi/ipmb_dev_int.c
@@ -137,7 +137,7 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
 {
 	struct ipmb_dev *ipmb_dev = to_ipmb_dev(file);
 	u8 rq_sa, netf_rq_lun, msg_len;
-	union i2c_smbus_data data;
+	struct i2c_client *temp_client;
 	u8 msg[MAX_MSG_LEN];
 	ssize_t ret;
 
@@ -160,21 +160,21 @@ static ssize_t ipmb_write(struct file *file, const char __user *buf,
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
+	temp_client = kmemdup(ipmb_dev->client, sizeof(*temp_client), GFP_KERNEL);
+	if (!temp_client)
+		return -ENOMEM;
+
+	temp_client->addr = rq_sa;
 
-	data.block[0] = msg_len;
-	memcpy(&data.block[1], msg + SMBUS_MSG_IDX_OFFSET, msg_len);
-	ret = i2c_smbus_xfer(ipmb_dev->client->adapter, rq_sa,
-			     ipmb_dev->client->flags,
-			     I2C_SMBUS_WRITE, netf_rq_lun,
-			     I2C_SMBUS_BLOCK_DATA, &data);
+	ret = i2c_smbus_write_block_data(temp_client, netf_rq_lun, msg_len,
+					 msg + SMBUS_MSG_IDX_OFFSET);
+	kfree(temp_client);
 
-	return ret ? : count;
+	return ret < 0 ? ret : count;
 }
 
 static __poll_t ipmb_poll(struct file *file, poll_table *wait)
-- 
2.29.2

