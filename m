Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285D4260875
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgIHCP0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AABFC06179E;
        Mon,  7 Sep 2020 19:11:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so5443756ljk.0;
        Mon, 07 Sep 2020 19:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZD78APQi2tl+Q5v9LPhVtkKJ+nkgMadC4O/adVR437Y=;
        b=QRYnJvB2Xk4lEuxhbrvoRgLEa8EJBATNxek0RSWfb4bvuk4aSpU2P3l2ouyHTA8Oxt
         SLn9rT5W86DbaVMwOOjilIMKT8LvaSw21PK527ZVCYdSf3bnBf7GA+DNZlyxQK5zrkQe
         U3BrMkrRfWkUvHmyl3Iq4uJEXTVeKTTUVzB2XRCVflh3yHcYMDOQy9tiF4ernZMojBKu
         +PxLoSo3cDwqu/m6CQXgsq3lRlZ3qTL9Dol5yo04Esqlii9fnGq+eGmpRDtnJ6VdtcwF
         n87TtCFRihXHnKZZDFay7rOFRfTwOW9B5FVty8o21MBTfla0+J/Ht4vMj4rUS+kQ12cz
         EXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZD78APQi2tl+Q5v9LPhVtkKJ+nkgMadC4O/adVR437Y=;
        b=RxYb/PnCPKvce3VSQM358O8lmwWlb2d4U9VZnwSVJS7iE77FR28OaP3neXcdh4qz1J
         OX3hjVFEUAJ9YJEvqFwvDh9rAfvXMvSqaNzQWLIvC8L6WqnGM0RU6Cq87+51Wsugemog
         DXXgCTkB/EbpUuH4iQQ869zZYjN+b2kmERETsjinKcu3ucfyP6PClaOgFmyZUrC1a6qc
         Na6uFNQpICzQQvWD8tZKuJ5t2No69Tz9hkDc5aTfWFPyDseBMbql17LuO91NfcBJRx4V
         +CZyeLA7OMAH0WH2f8DtyHJlK67sJ04xPQ7yxfj5UmtS0YTLcXROiUVpud5N587Jc4U7
         Stcw==
X-Gm-Message-State: AOAM530bn4DwMfzbnuag96ouASU1fQ8UmqCAQtfZoYMhl4hYEI8gOpYH
        3KRT0P+42DHXa5nshNyH2YA=
X-Google-Smtp-Source: ABdhPJwB8Q7wMPq+S95EwPVyJUWL+R8o/AXZZuONJzAtJ9YGW8K0CwX9XZvy62lUvkjqFE5Zi62akw==
X-Received: by 2002:a2e:8904:: with SMTP id d4mr12454862lji.322.1599531112122;
        Mon, 07 Sep 2020 19:11:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 18/35] i2c: tegra: Remove outdated barrier()
Date:   Tue,  8 Sep 2020 05:10:04 +0300
Message-Id: <20200908021021.9123-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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
index 29e096422b95..2393f52fc584 100644
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

