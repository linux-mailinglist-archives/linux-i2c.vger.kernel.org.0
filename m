Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F601A2887
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730787AbgDHSYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:06 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53004 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730786AbgDHSYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:05 -0400
Received: by mail-pj1-f67.google.com with SMTP id ng8so171074pjb.2;
        Wed, 08 Apr 2020 11:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nlrvf8fp2U9OGb1ZIrjNCK2BX6Ii8V5yANnwk2DM7Vc=;
        b=jriGEKpLWui7b2XvpGCs2adK+Voc1MkUgn+lw+/v6A1UD8Y+5dNClJd6jOfK5LGPBI
         JmGCfe47BWWwd4Fj6nCbpRg4+X4X7fczcQ43+YqxsNf8BhCdKHGDNwTDYV7pxhCCxvKZ
         fMGoPAdv/51Ox3Cpu1x4SwZUlTFgMNSzHIEzkcNAkgbRfDCd5H6mhc6lt+gGfVfLG1mk
         0+ZwMyF1eRqAmlh2Ff7K5XblUwo96FgpGK97TejD6V7G2yEB4zbR5FEn8HOx9VClOQoi
         uB4CwR/aHN29152VLqE05kBkjavCxGy1maeN8eq7QO0TCb29s4RKHm3OAmJ6B+cI2vPU
         hHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nlrvf8fp2U9OGb1ZIrjNCK2BX6Ii8V5yANnwk2DM7Vc=;
        b=kUjhWO4LoLQdp7bRYlsZzjBmRD1PAtzuF4PCNr4x0H1NqzcA3qriw0iTilppZnRw5B
         qjDpaB8niAB9FFFxpsxCj4czxb4DlNVkWMZdoMPknGCM5RZMsmmM1LaSPABv7/AaCemb
         5fzwSqOWTc1MYV0k+ZcqvHO5MxdtQWI/iwvrcbcLkE8YL+vImM9bDdMoV+g3q1hVRQpU
         bamq81lztaAWEBkRjIv/Epi7W8CWdoVJpmGtwtzH6H1cLroKRZw4fueI7ckcZh9ngx6a
         Z6Ay2tHSit1zP7XYefidS37BhFX4Y1j7xO+KsvEStkvTq86kGd/TBTK7wWKN219AbM4o
         gwtg==
X-Gm-Message-State: AGi0PuYZq3r0LYzYOPZMXrF/K0U9XnWmO/12qa4zck2bAL2SuOD653Jo
        0fsSxP//6AkY1sgdwuF1Uig=
X-Google-Smtp-Source: APiQypLvQYDbj5HxzhMm6TOMMehQ7TnmyH3QiJlEGiLPukJu8hIOsGMKZGc20Nhg+3Z6F+ltoqYH3w==
X-Received: by 2002:a17:902:8b87:: with SMTP id ay7mr8510632plb.281.1586370244522;
        Wed, 08 Apr 2020 11:24:04 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id q201sm2568873pfq.32.2020.04.08.11.24.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:04 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        ardb@kernel.org, gcherian@marvell.com, jun.nie@linaro.org,
        shawnguo@kernel.org, tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 10/24] i2c: meson: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:57 +0800
Message-Id: <20200408182311.26869-11-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200408182311.26869-1-zhengdejin5@gmail.com>
References: <20200408182311.26869-1-zhengdejin5@gmail.com>
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
v1 -> v2:
	- no changed

 drivers/i2c/busses/i2c-meson.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 06b3bed78421..b3bd869281d3 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -397,7 +397,6 @@ static int meson_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct meson_i2c *i2c;
-	struct resource *mem;
 	struct i2c_timings timings;
 	int irq, ret = 0;
 
@@ -422,8 +421,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->clk);
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-- 
2.25.0

