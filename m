Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB4927DB96
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgI2WUg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgI2WUf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5763C061755;
        Tue, 29 Sep 2020 15:20:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so7429509lfp.7;
        Tue, 29 Sep 2020 15:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0TzhV/xpHRUTPLxn2RboLmgmAAPEGe8EBtfOe13iVXE=;
        b=rl2KpK0wRTSw11Cek2dAvYBo1IuNTjjbIyivGN0ch/QqDlJr4oHr6GAD4EIeGtCiET
         DIs1JxXxlbrKZ/ZX+xn5HXt58Kt4hf4+/2euzMYPzoJeNq1Ok32eSFbzTisc5ZWg3wPa
         spRW4QBIPEsbDjub0TcDLSqlhxJDu8m25Jt/LFjsgJg7y+sBqAFTSoqhcczAodnRwjpR
         thFHu2A0i2wvHkMciUlTbWc8NqFSgOKD80oNvnQN4CU81wrhvKvPMbwZ6YpbVPOxrPVY
         7E5b+sHBFlrAIzdeOE3oP1/LstCs1SWWP8mjlfW0h3Qleq0dyRvh20EdTR4R/bqjK3mv
         m/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0TzhV/xpHRUTPLxn2RboLmgmAAPEGe8EBtfOe13iVXE=;
        b=ukBaO4IkeOrrXWD3LoTFMIkIhg1WnhhDWjogAGh61+BusG30QXPBU63iPnX9mmThVN
         x7jSxQJLTM38ILTdbHRVkLIEtbG249rFUvLx9DpCHobHNjHZhDmyNP35QB0XPM6XWz3y
         K+X49esKZV2BcLRsLGSXCOszmz/NQELstLU51Qb1sLbhWQxZoA38eVw0KgKgPbuAca5I
         RxKe+snOS53wdBVxydSCwItygqnNvoUjMe6FbjcnU0icVKyA/q+2su9C5XemZUzU8tVi
         91jEHbpofbulCFAjWRYU/HBNrrIYfon+YeQ9e4iFA5uUAs0QnA/IiA3soPbTBMpMkv/O
         DRhQ==
X-Gm-Message-State: AOAM531AR+YHfPKeu5ESjbeTzgs8tQVEyg7glpvYKXXIADvrLTnKK7P0
        Zi+pDuET0LYsGIyKMviwYTU=
X-Google-Smtp-Source: ABdhPJwwTa1/xOjYuOMZdITaJ/E9L7gPhdhXjniPNQX/y6r7CUJJNyN8agZ8rm5vRVUpZrwhSSWlig==
X-Received: by 2002:a19:4186:: with SMTP id o128mr2121735lfa.297.1601418033157;
        Tue, 29 Sep 2020 15:20:33 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 01/32] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Wed, 30 Sep 2020 01:18:44 +0300
Message-Id: <20200929221915.10979-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
are not updating if interrupts are disabled. Let's switch to use iopoll
API helpers for register-polling. The iopoll API provides helpers for both
atomic and non-atomic cases.

Note that this patch doesn't fix any known problem because normally FIFO
is flushed at the time of starting a new transfer.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00d3e4d7a01e..ab88cdd70376 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -470,9 +470,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long timeout = jiffies + HZ;
-	unsigned int offset;
-	u32 mask, val;
+	u32 mask, val, offset, reg_offset;
+	void __iomem *addr;
+	int err;
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
@@ -488,12 +488,19 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	val |= mask;
 	i2c_writel(i2c_dev, val, offset);
 
-	while (i2c_readl(i2c_dev, offset) & mask) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
-			return -ETIMEDOUT;
-		}
-		usleep_range(1000, 2000);
+	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
+	addr = i2c_dev->base + reg_offset;
+
+	if (i2c_dev->is_curr_atomic_xfer)
+		err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+							1000, 1000000);
+	else
+		err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						 1000, 1000000);
+
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
+		return err;
 	}
 	return 0;
 }
-- 
2.27.0

