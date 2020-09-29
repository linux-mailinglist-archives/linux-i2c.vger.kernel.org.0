Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6566627DBCF
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgI2WVz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729184AbgI2WU6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137E4C0613D1;
        Tue, 29 Sep 2020 15:20:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b19so5330243lji.11;
        Tue, 29 Sep 2020 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SaNfOo8psOG8LhI1IC/69S2HTJwTXWLAyweyWWQ18pw=;
        b=lMg7xmWljbgi1dAfQ2jk0C8FARfSfloVPuToDch3EKQhzg6y/Kw8ZlVzoHRz5esabw
         WMJiXmrv1tLI6vokSaA6YWAoCU70dMekBzzUja1jiDoS/t43wKuIt6+6TlQhqeDxU0ck
         YmTWQRMgJewekYIgilQbv//yNNDOaODp8uRic33AsdtYZAvJe/R7dhWbc6zcWFmtB1e0
         i3I+UIjWpGMZyImvT30Len/3TBRF7OBGsVf+6hpiu1uG9cgxQ7JECiHA6nfUxCf1M7ca
         Bcc8x4dutk8CGYmmatOtmtxQimFhNzyvO+1KsBph+CLfA5KwI2fOgaZ40uF1WAT3DPOY
         FNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SaNfOo8psOG8LhI1IC/69S2HTJwTXWLAyweyWWQ18pw=;
        b=QnR53povO7RJNFEudKAB5FfBqHf1etmmVAgYoXhL84MwKep3YHI+o9I+oMKgQrdgfq
         Arv/g+bHPbaZhY4nmFL94jvggjTw4FyOLZD8c8JHIWBRr2AggPlQeNeuABN7oRn2yeZv
         rIoDS2gvJvK1QP7oYY44o8JsPqJ/I/mH2vgTi87ZubcsbL/xImAdoeifTre66/w8/r28
         6vUlKnfpfHScl+pupuihFlP+tXaKHiSpulCN+JtLpIJiE1yvV1NbonWxq+yQ3u0aQoaU
         64Ii73KBEz9w20T/VYmgoAyKnHCpLcoqyg8ygyrzcvH//Jxp5zqmE0NCxxIXw/m6AUDq
         Xd3w==
X-Gm-Message-State: AOAM532FS46vuHoLvdcoGIk1lp3hohhRrWR2wDefbLwIOVUEgM2IcIbs
        6Jkdmg7jtR/ZWHL1yCaQLyx2ZpUOgfU=
X-Google-Smtp-Source: ABdhPJyO8cJjdz3jTOsIPN1LJEWeE9J8sMLpzDvtbIJYrJRpylXq/N6ddD8c8wkL8rkrtaLuB3MHeg==
X-Received: by 2002:a2e:a588:: with SMTP id m8mr1759704ljp.210.1601418056453;
        Tue, 29 Sep 2020 15:20:56 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 21/32] i2c: tegra: Rename wait/poll functions
Date:   Wed, 30 Sep 2020 01:19:04 +0300
Message-Id: <20200929221915.10979-22-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drop '_timeout' postfix from the wait/poll completion function names in
order to make the names shorter, making code cleaner a tad.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index eb62284e2293..f8bee67370aa 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1010,10 +1010,9 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
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
@@ -1037,16 +1036,14 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
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
@@ -1064,8 +1061,7 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		 * needs to be checked after timeout.
 		 */
 		if (ret == 0)
-			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
-								complete, 0);
+			ret = tegra_i2c_poll_completion(i2c_dev, complete, 0);
 	}
 
 	return ret;
@@ -1091,8 +1087,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, 50);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete, 50);
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	if (time_left == 0) {
@@ -1244,8 +1239,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (i2c_dev->is_curr_dma_xfer) {
-		time_left = tegra_i2c_wait_completion_timeout(
-				i2c_dev, &i2c_dev->dma_complete, xfer_time);
+		time_left = tegra_i2c_wait_completion(i2c_dev,
+						      &i2c_dev->dma_complete,
+						      xfer_time);
 
 		/*
 		 * Synchronize DMA first, since dmaengine_terminate_sync()
@@ -1276,8 +1272,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		}
 	}
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, xfer_time);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      xfer_time);
 
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-- 
2.27.0

