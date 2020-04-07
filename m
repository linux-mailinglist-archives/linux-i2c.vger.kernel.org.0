Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37EEA1A11BB
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgDGQjB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32930 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbgDGQjB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:01 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay1so1461288plb.0;
        Tue, 07 Apr 2020 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bFhSx68lYhYMPHE/ilJASIu7Ud5iM/KlgeOPWMIS3zU=;
        b=YfGvGoDTvYhJbVEsV0DgD/p4GLdxPgbU43ZnmHw4ZO3p7Dz+S3z5WvL1La4+z0OHJY
         GeEdANttmL49Q+qmB5E/J0J+nukFGQic+bvGqKnC03LnWnan5wzsGAu9fpj3ApWealeb
         eRkUAby/nkK6pJYTj6kuEB6OxOak+qErd12btCRJE88GoOtP6tO9q0xXtpKosM0CDV/U
         VqA8QBQ/Evn9W3VFRaKLlxDAsyPgKyYwB0qKbe4nWb8XytgOxntKGDMYr5aBm794byXI
         1w/KK2ikbrjHghysdZTAVM/LrKH4TavB+LBiocHlzp20wcZ7rj0AAd0Ggwi5VkTEjsTG
         uXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bFhSx68lYhYMPHE/ilJASIu7Ud5iM/KlgeOPWMIS3zU=;
        b=KFcJMAWJPnFFnLAwgGamCJ5IirC3fvrZWdkJYvEmjfNhpFZGk7/+qUuvhVy0Uixo48
         ib25OeeH/9A7y/oihmFdY3Z4aXLpHFWozTsLQmR1QCRNnNEHvnb1cmLlaMMQVmw/OxWf
         4QXbClEoNlLYIfRQm2prddV+oaKSazyv7lh43zZQvsCxir2ZoRNAvZNNhMJUKnCsYZEh
         nVMBqzZUbbPBLXJD+/d3F90VHJb39LK82ggVywpOBZb62H17oSNMA/SysZ9jUn/7r1Rz
         L7nX55o9/FkRIPWTGdKEfH3LeTThkw0twqMrbLHe5QehZk4nOcL6QX60O4wmrJtRRkH6
         ppcQ==
X-Gm-Message-State: AGi0PuaAr+8ORNTz7KwbVyTrO6a6M/n/tHnahdZ2JrCgNvl5hcpftxYz
        1wLfCpI02fU0k5JCANyLSc0=
X-Google-Smtp-Source: APiQypL/rbu5R3cJQ9fqui3wUek+97fQeQZZDtvCLr7B5mtzSlZoksmmp4ATj2V2kZP90ELtRvyBrA==
X-Received: by 2002:a17:90a:c401:: with SMTP id i1mr159831pjt.131.1586277539955;
        Tue, 07 Apr 2020 09:38:59 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id a127sm14448769pfa.111.2020.04.07.09.38.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:59 -0700 (PDT)
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
Subject: [PATCH v1 15/28] i2c: emev2: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:28 +0800
Message-Id: <20200407163741.17615-16-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-emev2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 959d4912ec0d..1a319352e51b 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -361,15 +361,13 @@ static const struct i2c_algorithm em_i2c_algo = {
 static int em_i2c_probe(struct platform_device *pdev)
 {
 	struct em_i2c_device *priv;
-	struct resource *r;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, r);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.25.0

