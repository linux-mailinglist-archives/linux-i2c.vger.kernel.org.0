Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D160125EAC7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgIEUqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728681AbgIEUmg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEED1C06124F;
        Sat,  5 Sep 2020 13:42:33 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n25so874117ljj.4;
        Sat, 05 Sep 2020 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pugblH5dOAVs3SsiQXTVmCXhBRaD7hV9PBTwCfEUcEM=;
        b=Fse9tUnMmmECafC+u/yA9v8UfgGhbWmZJIIlc5j+eb2+yLmfb2hXIVTU4hbnPOd/ov
         nDLRyXMbTAY2U/NoNgqmM05kHE5LVtRPFzmOJR/crdvYv2BeZyq4HAGgug59FgE49V5i
         RSQN9bpXUSNy2gRb4pxJgKpBBN1lYtIcCGo1aADCo5qSmoH5MdfF616W3te3RT4vpPuy
         HhCNHCTJqNHdD86ywx4haEZHGcSsx8l9JILnPU1xU7rqi4wRoo5YUOpTxbESji5oihnu
         7bawSvjZO0ujrOTo10RBQUK0t3fjl9MtTXpCyxYeDgNPRolLliEPqSI6AmQNMLXhsMZS
         l8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pugblH5dOAVs3SsiQXTVmCXhBRaD7hV9PBTwCfEUcEM=;
        b=KwLGUXftQ9GNErwxNe5cV9DJtd44A4nAidNk5a/wu9/7ZsNbYRaP88gCRWo1+a9yLp
         5jJZS5X8o2Wzre98u/WcFcry4u3Ur1ZmIjALCLVf46jn+M7/GqC3piGJ+IwejzTp9Zm6
         Pb6W0RqElB2NlB5tpPOr9km/is2ivyv+qobw7gEfiV6bKJ+jrKNwQWFc/I1EHq4j8ZK9
         2r80tdCsDm0nr7qZeq0jm5G2YGkoyicV7Drbt549C82soObHcRx+zbql77bJQobHNBeF
         qJlaWVNWZtVNQqslnLMPL2j9jlABFxztal11WlIz/3I86UVdWQFYqOd8JdJ7dcYngBC/
         dXwg==
X-Gm-Message-State: AOAM533aW5R2LRuk6WzNKC6BgMassK46BQEf+aTKLgrLKQa/d7wU61pb
        2hcLADnafEDfYPOQY4rfUJU=
X-Google-Smtp-Source: ABdhPJwB8dX6iiJK4JPCBsWAxG3/FVMl2cmLWEfO7PbwsYVgEoDV/15SQP6j+HXOSF0vC4NFacDF5w==
X-Received: by 2002:a2e:9719:: with SMTP id r25mr6898367lji.75.1599338552310;
        Sat, 05 Sep 2020 13:42:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/31] i2c: tegra: Use devm_platform_get_and_ioremap_resource()
Date:   Sat,  5 Sep 2020 23:41:28 +0300
Message-Id: <20200905204151.25343-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Driver now uses devm_platform_get_and_ioremap_resource() which replaces
the typical boilerplate code and makes code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 940b5f15ef11..abcfb53d649c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1666,12 +1666,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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

