Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655981A2879
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbgDHSXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:46 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45182 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730703AbgDHSXq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id 128so1075752pge.12;
        Wed, 08 Apr 2020 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jwcLpQVyDKzZ8WD+SF2LbCD6m3yu3dfWDUA/mq3QpW4=;
        b=Vdjt3/XqVl8bEzRyLUPRBKRe6J2+kpAkO4o0OL/raJg+uySxoznPKTUyFLNGDH1BT5
         swJZulexOGx3PwE7xC/WIrl75dDmqXuOzmXZ9iRs/Xx7e78ukRDYk8O6n9GfOATUSsN3
         YLIDHM7zBLy2kWVHU9dvoLGAcwR4b6lyQP87jnx3IK/ekn5pR3lq2ZIK3RNXyyRr9K6z
         6EZEcgIeyXr0AcsWRPAeJvjGVvZTquHw7zjlQ5B5a+dIPncZOSg5+6PS3g4tAcLOMmZZ
         /7z52C9XLXDl1VphVjwNQw8GV8KO80MkJJNFVJMPSXp5vTX6K4m8cAZ8oJ/182kgmEpm
         IMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jwcLpQVyDKzZ8WD+SF2LbCD6m3yu3dfWDUA/mq3QpW4=;
        b=GjU4oM286IKcC4UMJsKbL4HoSnXCOCGN4KxtQYZTjkb+Y5lpt7NlxKHAXC7C9kBj0B
         ujW4LCN7qEWOZScfl+nb0Z5gy45uEBZlMKjhJSzSDEVAkLqK1DCUbLXxCTNnqcF/J/cb
         D96xum3XXOpf01AjEWlYQU+f06iEtR8OJ9V1PJnzXRWng+MHWraHIeD9sdeF/WpfANa2
         g18gs2skC/4I1RMD9sProyWey+63QGNxjJIy7FOHFI2bwT15vOPqf2XYYK9bddZwf0DP
         aHZcJ/Z++htHh1H2fCEMQu/5pIHoytOb17XGNdLGO78kiO2P4w6053HzkdY7ppj66kDd
         Shlg==
X-Gm-Message-State: AGi0PubhYsIE9dq/lTaCVeY75T29muNQaPUmSCiILepT9QwB+ef7DR03
        pbWuQ8GDeUMwdhxNpDqomJc=
X-Google-Smtp-Source: APiQypIwFsz6N5Zc59fxBfrtudZdEaoDRHkc2x5pxbLJKW2N3TQkYJ49xa/UvE0XVMfsrNs4Lnzdgg==
X-Received: by 2002:a62:1552:: with SMTP id 79mr8881153pfv.215.1586370225075;
        Wed, 08 Apr 2020 11:23:45 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id p1sm17232348pfq.114.2020.04.08.11.23.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:44 -0700 (PDT)
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
Subject: [PATCH v2 05/24] i2c: zx2967: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:52 +0800
Message-Id: <20200408182311.26869-6-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-zx2967.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-zx2967.c b/drivers/i2c/busses/i2c-zx2967.c
index 5f3318559b8d..8db9519695a6 100644
--- a/drivers/i2c/busses/i2c-zx2967.c
+++ b/drivers/i2c/busses/i2c-zx2967.c
@@ -502,7 +502,6 @@ static int zx2967_i2c_probe(struct platform_device *pdev)
 {
 	struct zx2967_i2c *i2c;
 	void __iomem *reg_base;
-	struct resource *res;
 	struct clk *clk;
 	int ret;
 
@@ -510,8 +509,7 @@ static int zx2967_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(&pdev->dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
-- 
2.25.0

