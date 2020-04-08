Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BD61A28AC
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbgDHSZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:25:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43141 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729773AbgDHSZC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:25:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id z6so1322628plk.10;
        Wed, 08 Apr 2020 11:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lEwiscqdjE+0yBwv6UHLDrqeoId+6rAZT43UcJfE/I0=;
        b=i14l3L3m+gTu7hgExNhjKaqbfcwLEYvm5aI08/qNSsFlm1XTSP+QhXvh0KH3bpmNAq
         6d1IeHYjbpblCqvPREjPPyouuki2Jes7zAjsVfu+0Dn7ggPF3obcw7bs7p4Zt1Aykuih
         q8mvrYOVZHkjzDoY0qV6SDr0zkdN5hSO2v4YA6yhLDsYAHIDhPE2tm9Gn0ewsXsjGy4V
         ZY8qEwRl+Ds7nR65+/xNXSQ4OkZo0JM/Wh9LDe9q1V6Xc/CmyK/4g+XIuKbcy1PZV3In
         7xANJdj3USwHeXNyTQI5JdupqBFupUUzCZRqpXIVzH13LGsIQ0pOHTrzRcHx317yrPT5
         rTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lEwiscqdjE+0yBwv6UHLDrqeoId+6rAZT43UcJfE/I0=;
        b=ZtlOqrzYzZLWkJzcZQojXNr33upxEYWIGi9IV6L8xjcht2X0t0dKl42i12n0Nxgypq
         bDMQJPyeLaqr5VCoMH8wLu0NE938+Ixd+a48phqmcImVrrP6Hr1a7oVCJSp7zj6hUjMo
         nAfMpocFqGAAwlqfHTWmFFMlSUtIwQVlTyolXgOp3JphM8smPVsagw2Vz8k8YjV+h+W8
         fskgiw1sGdsz9zTL287hxBfiFAh1SzTb+YQNGBSPcEoT4rI4q5q9xHLM/9t/BU91IWzr
         Lwl2wJOIhvkQNWk7EfWc4QWi8sl2GxxZ0w28z/H8gVIPCEbkPzngcPRMq7ASkOcpJjtS
         skBA==
X-Gm-Message-State: AGi0PubkskDHrybrO/laYIWOvo72A0PfR0fV6Cvznf1cRv0arxcru9L8
        mlSBp9tNYx1l4dNhJddThFw=
X-Google-Smtp-Source: APiQypJCtRDPT+H+rYaPeQ9fT9TsEeZuEGB8ryEaN7siOyR6GWwcjUSFzqe0S52EfWTSqf5n48VWjw==
X-Received: by 2002:a17:90a:a113:: with SMTP id s19mr7107978pjp.161.1586370299455;
        Wed, 08 Apr 2020 11:24:59 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id a13sm231327pjq.0.2020.04.08.11.24.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:59 -0700 (PDT)
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
Subject: [PATCH v2 24/24] i2c: octeon-platdrv: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:11 +0800
Message-Id: <20200408182311.26869-25-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-octeon-platdrv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-platdrv.c b/drivers/i2c/busses/i2c-octeon-platdrv.c
index 64bda83e65ac..0c227963c8d6 100644
--- a/drivers/i2c/busses/i2c-octeon-platdrv.c
+++ b/drivers/i2c/busses/i2c-octeon-platdrv.c
@@ -136,7 +136,6 @@ static int octeon_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	int irq, result = 0, hlc_irq = 0;
-	struct resource *res_mem;
 	struct octeon_i2c *i2c;
 	bool cn78xx_style;
 
@@ -167,8 +166,7 @@ static int octeon_i2c_probe(struct platform_device *pdev)
 	i2c->roff.twsi_int = 0x10;
 	i2c->roff.sw_twsi_ext = 0x18;
 
-	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->twsi_base = devm_ioremap_resource(&pdev->dev, res_mem);
+	i2c->twsi_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->twsi_base)) {
 		result = PTR_ERR(i2c->twsi_base);
 		goto out;
-- 
2.25.0

