Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478D025EA7F
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgIEUm7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbgIEUmr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:47 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23122C061249;
        Sat,  5 Sep 2020 13:42:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w3so11781671ljo.5;
        Sat, 05 Sep 2020 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kYXy9dfHExgxjLgpe6Tj48Tl8bg38MQCS+DGdOY/xFg=;
        b=s0XKWbS8uYdgVzUHXWWGptlnH1s0rkhwEj/WMQzYdgeH61AKW9j+9UT5PCjFIg2OZm
         4seqyDK83Nu9qYrd3INE2VKjbVEzKt1zxC9SMaZxJkXRMp5WVV/zN6aF6ZoBUDuylT/8
         +E9vfjxmlF2ow5HHTEL62t+kItlKTyuhHqxZXtG4baryrEhAC/gfgtsTZivuB7+j+an7
         AU7wUBfO3WOLY1ebuZLaLFbMS2wqmCB/j1661IeBM4lLuit05rzxhyqGlxTH4rFAQFPO
         FKM6FXRAdh/0M0ROGKaJWd4tCj4pfu8oqnq8FeLNciZwV0gVE6oZtXhERbAhu6EpeZuf
         KPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kYXy9dfHExgxjLgpe6Tj48Tl8bg38MQCS+DGdOY/xFg=;
        b=eepG53j9/mgzg765LD8Zr9YtnOGLIFcHD2AuFIrQ2wmLf1/zJcGZ+X1fPIFkb6P552
         TebL/Jbd2hGiH0xVrEdlt2qzq5zRssjaR/nxOyqMjhQOGzJu20dlXIwLCE08zCRljR+H
         GnwIxMlTIush0uFhXha2jEVFHrd8r7ElhZ73sfBUQqfmfudPHwdnVGCBDAlSaGHBC7kA
         WLRD5ugTmjQCsgIXSwLreIle4sb2Y1afwjOZMhfJqvHR06KU2Ntcfoekjfai0YrushwB
         ovH0FatmnvXhuqs9C/7Qogagau1ndH+WhBRypj841ThDGzTEqbhSupTuOSNsFpIeOmew
         3cQQ==
X-Gm-Message-State: AOAM531+Kvq0LjSGYPAAMcCtLz24cd/PGERN5aXBoqNnV++ZPZbYp3+V
        YPRsABPjX7XljdzSiCY7wmv+auP6eXY=
X-Google-Smtp-Source: ABdhPJwBvmLyCsVEtaWx76LYZv+JCJHrYtvl2886f8XyEircY6dsbf7ypomhCUvhiSROYMWjTrEI+w==
X-Received: by 2002:a2e:7119:: with SMTP id m25mr1662385ljc.365.1599338565642;
        Sat, 05 Sep 2020 13:42:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 23/31] i2c: tegra: Factor out register polling into separate function
Date:   Sat,  5 Sep 2020 23:41:43 +0300
Message-Id: <20200905204151.25343-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out register polling into a separate function in order to remove
boilerplate code and make code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 43 +++++++++++++++-------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 129ca5a6cb85..68b2be321f9a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -466,10 +466,24 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
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
@@ -486,16 +500,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
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
@@ -695,25 +700,15 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 
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

