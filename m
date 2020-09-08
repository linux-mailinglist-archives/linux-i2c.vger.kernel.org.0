Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF940260865
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgIHCOk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgIHCMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:03 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EFCC061757;
        Mon,  7 Sep 2020 19:11:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t23so18046322ljc.3;
        Mon, 07 Sep 2020 19:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CH+tGayY3Xii8pDTmAx+Z65LYWNubZeJ2KNGkfprF0o=;
        b=q7LQSWJoPH17LhpG8Ij5kxBGv1GINCpyByNSRJS2267Vv99bG1eccilS5yxAAPHk1P
         cEVIarB3wZhH42itbXveTltNS7UF8EXujaixR5BA0pYUYBhseh1usZyXmwLGmUQHcA2g
         sfBdZ8EbTMrlZJp1MGAh2yAbDmLFap08lqpjRVJVtO82Cb5xtCF5lAjlbAPNi6rTNOGd
         9M2d+kMMkAhunnDvTK0uyHaVVHh7kkcyzW8XSU//7zNcqN+VR48sB7GcApeFFdPlvOH2
         3cfOoiXepbhpvOXCB8OybV3ewZzytQS0NtXXisT5bux/9PumSQXDLxXOHpySFjOwM8wZ
         T7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CH+tGayY3Xii8pDTmAx+Z65LYWNubZeJ2KNGkfprF0o=;
        b=OZNLEV53488aZ4tMtRK1lQVdwJpXF3KnS41V22GnJZT9S0rM1LGLMkmo5c+KKEOJEd
         T61wD0nsRNZ8YAN92BEDfO3O2pzjNdWH7GWs9BRtAXMvAHb7M3yl9Ztk3B4mDoQJsTeF
         BJZOfAR0nHrPqwpQq4XPD+yqpnRDDM+4TkDI/MUk+IcM04g7KHiwj9jTt9dk2uFo/lhU
         yavMa1FRevNZ8l+biIglUF1+jKSnmk7EnEXvpwRtmNhjZhsdrAZJXeLhKs0pS1+W+RTJ
         v2mZm9rRLtSGF1GeTYF5zEZDOZ4NGZh+RNrx0AgnDk9N8WtVKVZyS+8a0CqQBEpuf6RZ
         G6og==
X-Gm-Message-State: AOAM530Iuie91Exl1KkI3aQagQAfDzioWurPlRMnWkbK0buIRsipYIES
        QFAsitVaHrQY/YMhiZcbbqs=
X-Google-Smtp-Source: ABdhPJwKeE4jgVr/H5XobpJ54PIi3/2IyL+WLcE37TDByo0BizuVIollVgNmlCMYEYeVUKZcfCpMlQ==
X-Received: by 2002:a2e:808a:: with SMTP id i10mr12109982ljg.313.1599531116440;
        Mon, 07 Sep 2020 19:11:56 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 23/35] i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
Date:   Tue,  8 Sep 2020 05:10:09 +0300
Message-Id: <20200908021021.9123-24-digetx@gmail.com>
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

Improve coding style of the tegra_i2c_wait_for_config_load() function by
removing need to wrap code in order make it more readable and to adhere to
the common kernel coding style.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index be7a09041871..c16273c13291 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -562,25 +562,23 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 	int err;
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
-		addr = i2c_dev->base + reg_offset;
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-
-		if (i2c_dev->is_curr_atomic_xfer)
-			err = readl_relaxed_poll_timeout_atomic(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
-		else
-			err = readl_relaxed_poll_timeout(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
+	if (!i2c_dev->hw->has_config_load_reg)
+		return 0;
 
-		if (err) {
-			dev_warn(i2c_dev->dev,
-				 "timeout waiting for config load\n");
-			return err;
-		}
+	reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
+	addr = i2c_dev->base + reg_offset;
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+
+	if (i2c_dev->is_curr_atomic_xfer)
+		err = readl_relaxed_poll_timeout_atomic(addr, val, val == 0, 1000,
+							I2C_CONFIG_LOAD_TIMEOUT);
+	else
+		err = readl_relaxed_poll_timeout(addr, val, val == 0, 1000,
+						 I2C_CONFIG_LOAD_TIMEOUT);
+
+	if (err) {
+		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		return err;
 	}
 
 	return 0;
-- 
2.27.0

