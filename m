Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6749F25B7E0
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgICAzD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgICAyH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0791DC06125C;
        Wed,  2 Sep 2020 17:54:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s205so1405503lja.7;
        Wed, 02 Sep 2020 17:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fKC7ox5xjiDQwdax/qs9twZjRL3I7mSAjSyh7NydcjE=;
        b=gQvJG7MD5FQFlPScPf34fcl1WXC4zyp8EvZmt5Fyz5vhk+KmD1PKEGNcKGUV3z0ibv
         j1nS2ptI+CAs3fygoGy+lMCYfGYARgkyL7Pfug6tLAY1F9BnfY3PUVjACVvew9r9J7o0
         F+SGsT7hGYCqUJMeF0qkeY47WqfjGu9DaRbZzsrsYAokkiy0IyT/YQzJ0fpqO2BqBMKF
         bStwWW+NgLVrL1Tzme+j32+TObwjnIWVUGay70jP6KCjg8q1XLgG3l4qosM4e140G60g
         YFBJW5+4kpL1qIq6gbqdo9usAsZJFqOuJgMpV0ZaQG0VAwITEsvEaiw0FD1t2q/MwRzt
         O4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fKC7ox5xjiDQwdax/qs9twZjRL3I7mSAjSyh7NydcjE=;
        b=PYxLKjkreXTroPIFvVHESCCBEz4z2UnTRz6aUbVFZmOV7jtbtV/lIIg2cDSG1HAtUh
         AvlXAa5BXbkauqqpEW73dtu8uTNvEm7JiYs8n5gA0iWzS1hsxC5WRj3fqm4/zoY/cPb7
         0J9vRmi7NAP9UUgVcBw5atl/LArcm9dtbQLeEf+RS0d72fJbEbMwS3Lt7QkRWQ0xtJ7u
         dGj/O7hrMiJpoZS81+t9wBspVwMjs6MMQQZzGtyDYDwvFvGyz+9wsIksqzSKcnNB69On
         OdSd9+6hne0+FaBBmZ2iV7bS7jsn9GuJ+CtXYLi9ZfQcZbPjCopXK64cGdvL1dTEC4He
         fsAg==
X-Gm-Message-State: AOAM530K3uI8mnc7SGoqQ+vkh+1Xao55mwVkxqmEDfFtYv67oUa+Bjno
        zDCb7dm8QqivjMjItoulnx0=
X-Google-Smtp-Source: ABdhPJzeBY4SCv1hVAtRW5GZhA8whuQJAd9g4tLjAIGyxziPiz3qU1/wjB4TcJAwz46giBqrjmLqMg==
X-Received: by 2002:a2e:968c:: with SMTP id q12mr273735lji.345.1599094444495;
        Wed, 02 Sep 2020 17:54:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:04 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/22] i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
Date:   Thu,  3 Sep 2020 03:52:52 +0300
Message-Id: <20200903005300.7894-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
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
index 0f2b6eb5fa27..7c5931639d42 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -743,24 +743,23 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
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

