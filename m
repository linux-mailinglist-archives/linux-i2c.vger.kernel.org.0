Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7891A11DD
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbgDGQj7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:59 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36835 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729590AbgDGQjz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id c23so1990503pgj.3;
        Tue, 07 Apr 2020 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CtTj93RT22AUoZFV9c4kVk/vjcjiuKnw2EdzUfQTZt0=;
        b=eN291863ill/D0ps7cEyICwH2C1xq0YcJ48Bn98XNA7sHeKK/iXZfeuHToctcHrTA4
         P/lbHG9H6B3+7/6sHWt6AZ4ZmF4n0N2HS40kYqv8FDW976EXlzT8nxHcKTnWZY7GS4RX
         QT3MTTfYCU6a1SE6ii09dqc9dLSRvVtCNIawV225JBhtHOvwWCfu8FpfDtRsSsSOTqf7
         Md2Q3WzJY+OteJkmY9lle9z32yWPOYVYlH0AfUTKF3SKaZrR5AY2e3Q2THZ4lNrb322x
         bb24qsRVvaeusVbkkz+VJrs7qvHnQ6ou9OwnfvuDXHjADL/nfBhW/5A1P3EMIskIVETN
         tIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtTj93RT22AUoZFV9c4kVk/vjcjiuKnw2EdzUfQTZt0=;
        b=cVhIOZGB/hCNGl7xxkhSAY6WOVfpzCd4NEgTI4YCL90bcQFpPE3M/O4+B4SLWr9lca
         Ul6XUBYSvRZkqs5cjFU4j6Jcy4nU5Z9uEfr5OE1JuwEGaTaui+D0D6EZomIYkm6XVv8W
         60uZ45igvKMqkFvThkd30B3SkZ0H+BuCLKE2DFe/6T6jD/ZO+GvoZbG7HfCiMRU/oQHP
         z6DJDSO23qdgOZrwzBgEpCePPIvotq7bubct6O3nzbOO/7Ce3H9bth1a07efCNnONvd/
         9VYXRtPdKhrJ4xosI+DPo2FYacNwk7GpTl8p6Sbi2SlS/+1rHIXsgyzsQ4h+LVu35d4y
         s2tQ==
X-Gm-Message-State: AGi0PuaDWW/IOxb6mL4dIRHNFnbws5EmSRi20U6hB+9D3OoUOiLufTTk
        qacCd5765oxUl2dO4eIFHBc=
X-Google-Smtp-Source: APiQypKgOgO87V/3IVFebGYD+dbDYVB4T5zd/xMsEgAziL9EiEf/0Ygg8/A0Kh1FwHIJxJw5Jufk2w==
X-Received: by 2002:a62:154:: with SMTP id 81mr3308259pfb.228.1586277592492;
        Tue, 07 Apr 2020 09:39:52 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id mq18sm2292956pjb.6.2020.04.07.09.39.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:52 -0700 (PDT)
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
Subject: [PATCH v1 27/28] i2c: bcm-kona: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:40 +0800
Message-Id: <20200407163741.17615-28-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-bcm-kona.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 4e489a9d16fb..2bde3b5bad04 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -750,7 +750,6 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	int rc = 0;
 	struct bcm_kona_i2c_dev *dev;
 	struct i2c_adapter *adap;
-	struct resource *iomem;
 
 	/* Allocate memory for private data structure */
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -762,8 +761,7 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	init_completion(&dev->done);
 
 	/* Map hardware registers */
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(dev->device, iomem);
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base))
 		return -ENOMEM;
 
-- 
2.25.0

