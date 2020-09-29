Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570C527DBEB
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgI2WW1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729080AbgI2WUz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:55 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110E9C0613D7;
        Tue, 29 Sep 2020 15:20:54 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y2so7394344lfy.10;
        Tue, 29 Sep 2020 15:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pHAwf3Bd6yoReSveFkgnKtaMRN4YjhPD1mjTlCUGqUo=;
        b=MWTHIBAll+rNvndiQt03bMVIl4QYKhBNxv9NlqPYj3IRcPXpB41acsBR3xXQEwLg/m
         Qx2lrSbdiO06KRRliH+mhS7fmafOHPNbOnZR7sKJv9fvP1kXUwHpsw+pRFhwIrylDIXg
         dEbwe3HYVqvkZt02ZqD7fOP1kn3KlxGbb7XSWpW9Cv13X5DOp0/5Soy1GDHV91kCYzwb
         FOPA24YqoOIpd7YqzZYakNZ2ph3ZBijAY92ZN/C09iu5Y7BP9cMpfQo2UTMVerBcZOcV
         hHXBRUC5/9maB2PO8GZZwRM5PMpSJGaq44SWIeZKfPkyNR9+bRWQviPbgJxFrfiHViAK
         l2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pHAwf3Bd6yoReSveFkgnKtaMRN4YjhPD1mjTlCUGqUo=;
        b=aVrq9Cwqsg6M9YS+cMqR7XjPU14UCMnhp4QMVTsG1cz9+MWQtYF6wInDJrY8nrDe+C
         PZQiLPv3xlzzmi80qLmRYaYlq3Px+bdXiDgNdGUCJHR8hG1HOaVjLA3C5cu5BvyLJZQc
         mofj+TyhtiUVHVMsPN795hzjld+lSho1z12lYHInwfiqUPh+Fvy5owVTVP3KFhdv157G
         nryPZHP92WV4I+fZ09FEaq/Ij7WS8OJUNEXoPqg8f4xbNkVdHaY9fkDNKK8BpykvCCwY
         Q6qYIMnpAwpX/mhdnAQSkrno+R5te3wJZVeP6UAKIPXHETiYZsk7n5sLWVdteSJkK7uu
         55HA==
X-Gm-Message-State: AOAM533Fij+MRVAdqB1eKSWfsYGZ1CXMnX0t/Dp7SZvD0T0W+qbGvPdC
        MvAsy0CdC86o5Wbgqrb2Z1KCGuagzWQ=
X-Google-Smtp-Source: ABdhPJzAinU0q5m2aKuqRvAeNmHd1RJ5yGJp2/9SuO3IIC4FT28nL0dbdOafbquqPLPjP7WKF6/Lxg==
X-Received: by 2002:a19:8316:: with SMTP id f22mr2163836lfd.239.1601418052431;
        Tue, 29 Sep 2020 15:20:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 17/32] i2c: tegra: Remove outdated barrier()
Date:   Wed, 30 Sep 2020 01:19:00 +0300
Message-Id: <20200929221915.10979-18-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

