Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3F325EAA0
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgIEUmo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbgIEUmj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7C3C061245;
        Sat,  5 Sep 2020 13:42:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so11835759ljd.1;
        Sat, 05 Sep 2020 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=om5ZqYOPV7zYUej5+9JU/7wsUAJSLxumWbEil6zQbhY=;
        b=TQH3mROSnPqiFC5GgotpGRVgLnIsvuTdMNUq8gIWIbXUbjalS7xrvCFGcI9xcXkD9g
         TKUbgB220Vjm7mr4YR3XNLsf3wiMQoQkuWi2RX/XY9e4XMIRUS07RWhiX8coZQ7hVQ1B
         WprOEKphzSD+h+Ga7k+sJO8IClFTvVDRlDgyY/rjveFNeB/k77AksjQ7UWQ7xYc7vdOU
         /UCWu04V8ZADAIFrfNmejyOvK8Iu2lmWKcS2x1pHHj7BchezcKXlPueO1BmyjyrJLLJY
         D+85BQUXjPJoMMBwiJsXTkBfNch8YCveCzhpn/huVjYUEsxAcsJCvZX9T3Vmi6OV9KUV
         6yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=om5ZqYOPV7zYUej5+9JU/7wsUAJSLxumWbEil6zQbhY=;
        b=Tb2cE/+QpRR/YmED06Wkgu+n6PP9O8BTi6BHa5Rnrz4Ur9vrkK/fMVrycemFLn9f1+
         3Hv1J/wiNLUchsJ33QZMFKLxI7DcBVA761g9W0iuZ9WqcroN4Z+Qsq3Pg+2CMyUZFsXf
         zg1uSvpAWwkeooN7u4nnjWqwd1sGQ/YwpBsRGzQa4yEjNVBG3bPab7Q5a90jd9+QVhOP
         IjVZ5BbU5OPkKtQIMo2wsEqpcBAg85HqPR05f2OFciTjcP1LDRBiUgTV6minXblg7k3P
         jR/lUp4ujxXl2Dd4N42maEdrWjFMfjFAl1D6xrozrHPLfsyCbfyEx+Fceo4ewZfOeVkQ
         wWZg==
X-Gm-Message-State: AOAM530e81f7RRALheW6r1GMDj9thEKF1RjTBQCqTfVuH0fPgZpNmT91
        9mBsCMixMzsbMgImnvDQxnc=
X-Google-Smtp-Source: ABdhPJyQtkh+776YlePdn2LGvn/pl5vPELb5m/QV1cHzjOk9tK6Mf7xGiW5grew8km+7rg9TZtILoQ==
X-Received: by 2002:a2e:964a:: with SMTP id z10mr6719114ljh.463.1599338555890;
        Sat, 05 Sep 2020 13:42:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/31] i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
Date:   Sat,  5 Sep 2020 23:41:32 +0300
Message-Id: <20200905204151.25343-13-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move out code related to device-tree parsing from the probe function into
tegra_i2c_parse_dt() in order to make code more consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6e5af03d0b1d..d6bc23bf765e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1416,6 +1416,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->is_multimaster_mode = multi_mode;
+
+	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+		i2c_dev->is_dvc = true;
+
+	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+		i2c_dev->is_vi = true;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
@@ -1703,7 +1709,6 @@ static int tegra_i2c_init_runtime_pm_and_hardware(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
 	void __iomem *base;
@@ -1747,10 +1752,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
-						  "nvidia,tegra20-i2c-dvc");
-	i2c_dev->is_vi = of_device_is_compatible(dev->of_node,
-						 "nvidia,tegra210-i2c-vi");
 	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
-- 
2.27.0

