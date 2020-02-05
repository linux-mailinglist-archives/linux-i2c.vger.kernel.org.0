Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C38D1538F9
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2020 20:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgBETXE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Feb 2020 14:23:04 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35282 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbgBETXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Feb 2020 14:23:04 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so1286216plt.2
        for <linux-i2c@vger.kernel.org>; Wed, 05 Feb 2020 11:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AB0mPtmmhd4uES+XsmfG8LIdv1jJKRW24bbomYl8aD8=;
        b=IR4EUOI0PS96fst6PUpnxAAEiyW5vWCWKy8OEOWvsK8wU19s5K8fn5ulk+vD0NiP0d
         XdiYMotREZ5jrLS4LMRoc/UwPGFNnTSNuez1UQq1FQVHSm9jTg2DDBA3LjitJHnA/E11
         oQUQusgGsNiqFFOm9vX+YkH3CPwHT6d/oXFig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AB0mPtmmhd4uES+XsmfG8LIdv1jJKRW24bbomYl8aD8=;
        b=s4yy2D2v6VSNHtVelXkRMu1nyDeVkIu7plUymJbhszHOFwEkmXuR5qf9DhiGotcgXN
         DGyMBN0VaRpEHbjTRsBBJwNHhF61nlSG+pITcOgbfe3XaJyATNiJUKNywE5GlbstOlDj
         38BaFw/Tv5uC4bkZO5t+R0MDDGn/m5Yq9lzPaQ+FzynzgFErxDGoLrTDvrp5Exr4Ms4D
         gaNJunXzDUYW+58Bje8QLgwSlLtIE5rccBu+6i0ijSBqYCxekhuNX+OUc7Sknb2gAZvV
         RlYUVhdA+dLklc7KVzH98amDocclmR5lmR9cwNKUoVE/ijhsDlqeenK5Myxl7ostis0f
         aDMA==
X-Gm-Message-State: APjAAAWSPxnZ1GP1k9JZx8V0vwv0RRdOCpfE+J22ybhSvC5FLija1s5A
        3lkcay1L3RCy4kgn31UGxBFm9Kz2OK4=
X-Google-Smtp-Source: APXvYqyLLZwJORlgU1YWy2dv2sz3baiBjgGjcqCX3S/3kK7QyuWIeJag6P/sTJgjw9LeLvhQHH0gQA==
X-Received: by 2002:a17:902:b190:: with SMTP id s16mr33845395plr.299.1580930583956;
        Wed, 05 Feb 2020 11:23:03 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id c6sm535886pgk.78.2020.02.05.11.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 11:23:03 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS)
Subject: [PATCH v2 16/17] i2c: cros-ec-tunnel: Use cros_ec_cmd()
Date:   Wed,  5 Feb 2020 11:22:51 -0800
Message-Id: <20200205192253.187649-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace cros_ec_cmd_xfer_status() calls with the new function
cros_ec_cmd() which takes care of the EC message struct setup and
subsequent cleanup (which is a common pattern among users of
cros_ec_cmd_xfer_status).

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- Updated to use new function name and parameter list.

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 958161c71985d9..d0e0db2008d1ca 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -179,9 +179,8 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 	const u16 bus_num = bus->remote_bus;
 	int request_len;
 	int response_len;
-	int alloc_size;
 	int result;
-	struct cros_ec_command *msg;
+	void *ec_buf;
 
 	request_len = ec_i2c_count_message(i2c_msgs, num);
 	if (request_len < 0) {
@@ -196,36 +195,31 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 		return response_len;
 	}
 
-	alloc_size = max(request_len, response_len);
-	msg = kmalloc(sizeof(*msg) + alloc_size, GFP_KERNEL);
-	if (!msg)
+	ec_buf = kmalloc(max(request_len, response_len), GFP_KERNEL);
+	if (!ec_buf)
 		return -ENOMEM;
 
-	result = ec_i2c_construct_message(msg->data, i2c_msgs, num, bus_num);
+	result = ec_i2c_construct_message(ec_buf, i2c_msgs, num, bus_num);
 	if (result) {
 		dev_err(dev, "Error constructing EC i2c message %d\n", result);
 		goto exit;
 	}
 
-	msg->version = 0;
-	msg->command = EC_CMD_I2C_PASSTHRU;
-	msg->outsize = request_len;
-	msg->insize = response_len;
-
-	result = cros_ec_cmd_xfer_status(bus->ec, msg);
+	result = cros_ec_cmd(bus->ec, 0, EC_CMD_I2C_PASSTHRU, ec_buf,
+			     request_len, ec_buf, response_len, NULL);
 	if (result < 0) {
 		dev_err(dev, "Error transferring EC i2c message %d\n", result);
 		goto exit;
 	}
 
-	result = ec_i2c_parse_response(msg->data, i2c_msgs, &num);
+	result = ec_i2c_parse_response(ec_buf, i2c_msgs, &num);
 	if (result < 0)
 		goto exit;
 
 	/* Indicate success by saying how many messages were sent */
 	result = num;
 exit:
-	kfree(msg);
+	kfree(ec_buf);
 	return result;
 }
 
-- 
2.25.0.341.g760bfbb309-goog

