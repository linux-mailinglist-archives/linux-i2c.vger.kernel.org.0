Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BE825EFC7
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgIFSyT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbgIFSwD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:03 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868C8C061756;
        Sun,  6 Sep 2020 11:52:02 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so13520668ljj.12;
        Sun, 06 Sep 2020 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7lvKyeCsiM6/uO1ru+ncuOCvR/DrlE23mQHf7uwmWm8=;
        b=p5nVik/CGiycvOakEDRQb7Y+QQD9cc9Tud52yhmPKud++eI58g967P/it98AxeRmSb
         nBcnFcRZCIzauvu89a5B0wvIM2/9a3g/KaSuoYFbqlh0ZcwcbHLNdlnGHp4saHY/qZMK
         94Q5FY/wYGSuFBNQnbkmd0/hSaz7qJUI2vvCgcD2R/TsLFdrFyWYk3FjHwVoI0iWRsEg
         sHG47kftmB8tdkj/ds5i2SIeaENWLZpO8PjDWCb1JlZWkyqGhHDP4inQ9ACUXv5AMMU/
         er4XmqWzuFe6CnMhczMyGeVTSGUBWpJzOlpUIyxhyRSbhX4ElrUDB6wt8EmZ1lCKmrID
         6nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7lvKyeCsiM6/uO1ru+ncuOCvR/DrlE23mQHf7uwmWm8=;
        b=GenfZF1+Aza8PL/luHyOCFPwAj3ICiUasvy/0GZ15+QLfiTpNKDn+oWXH8nhfqvW/z
         CJ3YOkdNoJp6DFQHfscZ6A21+ckJJcnQE0wmohMXjP5RmC6oqk6t9T+X9wIwrf+cZNP3
         aGip7bzY0H1p+rxKg/j3fUQRT1eeyw0kEjXwY8GWWWvl2dSb3QU8MrnZDoynqcmQs2BH
         /NAUN6bM/v7zX8Ynuuyr1uF1ktFmee4Q1bfNkqohuiQhTHcKZ4qA8M5pcH9Pty/zLNJr
         2uB7dcnHGEFYZUN8oKIxFioCDfW5rP6ByhuOIXOvbPEqfxu8+L0/k/gnS45A8HjLPIpp
         6zlQ==
X-Gm-Message-State: AOAM530OFHS74Ci8Gs7cx0L+KE8rtLuFEfChLDQ7tuOGSge2PnreKKKr
        EChKEzI0r95ce9Ru4LMJi6Advmht1C8=
X-Google-Smtp-Source: ABdhPJx2sp2vgqxQA+mVobuE61H4yRV8XyKV2SASBq/ghOtO0EwJJ4qm3qkIbv4cEy6fefpDbWbB+A==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr7482635lja.369.1599418320966;
        Sun, 06 Sep 2020 11:52:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 25/36] i2c: tegra: Factor out register polling into separate function
Date:   Sun,  6 Sep 2020 21:50:28 +0300
Message-Id: <20200906185039.22700-26-digetx@gmail.com>
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

Factor out register polling into a separate function in order to remove
boilerplate code and make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 43 +++++++++++++++-------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 85e4a3b61e4a..b5ec540ae2c6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -463,10 +463,24 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	return err;
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
@@ -483,16 +497,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
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
@@ -691,25 +696,15 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 
 static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long reg_offset;
-	void __iomem *addr;
-	u32 val;
 	int err;
 
 	if (!i2c_dev->hw->has_config_load_reg)
 		return 0;
 
-	reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
-	addr = i2c_dev->base + reg_offset;
 	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 
-	if (i2c_dev->is_curr_atomic_xfer)
-		err = readl_relaxed_poll_timeout_atomic(addr, val, val == 0, 1000,
-							I2C_CONFIG_LOAD_TIMEOUT);
-	else
-		err = readl_relaxed_poll_timeout(addr, val, val == 0, 1000,
-						 I2C_CONFIG_LOAD_TIMEOUT);
-
+	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
 		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
 		return err;
-- 
2.27.0

