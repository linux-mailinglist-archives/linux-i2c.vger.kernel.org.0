Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0E451A286F
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbgDHSX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:29 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46497 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729672AbgDHSX3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:29 -0400
Received: by mail-pl1-f196.google.com with SMTP id x2so194008plv.13;
        Wed, 08 Apr 2020 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D9O/5jVB9epmxnjlHWIydNrXCo4W4m9wYm/jQk2rk6k=;
        b=hUn0EaI6mEbqDFwVvqtMFd6dQp/c9qWdL2RUo6e2SPFymThHfIPXKg29zxLxKnchdA
         WPXB3rGkH1suKGg1L7r4dnqOVbkdmZuck1v5Pj9D2arTRSBMi9btZvKYOGjm9TKLWyVf
         hp3RW3Q0Qju32FK3FWwzdSgHwViuitu0td7/wBRWRTKeehQEHR6QFGM7rvmomY6S+BZw
         CAf23xA4sgveNwhKDARqNoUUSOb3EqpuKlatMRx/BpS1IaKCpOqo00VN8/rl+9I/p4Au
         sV8dPjJ4kgmdcTNWsQHqpEDdyn1yWhAJn2CBiO03JD1x1l+hTFerO6o6yRmzGU4ZvVgC
         HZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D9O/5jVB9epmxnjlHWIydNrXCo4W4m9wYm/jQk2rk6k=;
        b=aRQ+0dm3RZ2SBXxobxQMj6K7JWaU6xkCIz5jjURrIuftBfl9NGSlVHtOpJQ+SZgvG1
         jD/M7BKs+o2QVt1IIYcTc3WMfEJRxQVR+tHZv245xx/YGIaNT6usGYdg037S0JwiGo2O
         SKLM/8ubc35NkzTvY/m8F8uAoPELfp/CeqZ1RrDWzKzb8tI4IoUIVljTeyUzoyzFCRKg
         4mqIj0DnjwYSx3/wEZ+JHECY87oizyDeXzu5aZpbl8r4AVIOTAOHpBArRS2yv7deaMvT
         25II79Gkw8qosLNZdRBJ9OIjJchn4SHxcevisiKjnOy/Y9rjLSDnK7LI9q7ZzjHyQSqU
         e+UQ==
X-Gm-Message-State: AGi0PuZywLHXHey8Ss13CNMhTVI7xdXjhSZe8kE1IbWocop+ZcoQ1UlP
        FIf9sJZv58S1q+/8i24RU6c=
X-Google-Smtp-Source: APiQypKiTviwuvS02LsrPUcLoq5OKVuqsgSxYJEk1A9o4IkjA/mHeyWDn6cZEEYOPq9wPYaDL5+q9A==
X-Received: by 2002:a17:902:8c94:: with SMTP id t20mr8216535plo.170.1586370207986;
        Wed, 08 Apr 2020 11:23:27 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id m28sm16013343pgn.7.2020.04.08.11.23.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:27 -0700 (PDT)
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
Subject: [PATCH v2 01/24] i2c: img-scb: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:48 +0800
Message-Id: <20200408182311.26869-2-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-img-scb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 20a4fbc53007..5e0022e55315 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1330,7 +1330,6 @@ static int img_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct img_i2c *i2c;
-	struct resource *res;
 	int irq, ret;
 	u32 val;
 
@@ -1338,8 +1337,7 @@ static int img_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-- 
2.25.0

