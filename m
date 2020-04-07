Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 643EA1A11E0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbgDGQj7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36948 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728667AbgDGQj5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id u65so1051876pfb.4;
        Tue, 07 Apr 2020 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VRer8X2L/GUfBquT6NjWsO1KdgfiQsJvE+ja9YUCoBw=;
        b=czssrx60iQ6+hcLiuMSvIwFmTLPuzgEeGYNSmaF9PYR/RMPq1lhVgFl0e0NoaRdn9i
         k5tlRRS12hm+t1ookatrwhGPkRhrlhBBMDObFzvTHMp5dyyzvNmFNT3lso+pwb6uUciY
         ub9DL3xZo6iSKyv8sTp/HxGZYti061s3FY7YCAz4ZLcbIwTWRXVe15Td9dMM8NC8eRz4
         dn71kr8Nqa/ZGsHB/OnOImEBU3dnyhB7mWu9orjgSunFbTdOb+J/ZdLA9TVZlDnU9hb3
         0gj7IbKqSlmp39UvXk/z/ybw1yVfYxvnpTgg/hwzGYvyVbtcDUFwpMnDYPZseuRztQWJ
         JmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VRer8X2L/GUfBquT6NjWsO1KdgfiQsJvE+ja9YUCoBw=;
        b=Fmuc+mhbf3+BOewinzQsYGLeotx5LV1B9Mng/TCQxrvXDx3Xh8opQA6NAUajqdbKGg
         t8pNFuJiedXio+/rtnKGevLwlS+VlfgdHnb3DtccaTeFY2Oehdx7bRS0STZdhuCepTpi
         l8GeXaIG3DrkuMoj+TEiOCNb7whxhg65FXFsOBz95yzMu6RgUAdI7HZr9s07hNu/4FTX
         jajlxDsHIKGp3jxf/ePvRHbwF8Bp/Jgcjvpj4gRF/HM9bPLdGG2qSeC3DYXEEPurPpJD
         AUW3i048B7LxZKTmh4ipU8jwNsgyRAopR7uXkpF+jXOYDF7bWIxlXrY7GbwTXJXGMgZW
         uNLg==
X-Gm-Message-State: AGi0PubnmTLY8i/Im4LLH24onXvW0F83J3ExL86KiMnabgx4pnO53wHz
        W6WxFQNTE+xi5YyWLLbILJI=
X-Google-Smtp-Source: APiQypJGSKZhvfZ2QAlimweCH8iql1s8R258WWfSHP6WRjIydPOv6M9y+MFtyf4SfosMWHq7TxFq0w==
X-Received: by 2002:aa7:9588:: with SMTP id z8mr3201521pfj.240.1586277596617;
        Tue, 07 Apr 2020 09:39:56 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id a13sm1127925pfc.26.2020.04.07.09.39.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:56 -0700 (PDT)
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
Subject: [PATCH v1 28/28] i2c: octeon-platdrv: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:41 +0800
Message-Id: <20200407163741.17615-29-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-octeon-platdrv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-platdrv.c b/drivers/i2c/busses/i2c-octeon-platdrv.c
index 64bda83e65ac..0c227963c8d6 100644
--- a/drivers/i2c/busses/i2c-octeon-platdrv.c
+++ b/drivers/i2c/busses/i2c-octeon-platdrv.c
@@ -136,7 +136,6 @@ static int octeon_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	int irq, result = 0, hlc_irq = 0;
-	struct resource *res_mem;
 	struct octeon_i2c *i2c;
 	bool cn78xx_style;
 
@@ -167,8 +166,7 @@ static int octeon_i2c_probe(struct platform_device *pdev)
 	i2c->roff.twsi_int = 0x10;
 	i2c->roff.sw_twsi_ext = 0x18;
 
-	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->twsi_base = devm_ioremap_resource(&pdev->dev, res_mem);
+	i2c->twsi_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->twsi_base)) {
 		result = PTR_ERR(i2c->twsi_base);
 		goto out;
-- 
2.25.0

