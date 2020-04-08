Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6A81A2878
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbgDHSXm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36953 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730703AbgDHSXl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id r4so3692983pgg.4;
        Wed, 08 Apr 2020 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D/XeRamXX05QkrU1HvrtG2EIwwlHeRpQdFdQJ6tbj1M=;
        b=PLGSVqw8wT4ESTAFPnNYOeNc5QJtTsIgt0K/8qVZWbfDBtPLvOYsip7yM5E1tB5c/c
         MEQ+xRu27k/1rbz8CY7Ozk/UKSrZ0MdfeMepFX/cnRC/8CwH/PD6t3XT9wkvLBadsFhm
         gvGpbf9u+d5JBA8yCv/y6eHcEAjsXtLUMnpk8j02Uy1R0TF/DOLBrY8hhGvBmoeYqEAe
         shXOvmxw0pVsmpQ3T0Oz1H0oa9LFaRECk/WqEqVGMnTIKwl2E5mQuI2DVEzIuJNZ4wRD
         IVmiKX1Jy5MU2IAPK1RUgggP8mE/BGC8eMxtKyCQeyBWyO/tJ6tpeSb3leSQUtt3dVCY
         OWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D/XeRamXX05QkrU1HvrtG2EIwwlHeRpQdFdQJ6tbj1M=;
        b=uTlV3zL/JryRGA6I/7QHOTXFhJXyUiIoLimGzaIlOTnLmKqWRW4g+y/phfUdiEcgZC
         Fdm0y3U3oqL/RLAh7RTsKWhl/Sz+kHPuCGqab3brc3JVvlq51kQo5a00JkmP4a2rUYi1
         xmBoFUZF8wVR4mPoRfNyFNbEbWGricivPiIchDWSnks1dSgk0Vr56pq10nf6/9ay1R6J
         SfkuJfEmBGkpz5hzN7jXxLf3ATCnXXkkGptkQCFlVtITTV1L2pYA+r1ZtyK6tLP1msuh
         79W3Odw+X9bzY1P/fwOPmaudfGwhwzYgOEOIC83giT13bNCuPvCRMwMcBW9YCiTV/uFE
         F0qA==
X-Gm-Message-State: AGi0PuYMEW4wKMkm8cC+8qDJVqfpzukX6+nKlmjlzN8BcM0F8pyvli47
        Kdrc5GB6jVG+rB1n64qJmCQ=
X-Google-Smtp-Source: APiQypLHTyeRyOIDK0sluDNU/T9F3T+UyUwb8gC/ARSclHZhd1prFrgrYdqvWHps3DzaUaCLwUxj3A==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr9140434pfm.230.1586370220264;
        Wed, 08 Apr 2020 11:23:40 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id ne16sm211745pjb.11.2020.04.08.11.23.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:39 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        ardb@kernel.org, gcherian@marvell.com, jun.nie@linaro.org,
        shawnguo@kernel.org, tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 04/24] i2c: exynos5: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:51 +0800
Message-Id: <20200408182311.26869-5-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200408182311.26869-1-zhengdejin5@gmail.com>
References: <20200408182311.26869-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource and devm_ioremap_resource.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- no changed

 drivers/i2c/busses/i2c-exynos5.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index e7514c16b756..5bf716df88f4 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -740,7 +740,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct exynos5_i2c *i2c;
-	struct resource *mem;
 	int ret;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct exynos5_i2c), GFP_KERNEL);
@@ -766,8 +765,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs)) {
 		ret = PTR_ERR(i2c->regs);
 		goto err_clk;
-- 
2.25.0

