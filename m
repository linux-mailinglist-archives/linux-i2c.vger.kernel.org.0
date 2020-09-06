Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD94A25EFDF
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgIFSzS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbgIFSvy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE15BC061798;
        Sun,  6 Sep 2020 11:51:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so13532606ljg.9;
        Sun, 06 Sep 2020 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7NSInBuxotINC941UeDn2216cD7xmvrT+jaeIZ6I2hk=;
        b=Va1dAOsXh2MVeYnwcQMKd6alv2W19Jzlt7mRXvqMOxqJzVw9wPVR/Tq7Pvi6Zg/HVw
         usJgueYeJ6fws9rEMcIciDf2njWQcF9qo9z3qUgp3OYeD3fmPaXqEx/fwCOZoT9629yu
         sx1F0Z+6mnTbCFR3pnCphF/NnS01fJyema5xo3n7IMKp2vUjKBAwdTh0TrqraSG86630
         QOQyt0TIzW3gbcNzYBobywiL9ie+thbrkBDzoK4YLwgaX3ynL9hX3Lb1AqmhXHHvppJ0
         PFh+2H6HT43u344soEitkMCfRpvUhszJYDJzu3mk2/SchLqL937ZhTCkZEmZFmk22+1U
         XLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7NSInBuxotINC941UeDn2216cD7xmvrT+jaeIZ6I2hk=;
        b=PyoEEWAWDnkJF0ywqv2Z9p2ktT4rAhrGUo3sKWwGQTOwnBVB6KrV8I+og6W9xibeJ+
         Qo9U4dup1CbT8Tc9qp5jiB/B/g8tXc9RBK8Ua1bPZeXxBrkQevomhnRurVchSwJvLlMy
         1sNARTdpK0A4owQp++gBp5XQ6I34zMjZtSGvFisWaMdyiEs9dvzec5wArbwcDMryM2SO
         zNUJVH4nAcPujKtXOL/wyBXBamQOEN5znDpEDwE8ZIjhRucxDaQ8bYFi71ssErYLn5SQ
         L+aKZHuN/FYNuXTDLmwnznm9wbjdYA31bT0gDVkKvSTinf0MPe8HAFrW84cRgtT2IHlh
         S63w==
X-Gm-Message-State: AOAM530k8NokNpUVJJ0Ivt5CHQ7Eh2vOershehfxw3XexYD18o72mZAf
        KcMlkwg0N9lkiqA8k2vW0txnUtwtVLY=
X-Google-Smtp-Source: ABdhPJyImD/GLqdNDV59eQOqSJNsz8bIpP3mVehkccRJ6kry3uXHW1sntb3Pa4wUlD5nTrIj78vsMQ==
X-Received: by 2002:a2e:8850:: with SMTP id z16mr8409524ljj.184.1599418312438;
        Sun, 06 Sep 2020 11:51:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.51
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
Subject: [PATCH v5 15/36] i2c: tegra: Remove outdated barrier()
Date:   Sun,  6 Sep 2020 21:50:18 +0300
Message-Id: <20200906185039.22700-16-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The barrier() was intended to reduce possibility of racing with the
interrupt handler, but driver's code evolved significantly and today's
driver enables interrupt only when it waits for completion notification.
Hence barrier() has no good use anymore, let's remove it.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6597cbe0a059..89b409130e05 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -589,18 +589,17 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 			words_to_transfer = tx_fifo_avail;
 
 		/*
-		 * Update state before writing to FIFO.  If this casues us
-		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
-		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
-		 * not maskable).  We need to make sure that the isr sees
-		 * buf_remaining as 0 and doesn't call us back re-entrantly.
+		 * Update state before writing to FIFO.  Note that this may
+		 * cause us to finish writing all bytes (AKA buf_remaining
+		 * goes to 0), hence we have a potential for an interrupt
+		 * (PACKET_XFER_COMPLETE is not maskable), but GIC interrupt
+		 * is disabled at this point.
 		 */
 		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
 		tx_fifo_avail -= words_to_transfer;
 		i2c_dev->msg_buf_remaining = buf_remaining;
 		i2c_dev->msg_buf = buf +
 			words_to_transfer * BYTES_PER_FIFO_WORD;
-		barrier();
 
 		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
@@ -621,10 +620,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
-		/* Again update before writing to FIFO to make sure isr sees. */
 		i2c_dev->msg_buf_remaining = 0;
 		i2c_dev->msg_buf = NULL;
-		barrier();
 
 		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
 	}
-- 
2.27.0

