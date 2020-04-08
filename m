Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B20E1A28AA
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgDHSY6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:58 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40353 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgDHSY4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:56 -0400
Received: by mail-pg1-f193.google.com with SMTP id c5so3693080pgi.7;
        Wed, 08 Apr 2020 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N1AOOpLyFmGVHrDB4uOZFvBj+PvjYEnZfLNYxMG2cMQ=;
        b=nP0JqBWg1pXQRjKe7clEV8q3bfjeo6+9fkca+SIALlpqCRyyzNLzjnf/mpB0yPOUC4
         USC6dNhnWTqXlFmXq5SjjtCd26kneHphB2mTqSZERIR0HhjzsE7lH1A0Gq1n177gVKVe
         nlVW4CntP0rcV32dN526P93ZAQDryVumHrR5Dayb9TGuKqkHcboFaBC9BhaRZ4PVkwnx
         zzofcld77LJoh1SXqYp6PkERUfMY+2rpitaT6CNbtwNGSFci/YSIGeEv4X/PcGkQBLnS
         iDy67KNzu9u3ttexSMlaDVyryhpEetXgUh67Ff1sf/hUxLDU0c8ax34akNd7NoTAXmIi
         Wh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N1AOOpLyFmGVHrDB4uOZFvBj+PvjYEnZfLNYxMG2cMQ=;
        b=RXv3aDsi48c5hkv2JhKe+APSaT3JVBSNBU+vV3LH+2gb167APoahN4fGwlC3J4q5U4
         fv1eX7cCLo9HtZeySTVQYombj/EHlAhQk4/U6DJ2s/n0NfnDzhCgdn+J8P4YlwEE1p5h
         wjpeJVRfiYafxH/WCNNx0CVfcK5rK9V3OkjABpeLWi1WFA5qQ7oEZNVL/Li/hwkuDIsD
         Zevk9iV+9IcXBe2VMuhaU/PZKh4+Y+IpL+dtc6X/pGRyoyjzGLx6KdvD49szSt2ikOnI
         NyR+3MAsgu4pEmdSvykwIpVOIc+9o/XDPIqGG/iM+pZWHQmHwOTFWTbqbAcvq/HYHXIc
         QixQ==
X-Gm-Message-State: AGi0PuZ70daFggzgO60OeeMOhQYD/4IxZhmDJnDcRYTdywDWBKuWHil6
        BGGT2GOiSFkwR58BtMVD4lw=
X-Google-Smtp-Source: APiQypKNU6PgtPunrigMGVuJCKphbRMAgePqa7TqPOOBCNok9TNZiF1XEolEERZcGxuIK1VwUVWpEg==
X-Received: by 2002:a63:7e15:: with SMTP id z21mr6415762pgc.397.1586370294908;
        Wed, 08 Apr 2020 11:24:54 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id r63sm17334991pfr.42.2020.04.08.11.24.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:54 -0700 (PDT)
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
Subject: [PATCH v2 23/24] i2c: bcm-kona: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:10 +0800
Message-Id: <20200408182311.26869-24-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-bcm-kona.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 4e489a9d16fb..2bde3b5bad04 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -750,7 +750,6 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	int rc = 0;
 	struct bcm_kona_i2c_dev *dev;
 	struct i2c_adapter *adap;
-	struct resource *iomem;
 
 	/* Allocate memory for private data structure */
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -762,8 +761,7 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	init_completion(&dev->done);
 
 	/* Map hardware registers */
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(dev->device, iomem);
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base))
 		return -ENOMEM;
 
-- 
2.25.0

