Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7201A11B4
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgDGQiu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:50 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38572 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgDGQit (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:49 -0400
Received: by mail-pj1-f66.google.com with SMTP id m15so984272pje.3;
        Tue, 07 Apr 2020 09:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D5GzvKfRW7ZBOb1tB5z5fB2mwTysfR3jTFyi54tpUoo=;
        b=Ol450GSu45hQg5biQQuFtIwqt3HZvWJGGaX6iwdGKjIRC2Wenqz3BNCGQwIG5AgI0c
         WEe8oKMrZqUPYchYXX5WjVyki/NrYUL4AeXu/0FA4c7dw/A2LZrpvOMOkPECK+CLdcxM
         Lu6zvBWAofTEB4YYaq40E3/zsTKiDh2PhIfayx4ql6UCemdEywhtiUhhB24ZFUk2vdcK
         pliprMpAmMt6Q6SyW9L1FQIDz1mJ3thpoxuvsqyczJO3pYmhx6spd2ShuXTcKmMpb8Xu
         gladSln2PcM5Gkdt7gBqmL/BUYXkY8BnQaMpgG/mtUntWMw6STIT12kMIeXjKkghRKa6
         4GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D5GzvKfRW7ZBOb1tB5z5fB2mwTysfR3jTFyi54tpUoo=;
        b=Dq68hkQYrOEa55+zdp/tdq0gNVOH+eJPJoxkJ2Ks2lONGqem/IX9sXZw53fqDSEoeK
         5IxGtAYp7MI6nwhNEyyWZRXAgkB/9xQJnAicDmLwab51/E/LzOVBc7f0ZKyPe/oLiwgS
         oy9U9YDarZZq2vENLlYrVYJLNUjniM+7bhSNK/l/BOgm9jHjskt3ZYzKzzfRkEhR/Ft2
         En62YL7/r9EyLpmFNVryxzcWyGYSFUpPImvODObE6moPU/KQKI2sxHPveGoGejLAg85U
         ltcZFkaxfDJiUcYbOQDXZzNQTUCBVpTOd42x4eb/s1DY19Bq+YL3Y4JMxT1yIQ/grnic
         JunA==
X-Gm-Message-State: AGi0PuZevCTwTDDwcAx8TGW+wJBaEQt5gZwfogIO8kdWUBAg98ssoMRQ
        XjpobY9DSLe3JlMvhfxcObI=
X-Google-Smtp-Source: APiQypLxahLmhoC+qa4D8pSOpGeO3Bxcp7JqDS38Jg6wCNGknxhlPFVU39SjhlU32Q4vHKUzWySPuw==
X-Received: by 2002:a17:90a:a484:: with SMTP id z4mr183369pjp.77.1586277528018;
        Tue, 07 Apr 2020 09:38:48 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id y123sm14186990pfb.13.2020.04.07.09.38.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:47 -0700 (PDT)
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
Subject: [PATCH v1 12/28] i2c: qup: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:25 +0800
Message-Id: <20200407163741.17615-13-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-qup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 2d7dabe12723..940e9fcca8ec 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1665,7 +1665,6 @@ static int qup_i2c_probe(struct platform_device *pdev)
 	static const int blk_sizes[] = {4, 16, 32};
 	struct qup_i2c_dev *qup;
 	unsigned long one_bit_t;
-	struct resource *res;
 	u32 io_mode, hw_ver, size;
 	int ret, fs_div, hs_div;
 	u32 src_clk_freq = DEFAULT_SRC_CLK;
@@ -1762,8 +1761,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qup->base = devm_ioremap_resource(qup->dev, res);
+	qup->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qup->base))
 		return PTR_ERR(qup->base);
 
-- 
2.25.0

