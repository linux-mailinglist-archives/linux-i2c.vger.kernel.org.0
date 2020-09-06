Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4D025EF91
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgIFSwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729201AbgIFSwA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:00 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B29C061786;
        Sun,  6 Sep 2020 11:52:00 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u8so865441lff.1;
        Sun, 06 Sep 2020 11:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x+NqQsUvQACUvFJO8l9Cfg5wBddIoEhoNMSu1+ju+hM=;
        b=HbgnCh3L0lJSnBwqiIolHQWeSGge2cQG1F1ksv8PoapEXwKeQhWtXSW2/dJBj0esza
         ViD8ZfJmnq1pieUIjDy6MSKkWWSdGIxnYvaPP4C1x+Xr5+W7Z5K7Kc/vhzHWef5mVkvZ
         IXrgG+TQWOllnnXr8yZEXlakztwUSDYplaRw3yISsHtoJnupF4C0xNS7288JRbjganzr
         SHHUTnFueSMQrQXhX12L0YdBpsxzOnzQS/CRZkBfB4g9UdFQS6upQF6w9f/yi0K/jpP2
         D6vXas4ij3CqD2agASD7xbmaniVLy1D1CP6vdA5u6QojgpTImkog1rpKDqGEjFr/q2zv
         J53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+NqQsUvQACUvFJO8l9Cfg5wBddIoEhoNMSu1+ju+hM=;
        b=SuqCJ6Fy+Cyq+HSY4tUcZJoDNMQn9T8b5grcLMpuVq/AAFJon5AFynRcH3g98xZLl7
         QnoMBO7kOQpF99qQevgg/e1BRjwrgrh8TCW8epvezd/Z3p0OObPa0DTAi8PUeDSmpNG/
         sv56lhmyXP2bbuLkOUpFmxzMOSgRwq1HdAtzHWMcc1GCOLK68JePNvdCmrf/RaaWrXnU
         QEolC4rBhFOL2ZBpuTpF0mWmnWMXp1FuS9dp5XjQs9JVXJDaOtZnN4xHxqqmVZ1BdtJn
         D6AyH+lNUtlyNx/b8ehdzBN/n1uwuwof0aQDkywDXicFAACtobuVucwug/LOpcTXGHpt
         fIoQ==
X-Gm-Message-State: AOAM531O2/wYiHv3ENQ5uUy/Bl6FQMTbqPRxjnu6loi+6ova9/0iGRzQ
        rrlvE5nefzvqh1lOw4cpR/0=
X-Google-Smtp-Source: ABdhPJxIX+zBIpXX9H9951NC0EJmKRRho23RwQI8Idsrl3nFX2d79CFExTB8eewXVv2XGtSMifR8Og==
X-Received: by 2002:a19:942:: with SMTP id 63mr8480013lfj.23.1599418317519;
        Sun, 06 Sep 2020 11:51:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 21/36] i2c: tegra: Rename wait/poll functions
Date:   Sun,  6 Sep 2020 21:50:24 +0300
Message-Id: <20200906185039.22700-22-digetx@gmail.com>
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

Drop '_timeout' postfix from the wait/poll completion function names in
order to make the names shorter, making code cleaner a tad.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index eea07aae2716..4436fecee283 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1033,10 +1033,9 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 	return 0;
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
@@ -1060,16 +1059,14 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
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
@@ -1087,8 +1084,7 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		 * needs to be checked after timeout.
 		 */
 		if (ret == 0)
-			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
-								complete, 0);
+			ret = tegra_i2c_poll_completion(i2c_dev, complete, 0);
 	}
 
 	return ret;
@@ -1113,8 +1109,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, 50);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      50);
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	if (time_left == 0) {
@@ -1267,8 +1263,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (i2c_dev->is_curr_dma_xfer) {
-		time_left = tegra_i2c_wait_completion_timeout(
-				i2c_dev, &i2c_dev->dma_complete, xfer_time);
+		time_left = tegra_i2c_wait_completion(i2c_dev,
+						      &i2c_dev->dma_complete,
+						      xfer_time);
 
 		/*
 		 * Synchronize DMA first, since dmaengine_terminate_sync()
@@ -1299,8 +1296,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		}
 	}
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, xfer_time);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      xfer_time);
 
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-- 
2.27.0

