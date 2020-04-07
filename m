Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8361A11A6
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbgDGQiP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:15 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34170 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgDGQiP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:15 -0400
Received: by mail-pj1-f68.google.com with SMTP id q16so1292325pje.1;
        Tue, 07 Apr 2020 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGgWZp6rMuFQA14rS1qbUgkNVqxLPRtd3BmKsf3Xf9Y=;
        b=oyTohD9slwCU0i8iwyxnG86LDJxYVMZVxFuIz/pp0KtQUmI/717HIfdftZt0rBfzHo
         NdWpF+4k5i64/ahO9KbhU2pqHIPdL/9NHXvNnQyUqa2jxjs7jfFB48tLarF8fMPTPLm5
         7CX52oxB+n7fXXprKxjytHj9COeGUuumjYnruo+/gmETcW009B0yqcN0se5LaFF1VLze
         uhXon+0NFer6X0hHB4VaeGKOYcY6MqX3bps9e5AoCBPyhatJFyC/Z0o3CZoimA9aubPz
         eW6DzMN6us3np1Wz59wRXbW2kAKHtrr10v6VnbiYGuoSc8SEKbix5yRxhYTTyqLXmHDB
         Qo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGgWZp6rMuFQA14rS1qbUgkNVqxLPRtd3BmKsf3Xf9Y=;
        b=bop1PxL1ThwwmKf4VweiEEtqzEbfPd/4QL/gtNfReeW3zduHKUHN4/Ygy3NJjhEMgE
         Gg1OnF6XIYajsKfbFmyFxSWWESNkNJHlavUkfjJ7Y7XT86lgEvYVLk9kUXWKZwD+RpnJ
         9hF77zQ+VSTKAKmf0sE5SwkQlqboQ5M4bWDFHHsyR1ikMDQqUBSt8fhYYDm7qPj2yYco
         jmFu8ttCEieVYGgOtNtn156fW3VhrBr5daBkyznfdllCXEW2guXDEsOBaiXctNO6R/ei
         7/exB1Aaml8RfaU6KrYTKG9DMImeRnjXURNKPmoNQ3bhkITRAhsOraegt+kqDskJ0ZMA
         Z+tQ==
X-Gm-Message-State: AGi0PuYAPyMdR7dl4gZb9/0eXvC38+FzvICSqJKIq6rKoYdgfyIwZQL5
        tWBgbwdgigz46OR4a67EAJo=
X-Google-Smtp-Source: APiQypIP7cQiTGQMS35KDYqx5pyUYU4fUqnAvpp78di/mJvVJ4dPfsjxdWLxnXPbeacQhXWm3e6nEw==
X-Received: by 2002:a17:90b:46d0:: with SMTP id jx16mr151548pjb.155.1586277494188;
        Tue, 07 Apr 2020 09:38:14 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id v8sm10652849pfn.213.2020.04.07.09.38.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:13 -0700 (PDT)
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
Subject: [PATCH v1 04/28] i2c: exynos5: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:17 +0800
Message-Id: <20200407163741.17615-5-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-exynos5.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index e7514c16b756..5bf716df88f4 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -740,7 +740,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct exynos5_i2c *i2c;
-	struct resource *mem;
 	int ret;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct exynos5_i2c), GFP_KERNEL);
@@ -766,8 +765,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs)) {
 		ret = PTR_ERR(i2c->regs);
 		goto err_clk;
-- 
2.25.0

