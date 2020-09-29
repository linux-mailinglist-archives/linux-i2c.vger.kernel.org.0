Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9432627DB9D
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgI2WUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728877AbgI2WUp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594B3C0613D0;
        Tue, 29 Sep 2020 15:20:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so5352425ljk.0;
        Tue, 29 Sep 2020 15:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H2rq0nVEOS84HR3P8fvBTnOUMIN2ZeUzy3s5LRGgHQw=;
        b=X9jdsjD08RlJ3UQ+VUNmGvQBwIv2CRN+aiW8cLMUXxcF/+QjGar7TTOGvEg1YiK59D
         0jM/Rln74pwfhKWAnyUPpNijsI0zO9fVT2+LwiDLmncECNpXr3C0f/MbsJGblxsrh9Qv
         IcW4k7VFEbMBSY9kp4ORhEg3xrC35hopAWzPaxloQd8ixXDVlN8wns37gpFi6Tw9dOqC
         /eBMEQ5hM8wz2UN0X2W1ZCMxWvJTddBt+EG0TcdMGzO2vN3YVqWkZDo75Qe1fNJrdtM1
         6tbhlssmxnnppnSslu1cUs2rq8equmyRlUEwTH4/KxhdakL0vmSmLCsbOl/m0d27YQxn
         Bi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H2rq0nVEOS84HR3P8fvBTnOUMIN2ZeUzy3s5LRGgHQw=;
        b=ehidjXzd3YNBAiLBWMO54DvjlrY0suhAAQ4tEjkngkP1rAKVcVO+2bK0Px0hAE12B/
         43/VrjBYemQ7TOfN/TPbIHEnb0xWViRDDhov8NCIQfckoX5h5+vU/BK+7YkSP2qjrPcl
         8ZifSa65A1Q8Sh//Kr5rFRSoWQYNh/FJ3QMnxIf79UB2P9UGBv2M/XSMI6x92oxNOriE
         5Ba9Tgj3mkxDvD6jPWcs3hTTDnOmOSh/z2yPDZRAQxjOjYF0susm+/GYKLBktyF7VvxG
         WTyAg5s+mR8eJiYofD/DEOHQMD2HQbsOzY9wzNuSJcPJKenJ7rUbwLUaBFsxCj1qf+mH
         xE5w==
X-Gm-Message-State: AOAM530B3NsWGZ/Qpd5IVZvLZTABdntjyX3s/8Ji+vSYXq8xy2U8cRzV
        1bbatlcvCQG1JjZEOfT/a5I=
X-Google-Smtp-Source: ABdhPJzjK7zBjNU6E8/l4mVy5XPSyPaA1cP21gRQAiIw1Z7Wa43qAO+v6yUmXLVYEJdVLbbF0GsPWw==
X-Received: by 2002:a2e:7119:: with SMTP id m25mr1937296ljc.365.1601418043801;
        Tue, 29 Sep 2020 15:20:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 08/32] i2c: tegra: Remove error message used for devm_request_irq() failure
Date:   Wed, 30 Sep 2020 01:18:51 +0300
Message-Id: <20200929221915.10979-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The error message prints number of vIRQ, which isn't a useful information.
In practice devm_request_irq() never fails, hence let's remove the bogus
message in order to make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a52c72135390..b813c0976c10 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1807,10 +1807,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
+	if (ret)
 		goto release_dma;
-	}
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 	i2c_dev->adapter.owner = THIS_MODULE;
-- 
2.27.0

