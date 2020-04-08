Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E996F1A2890
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbgDHSYZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:25 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43641 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729706AbgDHSYZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id l1so854851pff.10;
        Wed, 08 Apr 2020 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IrcyPzGYG2eAfmlkT9jxLPPyfyw0eU8QccN2vZqMkdA=;
        b=PmNAz5+wtBqIz1bcNxZ8zF7QqG9JzMDwNBWJPpNGez5k+fiNUVl3tCYyECLOeGQGyn
         2QuscoNhs/XMYuimI/5uQsPeduOV9CPZ3JHTQZm0MK0pu6U0YZrzyuKkJnV2S5XZLtCx
         jRePpqB2wITRUdywHLTTgfwRTqdA9B11ZR/cU1smV+1jJmqlulDtbTShvhKeRl0yOG1E
         857rji+bc517cMew+zlhL4JEng+fclwtfALv4Zh4BykewRJbE20oWEe/E8tOZrLeDUxM
         9+gw9Sg3Of+dKmBcltRoJGwAZVQiU9DnKE2LB7o74K7olTI4bCaNL9thvCbX2SQkBWKE
         vNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrcyPzGYG2eAfmlkT9jxLPPyfyw0eU8QccN2vZqMkdA=;
        b=C3k2eSPAGn2LsrIav4gJYUVMcv7xpfjtvg2Wf6zGv6MoB5Tuy1VkPdKc3oZGNYNzUg
         jzO7ok1jxyiN0/yxEKeFqctOBP6AQabWpEfb15ui11FgmIuEzhVvDNJaUBokNkp4o18Y
         4CzQD3d3xMEmE4xDQjdFXeATO1Ey/Krey4UlamWLWTlSGM2YT6b3y+5AuyExVJGStuJ4
         EAoFWU2cMdCrRDbCaHJ1xD37kWrShNeUXVqDyeD5nvVgJmEE2dU+3Hiu7Q0oVJqRPdph
         f7I62M+/40TBGa8nDUajPb1rL+bhKx4uUdu/bjFQLRBCOOHjqAanLPM4sosGYrFRzEkf
         DiCQ==
X-Gm-Message-State: AGi0PuZO8Oy4YRmOHi8GtSk+x/qr2i7/PxL9LCzm7L+A9rcRkvOp7su4
        4ArlG16G5dyaMxGDAhkTBuE=
X-Google-Smtp-Source: APiQypLxSk0XKLPoDsezkMBP3TQ/2p01ZqbX9mEf/oBd0YJdckx1cbozFc3PpXJNaHKj1Zg5ZNsMIQ==
X-Received: by 2002:a65:5647:: with SMTP id m7mr7902899pgs.371.1586370264050;
        Wed, 08 Apr 2020 11:24:24 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id g25sm9603435pfh.55.2020.04.08.11.24.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:23 -0700 (PDT)
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
Subject: [PATCH v2 15/24] i2c: axxia: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:02 +0800
Message-Id: <20200408182311.26869-16-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-axxia.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 0214daa913ff..0aa0753e2430 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -734,7 +734,6 @@ static int axxia_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct axxia_i2c_dev *idev = NULL;
-	struct resource *res;
 	void __iomem *base;
 	int ret = 0;
 
@@ -742,8 +741,7 @@ static int axxia_i2c_probe(struct platform_device *pdev)
 	if (!idev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.25.0

