Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB8025EABD
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgIEUpn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728731AbgIEUmn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD28C061260;
        Sat,  5 Sep 2020 13:42:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so11783414ljk.8;
        Sat, 05 Sep 2020 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c/jcR8Z08hT5PqIYXl8lIkxNFUmRqcyDSJPn+KrgUCI=;
        b=vNwh5VtxtxG/GZCNqR/X4EhSLimNTYm6lmBra4iNxG/lz2ccp2Gg87Lao3pd0dmY6T
         gGlEho5jEbQcYxoFXQUFoUNBxqB6wDs0GsuPh606PU8nOwMq3VvsWPTCQI19zfXL0hOU
         8cFAbnZnZaqUdDF7eDXsMahM+LSlZ+TJ6xw5PJvra0tGp1jWXVKfx4x0HQfNVh5zDLPw
         G1MgjuSYiQ0XLb/IeqKPuIIOPnSHE4t+d9R7KAtDKWoRo15vMoeo3X6FsJnPM16vy/lV
         1nrbZXDizVh/cjMvbAVValotirSzh21Tk4i9nyn2DAU2P8mu9/sD2RpSa0Z13W5deF+B
         UVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c/jcR8Z08hT5PqIYXl8lIkxNFUmRqcyDSJPn+KrgUCI=;
        b=XreD/EcCANZXmY0AEtIuP/jDqIAJUZWjovNsSZd8fWR8bXVeKTaUiZ/d2nQLNJSHOQ
         YabfX4udD5KLoQYj+byJL9R4eJ7EI5XxojyBWLzvwGE4frvlnmysis0T5Jv5hGZDVtq/
         TvYLsYj9faZVYQK47gOqbnUhezk7OxwOW7Eu+BbroK+/It1sw0rRw2K0Sd1zyTo+PXiB
         HUffQogYHZmwRE51DyFaiyslumrfD4705Bc7HOKnBrJgxk/i5l7Cgtl4W5w1YQ5G+hkP
         guOeXWpZlAuP9ux35yhCWdRBZrhZq1N7oKZsifwfMZgWtGaDesNnn4sPDhSahHV0I/SL
         JkVQ==
X-Gm-Message-State: AOAM532w6FMdEJVeyIXu+dw29v+AfQIBtCQGyFiuGZAyOL9hvim8FgE8
        +RimNKf6XbnzJv3o7KCstRo=
X-Google-Smtp-Source: ABdhPJzRFClPKEG8YPl8Z1u25UzT2z0Np7Z843D0jikEOIRCVv4L/04oyrlSHx38JQozjEfIzC8ydw==
X-Received: by 2002:a2e:9910:: with SMTP id v16mr6247111lji.59.1599338559455;
        Sat, 05 Sep 2020 13:42:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/31] i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
Date:   Sat,  5 Sep 2020 23:41:36 +0300
Message-Id: <20200905204151.25343-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
regards to readability and generation of the code, hence let's remove it
to clean up code a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f69587ca163b..f52046593b8b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1155,7 +1155,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	size_t xfer_size;
 	u32 *buffer = NULL;
 	int err = 0;
-	bool dma;
 	u16 xfer_time = 100;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
@@ -1178,7 +1177,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-	dma = i2c_dev->is_curr_dma_xfer;
+
 	/*
 	 * Transfer time in mSec = Total bits / transfer rate
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
@@ -1188,7 +1187,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1216,13 +1215,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1242,13 +1241,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1268,7 +1267,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
-	if (!dma) {
+	if (!i2c_dev->is_curr_dma_xfer) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 		else if (i2c_dev->msg_buf_remaining)
@@ -1279,7 +1278,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
-- 
2.27.0

