Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49A4274CA2
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgIVWxC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgIVWw7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:59 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32EBC0613D5;
        Tue, 22 Sep 2020 15:52:52 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so19880453lfr.4;
        Tue, 22 Sep 2020 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wtaads8+ZYjb9J6pb576PwvTjW9h+PesWRshKV7FPnU=;
        b=l5UslqCFpdn6RqJ4peEARmOSlWHEaB81YKnaXUtnvr/Ky6nRbNuAmL2nrwMXFmcTZh
         AmlOBefbfq94Uj5wpf7uZgCHx0CzTuINT+yuMtFz+ZeKnckXT2jg70E1mV18xqsqJ1Ej
         sVi6yj4DPYGmex+5NOlBFl7Rv51HkkMkSmj7CCZaZ+FBYFxyD3nj7ymu3TGpKkO76zuM
         6zO8MKsF76VH6/LnhUFuHezmcs2yHaPi7szvFikDmqLdg9m3r8G04s2L9M6hyWSuFKsi
         WA2ILueSHLG9itz1wLX8qqHzKnpuR+OcTbfSm2Uj5UkBxCtZUmkJTgieeFG8weB8zpvB
         xe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wtaads8+ZYjb9J6pb576PwvTjW9h+PesWRshKV7FPnU=;
        b=ar4/3vYVHxf2215Lq6mA92o5fiLWyRkRN3hI5m24QpbqRWB5Zb/yQZ3Vx2YYSz8ua3
         /h1kK3plpGSOyXyIIAxIUOWv/LqY5GfwaWT0PqooqzerHHecdJEsYLTLtQ299lbnXNJ6
         Ostb7ppEkIHfSDPYKfqk61Oed2GYj5ULt+5+dGuPWWkc6PJAnua9ienrEaNDnB1gLGrf
         9Ze2E3SLAP4ZmxasCtJbGQOuTA3YKaNEYIu8XxnJR8sJGTzj4THFqRPjXHtK01V9CD2u
         69J1Q9GKOoNwy3WstjloCSsuadSGG813peF2oQiSJ4WwSMkKWg/rli7u2eVkx+wZ4hRf
         Fc5Q==
X-Gm-Message-State: AOAM530ZPe4merKydRQTdPrZA/+KecyF4O0ivWChHEeua6YVYnlJIlD9
        nZCUstLJO7zDD3Vzov6elrVMwXpI1CU=
X-Google-Smtp-Source: ABdhPJzHwAOymCBXdVn70qD5UJtpwAX8ME3AXLhs8nQcVOFOY9PR1K96YqaqHAGYWk4LKWEVop12zw==
X-Received: by 2002:a19:c6d4:: with SMTP id w203mr2618519lff.245.1600815171440;
        Tue, 22 Sep 2020 15:52:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 22/32] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Wed, 23 Sep 2020 01:51:45 +0300
Message-Id: <20200922225155.10798-23-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out error recovery code from tegra_i2c_xfer_msg() in order to
make this function easier to read and follow.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f8bee67370aa..95d257cbd800 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1105,6 +1105,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
+				   struct i2c_msg *msg)
+{
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
+		return 0;
+
+	tegra_i2c_init(i2c_dev);
+
+	/* start recovery upon arbitration loss in single master mode */
+	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
+		if (!i2c_dev->is_multimaster_mode)
+			return i2c_recover_bus(&i2c_dev->adapter);
+
+		return -EAGAIN;
+	}
+
+	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
+		if (msg->flags & I2C_M_IGNORE_NAK)
+			return 0;
+
+		return -EREMOTEIO;
+	}
+
+	return -EIO;
+}
+
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
@@ -1288,24 +1314,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (i2c_dev->msg_err == I2C_ERR_NONE)
-		return 0;
 
-	tegra_i2c_init(i2c_dev);
-	/* start recovery upon arbitration loss in single master mode */
-	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
-		if (!i2c_dev->is_multimaster_mode)
-			return i2c_recover_bus(&i2c_dev->adapter);
-		return -EAGAIN;
-	}
-
-	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
-		if (msg->flags & I2C_M_IGNORE_NAK)
-			return 0;
-		return -EREMOTEIO;
-	}
+	err = tegra_i2c_error_recover(i2c_dev, msg);
+	if (err)
+		return err;
 
-	return -EIO;
+	return 0;
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-- 
2.27.0

