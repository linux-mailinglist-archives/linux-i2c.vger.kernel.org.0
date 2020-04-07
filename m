Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354D31A11B7
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbgDGQiy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:54 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33136 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbgDGQix (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:53 -0400
Received: by mail-pj1-f65.google.com with SMTP id cp9so1293791pjb.0;
        Tue, 07 Apr 2020 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FANZvv90GSdOPVRNwSkT/JjYzuiEgcdDPySaoRo1XLU=;
        b=L82qhJU/mSj0Q0GgtgHTADYjxBkzqgPpEanEJ6zf5+ofwz9etA+7gvkAaam+aM2TMo
         qUe4LA9OjQe9Wijs19BzDqzjD8JpoxF4XZyqSb3lfh4cGOBcMVN3Yh4ar9fvU7143tEw
         BaJRig2XU2RZpjPo7JVOucMgsEldC+eVATYO/hlvpMBYXpt7D472WH1z45OQNfHRtTvW
         k7tleIczSAR4525vAaJ/FWgADxlXm2+MUigOhhqzksae3y7BRq5Kh/aHJPy14H/m6RbF
         5zR99BoJ81Jo9rU8oCrqm6+FO/3Rbc+BuVSvTsXRaDbRSb155M/zl2wJ7LwcfMe1Ar2T
         xJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FANZvv90GSdOPVRNwSkT/JjYzuiEgcdDPySaoRo1XLU=;
        b=AupiccwQscz+iWCVa1lkGfxEI7CWyjmCoPPZ+4wYbw0s/BeI06F1oe+erjYv/umYuh
         0JcyYvVl+wbHGb42ziwpOzq3cUqWFyAf0ht2GyAyIPcaqCd35OS/RpFwcILdSWvnAti0
         fn0lBtyHv8Y2yzmkUwMiHq3k37XYTJGIzrwBEoqxplidyb6E+buoPuoyPEgQdFfKiXGl
         UXPsqpHh14RlZkTjZL/2nLdF1zZfzpvxPYV3kefLCMTME0hz7pnNNMd6g67mmZYTIF1L
         RvuTeMQxop0bacPvKdhOapjeR9sbpfDnkZ1WZg0FEOgon50R2z2mrCvQzuT5pug6fO56
         67Tg==
X-Gm-Message-State: AGi0PuaFSlTg+GNyIvWwDmYKGrBWnWF+AOLCjh9etIija751oLKoPXoB
        PuWUCmB8Xvg3LsgvrBvYnb0=
X-Google-Smtp-Source: APiQypKNkXPH8XpsexN2GjOnzw59mmVAIPW5LcWMk6x1zhpo04BMtpG/z7gp2eGVXVdyBIY9rw8tDQ==
X-Received: by 2002:a17:90a:37ea:: with SMTP id v97mr248621pjb.26.1586277532018;
        Tue, 07 Apr 2020 09:38:52 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 74sm14075439pfy.120.2020.04.07.09.38.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:51 -0700 (PDT)
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
Subject: [PATCH v1 13/28] i2c: meson: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:26 +0800
Message-Id: <20200407163741.17615-14-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-meson.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 06b3bed78421..b3bd869281d3 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -397,7 +397,6 @@ static int meson_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct meson_i2c *i2c;
-	struct resource *mem;
 	struct i2c_timings timings;
 	int irq, ret = 0;
 
@@ -422,8 +421,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->clk);
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-- 
2.25.0

