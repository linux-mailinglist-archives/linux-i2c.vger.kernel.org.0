Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F30C25A090
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbgIAVM0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbgIAVLj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1F1C061251;
        Tue,  1 Sep 2020 14:11:38 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so3293676ljj.4;
        Tue, 01 Sep 2020 14:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omhBBLP5TS7dWR2SebTFFy89ZunnJTchedJHBVNNWDw=;
        b=BJ7x0G6WRm+xkWFNnOzrKW+C6+9zLA5Nc8Tlufc+DNHcYPzWf/SyvPwVFgTWt+2XVl
         3Zc7wiHQQX4tsexrakpyAd1RQHPJrYmAB6IrDm6xAQZaPF6BHXuR6kny6dm8oczCwiz5
         hjuR1KnS7fu3iBJAeGBS85ncnCkyXuLw/3GZiSzk906mv584hcJLllVTnmAHSdLZZ/ZV
         npnX8YJ3V8MSrEsOh/Y5bR8ZYsZcMQEOcHCNwTVKuhTlJc1q9vhUm8exwAEC/d35ZGLH
         xwbukPy8Ce/LdpyzQy5RkypbJPL4V0vGJ6asM30C/mHmwh3YSB7z2LllMNpwKcrp/2Zq
         Ci4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omhBBLP5TS7dWR2SebTFFy89ZunnJTchedJHBVNNWDw=;
        b=ddfeoXmI+nodQk8PeN8oa1xK6RAGGGNYHc7uLHXDHPiyfXHDXevXBTDKb9MsJ+tjU8
         3+P5ObkO0+bc61IN06F2xNDit2Gn7oCCYAa/8EiDhHrB0YA6Wr0dfUurVElq1tSB9daS
         BcJ7yRwW8wPxnqyBd3mH+3ljAQldge1vEffQAfBvvFizQ49BndO8kzAA5oyawJM9kQAN
         4oml4L2ekON1Uw0EKKI0F7ombBt++ALtJxYuio59vavYDC76JfqklEHMtMgeX0BWdAc4
         4dembxjsmBZEazOZ3QK3qUqwUYGPjPmxvwV7A8re5SsdZvLfMnf3SBqu7VO+Bq2lbW/f
         JNJA==
X-Gm-Message-State: AOAM530UQz++7QGQjYFvm0aNqtsnqTyx/40zNIPuWFWR43W5foGZqTmK
        il2fx5+anUUUoipiY8MkFwg=
X-Google-Smtp-Source: ABdhPJz7z+SHfCFZ09nRhDN4XlS/Qd31FKyxailLSioA3596ire62H5kaJpGCFTjZwo+F1y3iD2uKQ==
X-Received: by 2002:a2e:8805:: with SMTP id x5mr1642074ljh.130.1598994696774;
        Tue, 01 Sep 2020 14:11:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/17] i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
Date:   Wed,  2 Sep 2020 00:10:59 +0300
Message-Id: <20200901211102.11072-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Improve coding style of the tegra_i2c_wait_for_config_load() function by
making code a bit more narrow, adhering to the common kernel coding style.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9a807caef4a6..70691179f170 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -733,24 +733,23 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
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
+	reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
+	addr = i2c_dev->base + reg_offset;
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 
-		if (err) {
-			dev_err(i2c_dev->dev, "failed to load config\n");
-			return err;
-		}
+	if (i2c_dev->is_curr_atomic_xfer)
+		err = readl_relaxed_poll_timeout_atomic(addr, val, val == 0, 1000,
+							I2C_CONFIG_LOAD_TIMEOUT);
+	else
+		err = readl_relaxed_poll_timeout(addr, val, val == 0, 1000,
+						 I2C_CONFIG_LOAD_TIMEOUT);
+
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to load config\n");
+		return err;
 	}
 
 	return 0;
-- 
2.27.0

