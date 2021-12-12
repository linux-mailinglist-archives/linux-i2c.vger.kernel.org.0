Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B456471C0D
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Dec 2021 19:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhLLSLC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Dec 2021 13:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhLLSLB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Dec 2021 13:11:01 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46622C061714
        for <linux-i2c@vger.kernel.org>; Sun, 12 Dec 2021 10:11:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u3so27089754lfl.2
        for <linux-i2c@vger.kernel.org>; Sun, 12 Dec 2021 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5EFH32R/A8nKeoiQKEQd1o39+iKWJFk8VbMvazM8aas=;
        b=PwLLqn2jtPgs4ZWqSP2LYkAwhq3gUsDH6gd+Dgi2Pn9pNHSysoSQQurPYzyyIJhQ7A
         7wF4a8tUFyFqT+LSHa3INHCpE/hgVLjg+axv0yAp0l/TLzZAK1QSwcdmkfkcwp7wBlwI
         89Uxa8zDSvcN0+QO9HKHHDJKU6Nf4kb4vUjjMHUCqaKBMz1yy/taQCgJwBIED8/MFFLU
         YRIuyHwA2ox8R2yH5VaYUAjI9waNtNTNkasB8DnUF8wi5HhMXVnkJMb2O5h0Jgadx187
         lu3FK1b0ZxGhxJ8X6LACU82NnpXjZ+LSUTN12PNIAgBG3Fz0NRJAkBKydqCAk//wgFcr
         +tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5EFH32R/A8nKeoiQKEQd1o39+iKWJFk8VbMvazM8aas=;
        b=wfr0k2HlZl0MjD+gFQEq3e8OuY/97N/L9/jBBcpmconV1jFaQdvMCEWa4x6G/S18sZ
         8H0eDr5fVLI/86iG2XwocXrNAVB+BJro81LzyTmoN/XpSRO3c+rXdu8rZC1Jap9fMJtZ
         fug5flY57ecZUhsapnIW37l2wfQfbgCG7S6Vj/SxewwgpBx+wiQXbLArAOgMxvwE/dmb
         /oHtAmwpsf2WVn51JqidNC1nH7wTTtuBonpR0nu5EbtRZS3ggfo1r0Ou39ECkuzo0CzS
         9eGW3ytI1WrhtSssqf/Juhe3+74xJT7ui6Lhb3ZwSFUvw5u7fm85vnUgWHg/xHHcyFqG
         JzVw==
X-Gm-Message-State: AOAM530+UaUZjwW+zJ42ySkozjt8NiSlnO2BOiLHiSxOgVmdLOOkK7en
        +grJDIqzodOPVsd/moPbgy86GQnQz2tF5pH6
X-Google-Smtp-Source: ABdhPJx2q3hRmHoqk/Aq5FNWiKiOKG/xa/RK/FiJVpoc4XG9at3CTlaVHM8/sXx2HKXarvzHSne2iw==
X-Received: by 2002:a19:604b:: with SMTP id p11mr23368383lfk.392.1639332659381;
        Sun, 12 Dec 2021 10:10:59 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id e11sm1109229lfq.65.2021.12.12.10.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 10:10:58 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: exynos5: Fix getting the optional clock
Date:   Sun, 12 Dec 2021 20:10:57 +0200
Message-Id: <20211212181057.20210-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

"hsi2c_pclk" clock is optional and may not be present for some SoCs
supported by this driver. Nevertheless, in case the clock is provided
but some error happens during its getting, that error should be handled
properly. Use devm_clk_get_optional() API for that. Also report possible
errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
clock provider is not ready by the time I2C probe function is executed).

Fixes: c93ac09df2a8 ("i2c: exynos5: Add bus clock support")
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/i2c/busses/i2c-exynos5.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 693903e80892..b812d1090c0f 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -814,9 +814,11 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	i2c->pclk = devm_clk_get(&pdev->dev, "hsi2c_pclk");
-	if (IS_ERR(i2c->pclk))
-		i2c->pclk = NULL; /* pclk is optional */
+	i2c->pclk = devm_clk_get_optional(&pdev->dev, "hsi2c_pclk");
+	if (IS_ERR(i2c->pclk)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
+				     "cannot get pclk");
+	}
 
 	ret = clk_prepare_enable(i2c->pclk);
 	if (ret)
-- 
2.30.2

