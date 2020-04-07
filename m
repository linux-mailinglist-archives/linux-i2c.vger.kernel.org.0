Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9747C1A11D6
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbgDGQju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:50 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37778 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbgDGQjs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:48 -0400
Received: by mail-pj1-f68.google.com with SMTP id k3so783pjj.2;
        Tue, 07 Apr 2020 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=exEnzA5XQ/FWHkjgrnVrTQgx+dHRYjbJi8cjIzdZAu8=;
        b=B3wdZRyCCBvvBjwzF2a++eqz01lIfnrGlK2TbmQ3RDq/sPym2J8XY5BxVOLPvfenR8
         6U4yUnVdYZvqMugTM0m4jCEmdSVZ21Aht3QDjxhRo0r0a9Vvc1GlzZ4ZgWXi4FIrSw0x
         Q4XxvjkhBnJKeWElvl7gRwQaSytENF6R9v/L4x6P+K3RRmz8jeWwa+H2fwdJI/8NhNaQ
         j2ym1ho4NAPIJuCr/8QdqH0s3FvPK0MEqC9tkCLnfzCIfyonVJdbgZiYFcVYVK3SkuoQ
         4riupmUdozu1P2lnJAvSNy7hR9gQl0n2+cwRUR6p2+mk9sZWDn01XPOP96y5+FCfEOpQ
         MtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=exEnzA5XQ/FWHkjgrnVrTQgx+dHRYjbJi8cjIzdZAu8=;
        b=YupFTaVUvSLnk0Pi1ySLBxw/3zj9iv6ca3Yc7oaU5szw9pY3ihGhMT6q78xJuXHJlq
         I2RhR0nE2L6wQzAKkyy5vSMPEcKdiG0JT35Cd2dcGzuff/czF2RYHBqt3L+iRwbbuj3j
         eYmCvcsFvrSwyv1gwedgMDVJ18wZqBrhBme5FCbVwTYgJqx5GpjnrOTsYzvYIrX9kHZ9
         v3OQOIWZ7XMFsjkJXJj8mw7oaoYY48r52xfMAsshB/zDE8aDwh5OS1eYf/beomD0cvjS
         77gmIHvvmHRc1+eCrDdIUZ8iF+Mwy2i0HbItdJUBThU2P5ZNrEwzgabe9TDJvZBdNchM
         Rtqw==
X-Gm-Message-State: AGi0PuaDUUwLPnyPnsMmAPAQeusdHIsP8PFRE2/ACfTgjP7aDTvGQG53
        g4kXMqOlwigFS7M1DLaKDIc=
X-Google-Smtp-Source: APiQypIZEbIutm/utWBUEq/teeS93v2qOo9/FCAdhUeazPWOsQQ9NdMtoCGVgR7AA2gMKlpelYgZyw==
X-Received: by 2002:a17:902:868b:: with SMTP id g11mr3218361plo.20.1586277587171;
        Tue, 07 Apr 2020 09:39:47 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id e26sm2668077pff.167.2020.04.07.09.39.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:46 -0700 (PDT)
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
Subject: [PATCH v1 26/28] i2c: xlr: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:39 +0800
Message-Id: <20200407163741.17615-27-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-xlr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xlr.c b/drivers/i2c/busses/i2c-xlr.c
index 34cd4b308540..544fd9459d60 100644
--- a/drivers/i2c/busses/i2c-xlr.c
+++ b/drivers/i2c/busses/i2c-xlr.c
@@ -362,7 +362,6 @@ static int xlr_i2c_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct xlr_i2c_private  *priv;
-	struct resource *res;
 	struct clk *clk;
 	unsigned long clk_rate;
 	unsigned long clk_div;
@@ -380,8 +379,7 @@ static int xlr_i2c_probe(struct platform_device *pdev)
 	else
 		priv->cfg = &xlr_i2c_config_default;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->iobase = devm_ioremap_resource(&pdev->dev, res);
+	priv->iobase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->iobase))
 		return PTR_ERR(priv->iobase);
 
-- 
2.25.0

