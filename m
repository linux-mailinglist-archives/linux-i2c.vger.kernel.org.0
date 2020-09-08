Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D962622E8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgIHWmW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730111AbgIHWlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:08 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C3FC061799;
        Tue,  8 Sep 2020 15:40:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a15so1003388ljk.2;
        Tue, 08 Sep 2020 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=52FpCY19v8txNVEIA3tvXS78M6BS9WeMsOxp4mspQSw=;
        b=aql52p9iNKhvSMl82dfDyHZ2rhbVlh6n4zYpf90JB8J1HePXzT9kwXtMKsd2gCraxU
         bXJbtm7CbumdRk/3RCS6cuHCB+VjjX7Kf7KdXOX9DE1mgPs58M1zGJFy1u7wd8uXfYDI
         IttGjjnRQyZVv0+9vP0KYc2UQHW88lHTP+dEKcmeEOmk7+nsJpnA4qVbyIWJ6xiKrFQW
         K+D3jXOmr11MwVrfIvhArxBOaMdoXN0rSz7e2rrjlBQe3BYRQrjGitoNk9Rggx4JCQNI
         nPoaH5rbUXACAar8bSKT+uCbmq7y46P7MtdDdwmGq8TxUbL7lU9HTmQ+ZjkwbzkiRgat
         h4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52FpCY19v8txNVEIA3tvXS78M6BS9WeMsOxp4mspQSw=;
        b=qTC+Jzwp8sWWAt57i8lVaOHhsL01LSK31jPEVcRQOw6aTHyIMoqFzTnBI0TmVZQGYW
         qLevEpnF3zFBNanfsR29t1dhfYCIQEbc8sjw7/THtNFRELJJFm5SvsrbL116kyCJCP+l
         6yZRIY8IR5S+ABoEOa2Y8pdRtxSih6V0hsyaIQ/BHIyMkVvDi9B9Q7eq2s9E5SO4l5SF
         uj/katP0Ft3F+/Yb8ClzkGjcxp5GoajHSBjNDiZvZ3vRJfxSniA6xiLyjGnVeZGMra7H
         XOpXJDuB16P1UPNGc//kuESfKc7KMC21y5LJ0+w8exBblrOHI/+7wE44p+3ytl3F/EGp
         i1sw==
X-Gm-Message-State: AOAM532bI18P+HUjE4+LZRazj7hFpT++rFON1zrnoi0x4Fd2b1l2MwFw
        ktVBmmsyesl0kOx+d92fjlU=
X-Google-Smtp-Source: ABdhPJzWwQmS67ElTp2lV9Kz4kvfcMOxw8MOyLQYV/PDWhi42h9MB1/PCcFgDbCK7gvpUd5qtWdZGw==
X-Received: by 2002:a2e:3615:: with SMTP id d21mr368647lja.111.1599604854421;
        Tue, 08 Sep 2020 15:40:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 24/34] i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
Date:   Wed,  9 Sep 2020 01:39:56 +0300
Message-Id: <20200908224006.25636-25-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The code related to packet header setting up is a bit messy and makes
tegra_i2c_xfer_msg() more difficult to read than it could be. Let's
factor the packet header setup from tegra_i2c_xfer_msg() into separate
function in order to make code easier to read and follow.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1ec2490d06ac..405b87e28a98 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1104,6 +1104,57 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1134,11 +1185,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1194,49 +1243,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

