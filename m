Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381B225A079
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgIAVLa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbgIAVL1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:27 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D32C061245;
        Tue,  1 Sep 2020 14:11:26 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z17so1579804lfi.12;
        Tue, 01 Sep 2020 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o54z0KyncSkTIRCR00YgxkSeoepil1oHLoUd4CNcJV8=;
        b=ajfxj2cMmDaByiJ0CMSkH/zTefpoGuyh6MVVkqRMaH4iVjRyETx2FikF5O7mZy6c1f
         4V3i2jE8e82hwXODQMJlwkn2XsoQ83ka2Wq/LDmevKQb4RrOzvJS+cRWUtL0KeFnC/+X
         VMeSmLTEwChkerB1RtwcwxBgZi0/UtUy86Npkwe3/ZOOju+6Kafy4imDIDWRiNhtjdvl
         wtdbGh1RXSoHErVztbU3rG8J2Yc13VVdkPjFNMskvaDQ6UAC4WGnQq1ecsbGHqar3WGp
         xXv4PCru/Kdy6eamzfKhAZtUNZfgJhHAdOY5dho0Hux+9rODQjw8lrKE+pEhsD375EkG
         sjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o54z0KyncSkTIRCR00YgxkSeoepil1oHLoUd4CNcJV8=;
        b=MA56jpFVNdGqZ2iN6NcwyJWMlq5LA4WZdACx2yqhUOVCGZq0ZB0BWavtWGW88TIQ8c
         kGvMlsPWjGQ9ECe/mweGMfIMf41eIwLAn38ghtnSEVxBYXeTUfKLT5F7BH8Qg36rjuLA
         /Ah4FF+M72JSNXCxl2NEwzdXw02+mnKehvZ0WG7Kq6wY8oFxvdmes/4gkMYEQdUSR7xz
         Sgc4ap/hIJe5aTKG+q0eZpT4hrNTinybfNPp+nz07I3bTMZwnBO7K+FVnmFkGCZrQhn6
         AIUoViBb1gwhpsXsb7xq4O1Zg2tk0acdpgbm6SJRVfT0SGGTW86BAe0LsvZPWfHP9Spe
         d5Fw==
X-Gm-Message-State: AOAM533izA3mM99Nc0lzgZgM52c7t3QCbG2QZYG9r1UNHtWh4MlQqTF/
        MubTDI+pctdanE6Q2cscfg8=
X-Google-Smtp-Source: ABdhPJxOG9uDCeA0STJGGmNQ1ApSBS3SWqIJR52OdEaETxFJKg73yMn9/ZNsGA8cZQFUPJfa1z3DOw==
X-Received: by 2002:ac2:5599:: with SMTP id v25mr1592391lfg.129.1598994684550;
        Tue, 01 Sep 2020 14:11:24 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:24 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/17] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Wed,  2 Sep 2020 00:10:46 +0300
Message-Id: <20200901211102.11072-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00d3e4d7a01e..aab58395fb71 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -470,7 +470,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long timeout = jiffies + HZ;
+	ktime_t ktime = ktime_get();
+	ktime_t ktimeout = ktime_add_ms(ktime, 1000);
 	unsigned int offset;
 	u32 mask, val;
 
@@ -489,13 +490,22 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, val, offset);
 
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
+	dev_err(i2c_dev->dev, "fifo flush timed out\n");
+
+	return -ETIMEDOUT;
 }
 
 static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
-- 
2.27.0

