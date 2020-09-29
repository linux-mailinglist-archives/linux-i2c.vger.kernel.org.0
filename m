Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB62127DBD4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgI2WU5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729032AbgI2WUt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFCCC0613D1;
        Tue, 29 Sep 2020 15:20:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r24so5361917ljm.3;
        Tue, 29 Sep 2020 15:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VcUXWgT8fmiQGlBR0JIfsCe8ypmBEn8DqgdCSfZJyN4=;
        b=IaVQKeEkzXKog/PEJXJ1mgImzUItixmSZDrWfixxI2/duGYO3pxI/j9InOYrtWGjLL
         CsierVNmIFC7uVzYIMwK8duQJrdwSoBrtGDF8ur3w6jc2S50sCkODWfGvA62shBuMHiV
         /1IjVNLgtnPcQOhD1Ph9rfF9Gv4GTt/gm3iCBP7V0GxZjUQGbOGOxcZcGOmiqgQxw18J
         VwdP2RpSvf+wyzOhEWyg+0QnXsYF2HKqIrh4CvbseRXEvEXbyhubUUXDDXXZUB2mo6IC
         EphOCXNz7bsTe4c+oz4mE1DVmfbaIE+FZ7iE4CvQuJyThgZQFHER+LM5/ojjgaIGtCln
         dthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VcUXWgT8fmiQGlBR0JIfsCe8ypmBEn8DqgdCSfZJyN4=;
        b=W2WzbjJ7KWPggSq5LuUc3vYEYFaQNkb1Zpmt74iOD8tQOA35FReoEqgHcyj+YeRUnG
         HGz9mphTXxP1Vn+PJbXwQrGBPuA4wl/hiQ6XnfBh82Y1FEshz2z773kdmyDuJf1Y72kP
         2LMFbw1WbsLWaA8SUs7UOeaZ5lXmXUl2Rn77yKmrY2yGdhEXg3M4KBfQfhENezTNJS9r
         jdhCmTJNGGd5f0UKGvRi+7MbX5lyWbzK1iZRQgRs3KsBUXhGz1FuTu93cbzQUcf9136K
         WIDCKmxL3CXI+3PPqyWllT9KdwYG/EAwOrqTNHoh+oyuSdM4pz9Jdvb1WhwCV4po8czL
         KDNg==
X-Gm-Message-State: AOAM530zzAbVFMu3HmeFPGXPHYC+IQ6EWfeODpbXzSudhft5IVUwqKN9
        qVQqouOSss9RSZLdfixGNeI=
X-Google-Smtp-Source: ABdhPJwUJDSsVwgmTMjwx2u++rkboQ+MZLUOeoq++XoTWXLMHxDPHVI3CysAFVr6vPUeidVyEvaPyA==
X-Received: by 2002:a2e:9ad3:: with SMTP id p19mr1709947ljj.374.1601418047063;
        Tue, 29 Sep 2020 15:20:47 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 11/32] i2c: tegra: Use platform_get_irq()
Date:   Wed, 30 Sep 2020 01:18:54 +0300
Message-Id: <20200929221915.10979-12-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use common helper for retrieval of the interrupt number in order to make
code cleaner. Note that platform_get_irq() prints error message by itself.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c2bbdf92b11f..505b5d37077d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1684,12 +1684,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	base_phys = res->start;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no irq resource\n");
-		return -EINVAL;
-	}
-	irq = res->start;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
-- 
2.27.0

