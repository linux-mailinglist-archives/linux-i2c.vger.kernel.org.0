Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4BD260871
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgIHCPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556A6C0617A0;
        Mon,  7 Sep 2020 19:11:55 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so18046246ljc.3;
        Mon, 07 Sep 2020 19:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5uWg/frcUGv1irMtVYv3F8vtSyCUVHwjLNZ6tfcNU5A=;
        b=p3D4215jRG/tdfVSF9+1z7MKU38MUW5Qr/3WVuAazJwjltPg3lKB0mubI7m/07TEGI
         Rm2KEZBxxg+4kFr8OjFAsRv37PwJM6G7sCXVX04S3v27qD1BsgyU3ZK/aIZuxzl0fplp
         +I4bu78WIn/ug6WyKbyfKLNQu8jE6QWqlv0XLmNhL7fNuEoPHbDs9NEWkqLZFg9Ns6JR
         8CiRWUJUAF3pAQM57HlTqBahZ7aKMLF+uSWsRPmvxAKJSAhTZunTPQQBejbtYVZ/EifU
         rTCV8OoWXrAwzP+xYwRuQqewMfDpZ8TeCJfyIn5LoWMgeiSgZFMcF7p94VRv4iDiH+Bk
         hhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5uWg/frcUGv1irMtVYv3F8vtSyCUVHwjLNZ6tfcNU5A=;
        b=j8bJO1nbD4WmNUbn3u6Wd/0cdYH9zyStP8+y/aBwsh650kI7Ut/GVQCiwXdx+hAG6H
         s/smau9dflLC4nNlZFKLhIbYwTtqaAeqZ2tn+Ns46/J+tKT72T2X+ZRjGeScdaE3fANs
         dXm1z8AdMDaxDbzaWu3beIENSM5cxDabXsLlCwGGuqVaFkR9ktb59lHR1WYDAesqCelA
         yT1M2XPwCjWS3O3WnAuDDXE4X71OuhPLTNpNSy95H8pK4+6GMMSxfTqI/vmt9iraV8r3
         WmMNI5AVjH13XDbuBOrFnQbH/UiiAVic1DpwuDuK9k1YTJd6webuCx4k5Zhi1+/IbJRm
         dweA==
X-Gm-Message-State: AOAM533/7H8v4LmvmKSvEueZ3WCxdlwIVlmmMe38jglUVm6GzxOud/fr
        SvedOlWhzjqPGQwXD7yvkJk=
X-Google-Smtp-Source: ABdhPJxAZtjsFzHZ4LtBzLFh11fd2Mzv3GVSw9yDE+gA8B2XoSQ3dgwHGwpdR8Qo2/QISOW+zPqLPw==
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr1692959ljj.296.1599531113819;
        Mon, 07 Sep 2020 19:11:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 20/35] i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
Date:   Tue,  8 Sep 2020 05:10:06 +0300
Message-Id: <20200908021021.9123-21-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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
index 4e8514696b0c..e94da14d36e2 100644
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

