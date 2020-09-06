Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1EA25EFC9
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgIFSyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729197AbgIFSv6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2BAC061575;
        Sun,  6 Sep 2020 11:51:58 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so986208ljk.0;
        Sun, 06 Sep 2020 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1NRnKWnLSmmGFzbb/eqooCRpgvjRpar3TZYRLigLm7s=;
        b=hj6Smq5VBdv8QUa6w+/cLKJ+3KM0w6ONfdiBs1b4juQrwOEoTHE1u76ZvxiGSkhI0M
         vFBA7WAOElxHRg8O7x1iwY2ZPegJOlK6MdpJSZGBMGwzrK2uJG+26OHAeS1hj7Fzwl30
         dyCyawvXva2DfdPnQoN17EKAJv1uZVFWYJ87WMaCN+ES8RSJKug+ZU1t8xWCk1PipTpA
         sUW+VAb7kqLedg07xMJ1ZbYu+2t+AOZldiYELW1LpRAIdcj0t8tRrKqEhX9LYvJfuLpw
         jYsHFlqSV+LJTtHphNAacagifiHmu/IUHzur0poWQm+wisATRIsxkeUyMDb3vkFyVbuO
         BErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1NRnKWnLSmmGFzbb/eqooCRpgvjRpar3TZYRLigLm7s=;
        b=BBl7J3ep0+lBKnz+9kMrb3dYu/g4FPSdpg83zdr1jgrKPZKVajYiIsgj4QtuciCQgY
         kGQ32N4thB10biNTsk+K6/yVOkCpPmE9eXIlHXAaEMcONRrSYGkkPa/lxCTILxNSgCTg
         iJlNossRNCbUT8Qd3m7q9SwU3av9I5tk2YzGbTrDPJUlFQ3AGcXxfHL1ejS2e1kMURYp
         45LEzpD+FrlxF0Am6I5dTx7d+DJeEj7nLjW9BmMnXBGSfX3R0CONimtSPbC6J3VM6y6p
         yROi2SQY13Q7Pd/dTu6hBpsme6rP+4Mc4wXiLLa7N4MWO3OQ+cItNf9AyoloNlxeEsFY
         pung==
X-Gm-Message-State: AOAM531ym90IOU63+Q6C29+0s8i0NnNT+2VVYpciZ27fuhDVGEYvi+Gt
        98Ymk2xWNnj5R02KCWaeJwc=
X-Google-Smtp-Source: ABdhPJzuh23AZhsyk3GIc8a57fOWw+RTboWljqxQBH/zDZbocFkTD/VPimY3Ul/UtKncO3Rx964zPg==
X-Received: by 2002:a05:651c:290:: with SMTP id b16mr8111127ljo.307.1599418316701;
        Sun, 06 Sep 2020 11:51:56 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 20/36] i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
Date:   Sun,  6 Sep 2020 21:50:23 +0300
Message-Id: <20200906185039.22700-21-digetx@gmail.com>
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

Improve coding style of the tegra_i2c_wait_for_config_load() function by
removing need to wrap code in order make it more readable and to adhere to
the common kernel coding style.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 5ecc9f7c9b78..eea07aae2716 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -696,25 +696,23 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
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

