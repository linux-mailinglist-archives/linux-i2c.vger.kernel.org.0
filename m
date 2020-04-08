Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E483C1A2873
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbgDHSXh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35666 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730695AbgDHSXh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id k5so3704080pga.2;
        Wed, 08 Apr 2020 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SwHXHMrHDmnrM9h1jlNq6eVg0WmuWCuP3Muw9KQ2/+A=;
        b=afQ37Krgok4UOrfmgSvOmJtJs+svlhimg9Mqi9+fRZ1au4I23a5t4KUnEad/7xMESh
         mCEhy00OGcpsPUAmNkfg8CJOF9sgnj3dUsbppdh6j77qupGgoIJBbTCJkhCG/gCNJ0/a
         KwnKqfVlkLnKzEYIfkAViLQSYbsyo29wyxtYfcxWQACV+nkSMdR/VhhP2xABift5A7f3
         sEr47qKjH9y6TtuUxQk3tXhhh9Wsr+83dfROQsUqK1gb2hEOm75xIKWOobnRJ+NXqA9A
         AOL/VFoSE4qsLfdByMrS7WfgN+WMcmuTH5q6IUs7XUeE2DIqdInfolE5PxelWFDIqC18
         ubqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SwHXHMrHDmnrM9h1jlNq6eVg0WmuWCuP3Muw9KQ2/+A=;
        b=AxkKMg3G5siEH7I/HGoes2ByraRP7Ck5cHdG+Zz1iPkzmz/Dr2ZE3lX0URj5CCd8nU
         4ap1MZvxYu83wihThn5AwchRKFmVI+NatNuXr/a88u8KHpcB/Zu+DgqNfhaukdK3+juX
         pbRYkI/z9VPjcfBsFEv75ltil5qsqzfiB9KvsY4VNlwHX5Sbw+g+NBwu/aTzk3X8naRJ
         U2pQrHzxhLDXBB+Ov9yID0IuKrVI7RkhdLdb16Zu9qerAWt1fYOTAyVS6N03abvqrx6J
         ffyYU2iEhMAunuNvRs0vdXUTtYFnXxmzyoh0KEBDy/4wKOH5OnH5YirKbOyCw3jgv3sr
         0bSg==
X-Gm-Message-State: AGi0PuYPHq6LeU0nZHIEbQHwXxvQI2CZznC17TWK0ROfhu9wKAVCDAHc
        1e7saAaz9iDj6Mb2mUT0Src=
X-Google-Smtp-Source: APiQypJ+9NWpM8g5E7bnD1K9Srl2jhvCgpmK6+3FE3ER6lPxZw+fvO03MXg542BNCD6bxVcji7UnXA==
X-Received: by 2002:a62:4ed1:: with SMTP id c200mr8919631pfb.207.1586370216046;
        Wed, 08 Apr 2020 11:23:36 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id h16sm3592332pfk.38.2020.04.08.11.23.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:35 -0700 (PDT)
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
Subject: [PATCH v2 03/24] i2c: owl: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:50 +0800
Message-Id: <20200408182311.26869-4-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-owl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index b6b5a495118b..c9e7fcac12ae 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -399,15 +399,13 @@ static int owl_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct owl_i2c_dev *i2c_dev;
-	struct resource *res;
 	int ret, irq;
 
 	i2c_dev = devm_kzalloc(dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(dev, res);
+	i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 
-- 
2.25.0

