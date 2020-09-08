Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6330A2622F2
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbgIHWmz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730085AbgIHWlC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:02 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E4BC061755;
        Tue,  8 Sep 2020 15:40:54 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so1014175ljk.0;
        Tue, 08 Sep 2020 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CAzw7V00TNX6Xyj54SjfhvDwqPQuqQxiXL39qRNRLzs=;
        b=ftT9thJu9ax+chR6bmG+7u1BCWASWmnn+8ql9OmEf7QAkMrHCH+IQFr66NGK60H7jR
         C5elwkJ6bPKXEodeUVOi/tDAIu99OaUNJSjOYcHtoYyTEoRqQhZA/o1ZmjB3Dd/JyAoi
         R38DT4MThF66FcgBzrA8Hjozrxm/7UPjuVRdXhl7xHB90MzSn2TjRrHOEBjIurJl+ZSa
         RWuiD+fDiWeW/Fvq1D7u/gdaxBq0qf9R+Nb1+WEdfBwRUjTmCDKEHypv16/r7MJXPk00
         gXvZ5vT5RpZX7nRUvYuGgMcg2cZocgCCfZ5z76zKNWmnF6ym62NrhC+10EDLKB1O6jU0
         IgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CAzw7V00TNX6Xyj54SjfhvDwqPQuqQxiXL39qRNRLzs=;
        b=P0OfAnDI5f3Bm/hcDxMM6T1EA+hjAiZ1JMw+Haq2jwCyvHtu3zzYc3QrUcijeX/inq
         +pXxE1sPon02FaNanicsENnDXmuWQdIq6pEyN6knDYT0sEyn5vkgwCOA/e1VdsGizZDe
         Rfog3acHrYb6pIYptpc3DkLkj8P0OqzGeBSDuqe89njJWQ2Z+AHvNyE2tG6Rht7D/+3s
         yHecIOD5oCQEU7T4Fm8pvjPHPUvXXglJ0LsYIhj6XFMzafo+5bItd5zl+reH8y95kSqV
         RqaRw2eeDT7+zsESMG7WWngGARRkJocZE+57qn7C2P9BLdwnLE+E8bnadxnEY357zTeX
         HtZg==
X-Gm-Message-State: AOAM530iR99RJXKAu6kpm77pu2cCfhwRDVm4n+Fg8jSPmMn2slyqWoK5
        zOODqz9KGv6OfaNruTnr+JeVp7d9ifc=
X-Google-Smtp-Source: ABdhPJyhcVugkgOesde5UMymh8sGKlbpJo+aamGHMiWT1mnPqIi4H0hovaA8T6mTPcRpv7DyVZj8zQ==
X-Received: by 2002:a2e:4554:: with SMTP id s81mr361302lja.121.1599604852679;
        Tue, 08 Sep 2020 15:40:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 22/34] i2c: tegra: Rename wait/poll functions
Date:   Wed,  9 Sep 2020 01:39:54 +0300
Message-Id: <20200908224006.25636-23-digetx@gmail.com>
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

Drop '_timeout' postfix from the wait/poll completion function names in
order to make the names shorter, making code cleaner a tad.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 574b59a8b2a2..102d26c01dff 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1009,10 +1009,9 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
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
@@ -1036,16 +1035,14 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
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
@@ -1063,8 +1060,7 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		 * needs to be checked after timeout.
 		 */
 		if (ret == 0)
-			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
-								complete, 0);
+			ret = tegra_i2c_poll_completion(i2c_dev, complete, 0);
 	}
 
 	return ret;
@@ -1090,8 +1086,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, 50);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete, 50);
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	if (time_left == 0) {
@@ -1246,8 +1241,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (i2c_dev->is_curr_dma_xfer) {
-		time_left = tegra_i2c_wait_completion_timeout(
-				i2c_dev, &i2c_dev->dma_complete, xfer_time);
+		time_left = tegra_i2c_wait_completion(i2c_dev,
+						      &i2c_dev->dma_complete,
+						      xfer_time);
 
 		/*
 		 * Synchronize DMA first, since dmaengine_terminate_sync()
@@ -1278,8 +1274,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		}
 	}
 
-	time_left = tegra_i2c_wait_completion_timeout(
-			i2c_dev, &i2c_dev->msg_complete, xfer_time);
+	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
+					      xfer_time);
 
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-- 
2.27.0

