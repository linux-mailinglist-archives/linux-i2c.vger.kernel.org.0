Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8BA25EF94
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbgIFSwP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729203AbgIFSwB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:01 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9868C061755;
        Sun,  6 Sep 2020 11:51:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u8so865453lff.1;
        Sun, 06 Sep 2020 11:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7OtLSTfQ0S+IgkE4lVHFt+06NUFbn0hYysWzQd0VDG8=;
        b=RPuSjTRib8bUKVFVCg+XQRm5lUCscZCuORRe6rgFtNbWH760VcwUBbj79tUDIySVD/
         MH7YS8mNpvrTUKbNMYT6og3Q1GTQczLHR42miKiVClNTYMDH2/fuCjxtF1UjGw8dYmKf
         /qYnl4PQQsP1dAOgC3+ZzRbadDlbq0Ga1VEx9y2Sp3LZcgoIGQByciTPie+9+Z5P5RQh
         9lZ3lAbNXl2cSXkUJinejkowuGieGbo4Sm5olM+plzer8xYnbh69Zh4sGzQfki2I4HUH
         86yZIolGHrMDPrXsB8fdlo/N+LgPV5mLGw0tbHFL3aJ83ciTQwN3QeWpBJYlqE8+6JY5
         qYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7OtLSTfQ0S+IgkE4lVHFt+06NUFbn0hYysWzQd0VDG8=;
        b=YbjWvMUTFaej8IUsGQTKPfJFDpX4mZajjV9vDpPWytvOEp3dD1q5WKPUrU0EfF7fmi
         8GbXVOllY8o68BJGJzpiJUFNwRzh3eMNle/46nxk4vKmBUagRxR8TzQvpGsrRX+o4AnQ
         KDmm+ao9Z5jlUfIurvzDdnhBgMWNwo9s2YO+gXOfmVEOL7rKIW6rv/iF65ckJO2Yw+sm
         phe5icrYStxzVCtbZa3czQp7jjRzvDGoQJdOgM9BmE9eY5Ur2XVaUAz8RYZjwl6pdRCn
         zcfEpsBU3c4fAldUnblZSpbKoxk15JdEvJi9oqYfuqAr9nHVncrpk0IsOCPU/IyzVzV4
         fgDA==
X-Gm-Message-State: AOAM533asluwtjKZSA6eBSvYnM+RbbkVa7QlRru3ZDduC/exzZ0FHB+e
        e7m2H1cZQP8CehnekqULK6M=
X-Google-Smtp-Source: ABdhPJw7ZOUT5m+cY/9+7uWecqIS46A0YFRzmO7llDaytTstL326zdfOV57jX0uawoq6AEk3NjMXag==
X-Received: by 2002:a19:e57:: with SMTP id 84mr8599996lfo.161.1599418318377;
        Sun, 06 Sep 2020 11:51:58 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 22/36] i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
Date:   Sun,  6 Sep 2020 21:50:25 +0300
Message-Id: <20200906185039.22700-23-digetx@gmail.com>
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

Rename variable "reg" to "val" in order to better reflect the actual usage
of the variable in the code and to make naming consistent with the rest of
the code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4436fecee283..8c87382b1612 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1093,20 +1093,20 @@ static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	u32 reg, time_left;
+	u32 val, time_left;
 	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
-	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
+	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
 		return err;
 
-	reg |= I2C_BC_ENABLE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	val |= I2C_BC_ENABLE;
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
@@ -1118,8 +1118,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
-	if (!(reg & I2C_BC_STATUS)) {
+	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev,
 			"un-recovered arbitration lost\n");
 		return -EIO;
-- 
2.27.0

