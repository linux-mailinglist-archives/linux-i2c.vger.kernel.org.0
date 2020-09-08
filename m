Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A0926231F
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgIHWof (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729741AbgIHWke (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:34 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F090C061795;
        Tue,  8 Sep 2020 15:40:32 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y11so539038lfl.5;
        Tue, 08 Sep 2020 15:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LurUv+YpHFsrZm3AgTKy4azZ/BxWvLTGRcrIRYEkzE=;
        b=L18wV+wnH0keseljrFVA8esoGN3whHrxEVuzpkw/Wuo8sWkUNtBUWJlYhQCx8Y7gIq
         tmv8pEx+s+e2l7KCgOcmwQeSQDOoaCauu20+Lb58KxGVAuB/o+NrQHiUlZkTL5AV3D7g
         HXpK7lxQnJ6MDq6h3AAvMSFcI0KGuivt29VWfe/t+9UYUxr7ZFMiskWY4lYWfYiDlmbx
         6+qNPsgpt0T7CZnnKp3ROED3tLWL5qHuk4z9spl8mxqLnhH500cljdtgjMlkTCXc+E6n
         S38uF8yeZC2BdLgcDjK8nrzRMcn5HYhpyG4zzwbZCuBE3+6T2LaMOwfqlxRDXxvlPalK
         hLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LurUv+YpHFsrZm3AgTKy4azZ/BxWvLTGRcrIRYEkzE=;
        b=jvmGz6MthzeXVM5AS6uSZKsDP9CjR3MEK0kbcGcQUrCl8Eqz6t4xcLl4dqurHTfJiF
         ekLIE8/PPM4Ym9VWxA/KlkYvO4qfQNj1pIxzWsZ5S+2yqrp2KtK7p6rzYHnpBI7CixeS
         z/PXCAhoEco1ocrvnJ4pfvcog4j9SQaUIjo0bjU5M0khcSuTqN67lzOtEPwTXHM4DO3y
         Zr+KjCQrUaxsbC2gIe3om1CKc1DcOsM8r6+nDAxM054+D0xYgFwMoV+BJdx42sKt4z12
         Rr3IkFY/rIAqQdcUGji+IfhOTh9tUGNtI8FXWNHO60YlsW8bctkeOvAZJa3hPO50/qLv
         5ozw==
X-Gm-Message-State: AOAM532qUGDN+6e9kRZR4iWOpL6akMGQLQHM/6vYkJhul9pViDnj4J2z
        CCGRWLnEnZMM3LmwNhYTFOTcE+Yy2Ko=
X-Google-Smtp-Source: ABdhPJwXgGv98Q8MCP/+yWmHEGVU4LL7IL3YE2N1rgnyO/lRJcDV7FKxzrhUhEfZn1Q7v96qfJLbfw==
X-Received: by 2002:a19:4bd6:: with SMTP id y205mr541701lfa.182.1599604830685;
        Tue, 08 Sep 2020 15:40:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/34] i2c: tegra: Remove error message used for devm_request_irq() failure
Date:   Wed,  9 Sep 2020 01:39:40 +0300
Message-Id: <20200908224006.25636-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The error message prints number of vIRQ, which isn't a useful information.
In practice devm_request_irq() never fails, hence let's remove the bogus
message in order to make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
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

