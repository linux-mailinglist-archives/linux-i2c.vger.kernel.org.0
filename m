Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 306791A11B1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgDGQio (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:44 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41931 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgDGQio (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id m13so1977038pgd.8;
        Tue, 07 Apr 2020 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hTp5JFzw7iFE62/3j/K34FEzHjeTdF067uEEsoybBTI=;
        b=vahRpNVDJcO91UBj+3ipJzE9QAg7WGJ199XnWhxdY+k40YM4sC556gw0hKUvRPbNCo
         UKU8rVgjlREBqfQ/s59bzXQD/OqLYqeMiA99DZAMHTy/JCkGA+DR8f+KK/0GT1gOWHSD
         m9E4Mpc+t5A/WqWDXt436+2UWsuLKpARSbM/NioekY+EZK0DR3ryqM3S8F9ZtwBRMQqL
         Dm8d5CGteSYHYWyOotahGzxouBDXMemUEKWP6ZlviQb2iijvtp4aGjvoWWnCinEpd24O
         tEnsuNgU4T6li2MYUXM/HcskFheywXm7S6QRohfCXu7aaPDuCMhFGSqdfe15Y/+wc5Th
         vjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hTp5JFzw7iFE62/3j/K34FEzHjeTdF067uEEsoybBTI=;
        b=MdmyQiBsH7XHSSj9BpeZ4KHcP4m3G36A7H32VrmiDy/bUIU3flF8Wg1nH4u9OIHxs8
         LxO5WjsU0mKefQ6Ro3KejRtXtoy3l7mRspnT6YorYln0ZOcbCIitZ5NII0PTq0AkBTHY
         wvVrZMrpofTWQ3zgHwnky/XNKlH1l8Pd2O1GJsJ6AlnJj5+UaRs6zYsZftGc7Loy0rpg
         +D1NZEIjisjltfvj6QVjAWSXlLhp1gGAknSiVkFYFmOWZZV9SjBQltuFEXsxDDpt6Vab
         0+mPzcG1Ae4+IsMYH5sDQHvOim4vJZTc0/hST0baGGFjuOaCcertVUax4wxvJIeL2vGh
         8FfQ==
X-Gm-Message-State: AGi0Pub0M5Y3B3C7dgnwINJVoWktfiGDng6Ke8WSyWHwp7cUMhvj+lvX
        LeACz2Pe86+KDo4+L5H4v2U=
X-Google-Smtp-Source: APiQypIqXxihzhIDXARdzXA0/J0LHH02Z5cVOE2CzcfGjUZTsG+OglV42EM0Fi4ohqKZMeFu3iPuzA==
X-Received: by 2002:aa7:9150:: with SMTP id 16mr3525582pfi.209.1586277522920;
        Tue, 07 Apr 2020 09:38:42 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 79sm14287427pfz.23.2020.04.07.09.38.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:42 -0700 (PDT)
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
Subject: [PATCH v1 11/28] i2c: rk3x: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:24 +0800
Message-Id: <20200407163741.17615-12-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-rk3x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 1a33007b03e9..862a26f66b76 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1193,7 +1193,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match;
 	struct rk3x_i2c *i2c;
-	struct resource *mem;
 	int ret = 0;
 	int bus_nr;
 	u32 value;
@@ -1223,8 +1222,7 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&i2c->lock);
 	init_waitqueue_head(&i2c->wait);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-- 
2.25.0

