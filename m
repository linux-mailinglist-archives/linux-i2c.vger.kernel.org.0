Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9959D25B7DA
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgICAyw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgICAyI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:08 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF59FC06125E;
        Wed,  2 Sep 2020 17:54:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s205so1405526lja.7;
        Wed, 02 Sep 2020 17:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLpQRqPzk9N2TpKBOdealB/MeXoazXs8WaVdBhbbscE=;
        b=PPfLR62AAtutqD2+OQLwfYrIhIX09bVxSKRgqnxnQokT521uFlcMMSBwRsaHCXGEKN
         c2k6LCFzH+KxzsDTmRr+mXQHlcf1XZNvHuc1UJjSjwvzUYAjvlQ07UDUKRfCfzU/8bhd
         q9KID7UeLMbSzfoBeo8pjHKIw95TkG8sbs3xocLvnxlHqqosJgHFt+F5u3/WE0XbyX8y
         /zUCOpEWPXGD/n8XUOTQ/6S1vWduKAt8eEbGJ8XOkIlN2uBuiyp7kuN+ex02a/KDABtY
         x2wS3i+3te+/f1xKRBXN/HUMfV7D02DTIgcXi3lqx9tUItK6T/PLT4uB+Q7XzaPVxSP6
         5jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLpQRqPzk9N2TpKBOdealB/MeXoazXs8WaVdBhbbscE=;
        b=Grt+OHDH8wE+MxKnF5GTR6MCEIus58CJMbRua+ISia3qta8Y5Z/KBrNwXmAZzOBcEE
         qBTmMnU5ziklz5Z0Yy9/HaVHMxRk2WE9wC4nqJgXPyq5b1WHUtMAIv/tjFZQhdRy7YER
         CMz9UABzgOrHLtipABniBiYIMiIMRV2dBwrjg3AogiKFhsz8dUj3/GQnWaMCsV/bKFkI
         nD0rgXAeZDUJMVgot7XFk9nTX+0tqj/K7CdrP/ZtsyIDvHRIZu0+tsTH/HblNCohpgUn
         vANpefHj+rLlKyZfJTdh4EPzre+7Bn9LSrDkW1QAneVxx7tHiEl6RBvPpCr3iAawKfvP
         6uXg==
X-Gm-Message-State: AOAM530vnu3Uwa/eHjGx+fZ+ruKeY6aaxm9Zt4gxOQbQcEGqoXiZL9jk
        g1s9DSmlnSP8BqYTw/UvWek=
X-Google-Smtp-Source: ABdhPJyKCdzbL1kNpyXpbqKSOSrKYVgh2UgREBIv0GPFH5SaryIRilT+G0oG0pXho+RbrEO6CAYjhg==
X-Received: by 2002:a2e:b4e5:: with SMTP id s5mr249876ljm.153.1599094445410;
        Wed, 02 Sep 2020 17:54:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:04 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/22] i2c: tegra: Clean up whitespaces and newlines
Date:   Thu,  3 Sep 2020 03:52:53 +0300
Message-Id: <20200903005300.7894-16-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Clean up couple places in the code by removing unnecessary and adding
necessary whitespaces / newlines.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7c5931639d42..ed8f2a7c2804 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1223,9 +1223,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
+
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
+
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 	dma = i2c_dev->is_curr_dma_xfer;
 	/*
@@ -1233,16 +1235,18 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
-					i2c_dev->bus_clk_rate);
+				       i2c_dev->bus_clk_rate);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
+
 	if (dma) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
+
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err) {
 				dev_err(i2c_dev->dev,
@@ -1264,32 +1268,39 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				   PACKET_HEADER0_PROTOCOL_I2C) |
 			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
 			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
+
 	if (dma && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
 	packet_header = msg->len - 1;
+
 	if (dma && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
 	packet_header = I2C_HEADER_IE_ENABLE;
+
 	if (end_state == MSG_END_CONTINUE)
 		packet_header |= I2C_HEADER_CONTINUE_XFER;
 	else if (end_state == MSG_END_REPEAT_START)
 		packet_header |= I2C_HEADER_REPEAT_START;
+
 	if (msg->flags & I2C_M_TEN) {
 		packet_header |= msg->addr;
 		packet_header |= I2C_HEADER_10BIT_ADDR;
 	} else {
 		packet_header |= msg->addr << I2C_HEADER_SLAVE_ADDR_SHIFT;
 	}
+
 	if (msg->flags & I2C_M_IGNORE_NAK)
 		packet_header |= I2C_HEADER_CONT_ON_NAK;
+
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
+
 	if (dma && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
@@ -1298,10 +1309,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (!i2c_dev->msg_read) {
 		if (dma) {
 			memcpy(buffer, msg->buf, msg->len);
+
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
 						   xfer_size,
 						   DMA_TO_DEVICE);
+
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err) {
 				dev_err(i2c_dev->dev,
@@ -1315,6 +1328,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
+
 	if (!dma) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
@@ -1355,8 +1369,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						i2c_dev->dma_phys,
 						xfer_size,
 						DMA_FROM_DEVICE);
-			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
-			       msg->len);
+
+			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg->len);
 		}
 	}
 
@@ -1969,15 +1983,14 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 };
 
 static struct platform_driver tegra_i2c_driver = {
-	.probe   = tegra_i2c_probe,
-	.remove  = tegra_i2c_remove,
-	.driver  = {
-		.name  = "tegra-i2c",
+	.probe = tegra_i2c_probe,
+	.remove = tegra_i2c_remove,
+	.driver = {
+		.name = "tegra-i2c",
 		.of_match_table = tegra_i2c_of_match,
-		.pm    = &tegra_i2c_pm,
+		.pm = &tegra_i2c_pm,
 	},
 };
-
 module_platform_driver(tegra_i2c_driver);
 
 MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
-- 
2.27.0

