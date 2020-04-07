Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5630F1A11A9
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgDGQi1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:27 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54014 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgDGQi1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:27 -0400
Received: by mail-pj1-f68.google.com with SMTP id l36so980281pjb.3;
        Tue, 07 Apr 2020 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AXe++Gaj8MpclyErhHCZ/ukAwMNv8mZXzgzntiJY7bo=;
        b=jWHL7xngdDxhsN3e0R4MNbAcNQhr+L38ZYjVXedBoy5UpSgF9c/Ui+Tqb32docYigg
         gVXi5fiZkZwzGQPx6pzm48G7dCdUd7Xaj7Dhcj7OCU++C/Ipdt01/IVhQqflcgjchAHn
         s1l2X8SscF8UKsqRHl6grN4bvshN1Bvfa5FyFZXoqF40r6g0O7VkqJV6woL4SXUGY8jS
         nibEqu7YnT6G6jVEchRPxlZvZMM0WsOam9IEtoouq/L9UPI6ATEW8HcezV8tQGmnOC2r
         Y3yWdnNbctPp4DSyREmihVKLVXJI5FTrYiOGcqSuevF/NWkaGEp+02ROZxiVy0GNoJIF
         aB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AXe++Gaj8MpclyErhHCZ/ukAwMNv8mZXzgzntiJY7bo=;
        b=E5c3dhTY+tlSrleUmY9B3Nrsq1Y1OHpODFykNrR0BiPJ0H73q+zZz+bcrPMjfy40CP
         R3T6EHH4Vp1aYlYsNKVxFaN23HhTe7i45G6XnUpphsR3197fBwHyNQkCk4mFR6NgSu44
         bsMAr20umMU/21l82sC6grP5qvipXGeZo/OJc9fHFTgI+SYx0mG/1e51JD01zChIFNNU
         LV+0nSCos9d3VSwearQ14P9D5jUHpUEnIxzE8SwP4VY8JtPm4mULncn3zGubSJhPGkw5
         gCLX7MZfxyo6ap+22QZNdG4LL+K9dFp5Vc+r4OoWzNuoolZgKVF8DMfOOnVgDFPDsz8a
         qfYw==
X-Gm-Message-State: AGi0PubB+CzkHfbsq4GmojgeZG0oW72ILMpLnU3cl1iYDowkd+OXs7TV
        LQg6sqha9fen4KCAcec/LEE=
X-Google-Smtp-Source: APiQypIe9nJWfkaLt2AWVoPG2h+SPqBXLk9c+/bQCpohsA3wdtR1d/umhRO6cRTZgj4fJZioxuRKIg==
X-Received: by 2002:a17:90a:ba93:: with SMTP id t19mr175971pjr.67.1586277506294;
        Tue, 07 Apr 2020 09:38:26 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id c62sm14153983pfc.136.2020.04.07.09.38.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:25 -0700 (PDT)
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
Subject: [PATCH v1 07/28] i2c: zx2967: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:20 +0800
Message-Id: <20200407163741.17615-8-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-zx2967.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-zx2967.c b/drivers/i2c/busses/i2c-zx2967.c
index 5f3318559b8d..8db9519695a6 100644
--- a/drivers/i2c/busses/i2c-zx2967.c
+++ b/drivers/i2c/busses/i2c-zx2967.c
@@ -502,7 +502,6 @@ static int zx2967_i2c_probe(struct platform_device *pdev)
 {
 	struct zx2967_i2c *i2c;
 	void __iomem *reg_base;
-	struct resource *res;
 	struct clk *clk;
 	int ret;
 
@@ -510,8 +509,7 @@ static int zx2967_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(&pdev->dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
-- 
2.25.0

