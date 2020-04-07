Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6423D1A11CE
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729537AbgDGQjg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36526 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgDGQjf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:35 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2so1449942plo.3;
        Tue, 07 Apr 2020 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Na+MBxK/KB5LpeIWE2GukXhRC2p8is3PfN4u2dPnbGo=;
        b=rdsJRnTKj85CIzP6I0/OF6RGyGGXkHpG0eEx8qzCx4tK5g6J9O537QQ51HR+kfraoP
         yw2yeg6nYu4A9Tp++y0lRkRdzoVQaJM7+C2IeMhB1Z17tEdhy4KMy/8BQSjBLn1SGxJd
         KEzl5X1SpdtGE21LnXC904BdS9JeBoYkAKzKDf1LI1LX3Y0hN7rWSoxvSEKzHiA7LAxi
         AGIM4acZC9MOxfJb4POWH8dk9sHdPuzRF5ep9NsmYRX5YAxjDIV1wLQV6A45qYWtQht0
         RnBGrLAQ3Zx/DZiQXwXuPYUSe42yaviFrvhgfGnrpao7F2E/ixJyaNMY3lukXfb508SM
         KtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Na+MBxK/KB5LpeIWE2GukXhRC2p8is3PfN4u2dPnbGo=;
        b=SbczzFTKvwIXfL0CdXZdIPTOP1YO+uaIOef6/jNrJ80z1QufV71iK8NG08P/Ylg1Iw
         1+rOScuKY1s3LO1rQxONZ3TECo0wj0L49ZJxYJZBZ4K1JktV389QRSBHJvjk93rlB42M
         X0fOy/jLHGpUVk8Nxa0eoNU7REpLCgt1pdUVCYxZ9tpU2cpbFFopFy746pPB9b6+4/uc
         f1HcjKDhJaiK+/TiAD4i4q7W1q9XV4CR/r5N2u40v8a48gehT6qbp4+dN+ZFKSlBVv5o
         nfxpKBjNrBzt4JQ4eVS7cAbyhQt9kKbhMmnW7zF3JiRe4sxQxDeDhEM5SYJ9otAtfB5k
         m4zw==
X-Gm-Message-State: AGi0PuaUTAj+bR3ktgmST2uvm4ThhdXxDRtNEPHGtKuTL6uYRIsx2O03
        fdtrFdJut3Gm/S32dSGOTbY=
X-Google-Smtp-Source: APiQypLjYFN0D/M16a9RV7IXhhfiacD3u6Jv2Cbu/4Gxm1c0uvBn9cRcGFwJbQRU5zOmM3/sCJQRhw==
X-Received: by 2002:a17:902:b591:: with SMTP id a17mr3156573pls.283.1586277574594;
        Tue, 07 Apr 2020 09:39:34 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id c9sm3083749pfj.214.2020.04.07.09.39.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:34 -0700 (PDT)
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
Subject: [PATCH v1 23/28] i2c: sirf: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:36 +0800
Message-Id: <20200407163741.17615-24-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-sirf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
index fb7a046b3226..269a71b0ee7f 100644
--- a/drivers/i2c/busses/i2c-sirf.c
+++ b/drivers/i2c/busses/i2c-sirf.c
@@ -272,7 +272,6 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
 {
 	struct sirfsoc_i2c *siic;
 	struct i2c_adapter *adap;
-	struct resource *mem_res;
 	struct clk *clk;
 	int bitrate;
 	int ctrl_speed;
@@ -310,8 +309,7 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
 	adap = &siic->adapter;
 	adap->class = I2C_CLASS_DEPRECATED;
 
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	siic->base = devm_ioremap_resource(&pdev->dev, mem_res);
+	siic->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(siic->base)) {
 		err = PTR_ERR(siic->base);
 		goto out;
-- 
2.25.0

