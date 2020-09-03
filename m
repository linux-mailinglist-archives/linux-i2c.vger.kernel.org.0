Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F98C25B7CF
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgICAyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbgICAyL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:11 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20E7C061247;
        Wed,  2 Sep 2020 17:54:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v23so1452189ljd.1;
        Wed, 02 Sep 2020 17:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffxkDcb0ZRAwotmKnZT62ghyayijcq6vK1tgkexB5/0=;
        b=Vy3uEgwn4eCP8ThxS22P4LBXaHeN/A8sW90tcKQ/QlYcJ8LIjscVNgLHIiMcDTlF6r
         bUZvluoq8BD8sAh6W0yegQc9/PAuA+PrRpXkeCcLjJ6M7pR9ulmcTdHqVsKfAxKyEkCN
         Sw0LNgfy/e8Q2nLpqYc5GZF152Xj/BODCJqcxxvsJNFbimAm1nSyFzsDURIy1/lfDbjs
         y95xGt0zVwCc316o8zGbto0ZA0G3iMmfJH05YIUyE7wcjErTPNhr3KicgSc/eayVcKFS
         qBG9p6NfO+D5k+R/ZGHWUYt8ZSINpBUBgyoiOwkTlEtaPtJPqphrAHUOPEKYzamXu1H3
         wgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffxkDcb0ZRAwotmKnZT62ghyayijcq6vK1tgkexB5/0=;
        b=Xh9UCe/U+ycsVSwoHys1zqSKCC2CKwLD3Gi1Oe8wryWmwSFPbwfaRguYPU3c99dUG+
         g12twrbCp4CKDc9913kFm7Gek8c5GiEhL78Emz7aDx6LffLo5E6WooswbU09T5pUeo25
         TGiESRTScGsm7il8GYSHmMGikErGoRFUnCsFJ52g74UO/bASvL5OiqNmIuMFJUQj5lIj
         frxej4DS0TL67Ei52/dv5LUzRoW0ibxKc0CHm5EuesBrv6+8f4bAkqRKNPlK74DJcsYI
         5eYwBXtLxzjTcxU0sd2J1XwbrIfL85Db3UEYfC6f94i7zp5n2TJIbPPAMuOUmNO76V/L
         0vXA==
X-Gm-Message-State: AOAM5326PPoteGPgLdFmIqzuUYN/pSx1mX4X8V6pRx/S62F39u6tn3rt
        PiVs2qOiJ72dJ2HKfzNzhs4=
X-Google-Smtp-Source: ABdhPJxHmDBc8iqU4aL437RK5b3JInpNNXT2vB2j/uebw7U6i/j0tENRGyzWzlgP3s1CGxaalZjvnA==
X-Received: by 2002:a2e:b0cb:: with SMTP id g11mr276117ljl.223.1599094449204;
        Wed, 02 Sep 2020 17:54:09 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:08 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/22] i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
Date:   Thu,  3 Sep 2020 03:52:57 +0300
Message-Id: <20200903005300.7894-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The code related to packet header setting up is a bit messy and makes
tegra_i2c_xfer_msg() more difficult to read than it could be. Let's
factor the packet header setup from tegra_i2c_xfer_msg() to clean up
code a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 46 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f30ac45c2bfd..d39d66621199 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1106,6 +1106,57 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1137,9 +1188,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      enum msg_end_type end_state)
 {
 	unsigned long time_left, xfer_time = 100;
-	u32 packet_header, int_mask;
-	u32 *buffer = NULL;
 	size_t xfer_size;
+	u32 int_mask;
 	bool dma;
 	int err;
 
@@ -1195,56 +1245,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
-
-	if (dma && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
-
-	packet_header = msg->len - 1;
-
-	if (dma && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
-
-	packet_header = I2C_HEADER_IE_ENABLE;
-
-	if (end_state == MSG_END_CONTINUE)
-		packet_header |= I2C_HEADER_CONTINUE_XFER;
-	else if (end_state == MSG_END_REPEAT_START)
-		packet_header |= I2C_HEADER_REPEAT_START;
-
-	if (msg->flags & I2C_M_TEN) {
-		packet_header |= msg->addr;
-		packet_header |= I2C_HEADER_10BIT_ADDR;
-	} else {
-		packet_header |= msg->addr << I2C_HEADER_SLAVE_ADDR_SHIFT;
-	}
-
-	if (msg->flags & I2C_M_IGNORE_NAK)
-		packet_header |= I2C_HEADER_CONT_ON_NAK;
-
-	if (msg->flags & I2C_M_RD)
-		packet_header |= I2C_HEADER_READ;
-
-	if (dma && !i2c_dev->msg_read)
-		*buffer++ = packet_header;
-	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
 
 	if (!i2c_dev->msg_read) {
 		if (dma) {
-			memcpy(buffer, msg->buf, msg->len);
+			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);
 
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
-- 
2.27.0

