Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56511260859
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgIHCOj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbgIHCMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0F3C061573;
        Mon,  7 Sep 2020 19:11:58 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s205so18039257lja.7;
        Mon, 07 Sep 2020 19:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JgF3VVU7tFsmkskdQ6viyyo6sIhqDxq3DbAN2Y/3odY=;
        b=je8zVeR4suUOynWJWNENTG/m1KI6DvGXWoGyQ9aX68bzvcGb1r65VP4glWVyFj8+Ze
         RizTf7zA1XjS8Z6Kz/lwJJh7f+KQqxnoFCqYx3txqXDeK+DWo6ltwgb1blRDedOnQxX1
         +dyIyWno3s7tQbQeIpE3B5Twfe66oBrCgYYEe1h0C9oXX/SruuvLB8l7sf84vRMIJzBj
         vbkivMI1qj2IA6LNb3Yxnz5x5Tk1iwG4cgYzOq+ePXP8oh5+x/WL2QbUoJL9myl2/tMw
         J/jbLCYHolVI+9qmew+cikm31UEczKpLRQOaCTANNZkLEfB4sDoWcFUWo0LbTCrM1sGj
         3hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JgF3VVU7tFsmkskdQ6viyyo6sIhqDxq3DbAN2Y/3odY=;
        b=uHdUyGGvQZdHnoD6MVTA9CG7E8hrOYEh0hFsM1rQ+Tm6Zw8/utquGc1iGwsEFvFU+n
         HuG5cJBnbC6sBnw+iHTkbzBbKD+Gp45uI56HkB8jjo3UeitelAxtxXZHQ1LsRhnYtFpP
         pSN7YaZe6JBK9oT+pUUBMmiL60yKBQkTyctAKa8KtNTJFysCmVoZJxsUjKSh3hsUUiDV
         YefCf0xh5W7gCK7zPXMRp3qeq1J7FiKwR92Qg0LwMEzggmnFKyGRH66UliI8FIlQq4ap
         93bJN/Hef00+oeey/++Vgoc8Qc5o4kaCYabXAIrnobNc1BIxvNXNc8SsX9bB2PuvYiNl
         Myzg==
X-Gm-Message-State: AOAM5303VSdD5hnLD2Afx/B2TrWlbSgJ2zxpbEVTQ8PvzTIofunsD4o6
        cHxW0iftQ6fUXkyk+K1OJds=
X-Google-Smtp-Source: ABdhPJzbpCynRifLlKBdg6XyNvORmkifbjjdQQOBwESWVKNdaR50R4AigmKhp7laAx0lfOouqB4DHQ==
X-Received: by 2002:a2e:9057:: with SMTP id n23mr9596269ljg.411.1599531117389;
        Mon, 07 Sep 2020 19:11:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 24/35] i2c: tegra: Rename wait/poll functions
Date:   Tue,  8 Sep 2020 05:10:10 +0300
Message-Id: <20200908021021.9123-25-digetx@gmail.com>
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

Drop '_timeout' postfix from the wait/poll completion function names in
order to make the names shorter, making code cleaner a tad.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c16273c13291..0d823aae9eaf 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1003,10 +1003,9 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
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
@@ -1030,16 +1029,14 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
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
@@ -1057,8 +1054,7 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		 * needs to be checked after timeout.
 		 */
 		if (ret == 0)
-			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
-								complete, 0);
+			ret = tegra_i2c_poll_completion(i2c_dev, complete, 0);
 	}
 
 	return ret;
@@ -1083,8 +1079,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, 50);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      50);
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	if (time_left == 0) {
@@ -1237,8 +1233,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (i2c_dev->is_curr_dma_xfer) {
-		time_left = tegra_i2c_wait_completion_timeout(
-				i2c_dev, &i2c_dev->dma_complete, xfer_time);
+		time_left = tegra_i2c_wait_completion(i2c_dev,
+						      &i2c_dev->dma_complete,
+						      xfer_time);
 
 		/*
 		 * Synchronize DMA first, since dmaengine_terminate_sync()
@@ -1269,8 +1266,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		}
 	}
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, xfer_time);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      xfer_time);
 
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-- 
2.27.0

