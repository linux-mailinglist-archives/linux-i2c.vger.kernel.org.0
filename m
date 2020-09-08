Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EEF26230C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbgIHWnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730067AbgIHWky (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4BFC061795;
        Tue,  8 Sep 2020 15:40:52 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id r24so1001184ljm.3;
        Tue, 08 Sep 2020 15:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G5sX0D1OOGjolxT/VG080HLXywGd79i8TKu1JUMhCA8=;
        b=XkRAd9F1VgWPvS2/GW8/trcBf50+hZYFTSm8Rirs/eHspSdeM+3DNhDf9Xyvr5WWIm
         IHspGfSm5rb52b34Jv8EReHJVpr7dE9/9PsT08RkcXxDgjDu5S/LllcioSJDZXTgOgzR
         SiztacyZvZvctlt+8ePCErl/umZaF42qOCfwph+stdHj9A9X/z4DAsWSi+xwQ+kgEKTf
         +YV50rXa3S8kRlCq0uxpMzfGYSkGCbV40U1W2pZ2bPPDgppCB3paJHIftQsm6WJU6XB9
         dm0Me9nlDyL1oMIKBgGOULhbWaKsAXXUmNlYrgnBvV67iFuPMA8UBX6rNzUWlBs/w/Hk
         6Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G5sX0D1OOGjolxT/VG080HLXywGd79i8TKu1JUMhCA8=;
        b=m8HsFJQf5JcCLxBCST7tblq823Z7A4Mu6aiFu2AnD0KUBmnVe7hFkJvUjMCsLXeWqw
         OLXcFwU4VS+8TZA4R2ZvBn6bsG1nnVYEGzAVtI14CykBE3Cu8J1pb3i0yYvg0uB93WpV
         5KvNvtIcSV7TBntkMd6iUOknxuYpBZo3txdn27H2Dz4MdwuDJk2bIdy9pqTRTtpLluCn
         smrX4NFJIhc/L8LkfDOVlbf4JUAb5ukfL/MnATkuMxc2LiynNLD9y66Lpto0ilAqtvZ2
         isCXtUC2uRqUi8BgNpe8dz5FnPi8qeRASSt1VXkHamZg+HscFHus2vbqk/43gUJFKYWG
         9W4Q==
X-Gm-Message-State: AOAM530kYSLdQuHLKfGBFpvvxctKGxx9q/Z+44jk5F1Ca0/asO2O4BHn
        98mDKvYQj27IDnRFrpmERZg=
X-Google-Smtp-Source: ABdhPJyJfoW9fgynm/YfnI2mSrvSutXG4zj6VNYGsqXkOWGyMyudaHftLwhgznSHQcFHK2VjcxV7CA==
X-Received: by 2002:a05:651c:554:: with SMTP id q20mr378888ljp.348.1599604850960;
        Tue, 08 Sep 2020 15:40:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 20/34] i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
Date:   Wed,  9 Sep 2020 01:39:52 +0300
Message-Id: <20200908224006.25636-21-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
index 18968302457f..76d3a05b10fc 100644
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

