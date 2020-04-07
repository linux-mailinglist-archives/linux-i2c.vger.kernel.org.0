Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC0441A11A2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgDGQiH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34874 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgDGQiG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id k5so1992936pga.2;
        Tue, 07 Apr 2020 09:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hdJkyJA4DQXKPFAUZLrofPOr39Sm9qcTCxF4bAfmE/Y=;
        b=fOF7nCzUQJZoKsDaz3OM3MD7cErAofwPUiygWqLcorxuMl3NLIb5r+OkJ9j9/9be4F
         PtwRZMm00LR2HMIxnccl+XGsz9tu4Ft4D5s9mzik+MlW0S0daZyiSZZKEsy3NgXI8L3x
         dbBSy7gMOKlFjBlrN3OhpgBTRMsYT3ISWIWW1nVqb2S82mexGR32GTMQgI76oG72HQQ0
         wohWth2e5VLYEsPa9S3Sdhqn8MfHzNLmZnkDjcFJObItOMoViReV0CCJZgx6gkQ5xVvM
         MR2QLdO8VAUfmxAfI+gz6ct1K4O0VlCfsvHmb2nhkaHbYfl873B6tHiQETJ6NRpN2MCv
         TQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hdJkyJA4DQXKPFAUZLrofPOr39Sm9qcTCxF4bAfmE/Y=;
        b=obj8FkCex/qiNMH4HIOAtGmFEq7I1SVwuXwx806dt2JljOYj+L1VsPTI9IgMns6U6T
         cxlqw8QRaymgVmPQzPYOOOWfdwZjLbndATv1ni+ELXzBD84PFIlGVe/z2LlY8HDDGohj
         pOBmVZ7dZpd0RY/eoEEnK7gkTozZ3ZzWFMPOiGjbd2CQC8xeUg80G2erlBIgLUfpH4x5
         ckUPoStKJnyp7Fg8Qf+WVOJExI8ptP+W4RtI7wi8S8q5obZQ2NGWXY38Czjr2IHMs6P/
         hEQyGp6HYxiC6kf4iPkyIZSwmIX8xpOxGLejMznYOYYJ1mQFQavI/qUWFyerlq2xPvFj
         bRzA==
X-Gm-Message-State: AGi0PuYspI/ihKY/v0V02SZdeqNahsOG+eDkTsMRBPoO/wKa6Se1zWs+
        f+wBQvIeC5h6MVsXX7i03vw=
X-Google-Smtp-Source: APiQypJy8UFTKojsVLCdd0786n6/aw7aVRh3TWA08xrxOmCbrzfj6rmqIfuD0jnv/7QxyvnjfY44tQ==
X-Received: by 2002:a63:d84f:: with SMTP id k15mr2752575pgj.137.1586277485728;
        Tue, 07 Apr 2020 09:38:05 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id h16sm765003pfk.38.2020.04.07.09.38.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:05 -0700 (PDT)
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
Subject: [PATCH v1 03/28] i2c: owl: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:16 +0800
Message-Id: <20200407163741.17615-4-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-owl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index b6b5a495118b..c9e7fcac12ae 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -399,15 +399,13 @@ static int owl_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct owl_i2c_dev *i2c_dev;
-	struct resource *res;
 	int ret, irq;
 
 	i2c_dev = devm_kzalloc(dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(dev, res);
+	i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 
-- 
2.25.0

