Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D36D25EFCF
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729432AbgIFSy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbgIFSv4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94124C061757;
        Sun,  6 Sep 2020 11:51:55 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u4so12680173ljd.10;
        Sun, 06 Sep 2020 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nVnt9RmgqzoLlOicifJoZVvRetbH598rGnCQEI+Y24k=;
        b=VHnp3Zu5p4aJ8ASH+dyQqOwa90WHPLtyrXvrEFfcqjOuc7SPwK6F7/AV5Q8LMNqU2D
         CSYXXPgYFPBI62OX/J5rbUn3xcTwnls7N2UQwKG8SAkMuPWZJFH3mmGfKVJIdBGt8cWm
         RbCvja86YjEtLU/z6FRoYYDzuAYcNYQS4SIU6bVAH2y8nLf5fBvMkLHGe9Y7MbdgRRed
         Rrw//bk3Dd9jxOqDYcLvqcv4dd7PFRHFlehbFzenjGWp9Ihy9IeAUVy676mI6mMgt4H5
         ozFGfnNflTPZ2s9YnKg9j4TlO1LtkXq3TDE1JzMQwQg7B6k6WTUPsfXqCXW4Mjy4OtTg
         YwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nVnt9RmgqzoLlOicifJoZVvRetbH598rGnCQEI+Y24k=;
        b=qpew/jJJ0TCAyEhUHSn9gJ5nw6E9GjtId3FI2RN2yCfWORTAiALdOTwsUwDsNsZtAv
         udq4QlnJsmPd35pxDgxwPmirGrRfFEJVZ7bfhbeLb2eyU9XVxiqUh+AfNY0OqYqK3hcm
         Fo0s6giStIVi8OIhBkT4LQUlToKjrO+qo776jl5mxC9nvJhzOr2GVigH51xcVASTYBfL
         36OIpXoGK/IOMoCTxUhYfwbUYmyVh+/gE1hIK+Rf2xPvUAz0p6oPqFQDE1Kb9cVJ8AS5
         DU4V1ywBOc0vGYL5rPyAPhkebxKJNIiRNWd1DfZKjLPcpnIMR6GZtCx/X+elMGom1NYP
         LAag==
X-Gm-Message-State: AOAM530dBSh8qS6I849bPeTYZlptnbRtamegaNnaHRYRkSbLOyRtd4UO
        6VVtLSUmp0FWMaAQq/WvVE0=
X-Google-Smtp-Source: ABdhPJyFWwRZKUnJGzIHSmdKB3+UoIivsB9OVTMCSGO6w22G7zgJxxMMP/SqlZl8orZZZt6tCN6GyQ==
X-Received: by 2002:a2e:86c7:: with SMTP id n7mr5662187ljj.229.1599418314096;
        Sun, 06 Sep 2020 11:51:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 17/36] i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
Date:   Sun,  6 Sep 2020 21:50:20 +0300
Message-Id: <20200906185039.22700-18-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_wait_for_config_load() checks for 'has_config_load_reg' by
itself, hence there is no need to duplicate the check.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 95ee082fe3d8..20168e49dbb2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1117,11 +1117,10 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-	if (i2c_dev->hw->has_config_load_reg) {
-		err = tegra_i2c_wait_for_config_load(i2c_dev);
-		if (err)
-			return err;
-	}
+
+	err = tegra_i2c_wait_for_config_load(i2c_dev);
+	if (err)
+		return err;
 
 	reg |= I2C_BC_ENABLE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-- 
2.27.0

