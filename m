Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07551A11C8
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbgDGQj2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:28 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36794 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729494AbgDGQj1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:27 -0400
Received: by mail-pg1-f195.google.com with SMTP id c23so1989924pgj.3;
        Tue, 07 Apr 2020 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tQajpkRbdeArZlQb21qGS0qf7y46zpGYXWar0lXtp8=;
        b=n10Sawszo/o9eKwpunK3EGx+yhXZp2Bb6Q9MtiGzBoq/LFT2u+tkCgrs4Epaos0+eG
         k3OSvGvMrt9yYuSNADbOhI/m3KsmHd+ckw9G4fj56GKHqpubiLvgSxChLuLFWZYtIC2r
         4T+19BzWDbTLCl6YEeYEf+JXHT98+ecihepC6SZKPBUSf9Q0lqQdijKbq7BiEKVmzlYU
         HNPnlIB1N8QRZZ1uOVCWD7KA4S5OPrdd+CjWtZDI/eonwi1Cl/thFcSSVJ5bbiELJpkg
         nXH1R1bqmZuNwV6JBwl5iVW7HWoO/cfje4xE8G+7dHcTpVnJSwvEBgIwafVfcrxrmDGy
         HUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tQajpkRbdeArZlQb21qGS0qf7y46zpGYXWar0lXtp8=;
        b=dYmakwdfUIX6hGbzINTKV7CpdM0KVQ3d/OWEjaHokiDcOO6ou8lcV/vrFMgS2YzJX0
         wNd2cU1Sd7I5NRPClOgh+nAGqcz1EhWHCn9ZvSLL+YB4RNPK89gH1BW2U3jlE0HWnZrD
         ItM4t803D8FTLbkRvAakr60VIRbHYkLHZxOMjH+A6mdR27lXJeOoO8VdMRkMTfK/0xYg
         Po1CtcOgLa9Is2jwh7YSqnh93uwRBXlp4XR6Aad3X8aSmEERfvmMyiczJ/P0I2hy1WFs
         9H75ztQbsxnayMu+FaqSJjvv2JrchMiZumFVNIKEblVkl66yWbBleWD6Q3kusnFsjxNK
         ywfQ==
X-Gm-Message-State: AGi0PuYV62XS4LujHPG0y7v3Ta3JZsa9hurfmnsTYPmtnaZqSOyrchPK
        xUaZYJCeD94zjNZgurgmgj8=
X-Google-Smtp-Source: APiQypIpvmXKcGjt41qLytPvGhaEbgnwWMFJRIahFj/ULYS29TkAx35qcnnFrVQc4UUgY1iSfAIN0w==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr3420243pfm.230.1586277565915;
        Tue, 07 Apr 2020 09:39:25 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id l8sm3366721pga.81.2020.04.07.09.39.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:25 -0700 (PDT)
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
Subject: [PATCH v1 21/28] i2c: digicolor: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:34 +0800
Message-Id: <20200407163741.17615-22-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-digicolor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 3adf72540db1..c199ed3334f9 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -291,7 +291,6 @@ static int dc_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct dc_i2c *i2c;
-	struct resource *r;
 	int ret = 0, irq;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct dc_i2c), GFP_KERNEL);
@@ -312,8 +311,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->clk))
 		return PTR_ERR(i2c->clk);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, r);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-- 
2.25.0

