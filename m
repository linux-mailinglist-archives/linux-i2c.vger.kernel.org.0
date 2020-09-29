Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D354F27DBD0
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbgI2WV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbgI2WU5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:57 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F39C0613D0;
        Tue, 29 Sep 2020 15:20:57 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m5so7430377lfp.7;
        Tue, 29 Sep 2020 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Psswkdla6eACQrD3i47Mp+MSOnvDclsKLFB9OO1v0TA=;
        b=fLmexEW0+D0nOEpWT1NRMuSW7qbrRh1EN0xrXY1flz8q7wTaDjsHxg1/7fFnJ0Q1p+
         hHDyWdc22gLH9jyazAZF3WAFWg0Z0veG/RGt9C5L2uj5+YMNdD8HIYYH0q9n8bS29OPi
         lI5ifYdUZJFfCs9wpLAMOxye/rZQ4+P/aCNWNZ+mxqjIPEZcXONHeB7X9/pxy3wB8Jcl
         LGUDEcwj6sbOW94JTzqvPtERq3kiZvYHrEbOl++DIa1+sWinb4rOXBOSkwYtO1A7B3LZ
         cbrVFkFtnqOBZQ8MiA5KsKOwpP4hUbkm74rBDfifSwk5XFiw3cLKE+H8QTjdAFFTsfJ0
         mzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Psswkdla6eACQrD3i47Mp+MSOnvDclsKLFB9OO1v0TA=;
        b=oOeF419s4feBoRcUSHV3Ul+K/w8X8mbnvYJrKgCND2aXGsd8OjGMfLmQt/5IgOdquq
         rJV2kndHk4PABK++Mzq6u/zR33YT0KxT/VER0dvHoDoGqdTCklrx2gbHtrQEnSTdTkLe
         PK7sOUjSr58oR89djmrwinojYcu/HhMKd7VO1iW0ulu7AAtGxrdy+PmRXGrLD8ZKncbt
         ohdoL6dhpg6bX3YeF8443/hWeaQX+pSd+uTJnFH6HI9Zm00Ce93+1bOEzmnNDFSA8zQJ
         utXHpVhaNVaM2ifWpAsKYWpUx7C5qjxlk4GQ5+S/KKI4o0BXZeBTJYScWAEe/Nd27/uc
         wAAQ==
X-Gm-Message-State: AOAM530fMRtMxmfEoIPZKqz09wUtEIIUM4z2kpvdUen0rsBKccb/DBCT
        kaRmxQMkaenn3tfR5+rjquc=
X-Google-Smtp-Source: ABdhPJwaxAaYytbX66UG3jhxbMaOW+K6UhSJrAeHt/G7RIE5wqpM/5ZLjyYJ+KOithvpbN+WCXCZRQ==
X-Received: by 2002:ac2:41d8:: with SMTP id d24mr1883280lfi.458.1601418055398;
        Tue, 29 Sep 2020 15:20:55 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 20/32] i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
Date:   Wed, 30 Sep 2020 01:19:03 +0300
Message-Id: <20200929221915.10979-21-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 79fa98423cae..eb62284e2293 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1120,7 +1120,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	size_t xfer_size;
 	u32 *buffer = NULL;
 	int err = 0;
-	bool dma;
 	u16 xfer_time = 100;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
@@ -1143,7 +1142,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-	dma = i2c_dev->is_curr_dma_xfer;
+
 	/*
 	 * Transfer time in mSec = Total bits / transfer rate
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
@@ -1153,7 +1152,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1181,13 +1180,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1207,13 +1206,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1233,7 +1232,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
-	if (!dma) {
+	if (!i2c_dev->is_curr_dma_xfer) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 		else if (i2c_dev->msg_buf_remaining)
@@ -1244,7 +1243,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
-- 
2.27.0

