Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3AA1A2884
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729476AbgDHSX7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36974 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729702AbgDHSX6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:58 -0400
Received: by mail-pg1-f194.google.com with SMTP id r4so3693302pgg.4;
        Wed, 08 Apr 2020 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wbBLmi2DoCsEIV35Ff4kc4N3zGno3JD9nHI93tz64FQ=;
        b=u7FRQFXVHBcTWjyfvtk2s1CxMkIESsYWtniiyZgSvfR1QEUYK7U3FeKXCLEeJdXB6B
         4AUglwPT+C1y2J4oW5KBwoAzTaxFRz/BwQ/d6IK8NM5mpW/d1Cn1pBEEGdqljyJIgkEs
         qaaRKn4lgd2lFjHkyJTOC8BkP+ZYueQTiKrmzidAyrCYUZKgpF8bKdia3NuiK/iEWJyT
         z7AnL+rl15q8dEXHsBXPHR5jQCAUbJob5KVvi0NZ8dP/97xvkRyrWGsaK+aYEVrkhhDy
         RRBEk/bxJwLwuvIZmR/Fpm+sfJunjBFrUCrLMkzLhyUkMq8BDs0EwYH5unWAweSLJ5JC
         Tb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbBLmi2DoCsEIV35Ff4kc4N3zGno3JD9nHI93tz64FQ=;
        b=mp/FaNEhvFBBw+uOW0+Z2AZ+s9NHH7QVauApcGaq6mOCQ57TyLbq1cKSstOGpkkeGW
         Ro8nyN+VEQpUX5FdwlxFBqau+TM0M7yywspndtnZuj/ziZovy3TleSbIZNbv3+waADTh
         Pphp3dREYyfivclI83YorUMPRF/pqA2Af3/43BVcpyavY0qJBB70zNMb7zB5TISf1T8P
         qxWmYi7Y+IS05a95i/IHS86Sp8Gk/2Y1lSb3YFNRoY1Jl9en0Rzz0JRgAdyZ0gRe6ZQe
         yPv08kx0+TLbO0dSKJVfchOSs8mE18p+jaRyGBNhc63wVDDpi+6SaMzrbzGktR2Guvur
         L3eA==
X-Gm-Message-State: AGi0PuarB+HHKoxcYaIcCdfxkd+JXlGdSRvkJeAhbEVzQfC++vxrmMvB
        nfPPEahLVjjbbc2SFjQBUrI=
X-Google-Smtp-Source: APiQypIupj6294IAHNLHRBxjtGRMxYbTXmJLR8TDh+CLjTsrHtrcVgYpQZKeDxCIhvDpBF6fnji7KA==
X-Received: by 2002:a63:5716:: with SMTP id l22mr8218079pgb.164.1586370236777;
        Wed, 08 Apr 2020 11:23:56 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id r63sm17333523pfr.42.2020.04.08.11.23.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:56 -0700 (PDT)
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
Subject: [PATCH v2 08/24] i2c: rk3x: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:55 +0800
Message-Id: <20200408182311.26869-9-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-rk3x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 1a33007b03e9..862a26f66b76 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1193,7 +1193,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match;
 	struct rk3x_i2c *i2c;
-	struct resource *mem;
 	int ret = 0;
 	int bus_nr;
 	u32 value;
@@ -1223,8 +1222,7 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&i2c->lock);
 	init_waitqueue_head(&i2c->wait);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-- 
2.25.0

