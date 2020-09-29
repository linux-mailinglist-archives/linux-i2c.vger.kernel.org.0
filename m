Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD37827DBDA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgI2WWF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbgI2WU4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:56 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069C1C061755;
        Tue, 29 Sep 2020 15:20:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so7410236lfb.6;
        Tue, 29 Sep 2020 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LqOxqZnSM1Klocs7LgilmbCtwZ98vQsnxG4EkAGBKYM=;
        b=FkWR/vrqmhm9tPfZjO8wZJ2W+AnPiiEkvd4M1aMRBqD2r9O7OuQXLqL06aDcZZMbpk
         ISWYH65O0o9om/fyPAxeNGNh2pnUzOytPTSecrJCySYbdVeTq0/EzQ/c8oi2iKao20pg
         ZlE+1fY8n6Fl8S+D8EQLMshEtoEswSYPjYbysTSIu/EGpTpZ0XOvhL7fWE5W4fuxJHyO
         M4fqIsbroTol+BkiJHPPkfFc0j+H5wPw7Athhc9aenn1JAabR+z8BvzWKfexipotSIqn
         Ssm9RVansgXaB+/qOabxfoz3i5Z4Pp+B9UDiiSPaxIHZQ16eOR6zDnPfLtU7ZT669vLx
         PR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LqOxqZnSM1Klocs7LgilmbCtwZ98vQsnxG4EkAGBKYM=;
        b=QaYAPjUn9W0ax6NRb3Fo1SGaQVaMxgJEKqBOlzHJYzqBxqIUQrTghMw3bktf+4geZY
         VuJ1fcq/mn6L8pCPys72N7UjaNbMdeuG7P+ART+SVlGyokJVihqL8oxHwmUp9y41V3F3
         JfiPOyrra8oN4ijlTPN/SqzmFpcZ4lVMc/rmWylE1zss7TLBfnc8LpZlAJqj9lga25XG
         l+y33Ni5P7sVpxlZAN+TVHwe1PirFOczc1M7P04oplOja9Z1R50Xk16rtWFPE6qvFjWw
         yxNEMAi/HeA1U1oCmVWH85xmQRVfy+MRn+aZ38fXSAm8EBQlyEjq0w+JvigS2eUOc2uE
         Lsjw==
X-Gm-Message-State: AOAM531BqiFXXv7XlPmrce933bqtrA8A5542hmmBHHlh00EOFIDV89BM
        7/nq2hFQphix3PuZjGNiw3c=
X-Google-Smtp-Source: ABdhPJzVeBlBAIgIskZfsEnEnVljj3YjRnD9Coba7pD9hVqRvmSWnLt3QZFO0g+jgM4M2OgKnDRW+A==
X-Received: by 2002:ac2:5192:: with SMTP id u18mr1886444lfi.464.1601418054270;
        Tue, 29 Sep 2020 15:20:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 19/32] i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
Date:   Wed, 30 Sep 2020 01:19:02 +0300
Message-Id: <20200929221915.10979-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_wait_for_config_load() checks for 'has_config_load_reg' by
itself, hence there is no need to duplicate the check.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index dc25578adb6b..79fa98423cae 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1082,11 +1082,10 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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

