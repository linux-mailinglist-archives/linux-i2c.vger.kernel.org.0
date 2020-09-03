Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADBC25B7C3
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgICAyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbgICAx7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:59 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6DFC06124F;
        Wed,  2 Sep 2020 17:53:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r13so1455778ljm.0;
        Wed, 02 Sep 2020 17:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TMlA3jr28uMb7L0xhhBkqq30RApgcVYpT2jSq42Q4zw=;
        b=cObvUMwPsKab4wBfLTRg35yhngfJSHZUNorm6LgzTnhGbwFFAkudXUPrGlzSwnfYsw
         8rjLWTmKohk99B/lz5a3mmxyxzzAEwxl3dh7JQGNLEcKLZmyNtI0pVM7vBxjZ9utQLy5
         iqfqU6BKVcoc68sIPYziWgWz8+SprYB6xPzl1Xn86Zkzi65ozeNDedCXQSUXh5FtOM0U
         q3uaBth5x/yUa92M0IdU8jbHOmWP39XmgQmQiGFHqqBiBbxuV326QjAgLeMLC+mmDzgP
         7hQA1MBycw/6deo9a2F5eQfoifYMWmJc0rgWg7HS9kP7Bv8V/5b9hgt4wEEp2Yf5egRn
         6pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TMlA3jr28uMb7L0xhhBkqq30RApgcVYpT2jSq42Q4zw=;
        b=tGlqpIkPTY+2s5dJ9rpz62tGzTSEI9/JWip+wAd029ZmMEe2wpgaGAOPBiyCbsPw9l
         TZvASNdbOjjW+JKpVV3i2O2Twlhdlxs+EQ8msPfNKPSHBJ1aUzv0UFTrnzf6lBr2gJ3l
         +a8xxCEKuIGV4H1w6UnHY/Qf0GIxiLV3BTpA20DJNpJr7Hf3IT3hQeiWmg1G5UHmM5Kg
         XvYH+p5dTXKaZE7PlGrkgdzZdrGf+3KeLjgjEHTBh2pZZh/fVMNvMawuJST1jO6q5VYN
         OlC2a1MTEO8K1QsU8InLE94f4OGabjEOwdJlcfz0r/S41zSBcb2bP95ELYZLIob+R3Mk
         +e7g==
X-Gm-Message-State: AOAM532SGbaYh0+8/Asoub0ACILJYP98a5l+hnM8WSJuTW3zaMJROhzt
        p+1qRpQV5319WU7Bu5MDjA5kPrx6r9w=
X-Google-Smtp-Source: ABdhPJw6j6sE1V4OWWrXm5q2JE8KSvqHg66382HIAcN3sxocTcr5TzADcGQxxrbbJQeGABySQ9iy5w==
X-Received: by 2002:a2e:b8d6:: with SMTP id s22mr283144ljp.284.1599094437694;
        Wed, 02 Sep 2020 17:53:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/22] i2c: tegra: Use dev_err_probe()
Date:   Thu,  3 Sep 2020 03:52:45 +0300
Message-Id: <20200903005300.7894-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use dev_err_probe() to replace the manual -EPROBE_DEFER handling, making
code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 98b1a5656518..409f6bc5caa8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1656,8 +1656,8 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
+	struct clk *div_clk, *fast_clk, *slow_clk;
 	struct device *dev = &pdev->dev;
-	struct clk *div_clk, *fast_clk;
 	struct tegra_i2c_dev *i2c_dev;
 	phys_addr_t base_phys;
 	struct resource *res;
@@ -1678,13 +1678,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	irq = res->start;
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
-	if (IS_ERR(div_clk)) {
-		if (PTR_ERR(div_clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get div-clk: %ld\n",
-				PTR_ERR(div_clk));
-
-		return PTR_ERR(div_clk);
-	}
+	if (IS_ERR(div_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(div_clk),
+				     "failed to get div-clk\n");
 
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
@@ -1723,24 +1719,20 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
-		if (IS_ERR(fast_clk)) {
-			dev_err(dev, "failed to get fast clock\n: %ld\n",
-				PTR_ERR(fast_clk));
+		if (IS_ERR(fast_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(fast_clk),
+					     "failed to get fast clock\n");
 
-			return PTR_ERR(fast_clk);
-		}
 		i2c_dev->fast_clk = fast_clk;
 	}
 
 	if (i2c_dev->is_vi) {
-		i2c_dev->slow_clk = devm_clk_get(dev, "slow");
-		if (IS_ERR(i2c_dev->slow_clk)) {
-			if (PTR_ERR(i2c_dev->slow_clk) != -EPROBE_DEFER)
-				dev_err(dev, "failed to get slow clock: %ld\n",
-					PTR_ERR(i2c_dev->slow_clk));
+		slow_clk = devm_clk_get(dev, "slow");
+		if (IS_ERR(slow_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(slow_clk),
+					     "failed to get slow clock\n");
 
-			return PTR_ERR(i2c_dev->slow_clk);
-		}
+		i2c_dev->slow_clk = slow_clk;
 	}
 
 	platform_set_drvdata(pdev, i2c_dev);
-- 
2.27.0

