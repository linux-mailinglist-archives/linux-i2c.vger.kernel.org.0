Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75CB81A288F
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730820AbgDHSYW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33227 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729706AbgDHSYV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id c138so3450142pfc.0;
        Wed, 08 Apr 2020 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWiu3WBzXJViKuGLFAYe67OxpW6TfhQVL5xLKhPbse4=;
        b=aXKMOtA61ivgzF+cSBAXvbLTDGfkV56uHY5Fkdjhswf3W6AMKUVPJN8qfhvi7NrW6Y
         qv6UOw6JsGU06zaX7lWppIRd5LuBXiDqxL384tx6X7kgUa/pPsVk9fjXAadJiE1Ioys1
         NPjDnzgIsfYx91jJojrUxP3mYujpsHJiTlt2cg28oJXbHce+k5m7mgHhU8oJb+BsznkI
         0BSyF4Re3qtni+vyZrBIMB6G6GeHAuZ10Jg2LAkHCRr+5rLDMoZfVtVrrweQVw8P1kTP
         bEo0LQooQ2PyiJLSk0zWMEUdWQW5GZaebAWkjpTsfHgV9q7PpwsYVyqLsDodXYWcYQ2V
         Cneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWiu3WBzXJViKuGLFAYe67OxpW6TfhQVL5xLKhPbse4=;
        b=BCLKda396dUOY4AHjiCOavxpjWROUZwn85MQZuwew0vTFH80l5TY3hQ7q2f4hW6IPr
         JDYE1jnijDeVT68bmqR/eZ5dgO7B6lD9CpJbTu7QlXNlmpHHmOjL9G1OUPthyLhdXw8M
         Ylgzf3YV6VNZXUhcEOgENU7p6qPuR/YBrtL5of+t7LJHnRw8VEv18VX7zpvNKDpPVM5W
         5eAmgvkL6U2T746x85AskrlVaRY0T7NGlD86kntjBxI2D7rJOOlMGbrNhGGuhV8U01B/
         cRE8SCcjMzdo6NLiBDdoBQMF8wmdYMBln5ouL2Gf/urCVRerkTP4zBJleBtm0u2dmmTf
         49Gg==
X-Gm-Message-State: AGi0PuZSjCus2cXTTzJvJVnkThsS5lLuEqP9u0v5Vnnei/g28373NsE8
        nAF6XA9eCUcy0x6cPDgKlGQ=
X-Google-Smtp-Source: APiQypJ3Bl7qUOhWUgKN1XcjWEoOtQmHSZJJr6hCpx+MtyErNuVCHuJ6axI73HFu7J1rdMGK/fJkUQ==
X-Received: by 2002:a62:1d1:: with SMTP id 200mr9412749pfb.8.1586370260239;
        Wed, 08 Apr 2020 11:24:20 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id l59sm609696pjb.2.2020.04.08.11.24.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:19 -0700 (PDT)
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
Subject: [PATCH v2 14/24] i2c: altera: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:01 +0800
Message-Id: <20200408182311.26869-15-zhengdejin5@gmail.com>
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

Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- no changed and thanks for Thor's review.

 drivers/i2c/busses/i2c-altera.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 1de23b4f3809..7c4c836a3228 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -382,7 +382,6 @@ static const struct i2c_algorithm altr_i2c_algo = {
 static int altr_i2c_probe(struct platform_device *pdev)
 {
 	struct altr_i2c_dev *idev = NULL;
-	struct resource *res;
 	int irq, ret;
 	u32 val;
 
@@ -390,8 +389,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
 	if (!idev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	idev->base = devm_ioremap_resource(&pdev->dev, res);
+	idev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(idev->base))
 		return PTR_ERR(idev->base);
 
-- 
2.25.0

