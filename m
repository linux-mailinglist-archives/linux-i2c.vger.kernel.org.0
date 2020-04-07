Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59371A11C6
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgDGQjX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33600 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729494AbgDGQjX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id c138so1705414pfc.0;
        Tue, 07 Apr 2020 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L4bwPS7uSAEJmVwcKNrr/o3b0kDw3tjHqSkhToOn5yQ=;
        b=kQUdAX8TkZqJnIK/9t8GtCWqQnR5ltxPBYcPB2tV2K/0SweZF8q/OeHGG8RJEAxOjI
         RuhZInx1FYO1az5y+53Aa4rOYY4pWp301TzrgSWSb8RLx/jmXjs7zi3r22HZVCLaHi3Q
         NZkwM2N2j3GQqxHDpfHjDr+l3Ba5B9EG73rDQ+B8t31NpPeAh2D203qOdDiSsgYOgR3b
         hHeXF19nM1fwIZ12Z2V1v3GkPdGVJ0kaFq/KB4LTQNBp7l0eMEaknAsYPYM7lr+orrHP
         6RRn6g6gB7HFmLFlwtfTmydQ1v11LGPU1snu2URoPpwkq+Lu5gwaiPHu1WFX1a3Y5g+A
         Zqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4bwPS7uSAEJmVwcKNrr/o3b0kDw3tjHqSkhToOn5yQ=;
        b=EaDIJ674teTUdiiEGmh60IGTzhuLBqDN7Y8b7Gee443mkxxsgm29iN5M5KncJLkV6j
         vTw8Do1yxoU4rOe2V851/JJojShLjazfaUg2DnogjQkF4T+UwARUvBCOqzBprJjMLSaj
         Qmx0HCNb5L9jDT7pPAYmlXImQppqiUhGbqEy0pcp7D2ic7ZrnlC226CyhPPwVwRKGNLw
         urXPYOqk4x37Uxr964F6QQnNCFlqunRhh3qiJRRxZlsmA9YJOnvNFn62uQ3EFM0Z+CYK
         AWVTXw+Zfu0E7e6fDp7QRQ5mJ0ziUIaCgEWbogdRUs7OBONi4NjAaFGMiodPkIAduEEm
         bY5g==
X-Gm-Message-State: AGi0PuYoOvIvzm8xfBjPm6dvB0fIt5+Z89t4zIOQD91OVutV7zmydFZj
        7o4CyomtKHBDAKQQHL9pwFA=
X-Google-Smtp-Source: APiQypITtP5XYA/uzBdKO+zMMPZ75YJbCMX2Pb425GCH2vazLcUlaf2weXiV+ebzTbMuaF8WDE+Ysg==
X-Received: by 2002:a63:89c1:: with SMTP id v184mr2992977pgd.333.1586277561848;
        Tue, 07 Apr 2020 09:39:21 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id j96sm2015048pje.32.2020.04.07.09.39.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:21 -0700 (PDT)
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
Subject: [PATCH v1 20/28] i2c: davinci: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:33 +0800
Message-Id: <20200407163741.17615-21-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-davinci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index e3ceb256a380..232a7679b69b 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -761,7 +761,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 {
 	struct davinci_i2c_dev *dev;
 	struct i2c_adapter *adap;
-	struct resource *mem;
 	struct i2c_bus_recovery_info *rinfo;
 	int r, irq;
 
@@ -814,8 +813,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->clk))
 		return PTR_ERR(dev->clk);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(&pdev->dev, mem);
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base)) {
 		return PTR_ERR(dev->base);
 	}
-- 
2.25.0

