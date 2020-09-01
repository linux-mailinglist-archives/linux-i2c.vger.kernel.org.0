Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A7825A09B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgIAVMo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbgIAVLc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:32 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A50C061247;
        Tue,  1 Sep 2020 14:11:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w14so3293381ljj.4;
        Tue, 01 Sep 2020 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZYfcEkg6MN7XwZIXTI1VLSEAge97NsZf/nSNk/9wRjc=;
        b=kgVU0FQL1ZNctd2YFK0SWhXHis7NuQPcskeeA1kGqOjaNH4lBGDOICmwMwWb7S5z+A
         sEZ/fmxlOM21pMWMvucdrOFTz+w74ahkGGLLjsUUkOkmhWSK2hfwSJqzXWA0t1CuFvl1
         dG3h4gcTiQus9ZcOFMtqKLe8zizZDsHYMURrhouenSyjdyMkaAMrt9+Q2TioLJQQbP2S
         2i5ud6s7xIQzfBL7I/ysSm1fLs8G28O08bqlkm5QKHt49BZ1TU44A0eBVSresQGwrLp+
         Uee5AYli00AU4wPA1iETlQoqyoNuYqaCSd5/JsdxzBdV2MACv4CpqevKQqom2H9YSIzD
         ZkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZYfcEkg6MN7XwZIXTI1VLSEAge97NsZf/nSNk/9wRjc=;
        b=LM/rmWZBpis5ByOQZotR1oxwxRQKZaIvZZQxwZJk+vWtAjBRp9Qx53IOtBTH2eenfd
         PFrxRRSt5hzlXH/NIC1jM+KiplK8dZsSIjsWlIi4nbRLMjHUMWJAkpGtdAUyCo5U7iN3
         r5OI8Rrz+NrI92Rtv2KEqk78lR8H0Y3Cl0XgsvI5B35NAPUUdTL0wywT2IJYkugbzuYx
         bX5JV+9IzFC0DIRdxAxEG5U8odt0FgqdwkOc24YQSNcuPJckhIJJz7REaDzjesA3edGN
         j790WKFPXsz83QPReKK9iMPKy0FNkR4CHSAF1kfPc6lt9VXZ488fEoZOn1T5t5xNsZr3
         fegw==
X-Gm-Message-State: AOAM530w2CWUApcrDceIXmhczsucmR/4rFoJIbFLnUzOHdChhYUA91ik
        gLsy0NGucVxHgx0UBFQDB+Y=
X-Google-Smtp-Source: ABdhPJyIIDPj3sHfxDUiKnQ8Eti6WewnyWpF6xGCCDK0YJJPEvku3AmzrMN4LpGn3veJhqImU4reGg==
X-Received: by 2002:a2e:b1c4:: with SMTP id e4mr1627979lja.379.1598994690234;
        Tue, 01 Sep 2020 14:11:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/17] i2c: tegra: Use dev_err_probe()
Date:   Wed,  2 Sep 2020 00:10:52 +0300
Message-Id: <20200901211102.11072-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use dev_err_probe() to replace the manual -EPROBE_DEFER handling, making
code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 16f105283145..c142b424e46d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1646,8 +1646,8 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
+	struct clk *div_clk, *fast_clk, *slow_clk;
 	struct device *dev = &pdev->dev;
-	struct clk *div_clk, *fast_clk;
 	struct tegra_i2c_dev *i2c_dev;
 	phys_addr_t base_phys;
 	struct resource *res;
@@ -1668,13 +1668,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1713,24 +1709,20 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
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

