Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3604E3605F9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 11:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhDOJii (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 05:38:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40252 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhDOJih (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 05:38:37 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWyRy-0005zO-Ee
        for linux-i2c@vger.kernel.org; Thu, 15 Apr 2021 09:38:14 +0000
Received: by mail-ed1-f71.google.com with SMTP id l22-20020a0564021256b0290384ebfba68cso1039887edw.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Apr 2021 02:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7z2ouZqcZvLyEOcdE7FnfhcpFO/282ITnfmb7UR/10=;
        b=LIBU+orW1mlPuMgtK8cNf30o1MjTNS0X0PfiPvp2u70H5U0/LEsAaZf8LDhY8F4tce
         SBCzSbQmNTwgpBrgWIZJjNenq2LG3C5XHoR+l2ohVY8q391Z35llt4R2XxDpGKHQkVP9
         MtTOMIkgaeO6RKuxhTxx/FchlMo5cYWHjYWf3MDTov/l+QuGG6+uKsKz4MhfY6S1aV90
         OLxrstiDhcjF6HK3BgR9Yl58gFKnPnhRW4scXyfYCeru1nZs9U6tztuodMS/BKgcpqaB
         XUkNK18rF2HiKMY2E1J804rwJE1P5KuX2NZLJ7EPVqIO8ikvm84jMr2oZetg8ax6LhI2
         jU4g==
X-Gm-Message-State: AOAM531hYUxNvMl/Rzhf1Xk74nhiuT6dDLpFzzWESG7Hao3NRSu/hhRD
        vBMez8Ox725e/L/PtCtxztg4AbVgUdfuYExC1c9HO9gmn69zqiG6NV4Ji7QveuTHuBmQ2FHzbD3
        UNmWLD18NVaZ4nkDR5nq/dKpvrEfNxMEpb+KcFw==
X-Received: by 2002:a05:6402:441:: with SMTP id p1mr3050357edw.298.1618479493845;
        Thu, 15 Apr 2021 02:38:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjTWhXTydv5lD8MaRLQ1f9/d9f9dV/fzvHNm6rGHF/jEEPA7jl/HaK9McUQpiTlM0C77cbrw==
X-Received: by 2002:a05:6402:441:: with SMTP id p1mr3050341edw.298.1618479493689;
        Thu, 15 Apr 2021 02:38:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id cq26sm1954088edb.60.2021.04.15.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:38:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/2] i2c: s3c2410: simplify getting of_device_id match data
Date:   Thu, 15 Apr 2021 11:38:02 +0200
Message-Id: <20210415093803.162673-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 62a903fbe912..ab928613afba 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -156,12 +157,8 @@ MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
  */
 static inline kernel_ulong_t s3c24xx_get_device_quirks(struct platform_device *pdev)
 {
-	if (pdev->dev.of_node) {
-		const struct of_device_id *match;
-
-		match = of_match_node(s3c24xx_i2c_match, pdev->dev.of_node);
-		return (kernel_ulong_t)match->data;
-	}
+	if (pdev->dev.of_node)
+		return (kernel_ulong_t)of_device_get_match_data(&pdev->dev);
 
 	return platform_get_device_id(pdev)->driver_data;
 }
-- 
2.25.1

