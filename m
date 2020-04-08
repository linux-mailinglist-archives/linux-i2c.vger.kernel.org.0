Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F111A287D
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730755AbgDHSXu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36288 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730751AbgDHSXu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:50 -0400
Received: by mail-pg1-f193.google.com with SMTP id c23so3700317pgj.3;
        Wed, 08 Apr 2020 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X0zRSaYXjzcJ9Hlrze4BqCSrCRRxSAkZlA9nRwyv1rA=;
        b=LMJvqQGjhqBUN/o2zZj5bwYDy9Yj6om9QDHH9O7rbVbgJOO9zioDyq0hf/HluAmH0/
         KDYoBf3oPT/JYVMx5oFtYIjAru1zbd44ModZ5k53kh4QfdYBGDwQ7sDrpsemxa9bQAYh
         Ua14qXYITLcj1sSRQgFGb2UXIrEAlPSCxUAvDMrMHAR7y1X24oCmRPKFpT31b9RmR+93
         3ZEG8chFxnbMqc88bkdroM3drxGvzmx+lARYXe/dcsNU6t7IuW15+cbbM26qIobgp+8Z
         Wyz64FTh2hGngR3Z9+S+JVlCmsE1MDiCVjbXY22vFB0BLvMnyYI2DzuMMp7z8qNnO6uD
         qa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X0zRSaYXjzcJ9Hlrze4BqCSrCRRxSAkZlA9nRwyv1rA=;
        b=LKnAQnQXQjVukHmrN1AlayQ3YKQYoOj9Bv09A3iHpfIv0CRDu/f7AdO53hcvA8hAbJ
         ZhOrQBHMY6jJD7X4xcMCBuj1hGIFUZ0dg6VANaoOQHCZfWg9ChpCE5dgAdM4MvqiKF9o
         AagBX/D+5znj1HmjX5AA+dHsZZslDQuZx8Omj6NXdxv84fkhyhwZIkV3qJm6IUUUMsOa
         982duCLi61X1P2Fgb9ZhzxkoHCs89Frslf1YApRXwr3zxnAr06c4/fGahjVxZSqGK/N3
         RuxG4Wyvt3BzqSbDoKSaMnKN1VjFHT4IOg5k58EcF19qAoMW+H01/LoQH3p0VnPtWM1r
         M9hQ==
X-Gm-Message-State: AGi0PubbdKr7m4asjofwEiK0HXHa90WaOiF+S3maiyhv3ubd6DC12a6Z
        ie0zn8te0jADAbvSCwIML5k=
X-Google-Smtp-Source: APiQypJSKipLCRXs7PSE2qrjqRx0zT2oPBc0yNX/TLwG6sPMeYKY5+AX+MpapIxMD8D5o5EJKbzL1Q==
X-Received: by 2002:a62:5a03:: with SMTP id o3mr8838343pfb.301.1586370228956;
        Wed, 08 Apr 2020 11:23:48 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id w15sm17158523pfj.28.2020.04.08.11.23.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:48 -0700 (PDT)
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
Subject: [PATCH v2 06/24] i2c: xlp9xx: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:53 +0800
Message-Id: <20200408182311.26869-7-zhengdejin5@gmail.com>
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

Acked-by: Robert Richter <rrichter@marvell.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- no changed and thanks for Robert's review.

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

