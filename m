Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7D21A11C0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbgDGQjK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:10 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40595 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgDGQjJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:09 -0400
Received: by mail-pj1-f66.google.com with SMTP id kx8so981176pjb.5;
        Tue, 07 Apr 2020 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j6CDNKFBch6cDLyBMGcQadHcYh5lSOksKsdytSWscVo=;
        b=rZguRPtf/N3dKsh4Av+7WrgqVIXKOixgPuiDHz23FjQxtVMnhEI9+D8isn+RXKHW86
         TvSjmWpOz76/nRailfDxbFqy6BYzXLJEbmc1RonfsJ0f10u8u764hxKKT8bigoN/2gdw
         Dta48r+iBVoDLXHX+OJxqQdKpzs8oOmm2Zu+Su92Mf8V3fEmerkpdLh60MbBx8wFStd4
         yZb659ucq2P99IJXCkuRdMJb1SqgBTSTJgWxS6H1Xpr7abdDBitraU61w9SnRCwvjEGw
         X+T86HJI64EGQZBI9FLZzHYDeXIKAQHg4inghqXiHLlpCSCELo8ocuO8wIkHiccfM1qY
         iUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j6CDNKFBch6cDLyBMGcQadHcYh5lSOksKsdytSWscVo=;
        b=KdPsh6N+G4hAbuD78l9j2QEiTiPJNTiKd3TIS2wSpvpDoETWMbBJ8PfkJpgf34mWsN
         HFWgGAEUIJoetJwvqzDqfGGTHLkQ62x8DHE651d1gK4E4Rb9Hln72+/twMtp74xaN9o/
         iqav7Y56YEt/HhdmwQ9bli6af059diWHA5NAwyhoKZJqQuaOiFYCgAO+oqRlrtgqrjDk
         1ZBiu6QCzVQe+WNF0RxKRj5iYBITIRk9jHeToeKUDZ1aOZV6zunmpbns/Arur9m7s0Bt
         /EdhjG5pqCzcGs6MHhLlGibBnOT+dB5B9Kr6gzeDPEcSG9jBgcp9talZ0ukcLbhjuUbw
         YPUA==
X-Gm-Message-State: AGi0Puaqjegou+zweMB0pI3oT7BNtBE/gndmmBDTLycfQDvPsQy5F0rZ
        I6Y/s38uAcqYnuvx5DWlyEI=
X-Google-Smtp-Source: APiQypJ/0xdFhHNqcZqEqKESPIBkkqjz8b4RJVh76Fbw45eHAz6CP916AX8jfx7nUER293gOyuo1Nw==
X-Received: by 2002:a17:90a:fb47:: with SMTP id iq7mr157266pjb.191.1586277548287;
        Tue, 07 Apr 2020 09:39:08 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 135sm14803911pfu.207.2020.04.07.09.39.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:07 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        nsekhar@ti.com, bgolaszewski@baylibre.com,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, matthias.bgg@gmail.com,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com, kstewart@linuxfoundation.org,
        allison@lohutok.net, gregkh@linuxfoundation.org,
        tglx@linutronix.de, bigeasy@linutronix.de, info@metux.net,
        hslester96@gmail.com, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, fparent@baylibre.com,
        opensource@jilayne.com, swinslow@gmail.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 17/28] i2c: altera: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:30 +0800
Message-Id: <20200407163741.17615-18-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200407163741.17615-1-zhengdejin5@gmail.com>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource and devm_ioremap_resource.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-altera.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 1de23b4f3809..7c4c836a3228 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -382,7 +382,6 @@ static const struct i2c_algorithm altr_i2c_algo = {
 static int altr_i2c_probe(struct platform_device *pdev)
 {
 	struct altr_i2c_dev *idev = NULL;
-	struct resource *res;
 	int irq, ret;
 	u32 val;
 
@@ -390,8 +389,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
 	if (!idev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	idev->base = devm_ioremap_resource(&pdev->dev, res);
+	idev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(idev->base))
 		return PTR_ERR(idev->base);
 
-- 
2.25.0

