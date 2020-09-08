Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE73262317
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgIHWoG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730054AbgIHWku (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:50 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0847C061573;
        Tue,  8 Sep 2020 15:40:49 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y11so539405lfl.5;
        Tue, 08 Sep 2020 15:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e1fEwvYGVc4Rjygf6C1JwpQ8Ow8K6KfjGtqJJ79slO8=;
        b=Mlr6R/1l4hKnL+YI84D/CMKw3csSXxA5bp//v92tFjvz8zuOva72KP5A64ui7nvrD0
         uimCtB1InIu/44d8gr98G4OksCcnW+2Gr9YV03Q3x0Fc14tYnjirC0KFfNBmzITsWaOd
         EsGCzd2frJxu7R3W3aFlsMG2Hk4e41d71EuJYjccyxqoDxUNz7/7cXP4dLINmVViz6Ii
         FwkGClUmAVBBGcjEscNdF4xvS1Onm8UFZ8T2Gg6MI+Wpqt48ncA614UEx2X9RFkbVp7z
         bu8/knXp0Lvf9+m1wALtHesOwJgdSf+LydEMnK7iq8AyRz35KYpC6BAti3mIqNQXG8qc
         d0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e1fEwvYGVc4Rjygf6C1JwpQ8Ow8K6KfjGtqJJ79slO8=;
        b=hpM8zxIPXXLTpCCYxi6RrTW3Qb1JuZVavT4pF/1niXbdaOini41vAD6/K673WIDvWn
         Me0wYVMwEc6jq7BZllAknw/4ls++RMJX4JTIHkfhQgANrLyGFUskGij0zMM2rs29BtDL
         avgWX3FGJ16BFwgFB/Wy1L4GVG8YWJnR3Fv4GZNpfdGnINBNAXtE6Wkvv4y75TYOcWAk
         46Okf9+fW5ngKYRNtVOX7LBqD0lhGcGnJiJAXR4s8kH79+1IGxmTk7mljP0MtjNvegSp
         vRbGMwW45ncVb+dtkYLBG9CmnamyG86Ju8VkXWRMJW9+GW9sVxrDHw5f3xDtmYVby0Bc
         vneg==
X-Gm-Message-State: AOAM531eGW/ghnsu8QWZgVejqm+JTZG77O5xOrBW165k1M+HYW1KurBc
        6G3HW1M4txh1dXheZvpjUQc=
X-Google-Smtp-Source: ABdhPJyYRnAwV78qx0If7eGiPj5aYVpnoOn40HTT8DyE/y9S2NeEQ8y0562g4b6N+S8MpsV8qtjkzA==
X-Received: by 2002:a19:5e5d:: with SMTP id z29mr542824lfi.32.1599604848234;
        Tue, 08 Sep 2020 15:40:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 17/34] i2c: tegra: Remove outdated barrier()
Date:   Wed,  9 Sep 2020 01:39:49 +0300
Message-Id: <20200908224006.25636-18-digetx@gmail.com>
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
index 71e82a68c942..ab83d1de6c94 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -795,18 +795,17 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
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
 
@@ -827,10 +826,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
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

