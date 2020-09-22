Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA76C274CC0
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgIVWyB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgIVWws (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:48 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447D8C0613D0;
        Tue, 22 Sep 2020 15:52:48 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z19so19880301lfr.4;
        Tue, 22 Sep 2020 15:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJxaJS9zxYhaymHHDoqlujoEmK5Ye8suFy8gG2bHHhY=;
        b=oTb66uNN2Fl6H8jtcuwPxCs6CcY22NLQKdYWEdRnOFAG8da8P+Lq59AQXvfZNArepV
         6dMlWtvPKhSPOvrH6pbUIE20uVn12WBVoWj7ZWl38meB7gk89fsA+wxXahrYt1aEWHnx
         OaEABJUb0KoLrqCmSEiBmK39ayZQ9kOwRW+tn0eOhKIZl+IPizhu3ip6cjRXadXN395T
         v5Pk09/dSnaF21cv0d4oizmfL8UUcG7EwKQ2+gdxtQU1sYn9Nm4JWSYskc4MR6ofrmFz
         MJFh9iLXZQUIWTd+KL/jRy+pckqiV9wW1DRe6ao9XOk7YaI0v63L4CAX0C1eWFoLYv09
         YqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJxaJS9zxYhaymHHDoqlujoEmK5Ye8suFy8gG2bHHhY=;
        b=XJQEMyUU4ol98wKdHBEVZcJvS0PoSLTav/jEf/6AH5eISzsbXEEMi/FDGxfv6IAjMg
         9QuG8A9hftmJDj+e1tWDLER80X9dTKNwk6sy29dl+KBjgYGhT0Of2OZ8amrx8XxfCjqS
         UqL+l98Ll586bR8oyG7Oo813J7ctqSao41tHltkm+rud+QjNcXAAJml77p/XA2Vmy8T+
         z1jXFUzmw5l4FcUV59CDr1rAE7A6K9bJqKJn2zm5vgyoqYqgzL2MKkTf6ADYqsK1qkd9
         6Bfm049tsYBHSGM4uWhOpDjxo6I7ZC7q2veqcc/C6yqRtdEZTHrko+NgiHDjsPy1YpOn
         z6zQ==
X-Gm-Message-State: AOAM533nPZg/Lv3vMSqDsb3EFaTJ5NqJgT02rLB5ZlYumRc2VF1nf1vU
        6148i24rjz2NvEOIPqOkTJU=
X-Google-Smtp-Source: ABdhPJxDOz6y9UZcK5Wqm1KhmtEAt8rj8GWG5KLRKzwTS68VY1+Fzj8cgMuHf7tw++8L6hVA0Z8JIw==
X-Received: by 2002:a05:6512:4c1:: with SMTP id w1mr2559216lfq.202.1600815166695;
        Tue, 22 Sep 2020 15:52:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 17/32] i2c: tegra: Remove outdated barrier()
Date:   Wed, 23 Sep 2020 01:51:40 +0300
Message-Id: <20200922225155.10798-18-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The barrier() was intended to reduce possibility of racing with the
interrupt handler, but driver's code evolved significantly and today's
driver enables interrupt only when it waits for completion notification.
Hence barrier() has no good use anymore, let's remove it.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a56c0873f4a3..347651401cd6 100644
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

