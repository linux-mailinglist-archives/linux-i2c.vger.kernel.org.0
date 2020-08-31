Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC9C258276
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730038AbgHaUX4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729397AbgHaUXi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:38 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829AEC061575;
        Mon, 31 Aug 2020 13:23:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id t23so8245978ljc.3;
        Mon, 31 Aug 2020 13:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oay/lLFbyAzhcLMmu4x+aLy0m9Fy52Fvfqcuwro8waU=;
        b=CMjEz4Rjy3TQB8KrVPWAVy6ph+o91WuDdsixMYI6u0uiDPUX5ptTPot3ZWSCZvVNOL
         98wtOouTsK4wHQCMjoSoe1zqYm+ldUEGmXDKVF8YcaTMxKkn0YLgyuJOOdAYCW1iVgSJ
         ui7F8SydFW8LdfJfSFf50bmwLDsOc88ea8R9JI56QMQp+x4/jFrLUnA47Yt5Wnt5pMeI
         4JUW7jqiHTrTRS9yeA4SbU+Sag6IcPeQHdSMnm6gYDcL4Ng2MYoRYhkFFW/RudBjTdey
         oAdNLNrRcVUV15oxCV1Kw+/gp4GryxKX26u06MySgCFaYWDn0HGC5DRlbmT7RnlWcqcq
         2YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oay/lLFbyAzhcLMmu4x+aLy0m9Fy52Fvfqcuwro8waU=;
        b=fUeTCd1yKStLhB/QQkk0K6dVdVhgv803dWn4zuWieGqUa0xQbU85YVgCCHPczH9vKN
         1+H6ozT4xazyI8S8WnS75MrXPVxXljw1JtKzHcCk5m8P6w2uxG/XvoR+XQTTWPI6xCit
         mpM8gVgDVrrPY/7dLzRdsnQ6MgcPTluttauaNNQEWq2k3CKwvSVbJ4eSO5QtY9zzFmBJ
         oshWtA7yQsaPp8T1A1go70KNT9GLmqYD3Y+DCXi0tRFerKWQc6ds98DLezYyjdJ2sher
         bLV/mtDVYUJ+H4kitXIwQ+YBECOJWrXuSc8jfPxbWTm3LoHTr0+4Jy919tx+LFz+urOp
         O23w==
X-Gm-Message-State: AOAM530N68O3Ha7ke+jlSvfXNAakTEuDu/klG+eUUT0taPsdaD7D19/f
        OTlegEEYhbPzGaXkIktW+Ro=
X-Google-Smtp-Source: ABdhPJysKveOQlsgQpRxqwLInIhpzMoJajQ6e+D68gjm+5YvVNqyGKcgn55fl/b9trQRe+ScrZEkfQ==
X-Received: by 2002:a05:651c:3c5:: with SMTP id f5mr1285209ljp.209.1598905414977;
        Mon, 31 Aug 2020 13:23:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/12] i2c: tegra: Drop '_timeout' from wait/poll function names
Date:   Mon, 31 Aug 2020 23:23:01 +0300
Message-Id: <20200831202303.15391-11-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drop '_timeout' postfix from the wait/poll completion function names in
order to make the names shorter, making code cleaner a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 57a3e1a9eef7..8c8f3189928e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1067,10 +1067,9 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	i2c_writel(i2c_dev, val, reg);
 }
 
-static unsigned long
-tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
-				  struct completion *complete,
-				  unsigned int timeout_ms)
+static unsigned long tegra_i2c_poll_completion(struct tegra_i2c_dev *i2c_dev,
+					       struct completion *complete,
+					       unsigned int timeout_ms)
 {
 	ktime_t ktime = ktime_get();
 	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
@@ -1094,16 +1093,14 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 	return 0;
 }
 
-static unsigned long
-tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
-				  struct completion *complete,
-				  unsigned int timeout_ms)
+static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
+					       struct completion *complete,
+					       unsigned int timeout_ms)
 {
 	unsigned long ret;
 
 	if (i2c_dev->is_curr_atomic_xfer) {
-		ret = tegra_i2c_poll_completion_timeout(i2c_dev, complete,
-							timeout_ms);
+		ret = tegra_i2c_poll_completion(i2c_dev, complete, timeout_ms);
 	} else {
 		enable_irq(i2c_dev->irq);
 		ret = wait_for_completion_timeout(complete,
@@ -1121,8 +1118,7 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		 * needs to be checked after timeout.
 		 */
 		if (ret == 0)
-			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
-								complete, 0);
+			ret = tegra_i2c_poll_completion(i2c_dev, complete, 0);
 	}
 
 	return ret;
@@ -1149,8 +1145,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, 50);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      50);
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "timed out for bus clear\n");
 		return -ETIMEDOUT;
@@ -1296,8 +1292,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (dma) {
-		time_left = tegra_i2c_wait_completion_timeout(
-				i2c_dev, &i2c_dev->dma_complete, xfer_time);
+		time_left = tegra_i2c_wait_completion(i2c_dev,
+						      &i2c_dev->dma_complete,
+						      xfer_time);
 
 		/*
 		 * Synchronize DMA first, since dmaengine_terminate_sync()
@@ -1328,8 +1325,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		}
 	}
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, xfer_time);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      xfer_time);
 
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-- 
2.27.0

