Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C89D274CD2
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgIVWwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgIVWwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:40 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41978C0613D5;
        Tue, 22 Sep 2020 15:52:39 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y11so19861441lfl.5;
        Tue, 22 Sep 2020 15:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDSR1ce4KphQ0il3AGhZbX187pqIlH1Dh9elxFFWxsQ=;
        b=I4DnbTjQCA0ErNuWNmbzIgOLU0l9NHTV1I9vWrGUvr0qxXQBzBsmz2/xDtsloxtmp/
         exif/EJ9arRA7sRjZc/F1WPvCAS95+HYZ05rixYNn2SJjjD449C325DaSrunDWMuukz/
         CjYWwwm7UPzdXJBrED9Ha5nFymDQ7eMv4B2mx/iLPqSDg20FGiYktUVGqc3zEJOHUtDA
         TvPilNqiufwlgBCe7/NPR/fKMMdlugIIk0lPL5UAaYZSX5gkCJcQjvSpgatW/4tsp0oZ
         h2GOh25waD1UgtEO/lKnJf/aSD0r4BEl1QH/RmigxODq/hD6Yd+sPuhVBrWUCY8BRId4
         gxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDSR1ce4KphQ0il3AGhZbX187pqIlH1Dh9elxFFWxsQ=;
        b=H9HpYhbfzfc3h5poygpHfCkxv3QaaBGtdF7pMW8LU28avciayWt78bQn+q0fHgUgso
         kjqePSlCPK21xUlo7k7bu8KyXphg0KEc1UIfh7anJDuMCbjw9X/98OptqGp8iS8jid/q
         Ceywuw/SHxa76e147gb/5Ull1DpwVpbja8ljVyGFYk88YFbGt/D2ktPOlWeUF2CuCkCn
         eMv1sP7AnWXqrGiRxPGr/h+oH7ysEaLFaONROjmFRZk0tTJMiR4cInuBUyWZtcEhCwIO
         Wu4TnommVOuDevVBI3tKOu5m0Gz7Rb7ApCamheWNHz78G6nGm6bB6RP3ffhSXPQpMERw
         kvdw==
X-Gm-Message-State: AOAM53085yt7kYml3k5kEGweDmAldGJCaJsxJdDvwFU9V1MFqMe6ROCi
        sb6OTYZd+DJr6Wf5APKAaIY6x3Y9VNA=
X-Google-Smtp-Source: ABdhPJybzXosQTxM8GrtwzOVkpYGsC6KIdG6wboEzHpPfwG8TimhsA/VwqlMcr2zj7n2bkVHqhgDRg==
X-Received: by 2002:a19:ec7:: with SMTP id 190mr2286305lfo.275.1600815157692;
        Tue, 22 Sep 2020 15:52:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 08/32] i2c: tegra: Remove error message used for devm_request_irq() failure
Date:   Wed, 23 Sep 2020 01:51:31 +0300
Message-Id: <20200922225155.10798-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
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

