Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D180325EFD7
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbgIFSzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729183AbgIFSvz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:55 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD29FC061574;
        Sun,  6 Sep 2020 11:51:54 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n25so2645670ljj.4;
        Sun, 06 Sep 2020 11:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H7SmJCneBY+wUdrYlbmHAackmFugASzUQLK8rfQhPKw=;
        b=ZOo1+RbovB5PRvKxwMDQxVVenNwTgZe6NpHdPwE7cpJhxQ2/ha4qvVCdyoB0pz6+m7
         9BiW80q3njhPPwjAdVI4HEVzUEA5Sn0P7gueAzX64Bnlzelzo0aqNE8zA3vv5svCzHCT
         c3Hefgmo5LRoEDxIGmonryHim5fq3V5+JMQbO1xFJoiaYM0/pZb6XwuPbl5Ctbw2o1IN
         3dWYBF8QpX42rUaw5ljwRWRsk+bgTnqzDRbm9RVodoh5lwSt0N2RIp5bajHD8pZNP2jN
         Fa8RxEcJ8sjIH6qaFrp5Tv1+3PJ9jLEEaZlwHY9oZr7k0+qszbLHRkrLaKsThjOOLce3
         VpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H7SmJCneBY+wUdrYlbmHAackmFugASzUQLK8rfQhPKw=;
        b=AE5MiB/SO2h2J1+6R1+qCnR4YaZzeiufQrmNC2aw3oX2UB/NRIJw2nN1gy4Lwejs1e
         UZJ2EnqkN6YA3laLW8HQzY4S63RNPGTcyuYmZLnjEwphOlX8RL+HeCVWNhHsUpJiHHiQ
         jr0XJaL5bCU1ihk/A9ZGUAz0FYCQhXW6lsHUlD66+ozKzo1306Y3fDMGF7uOMG0Xch5d
         qZjt8vP0uDfGCs0yTI9Kb2AAsUy+CUNu0s+JX/NCQrmRwOdcJxeABT/o2WRvYcEpF3Gy
         rbU5VbDJmB7NI/SoSzQsrgGDj3ouly8XQ/yvYnS69+oUJn9rBZhSGaSu5hNkEoSvg5hO
         nNLA==
X-Gm-Message-State: AOAM532cZLvndCYmplKTyxJuS2Sd2Fg2nssQ6bKuXl20YOkGffMYvctL
        mPOt6mwSpeOb6bNcQeEODdw=
X-Google-Smtp-Source: ABdhPJy64EIs1jri+cw6l5A3XLWahH8iIss9WZFyAAClpeH32fUpd0nrkYDicKrTbM20sAsukuLf4g==
X-Received: by 2002:a2e:8693:: with SMTP id l19mr8428527lji.25.1599418313275;
        Sun, 06 Sep 2020 11:51:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/36] i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
Date:   Sun,  6 Sep 2020 21:50:19 +0300
Message-Id: <20200906185039.22700-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
regards to readability and generation of the code.

Besides readability, it's also not very nice that the is_curr_dma_xfer
is initialized in tegra_i2c_xfer_msg() and then could be overridden by
tegra_i2c_config_fifo_trig(). In a result, the "dma" variable creates
slight confusion since it's not instantly obvious why it's set after
tegra_i2c_config_fifo_trig().

Hence should be better to have the variable removed. This makes code
more consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 89b409130e05..95ee082fe3d8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1156,7 +1156,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	size_t xfer_size;
 	u32 *buffer = NULL;
 	int err = 0;
-	bool dma;
 	u16 xfer_time = 100;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
@@ -1179,7 +1178,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-	dma = i2c_dev->is_curr_dma_xfer;
+
 	/*
 	 * Transfer time in mSec = Total bits / transfer rate
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
@@ -1189,7 +1188,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1217,13 +1216,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				   PACKET_HEADER0_PROTOCOL_I2C) |
 			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
 			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
-	if (dma && !i2c_dev->msg_read)
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
 	packet_header = msg->len - 1;
-	if (dma && !i2c_dev->msg_read)
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
@@ -1243,13 +1242,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		packet_header |= I2C_HEADER_CONT_ON_NAK;
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
-	if (dma && !i2c_dev->msg_read)
+	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
 		*buffer++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
 	if (!i2c_dev->msg_read) {
-		if (dma) {
+		if (i2c_dev->is_curr_dma_xfer) {
 			memcpy(buffer, msg->buf, msg->len);
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1269,7 +1268,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
-	if (!dma) {
+	if (!i2c_dev->is_curr_dma_xfer) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 		else if (i2c_dev->msg_buf_remaining)
@@ -1280,7 +1279,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
-- 
2.27.0

