Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCCB26231D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbgIHWod (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729785AbgIHWkf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:35 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DB3C061573;
        Tue,  8 Sep 2020 15:40:33 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s205so968665lja.7;
        Tue, 08 Sep 2020 15:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtsscUVX9USqMNRXBDByuYOqMY2muh1bB3NfySu7tl8=;
        b=M0GKSFGXs1N0/dC1oIfvbKkX7t8uMGVsRdeutQ4M7SP41Z4SRUAc9/hF2dh00e9V9C
         S4g44yWY+ReBonSunG1jUTLzdU+YbRq9L3KtI0EeZIFahKtbTWIp6LPZShM8YPHLDPm0
         D93Gr7Le7vRopTtOMgqqWkZDGBX/uy16FC7h6uMY7KE5ecy5yPIg2dETblXTMqQnqYcm
         kjhK4B4KmPTYOnIHoJ0sMNoNjNGGBjXDP5EPnIplo9gQAhTUMnxBYGhu10ONf92QdSsS
         fTpOzvOIo7EUGaXpPYTczO8SNGPQXwLiJA9yYpBAC6xHpuQ8u7rQtU2+cSgPmCOT4SL4
         xd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtsscUVX9USqMNRXBDByuYOqMY2muh1bB3NfySu7tl8=;
        b=DW+xLWfPA9czdB9eI2jRLj2jkrYcqpJpBGVWzBkCbyC7IziVYCjxKgZ1YeUujw+HMm
         8OXX21KoKksZ5g6KZUdtAtwZC+HmuMavQO0zHMOpD+fUv7rGGDm+GXJB9ypkAFKOY/5P
         eCWQFF+p9Atps3eL173JpGGoePV9xEBEWous5toiAkbOHbHGPkOnnNUOg295VlIbk6wv
         hCXgGu65gwU1tF6W7q28XUTK4d6TvS4BGlhbC8sy9jx4UtdRYgWvP+1HTZordSiE8Jrw
         Q5oTZ7AAKZATkFKaJiZLxhrhvKRBbjvIROq/765qilC47XyvuCsZnusjrF22PMJYl4GA
         CgLg==
X-Gm-Message-State: AOAM531nIodBwTLyKcO+F2QvLchgwuslJFEBScAUyq6yK1TQewjiXRpP
        IVeJsWIpotsOON01G0m4bDt4Q2ac8pQ=
X-Google-Smtp-Source: ABdhPJwya7t5UTyvAQulCZgcQ6S7CGRWZjbUd8+UKTbrAApSVAdNtsnFvYDbJ2lAPBfVvgPWXmTujg==
X-Received: by 2002:a2e:8159:: with SMTP id t25mr348939ljg.137.1599604832426;
        Tue, 08 Sep 2020 15:40:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/34] i2c: tegra: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  9 Sep 2020 01:39:42 +0300
Message-Id: <20200908224006.25636-11-digetx@gmail.com>
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

