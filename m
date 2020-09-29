Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F03A27DBB2
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgI2WVN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgI2WVH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:21:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F044CC0613D9;
        Tue, 29 Sep 2020 15:21:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u21so5348058ljl.6;
        Tue, 29 Sep 2020 15:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tRfT0v2pgtsvyzHJ1wIuhcN42kKahStp+xPAVamWbys=;
        b=I2+6bWZTvt31LV809EIvdyUtmm4gpZcVKMsagrUjwPRStRQz8t2YB3Fcc0r0KJa2Py
         t3nk8LToM4VSdQOe5eM1tY1gdQWEOaVIsOKLnNM6hnAn1foyeQ22DBgJYJRJ5p5LgQWW
         mONxpZYwVUCFtRt00FldsRHYbOVUEAPWwOfSpQD+cSYAIdUBI/647cvvsIWW96NiJBPr
         xUDo8wluD1Ld2uACpHFGkl5t7pPt6pM4wekeStyf4BCEkuHXE6Xg/vlRyzX0ay8qqMKn
         /hMcDAZqBXJDjkOzi/IvbQEQnAkgol6OqI811gRRTjsLwsLFiUmIZVBSEnzIV5tJIdXA
         TJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tRfT0v2pgtsvyzHJ1wIuhcN42kKahStp+xPAVamWbys=;
        b=eq+n/nlRXxpe0AsjkNi5H38G0hwdUZ+PHp6N3XDC0/1IHRigaYbhm/P8nHCdU4l/GH
         02DVZ0Lw7wnrZehXBDQ4/22KxicJJbLh72u92k9HMcVkEkkRBTyxsNlJX/y0h9pnDvn+
         5npk85LmUYntf6VHx19ui5y8Pi/JDPPCtL8PX1Y0urGKnKA56Fnq0YPOWB88UU1+JqwK
         YeFdluaoKwbPYvE/d34CMXSVM0wL6O0vBx8fwHXO1gDVPtHxBFVHjVqPkbWDTjBSvWUH
         BVbvMvJAWLrfOW53tcl4jfSfCc2M6A3RJIC5cyK/vjrEjb0A/1Kcpq3N+vba+mRblZKT
         MRPg==
X-Gm-Message-State: AOAM533HDxIjGFsdf352PALTuvK2mbX7J+ZZF1Bix83wDdMCiioMLVpA
        SKqFgsfgWG5PNMFeOT/JbcI=
X-Google-Smtp-Source: ABdhPJyTlzHAVAGkVAGgJHyvwmxNXxhI2iZ83YD1oaHi12KcNTgKjvkY7sngA1JVCqey2dzKbepWxA==
X-Received: by 2002:a2e:548:: with SMTP id 69mr1987276ljf.386.1601418059420;
        Tue, 29 Sep 2020 15:20:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 24/32] i2c: tegra: Factor out register polling into separate function
Date:   Wed, 30 Sep 2020 01:19:07 +0300
Message-Id: <20200929221915.10979-25-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out register polling into a separate function in order to remove
boilerplate code and make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 57 +++++++++++++++-------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index fbeae872ece1..2d18a35dc18c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -514,10 +514,24 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
 }
 
+static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
+				   u32 reg, u32 mask, u32 delay_us,
+				   u32 timeout_us)
+{
+	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
+	u32 val;
+
+	if (!i2c_dev->is_curr_atomic_xfer)
+		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						  delay_us, timeout_us);
+
+	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+						 delay_us, timeout_us);
+}
+
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 mask, val, offset, reg_offset;
-	void __iomem *addr;
+	u32 mask, val, offset;
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo) {
@@ -534,16 +548,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	val |= mask;
 	i2c_writel(i2c_dev, val, offset);
 
-	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
-	addr = i2c_dev->base + reg_offset;
-
-	if (i2c_dev->is_curr_atomic_xfer)
-		err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
-							1000, 1000000);
-	else
-		err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
-						 1000, 1000000);
-
+	err = tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000000);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
 		return err;
@@ -553,30 +558,18 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long reg_offset;
-	void __iomem *addr;
-	u32 val;
 	int err;
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
-		addr = i2c_dev->base + reg_offset;
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+	if (!i2c_dev->hw->has_config_load_reg)
+		return 0;
 
-		if (i2c_dev->is_curr_atomic_xfer)
-			err = readl_relaxed_poll_timeout_atomic(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
-		else
-			err = readl_relaxed_poll_timeout(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 
-		if (err) {
-			dev_warn(i2c_dev->dev,
-				 "timeout waiting for config load\n");
-			return err;
-		}
+	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+				      1000, I2C_CONFIG_LOAD_TIMEOUT);
+	if (err) {
+		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		return err;
 	}
 
 	return 0;
-- 
2.27.0

