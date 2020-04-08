Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5981A2893
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgDHSY3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:29 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41898 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729346AbgDHSY3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id b8so937380pfp.8;
        Wed, 08 Apr 2020 11:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WRDrnseeS89eCKjK2cIzxCoBnvg+cqcSp0yx2z2gfAU=;
        b=BNAUd3Kowbg8F6x3H1mpu7pq6oMHI0uMUzcrrJBARnU79Qk15WlIG5s8jeIQ8d7Bct
         7+J/jcT/68eZLhxLaODR+f2zGmMiCiotV3rRa5DOs1ykt/H+2nGCrqp5jUfe3pX9zdbW
         NT7tFkNO+tVh5dJROdvC4XuPVLzhNMqYE0YRAA42SwWwS+pC3JAObs9WYmwAWPbAAIQ4
         cQnPplVkp59rl5mColPJNYFrxX1cqtLfryM8agebpJfspLf31nq7Hb6qj5VP2HAatDGw
         epfmO5znxx0d1JQotzAyQDDP6uIbp1KUTO/c65KOnfAX4juaoW/AUJneHJBI1HYvwnu8
         g4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WRDrnseeS89eCKjK2cIzxCoBnvg+cqcSp0yx2z2gfAU=;
        b=TxO+PV1DDVpKEsQvyMzqMK24b1dXhG2IvE3S6ZNnkrvNfBhCrNoCCV4uBigfMHz1OJ
         2Xy4XHLYxXkyLFQaYnBgq8RYPosL6C0pe6b2wZ8CZ1VZG5tc8QS7bfL6s+bwi1ImePlJ
         s+LSmPRus7zyL4l9PCgPJ5VRDPchLuGuVIS0rYmCcvO7ErP3qmRs4eanKCjSV98cpyyh
         13fS1KfSYL2szwdqdUIHAi3FN9J/peryno80VQarUMw+lGIpayCgCkLKJNohdpd2NZby
         CKwjmKMB3Hm1jiN1/0NkUD3i/Ktl4cd9aJXf5QL+o7zlNjrWNKxtUCAm5FrvVaZeNPP9
         fUfA==
X-Gm-Message-State: AGi0PuZUvtWpMFtxAJpekR69X5OJ1s5CsF7RZeLdKeY2lLAcIrra5Yef
        JRgYk1fH6nB2U2jcvEUxE+M=
X-Google-Smtp-Source: APiQypJkKdTmivRcAdiIc/hrYIPv+j8xiiFF2R6C/zaJScBvFNqVjPoFOA02b2UpM1/SojfEuEnHXw==
X-Received: by 2002:a63:770d:: with SMTP id s13mr8242862pgc.5.1586370267892;
        Wed, 08 Apr 2020 11:24:27 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id a3sm17202312pfg.172.2020.04.08.11.24.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:27 -0700 (PDT)
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
Subject: [PATCH v2 16/24] i2c: davinci: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:03 +0800
Message-Id: <20200408182311.26869-17-zhengdejin5@gmail.com>
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

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- no changed and thanks for Bartosz's review.

 drivers/i2c/busses/i2c-davinci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index e3ceb256a380..232a7679b69b 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -761,7 +761,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 {
 	struct davinci_i2c_dev *dev;
 	struct i2c_adapter *adap;
-	struct resource *mem;
 	struct i2c_bus_recovery_info *rinfo;
 	int r, irq;
 
@@ -814,8 +813,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->clk))
 		return PTR_ERR(dev->clk);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(&pdev->dev, mem);
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base)) {
 		return PTR_ERR(dev->base);
 	}
-- 
2.25.0

