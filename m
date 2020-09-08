Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E0D260886
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbgIHCQR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbgIHCLq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:46 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DD3C061795;
        Mon,  7 Sep 2020 19:11:46 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b12so8304879lfp.9;
        Mon, 07 Sep 2020 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtsscUVX9USqMNRXBDByuYOqMY2muh1bB3NfySu7tl8=;
        b=fa2KeXtAHAMJQOqBaP5RMOJTBSw+cDEK6ojVorwGCj4qKTPLaDySziuD5peEJGTu7k
         cD20ecHaj5uUdDOjratvenhjB9If0XSmdqzGfSBAhB9RkdcTTnbRG7WlsF2C1a4Y7Ay7
         AD/vk5sdfBfl1rNtrX5njAcU+iiLpMR8jsmkzhVGAZ3g3a8Fj4olBN9MB9ZvSWN1SEf3
         0Vg4fYgk4T6cKISxEPua4jzV+3uHw57W1055TYEL+WQf2mqEMTV4KTbQfuclQq7pU5he
         XJqJnyb/nJ/hxpRIsbmzG1t7E/QXFrvENHYfHa7QKiwNRsB4YMkZ6V+xfVTkWhiWbAEH
         oo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtsscUVX9USqMNRXBDByuYOqMY2muh1bB3NfySu7tl8=;
        b=tLEZG+hEDz9Y3w/cNFHcjlmwC9Fii2TY9zckVQSoBYeI/EgsNo8m4n7rs9X4CZTAAg
         kWUGzuZxxjmgzKxJh2Y/CRkHQBlmtsiOmFqQPX4+bcj3p9gitPcsPiPVs5JKRmgqeOjY
         Zp5pcVKrJdFPzKeWmaC8TeKctvRH2TyeJR2s3JKd4QbnC2voYQkMmSYUgq3Ddsqwz9MU
         IjVhjHGeVP5zbhKT8EdxZNt8ZKyc82uD8P5/lkaHXA8NT5dH5HHGCjHRkBIs79xuaC/a
         OywQlPSzkvyVzm05RjbZVO8LALpHpAUFxwP4GRpXmdqgLdq6uMziCp4ubcZINTw/OEbS
         nXKg==
X-Gm-Message-State: AOAM531MxTBxvVB7OgGzcNVCwLKxkxC5O3e05KRvd73ZkyLHCZXpVVFG
        aG/pUrH2MJXXjfNRPqXxGcA=
X-Google-Smtp-Source: ABdhPJx7gNa1jKMbZzebHb1QwcP2ueIhpoe7fO7AvO/g6zQT/AFsGuEWw9z3y5QO8cYAUNxLt+a62A==
X-Received: by 2002:a19:7604:: with SMTP id c4mr11501739lff.132.1599531104430;
        Mon, 07 Sep 2020 19:11:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/35] i2c: tegra: Use devm_platform_get_and_ioremap_resource()
Date:   Tue,  8 Sep 2020 05:09:56 +0300
Message-Id: <20200908021021.9123-11-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Driver now uses devm_platform_get_and_ioremap_resource() which replaces
the typical boilerplate code and makes code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 90ba2f5327c5..c2bbdf92b11f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1678,12 +1678,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base_phys = res->start;
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	base_phys = res->start;
+
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "no irq resource\n");
-- 
2.27.0

