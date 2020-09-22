Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38FF274CD7
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbgIVWyb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgIVWwl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15595C061755;
        Tue, 22 Sep 2020 15:52:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z17so19809902lfi.12;
        Tue, 22 Sep 2020 15:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=quaU3N237ENuYY+8BHHumQYpoI+fueLQHJXbKb71IlA=;
        b=RoasUXapie8yCfGzhzSrBYFgAaByktjPfFLrElNKr6tnUS6cbKkuopDMOx2Ng5Edwz
         cckCbR2iVeslYJJVAw4/9VzyTRV6aYKXjoh+sL0m9Eoh2TUsjOtuesjMVUqLHXfK4KfX
         pGXnbCjHL3HBJVOL6NjOIz4jokmuH7JjCFL3wRMq/GKd+xgu1cRStECBKa4u9xEDQLD5
         Q6eidGcfqEWBTs6zyVTTCnqw3r23ZAfFmJYHVR5jC0BXSxu4S9KznC1fEsCBGNVabzLN
         nh/QGEhjTQz5DJEjWXaxtKkTMWhJtt/Y6U5qRda12s5R469dZzhXkuIQL2zkyB4stlsR
         dBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=quaU3N237ENuYY+8BHHumQYpoI+fueLQHJXbKb71IlA=;
        b=rU1QjFw1UFAzfU1IL6hnY/hJSWDXombgNK9pa1k3lmvX+BnckgfE6ex1odXpQXca0Y
         46RKpuMi+EoT60ypGGQnnlYF09swawlad5cNuQoEOeWie3iLCqmHtSZnxgNkRR436oWf
         uhOhwnWSCklfHk45hdbiH6v6FQ+nL5iqLvlsdOAnEq9Yse9eq878bka2zFbrgggm4PjC
         WItsvzVL3ymW0KddJYn4XZRLw4/iozRWekl5rMfeofun7Rw0OazQSEi3w4yeJMrwm5Rb
         Jiyy+YOuBI+QeMKsqvqOYOkyzq3uJrgBapVuglkfx5zpDIgFAWmRpCCXwHVXENHH22sI
         dSEg==
X-Gm-Message-State: AOAM533DVV1b303kzAhGDMAsm2DoQwxABLYuhU4wLZCusQGWTnQD25dh
        nTBAtcdn1IKPr2JP17EkbAY=
X-Google-Smtp-Source: ABdhPJw/w/81yoDE8D7td2UIZtXA8J9MRVaoA2XjQqbKTlAYXi2qEd+l3WsY3Kq9phQuJHmBfy+RMg==
X-Received: by 2002:a19:c152:: with SMTP id r79mr2188932lff.601.1600815159529;
        Tue, 22 Sep 2020 15:52:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 10/32] i2c: tegra: Use devm_platform_get_and_ioremap_resource()
Date:   Wed, 23 Sep 2020 01:51:33 +0300
Message-Id: <20200922225155.10798-11-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Driver now uses devm_platform_get_and_ioremap_resource() which replaces
the typical boilerplate code and makes code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
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

