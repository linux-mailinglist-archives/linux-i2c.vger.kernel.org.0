Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF58825B7C1
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgICAx6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgICAxy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04FBC061245;
        Wed,  2 Sep 2020 17:53:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id t23so1435105ljc.3;
        Wed, 02 Sep 2020 17:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2V3E7Y3H2YnwHoVhaPEigRDT3aSpbZYQZy1kknrVrt8=;
        b=cOYbBf1VrRhWXaMPsfR6vBSgjGNE6BfzSomT5T9LWQCqWpPa9DfbH5bHD5HMcj5dUR
         1usxUjUeB+zwyS6ThBnB2NIcmDr3WJWuMjtVjwAkyPyelo9Dq2ypbA4P/PvvTqbufNS/
         VQEsU72rP+Ik6DOSPPaV/HNiMOD86zOJCnr1ofKXdx+JM6nszPKRN+B0sbJI10fnVmCM
         zhIaDon89+gx3iLXKSPBQf46lP7GKOGKm0kRDPEEOFf5Wz3eRbv2RIxUlZreM25VgcB/
         2nU1MH9pSy1WO56a9VMFteZdokY0MWdBrgWw1e+UnKunCyeo5AqqfVCDQKkwLcjOxUXf
         aXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2V3E7Y3H2YnwHoVhaPEigRDT3aSpbZYQZy1kknrVrt8=;
        b=Q4baBhEczCSTj6HsGdn+1Jc/qs0t8/3c2Y06yAqPdf93Hj2WbKn3j2DtOChrEybw8c
         0QihrhfPOg7JvR3H16nAXUONINFLSFJ+aDTGcyJv0qgCkXhlKLbm/pzs5dGSzXWq9LqK
         yc+TI2gPCesRO8+sOxZFDATnMM19UNM8EPQd7pVhe9oDrC39n2bN5WzgglR4KMFoR7ty
         FWKd2Nm6sVx+COz/3bTHDKyT6Xi+WMZkI5+o5ssLXGwsVo35cXIM808+ZWl7ztehkG9l
         4tg6NNO6DwdgM/K0Gzy1d25TfzEpwVz4GTFFa4Mf1l4+itnKKXH8vLKXVcXd9GOFDXKa
         Q5jQ==
X-Gm-Message-State: AOAM532Wz6AyxDwJgtv1Zh/354HbadWuP8ufTFTvPn6fYsMqT9mpf324
        oiczDbOpYrZbJ9MALkVjeJ8=
X-Google-Smtp-Source: ABdhPJxF5VbI5LPu9RoLW3kZ/oYdO0vzYElEb5Aw1ByEYZ475Evx1B6r1iUpu7iRm4IHC8vT2M4N0g==
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr236895ljj.341.1599094431462;
        Wed, 02 Sep 2020 17:53:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/22] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Thu,  3 Sep 2020 03:52:39 +0300
Message-Id: <20200903005300.7894-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
are not updating if interrupts are disabled. Hence let's use proper delay
functions and use ktime API in order not to hang atomic transfer. Note
that this patch doesn't fix any known problem because normally FIFO is
flushed at the time of starting a new transfer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00d3e4d7a01e..72f03ded2eae 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -470,7 +470,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long timeout = jiffies + HZ;
+	ktime_t ktime, ktimeout;
 	unsigned int offset;
 	u32 mask, val;
 
@@ -488,14 +488,34 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	val |= mask;
 	i2c_writel(i2c_dev, val, offset);
 
+	/*
+	 * ktime_get() may take up to couple milliseconds in a worst case
+	 * and normally FIFOs are flushed, hence let's check the state before
+	 * proceeding to polling.
+	 */
+	if (!(i2c_readl(i2c_dev, offset) & mask))
+		return 0;
+
+	ktime = ktime_get();
+	ktimeout = ktime_add_ms(ktime, 1000);
+
 	while (i2c_readl(i2c_dev, offset) & mask) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
-			return -ETIMEDOUT;
-		}
-		usleep_range(1000, 2000);
+		if (ktime_after(ktime, ktimeout))
+			goto err_timeout;
+
+		if (i2c_dev->is_curr_atomic_xfer)
+			mdelay(1);
+		else
+			fsleep(1000);
+
+		ktime = ktime_get();
 	}
 	return 0;
+
+err_timeout:
+	dev_err(i2c_dev->dev, "FIFO flushing timed out\n");
+
+	return -ETIMEDOUT;
 }
 
 static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
-- 
2.27.0

