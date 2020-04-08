Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2D81A28A6
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbgDHSYu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46582 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgDHSYs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id x2so195337plv.13;
        Wed, 08 Apr 2020 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OmEkgDhrfDmBuDPuWWpDI+7kg16S00q6H3sG53fS7I4=;
        b=R46n0Fa4oKeOiSZZtHmhzV6M2gNCG79FxozSYOw0bEbohzzVnA809OtAkZftClHuJU
         5SaETgqlRQvvIN6/9k1gyz+2pbP2YJKB7sX5ZM6KGm8IN/TeE8xJcajglMtyYfrCpUOI
         JQyb3H3KpYxCopryxgMbNs6GJ8mRd+SBMQcdIK+4uROum7qILve5m4ov5cZ1KyEtIP57
         flaeyYyQqeEiFM/EvS56wGrwvhT2Dx71PvBk/HTZ1wwcv+yI/O16W+L2hzLsCUtDZjhB
         HsSTqZJvJZZht8vA8iH/ZdY9e2brTojA/um2//iPY/rztPY6qdZtApYl6O5ioXhhqzoH
         1ovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OmEkgDhrfDmBuDPuWWpDI+7kg16S00q6H3sG53fS7I4=;
        b=ZxGkbhg4Nb7HGh8ieMSHHPqFlXG5JEe+dpMJ+QjlBEgjxNM8JKJeNv1/6GxleSQIsj
         r8midCDF03s+1YAkzU/grHEaul9zhgT3aVcEMWWN8KHlu/XR8eT9DSRVEqWer6IGn4ex
         99r2c7Q57EjPXwEp6bNZ6agUvYU8PWyTG8L/eRJnjmx/iO9lCpBUDvZBRk6TCx046Piu
         XvS+SIzg1zh/RxPTXZFHIIw9V7xntQVLOzWxYJqA3rTFlo6bYTwsL6sxL35OAqxrXcPy
         Tw5fAaXBQSHlf6+140zNm/aNhBPUR8yIdtxCvRcq79XMreejDLdAQ/C3WseQcF6YPZ2v
         C7Tg==
X-Gm-Message-State: AGi0PubaeZTYptmpTayWKzbZotCrQCRSFk/DJ9OJVf6qkEBfIh3HfKVl
        S6nVJgFs5ei36dGGwar315I=
X-Google-Smtp-Source: APiQypLXwUXpCNh6YtNCNOvNntw4ARxztTP2rWqpK6WTDHOJU9yem6Lnj8J9BvzUwTXmQBOHR8N6WQ==
X-Received: by 2002:a17:90a:21ce:: with SMTP id q72mr6755281pjc.160.1586370287130;
        Wed, 08 Apr 2020 11:24:47 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id u10sm24638pjd.13.2020.04.08.11.24.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:46 -0700 (PDT)
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
Subject: [PATCH v2 21/24] i2c: sun6i-p2wi: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:08 +0800
Message-Id: <20200408182311.26869-22-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index 7c07ce116e38..cb78c38ea3a6 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -187,7 +187,6 @@ static int p2wi_probe(struct platform_device *pdev)
 	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = 100000;
-	struct resource *r;
 	struct p2wi *p2wi;
 	u32 slave_addr;
 	int clk_div;
@@ -231,8 +230,7 @@ static int p2wi_probe(struct platform_device *pdev)
 		p2wi->slave_addr = slave_addr;
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	p2wi->regs = devm_ioremap_resource(dev, r);
+	p2wi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(p2wi->regs))
 		return PTR_ERR(p2wi->regs);
 
-- 
2.25.0

