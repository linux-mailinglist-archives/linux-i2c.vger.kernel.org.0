Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C40A27DBA5
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbgI2WU4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729021AbgI2WUs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:48 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2CBC0613D0;
        Tue, 29 Sep 2020 15:20:47 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w11so7450428lfn.2;
        Tue, 29 Sep 2020 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPlFi2S/cmjUsxvBwkanO4MpIWrGtYus5a2EcdQgd70=;
        b=Yg/frGn/rolI9XzUB7nA8Kchw6CrRy6HPtDENkvRX69krrlbkvWIDnuFqt7ALUvfkG
         wAxBYqXJ7fehtVyBVqgND8LYRLQTZM2+fiNof0czdOSYzvzsnnuyNPExtOXHfbLAYVED
         LZndfRsG1ggzynA1BxEVtfd0cZX0l90Xv3O4p/EEtIvgxhuyzT48WNlAMJPaZ2wLbef0
         BNni6DtyC9Of2zt5wOcniaOXWTKFOiM8Dxlx9TExoQtUwA1uAZH5050gv5r+P14Ddhlu
         ZWOlKNHWKSS80IzBGN/8wwreuiIIGrZkRx3DPWueV6ZeT8YNVB899xtZ0kEkJgxP1ZYI
         YasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPlFi2S/cmjUsxvBwkanO4MpIWrGtYus5a2EcdQgd70=;
        b=kd/y9nywgPdDHrCfbYwF3go0hHTQQFhF7KkXjI8WNH3sNoE0n20Jb1znAGpu5MVq7O
         P5qpYwHqa0t2vOo6DToCDdcin3+c4PvFd/6/SAUsnadLpRpQg8RZjt/JiHj7TmjXHqj7
         mwADYisQBJsvhZM9GfPtKpPP3qDPBGwdT22dYUV/SVmqpKVpUHqOnmNUqVdMo54svbxl
         Sra7jSUJ6gaz5fz0nbgFGa41FC3PPEb1bwgRlIiyHh77do6DnBdyoOhbg14bmj5LqThn
         iCfHZ+6hEmu2aS4/zMmxsnrmHwfZ1ZZZpBiX0V/7Xjy2aDwmV8rI9lOqUloTBRIpmVlI
         t3LA==
X-Gm-Message-State: AOAM531XEHcEFBd1TRUqTRPUXsJ06YLvFYZVkkGQ/6k53wOgokytK7li
        zeuD15VsgYecUdSnsBS0Zrw=
X-Google-Smtp-Source: ABdhPJw3I4PdLWyPn+X8fzoJYF2T5+EFlPJiADrmAoSXd63bQL+FU9WXb3IP0bzLS7gwSl1377tSIg==
X-Received: by 2002:a19:5e4a:: with SMTP id z10mr1820526lfi.380.1601418046145;
        Tue, 29 Sep 2020 15:20:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 10/32] i2c: tegra: Use devm_platform_get_and_ioremap_resource()
Date:   Wed, 30 Sep 2020 01:18:53 +0300
Message-Id: <20200929221915.10979-11-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Driver now uses devm_platform_get_and_ioremap_resource() which replaces
the typical boilerplate code and makes code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
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

