Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FACB1A11BE
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgDGQjF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:05 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34879 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgDGQjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:05 -0400
Received: by mail-pl1-f196.google.com with SMTP id c12so1454328plz.2;
        Tue, 07 Apr 2020 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=COoAuq3RN8WgiQF8XQrpXoF2QsJ0dC9sVNr9xVwXQk0=;
        b=p6l8fmT7ODsEzUttRgW+BI9wHrfF7FjDZJqG6ln9UDzowd4TdJzuRe8l03079RTuId
         4x7O22ghuSAqqwygPhf5QivF4HmNISSiMtZ86676kVEuAm2+duswIkUqItFQV9NxcPws
         Bqwo74Bj2WcWTfm6IpUHbVTAyZusfn3HZfz7JPF/aLmO6fWJXpZ++WftXCMUiZg9pMSc
         tjjlGM9m2EJgWvCB2kMG7PWfRGJwJ5//fwJkN3dYWJzbageWFCvIwC65Zymxs1aAYHMw
         GIUHNYUua3wNlGne0CMIrPQ/USkf0rX9WcAcKJHkXRe4Bb3k2VK0OIdrXiT8KuPukhwd
         gnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COoAuq3RN8WgiQF8XQrpXoF2QsJ0dC9sVNr9xVwXQk0=;
        b=XxmJNVxuFCYuxSnUcWP1ghxbckmjArEkW9kghaCtue0rFr1N6YlaxB0scNYqwS5/eW
         X5JPYxhnTUm+ZPHaJ2EHcRNhZkAOfU9xEEun2TcREEuhxbG2beVcCAY/647O+ObCmC54
         kSg81hLXMDc+fY52+gK0Z+FOl+/bPAZXxvt7d5y3zB1dPjEL77TimA2HjLt9oBO+RHQR
         BV/PrUwbOxpurrkowGWbvuR/X9BpM8txJ5/oxCSQmOMmsQTtVCp/RIS3ZUCer6ORSlV7
         sVG6P7rbcTX+DAfjIE1gabWaT6UVZ+jHH7f3UJunI+3A0oq7tKywl5HPwmtVLUGtk65l
         2Azw==
X-Gm-Message-State: AGi0PubBJiYsuKl5kKbxD7xnv//vUylIoCt+Nspb8pEA6QAI2yeN/oYb
        jXNz6S2TJej+B9bLOh0vW7Q=
X-Google-Smtp-Source: APiQypJxNR5pScUeaxX0ZrnCJcfZx0QMU8SHX/sSSERtLkLPHNSmXSmAdzXBo7HIsz4nqiGNIcS6GA==
X-Received: by 2002:a17:90b:4d09:: with SMTP id mw9mr175593pjb.101.1586277544082;
        Tue, 07 Apr 2020 09:39:04 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id v5sm14372036pfn.105.2020.04.07.09.39.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:03 -0700 (PDT)
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
Subject: [PATCH v1 16/28] i2c: jz4780: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:29 +0800
Message-Id: <20200407163741.17615-17-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-jz4780.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index b426fc956938..ba831df6661e 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -763,7 +763,6 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 	int ret = 0;
 	unsigned int clk_freq = 0;
 	unsigned short tmp;
-	struct resource *r;
 	struct jz4780_i2c *i2c;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct jz4780_i2c), GFP_KERNEL);
@@ -787,8 +786,7 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c->trans_waitq);
 	spin_lock_init(&i2c->lock);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->iomem = devm_ioremap_resource(&pdev->dev, r);
+	i2c->iomem = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->iomem))
 		return PTR_ERR(i2c->iomem);
 
-- 
2.25.0

