Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9921A11CC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729528AbgDGQjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33569 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgDGQjb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:31 -0400
Received: by mail-pg1-f196.google.com with SMTP id d17so1995974pgo.0;
        Tue, 07 Apr 2020 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vFx/L7ZH4dPqkp7HYavhC0XYnGNovfn70VFNMQCDuIY=;
        b=avD1dL5LNEvlKPrkxsusZ8wDiTqr5Wu2oFqzu+Ywt6EdY9IK0v/s75E9NVixyvNVjR
         NeLkIp4UqdHYXCwURtix3ndKGDpWK4jZdSJf6cWSdOZHPcXaXszpfKDlMKBhOkG6FTMN
         tUEd1SNbG5JAB649gvOFux2DDaI7QkVCIcVdXzWrR6t78kVYSeimQXQ0t/35kpHc+Vp6
         QA88DFy2/ecK+WVmSLjt89HNK2UNYshvt8VzWdz7MbgRPSx9bUnc85VPnQqgXH+sOXfo
         zWt/1WblPgdgyRrDOmNB6dcWz1R9JycDxS7ZPK75NdGQy6qH3RpjMhcE2dVRku2Of8eJ
         oz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFx/L7ZH4dPqkp7HYavhC0XYnGNovfn70VFNMQCDuIY=;
        b=GH5xgex1xOmlbhttOk0Oanw5KtSzAg5NF8PuOAo15KUpz+oPPgq6tgc9XJJJNaqfz4
         08eFsrG1MJw9fn+Z8/h4qeI0k2FHWX5SVt77RAVYCP2cnoNPXqAstTXaUzmj1pqdySHX
         vSwZg64aSkmpl9ohH+1G/QGBjPiKNyKWjRY24+aoaVsc+FqQYkg2ClUlNtsCaafWX0er
         hPx1udQ0NYkylIBvTbT7eH+6VZq0AdiTzhjm/cO82R9sXGAVsR5YVqIIjrd7nlV5z2g1
         gfBkvOCKruV2iEkvpMp0WFpwnEvhzT+8EpithSUo7thHmxImq6AfUK3N1S+bnctptXH0
         e3CQ==
X-Gm-Message-State: AGi0PuY6V0jQ4JKLN00oYGCNNT71swMW0hymX5/ckUgikBD5QCIah4Nf
        DxSt30QJAR9POZTwtDU7chA=
X-Google-Smtp-Source: APiQypIN/K5CBbCVESma3SYFHA3dC2DbHYllBpWrUo/BVhGAuLWam6H0ShGkYzlu8vpD+HKYKjO31g==
X-Received: by 2002:a63:6cc:: with SMTP id 195mr2934422pgg.12.1586277570791;
        Tue, 07 Apr 2020 09:39:30 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id nk12sm2231199pjb.41.2020.04.07.09.39.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:30 -0700 (PDT)
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
Subject: [PATCH v1 22/28] i2c: lpc2k: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:35 +0800
Message-Id: <20200407163741.17615-23-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-lpc2k.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index deea18b14add..30f6dd1d37c7 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -346,7 +346,6 @@ static const struct i2c_algorithm i2c_lpc2k_algorithm = {
 static int i2c_lpc2k_probe(struct platform_device *pdev)
 {
 	struct lpc2k_i2c *i2c;
-	struct resource *res;
 	u32 bus_clk_rate;
 	u32 scl_high;
 	u32 clkrate;
@@ -356,8 +355,7 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-- 
2.25.0

