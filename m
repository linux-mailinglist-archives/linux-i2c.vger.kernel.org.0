Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D791A11C3
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgDGQjP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36884 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbgDGQjO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id u65so1051052pfb.4;
        Tue, 07 Apr 2020 09:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6HmSkhu3FjCFzZaUxCM2aMgledh3iLP2doIQM+uvUtg=;
        b=F4I1imoDOWZKzGx9bPHVD53OWBbiP/Mf3QS2pdSp0owoey5hrLoninPoNAc5rqCLKk
         FMOqi+7J3BqYLgF+fgq68KwGlnZzuoig1Jfa6weMo+3AEO3/NRt76whyEP7zAHb6fJ5v
         ImOYPy4Iy9e+/hwgi6RkyvPFZEncstmUd1X1Epoeh+MybYllGXlfIHuySHJEAgSdiDlS
         BIDdqJw8bhcUVkVKX0vy3wTzltPLiivnZOOrHpt5CX168M9XEPp5cxHUgdsi8JOTPX6Z
         Sm28U21AyeuwDh1pZfSKGQqQvda06ukD/KImB3q7uD36v7VgH4Vw2ggYKXth4rc6OMag
         HYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6HmSkhu3FjCFzZaUxCM2aMgledh3iLP2doIQM+uvUtg=;
        b=r2PQIbNKoBYM9xRsfqTPKAX/QKzdyHpEbF5TWOH42u6vRxtNYGZ69/V5r3ql9SfE9e
         f0z7Fa1VKYigWh4a9047w1O8buHNFqi1jP+I/miOuaMYYa92CxYAlUpmZJ1N3V+fuEDS
         FH9CB1JZfcsMr94UzsiqfzM0VpcXur5cYzud6OEQ5TkZjdbSvLUiIjdUs55LOrEn89QO
         VmFwbeNvEZoOJrIXXpPw909LEK14js4igjukESsv8//H7KLPclzcko8HHD7WGfc0HFde
         EOfxmDIA4X7AzAvAu6AvJud2PLzYKqLQd7Ef6usoQZpFbQPWIl8LJ9PQgB//q6v93TJI
         puNw==
X-Gm-Message-State: AGi0PuaGnfpQeMQacqJsiyQP+bh+LJhZ5CuB16YwCNxDWEOJrfzTNl5A
        zRvo/DWVU0OagVxXjYsAgYA=
X-Google-Smtp-Source: APiQypI6zZKeIBD+nhMTtHximiswwVlPcVyJyfpDphCHNwXtYNIaUnJphZ9Re3U32RM9OfOrgW0Vjw==
X-Received: by 2002:a62:e20c:: with SMTP id a12mr3454657pfi.37.1586277553321;
        Tue, 07 Apr 2020 09:39:13 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id a75sm2002866pje.31.2020.04.07.09.39.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:12 -0700 (PDT)
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
Subject: [PATCH v1 18/28] i2c: axxia: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:31 +0800
Message-Id: <20200407163741.17615-19-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-axxia.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 0214daa913ff..0aa0753e2430 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -734,7 +734,6 @@ static int axxia_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct axxia_i2c_dev *idev = NULL;
-	struct resource *res;
 	void __iomem *base;
 	int ret = 0;
 
@@ -742,8 +741,7 @@ static int axxia_i2c_probe(struct platform_device *pdev)
 	if (!idev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.25.0

