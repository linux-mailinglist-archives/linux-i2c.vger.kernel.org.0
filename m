Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6088B25B7DE
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgICAyv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727881AbgICAyI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:08 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F191FC061245;
        Wed,  2 Sep 2020 17:54:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u4so535135ljd.10;
        Wed, 02 Sep 2020 17:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=awlTr+/jK6xRAU2Z+v5rJTj8OB3fgcHycxXMdhCQDDw=;
        b=eJ7KNqgdpjQSLf6TzgWaqSc7j4jGso2nIRMoGmjcIiklLFi+/YA1109SbAXUOpPDld
         B5Z6D6wuTZ2RJ45u0ljD3qS+6ARPhkzUd4KTVwQNOA3El6vSF8EMjZ+hOqYsTabrpAJp
         FgrMAYT1xvt8rhVJHMz9/o7fHHNmz+CnO/Ci3d6XLbpd8BzhgJUNDQQLW82yjAJKAH6J
         ue3gGrIrVl2SSEQmgNGFBmhLOn87/JAD8TSIxNY0e/6mq3s9K9W7T7IhZCpMJraeW8T2
         QcLRvWsfyGy0RUuil0nLLAT9Lb8cS92l325sDFxF89TW3pLa0UZFOfNGDkd3M0L/SVkT
         uhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=awlTr+/jK6xRAU2Z+v5rJTj8OB3fgcHycxXMdhCQDDw=;
        b=PiszuwtTkY8D38uJhmP1VLBD9iCHEMBOvDDQJq/5t/HjGYhbp1k0BjEK1ulJxdS1ku
         hpesUUFgV/AfKRnRTBaN3VhWbZj0pM8aPEr7isIzI3ub/mYRUPdraEzKdNT3ImE1JV/a
         3MD12twkWTRXKnJflaXaEBmKt5ALpVfR8+OCwkYuHyJsh5JxJQB/14Evy7s8BEq6k2Ip
         qAGirwYwuXjxwA+UgpMixtLH7MMnAsVzRcxnElhMUa+51tFUd5zzZ7UJR3U1ZNP+lZ0q
         wqzX6ZimI+wi046TCPoBmf63yX2ljEUOnY6OJbTGq+vuEpnuO9ETpWbzjZbzCnaT0KOa
         OCyQ==
X-Gm-Message-State: AOAM531FyzPXqRml2Vkf8e0TcDSijB6LJ2gaN9P99NOXNLjmm2NOw/0/
        G8bXhqeo4QW8bTv6K+Tj3Kk=
X-Google-Smtp-Source: ABdhPJwnCApj+uKfGK7ZhoIIjDKz5/UCdf3UKTEJpotbrr0LJQXU2BgmRD2mSrTuradWGr32FYWysA==
X-Received: by 2002:a2e:7c0f:: with SMTP id x15mr264099ljc.205.1599094446373;
        Wed, 02 Sep 2020 17:54:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/22] i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
Date:   Thu,  3 Sep 2020 03:52:54 +0300
Message-Id: <20200903005300.7894-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename variable "reg" to "val" in order to better reflect the actual usage
of the variable in the code and to make naming consistent with the rest of
the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ed8f2a7c2804..67f2f4a0fe86 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1137,21 +1137,21 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	unsigned long time_left;
-	u32 reg;
+	u32 val;
 	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
-	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
+	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 	if (i2c_dev->hw->has_config_load_reg) {
 		err = tegra_i2c_wait_for_config_load(i2c_dev);
 		if (err)
 			return err;
 	}
 
-	reg |= I2C_BC_ENABLE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	val |= I2C_BC_ENABLE;
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
@@ -1161,8 +1161,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
-	if (!(reg & I2C_BC_STATUS)) {
+	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
 	}
-- 
2.27.0

