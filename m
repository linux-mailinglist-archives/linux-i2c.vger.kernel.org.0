Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055AE25B7CA
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgICAyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbgICAyM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:12 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03E3C061251;
        Wed,  2 Sep 2020 17:54:11 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u4so535290ljd.10;
        Wed, 02 Sep 2020 17:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YP8LEZmoEtAq6bYClWtgAF6gakcyPfLGVhCztT3yQBg=;
        b=kTM1C2IrJBB4i6yqdYVQZI0ZfWkDZLzK7bnKhJ3W4lSHm1rr+SWZoLaa0nRbA2CpuD
         ZaJZPxWfoyZ1BpIOUH7O7vqoD3EnIl6WkvrEHI6uO9X01kzEO4eq97ZSwmTpMcnFVYmx
         24R+Ws0YTgLuFkPwjeCVUO7RcNHOTakt8cSxgD0a03Ezh/mZ3WSGJyzagdRYpJW3lbNY
         vn1fdoaRemD0uYwVk144dZz89hEDBjc1a6wIf4hzNQErLy/ey1pRK+UTl0zOUVgEuoA7
         iq6ANBqQhKH3f/5AwicLKsukwA4WmNho180gwei3HgSWxj3CayO9K0/HUbamqCxxuTZ+
         1BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YP8LEZmoEtAq6bYClWtgAF6gakcyPfLGVhCztT3yQBg=;
        b=tSHHCvbH4TDtfYqluYq3uTC1AKFA8DEnNoed4ZEWMLvZdSm7TMifsNGCBB181ev54Y
         GA8aRT6REaEjbDAqxUcsSzgBpq8zOWYgfOGpi3HsiYxLTxJ+1HCrUiv9Abf+VNW6f2nY
         535Rd+D0byif3FTj7GmTtVeHQvsuVPiOZjCjhv+QCxLWkX/Pho9kkv8sJN5veb5P8BH8
         UJ0rreSQJD8xj/O1E8i9aAsefZViBhCgkA+q6YQqHfmwu4ya9d3RlJLQV4Fq3DlOcQWN
         1Wzu1MWXjDaVFoSCk7iZNcOi0cezPnYaiQ/LJdA/T3Z82y4ZwI3eCrKwmlfGoPgM4nH9
         Jlaw==
X-Gm-Message-State: AOAM533w9LxhSARPnkcBYpi8AlpZJAwPF0CjXsl99jPrXBXtbhpXOUz0
        5usNHOqY0qXo3geaToNsGR1Mm/ZFfCk=
X-Google-Smtp-Source: ABdhPJwyjz9GUnFxxC2+Ge5hnowrjhjEXtRyKYY2vq9L9crvnyALo+FzxbpoLPFLRFYYIPKqTyWURQ==
X-Received: by 2002:a2e:92cd:: with SMTP id k13mr254802ljh.441.1599094450204;
        Wed, 02 Sep 2020 17:54:10 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/22] i2c: tegra: Remove "dma" variable
Date:   Thu,  3 Sep 2020 03:52:58 +0300
Message-Id: <20200903005300.7894-21-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d39d66621199..79caf87bb4c0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1190,7 +1190,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	unsigned long time_left, xfer_time = 100;
 	size_t xfer_size;
 	u32 int_mask;
-	bool dma;
 	int err;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
@@ -1215,7 +1214,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				    !i2c_dev->is_curr_atomic_xfer;
 
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-	dma = i2c_dev->is_curr_dma_xfer;
+
 	/*
 	 * Transfer time in mSec = Total bits / transfer rate
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
@@ -1226,7 +1225,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
 
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1251,7 +1250,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
 
 	if (!i2c_dev->msg_read) {
-		if (dma) {
+		if (i2c_dev->is_curr_dma_xfer) {
 			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);
 
 			dma_sync_single_for_device(i2c_dev->dev,
@@ -1273,7 +1272,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
 
-	if (!dma) {
+	if (!i2c_dev->is_curr_dma_xfer) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 		else if (i2c_dev->msg_buf_remaining)
@@ -1284,7 +1283,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	if (dma) {
+	if (i2c_dev->is_curr_dma_xfer) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
 						      &i2c_dev->dma_complete,
 						      xfer_time);
-- 
2.27.0

