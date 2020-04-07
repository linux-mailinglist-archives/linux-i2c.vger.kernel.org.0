Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCC01A11AB
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgDGQid (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45633 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgDGQic (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id o26so1965827pgc.12;
        Tue, 07 Apr 2020 09:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rurhJBB8WFP0X/vT5uuCydJOn/n+IHc7VQrAZhvvHj0=;
        b=Mb9ETmpKSzt84i2DIxkHyt8MriuACx5NTOxuRDJQ9qAzrPE5hiqDvKiI+6unPlcYkn
         i1XfMPkvdJkUm5+C0TYTbcI9ZNESJMCMyYri/kp6MDr6EGpQYo0NwZenjTJhYaDZtQPT
         XkJezbgE0XQH+TiSVjV6bPkjFcdJQ25/prrrQPIaqIII16B/3178J7bRVON9jl7jt9Ja
         1lkRhrMW9nS+JFUblIRpzY8kYjIXiywl3ZoKX6vyE/xlCvEf9tOteLq7qo+qFsCINCnz
         ybTwOjZYWEaRfOxl73USmqlIluCZ2rkDZ180IWE3MmJZXNbovGNPoKkQVI8d8m5vloFz
         9yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rurhJBB8WFP0X/vT5uuCydJOn/n+IHc7VQrAZhvvHj0=;
        b=Sxlu5Jg1Vedih/3BNRCV+xlH8wDVJ1ehMbzU1RVkEuEzpAxOLQMvynZRNIeuQJ/BO+
         pUSI3ytfYjT7F2UYUsUhd76VDmEdadRWGCgCzmxsMYNF5ikMJx+APJ+WGimsvkuFuEih
         XJPdWshi5BlMtgoxmRl0MJRwWWKHASWjpFPG/ensc56NSbodzA8K/WRlPWYJmUt0e9XA
         5wOQ5X3+Gwga9ps0khgcCiCnjJNULbpw6jVUWhCa2sbeqiB71l0bHCcgLGRQ2Gy+SfiR
         RXVGlJrsrzc5rDtIbr971r1UrWR+WWvgmBlgIHXcJ2qh1lBcmQxDnUBZq0ZTmGYTevCP
         moXg==
X-Gm-Message-State: AGi0PubqSc3PXOWFqbwfDAqL5y3pGINf5Dal8h8S0c4fgum4WWYAa1bY
        4y0gkZ9h1sc6DRmysBCHxCU=
X-Google-Smtp-Source: APiQypKrA6S87u44CAnqLSDpzaz50Ab2aPz4NUgv18cYT8CLJ21dASeaqA2t/fz1mKWEL1EqopU5wA==
X-Received: by 2002:a63:7743:: with SMTP id s64mr2786539pgc.240.1586277510956;
        Tue, 07 Apr 2020 09:38:30 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id e80sm14875482pfh.117.2020.04.07.09.38.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:30 -0700 (PDT)
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
Subject: [PATCH v1 08/28] i2c: xlp9xx: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:21 +0800
Message-Id: <20200407163741.17615-9-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-xlp9xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 8a873975cf12..beb2bb6905d6 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -504,15 +504,13 @@ static int xlp9xx_i2c_smbus_setup(struct xlp9xx_i2c_dev *priv,
 static int xlp9xx_i2c_probe(struct platform_device *pdev)
 {
 	struct xlp9xx_i2c_dev *priv;
-	struct resource *res;
 	int err = 0;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.25.0

