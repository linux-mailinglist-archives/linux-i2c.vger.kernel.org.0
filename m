Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8098025EFF0
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgIFS4o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729158AbgIFSvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:47 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC75C0613ED;
        Sun,  6 Sep 2020 11:51:46 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s205so13580893lja.7;
        Sun, 06 Sep 2020 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mScTnvkI0v+a0e1A+omcSwDmvn81FxfoJtBPtDVBGs8=;
        b=Y621wJ68P2B91baz/Md4NuqGyRGUGaAWCttcPlKxEPQ8GckTxWB2Fm6zCpnvEPjnov
         BHXUjWs6rlLSWdTYRXuDIyGl5CR1N908zUwk0HDm3eIBdWTfmzCIXEMi4S/e6kOwVRkb
         PSKJjnOWcaZFBSTVNEJF45nGSU2rVl38T/eQKDEq2Nxy6RjHEWNZS3GnQWy9l29cMiq6
         yV/sREpm0aoSxMP53GOdCk2y0D4ZQRZ9Lio4E0ltEBdGjyiHbTJ8kCCf7963q9xzZpCa
         /Q6qahlVgOHH4dJ7YHAaDXm2CJMEyeGU+Du0y9Q8iWfZVrThSY96dR729F0wLNhNPgtL
         Vz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mScTnvkI0v+a0e1A+omcSwDmvn81FxfoJtBPtDVBGs8=;
        b=LrjAeUGaYLt+iuzuuJkPzC1ey7EFJ1fTvAv6paKcS5LxIPrp48lnYLbDSRL2vaHF2M
         GWlppCt1f5D0b0WAhXWZOxBM+ZGBaVFBQYERXSvxFyHtTkYltQ1oBx0ahJxQ4xR/M8l/
         IJUET3O1eYd1oxjY5qs1ZQCCGR3TfZ6e7HG0xv24Ig2XyGDMLAXGPg5Oy97ByobGu3KA
         nBZasZdA/ReYD6iAeAA+xZspoJPeVA6aTp9kSwvvwD2gAYfJuyeJifiZaggnOXSNcLBs
         ciB9yjP+kcxJsfaKyDQivIwNlR3gIE4GveipckeOziBcj0K03JKodTSF2lJK9pLyH8S1
         CpSQ==
X-Gm-Message-State: AOAM531j/EVYtiIPGpQMbUKDjhwBMQoEsihg3pwlIMgFSrt55BYP6xQG
        v4RfMHGplnbSHq3jtdpb43c=
X-Google-Smtp-Source: ABdhPJwnTXa6FKuTZ+lh6EM4/+IqjmWX1HZnsq0h7TXeRSdxhfJdA3lIKfT0lXnZsrBKR5HrnWWCTg==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr6101840ljj.268.1599418305435;
        Sun, 06 Sep 2020 11:51:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/36] i2c: tegra: Remove error message used for devm_request_irq() failure
Date:   Sun,  6 Sep 2020 21:50:10 +0300
Message-Id: <20200906185039.22700-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
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
index c296095ace87..043b5ce52a6e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1805,10 +1805,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
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

