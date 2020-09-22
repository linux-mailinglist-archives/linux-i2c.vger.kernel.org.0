Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D32274C90
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgIVWxC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgIVWxA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:53:00 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E454CC0613D6;
        Tue, 22 Sep 2020 15:52:53 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u8so19877007lff.1;
        Tue, 22 Sep 2020 15:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0qOI38gFvv2HK8YPxAWOsA5TBgVtvfU4EpNkagQuTNc=;
        b=RHTvF6+C1U/KjPPtoE7qJAQ6Yzhq4PTMWdMEtEvPbUGklUx9jIayy8uBSz466cDICh
         9llSmxCnO4LWViHpCeEnfCQ5qIyJZnOSyVvZIkEuCrW0cuH4a2qzdaCG7Vfr8YWZPo3M
         r1nxGP6paDbJTScMzRsRMUKiYNEzXFzW9m/MqWPVOUFw73/UkoGc4E802h3rbZUsP85c
         WMhnwwlKT1NWe+mOLEkRsq6vARsIO5h2/nnkRj4P2TB5pv7zWE5+3kdQf/Fu6Tn+WLyw
         WW2vTaLhEk2CSR95SroWxIVngoTKl4WSX3xM4Y5fGIYBQR7OZIfJPrmZHUa2R+bjOYVg
         W2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qOI38gFvv2HK8YPxAWOsA5TBgVtvfU4EpNkagQuTNc=;
        b=D74d6g4Xuwd1oe2zHYtWOiOegw5q+KnZ51YumdSbMp2ffC9VRtfHX81SeQngRbUqgt
         s3OCRBkzSdrcUWDGQ+a+HCS2QOfff1NMY9mDidZbIKvQBPTm3ayM7PACjxu2KJUys96Q
         GwMYCUH7uMRh38w4kQbWEInEoieuVKiOkb48ZE2xMC/RrPFUBfRP1SdYr2hRcDngSNhC
         yYek47UpTelv5t0TZv/N2h94/arLlyT/tnlnYx4stF9f2e6d9hyUWIHFzedQ6SAHQvVW
         39QmWWwFN9BjlGp35YRMe81eQ4DCtF15+okzT15L5V2wH9XdWyvs8KDwqi8iVa0Y+zgi
         5mrw==
X-Gm-Message-State: AOAM531qwtpH9odCcr9jfj3eqKq/sXOVe+HiFCSrHm9tKtmIY6sqEWsc
        64wQ3j6L03wpEea425fKgB8=
X-Google-Smtp-Source: ABdhPJxJaOg2D/HUgMe+oaNi1fEi9j4jjZwBo+IcE2xuR4HsvYZwbFiXkwYFDXifmiS78YDR9A2uIw==
X-Received: by 2002:a19:e602:: with SMTP id d2mr2234710lfh.536.1600815172329;
        Tue, 22 Sep 2020 15:52:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 23/32] i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
Date:   Wed, 23 Sep 2020 01:51:46 +0300
Message-Id: <20200922225155.10798-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The code related to packet header setting up is a bit messy and makes
tegra_i2c_xfer_msg() more difficult to read than it could be. Let's
factor the packet header setup from tegra_i2c_xfer_msg() into separate
function in order to make code easier to read and follow.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 95d257cbd800..a0de01d5cb1c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1105,6 +1105,57 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
+					 struct i2c_msg *msg,
+					 enum msg_end_type end_state)
+{
+	u32 *dma_buf = i2c_dev->dma_buf;
+	u32 packet_header;
+
+	packet_header = FIELD_PREP(PACKET_HEADER0_HEADER_SIZE, 0) |
+			FIELD_PREP(PACKET_HEADER0_PROTOCOL,
+				   PACKET_HEADER0_PROTOCOL_I2C) |
+			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
+			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
+
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+		*dma_buf++ = packet_header;
+	else
+		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+
+	packet_header = msg->len - 1;
+
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+		*dma_buf++ = packet_header;
+	else
+		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+
+	packet_header = I2C_HEADER_IE_ENABLE;
+
+	if (end_state == MSG_END_CONTINUE)
+		packet_header |= I2C_HEADER_CONTINUE_XFER;
+	else if (end_state == MSG_END_REPEAT_START)
+		packet_header |= I2C_HEADER_REPEAT_START;
+
+	if (msg->flags & I2C_M_TEN) {
+		packet_header |= msg->addr;
+		packet_header |= I2C_HEADER_10BIT_ADDR;
+	} else {
+		packet_header |= msg->addr << I2C_HEADER_SLAVE_ADDR_SHIFT;
+	}
+
+	if (msg->flags & I2C_M_IGNORE_NAK)
+		packet_header |= I2C_HEADER_CONT_ON_NAK;
+
+	if (msg->flags & I2C_M_RD)
+		packet_header |= I2C_HEADER_READ;
+
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+		*dma_buf++ = packet_header;
+	else
+		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+}
+
 static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 				   struct i2c_msg *msg)
 {
@@ -1135,11 +1186,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
 {
-	u32 packet_header;
 	u32 int_mask;
 	unsigned long time_left;
 	size_t xfer_size;
-	u32 *buffer = NULL;
 	int err = 0;
 	u16 xfer_time = 100;
 
@@ -1192,49 +1241,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						i2c_dev->dma_phys,
 						xfer_size,
 						DMA_TO_DEVICE);
-			buffer = i2c_dev->dma_buf;
 		}
 	}
 
-	packet_header = FIELD_PREP(PACKET_HEADER0_HEADER_SIZE, 0) |
-			FIELD_PREP(PACKET_HEADER0_PROTOCOL,
-				   PACKET_HEADER0_PROTOCOL_I2C) |
-			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
-			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
-
-	packet_header = msg->len - 1;
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
-
-	packet_header = I2C_HEADER_IE_ENABLE;
-	if (end_state == MSG_END_CONTINUE)
-		packet_header |= I2C_HEADER_CONTINUE_XFER;
-	else if (end_state == MSG_END_REPEAT_START)
-		packet_header |= I2C_HEADER_REPEAT_START;
-	if (msg->flags & I2C_M_TEN) {
-		packet_header |= msg->addr;
-		packet_header |= I2C_HEADER_10BIT_ADDR;
-	} else {
-		packet_header |= msg->addr << I2C_HEADER_SLAVE_ADDR_SHIFT;
-	}
-	if (msg->flags & I2C_M_IGNORE_NAK)
-		packet_header |= I2C_HEADER_CONT_ON_NAK;
-	if (msg->flags & I2C_M_RD)
-		packet_header |= I2C_HEADER_READ;
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
 
 	if (!i2c_dev->msg_read) {
 		if (i2c_dev->is_curr_dma_xfer) {
-			memcpy(buffer, msg->buf, msg->len);
+			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
 						   xfer_size,
-- 
2.27.0

