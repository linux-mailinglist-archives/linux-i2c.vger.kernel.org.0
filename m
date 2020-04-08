Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11981A2894
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbgDHSYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:33 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46411 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729927AbgDHSYc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id q3so2779185pff.13;
        Wed, 08 Apr 2020 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+hBr9e40aJPlN6JzFm3li2WZoTHSuvzVnOsQoF7MLJs=;
        b=DaFrQOyLUNu/v0XYk15kGafUuGoq3b/1SItS1YnyQIBU/NmshkYkI7uKTXpl20lR4L
         MTtujyR2e4eqvvQ4qz54ltqSA8kF2F9wqWBcIvZnmDVmceRQGw1z5Zshx77iHixEyT9G
         usLeJtRXDX4O2Fr0iXUh8uQshT2oYw2nS8HE0c6Kg8DQt/gi1cyv+rvVfo991W+fYmfQ
         ufFLesOXM68jFGmnON09zf9+SznyW2JMoCKD5FNM5ccR8LovEP2OJWfMT4N39YrwKNLi
         QTE99gnYEBSQMejQylair20MfVg55Z1r+HSBzS4otJSpzIJkIPQjnSgxJxu5AkaV+EVr
         LH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+hBr9e40aJPlN6JzFm3li2WZoTHSuvzVnOsQoF7MLJs=;
        b=A5bKG91Xg8Xhlk7KtVsauoMRFEU+Xsn5zaXANap+8zdXR6R7V9FAWZEy3kjT3uuYI3
         +llR+fEbYoDGVLvor1WQyBXd7610xDuyBj3uTn+XkmYjFtUH817/cnXcyRdJOrsM3Rim
         SO2GoxJx3r9CDUHMnS2aKKoRegHqm3r5DX4pHb6xLo9hE+pm3vMoG2yGGumL2FZmuazI
         tJ83amJ9VJHenH8yOwKyT9K5A9qTr3IyDwgv3H7Two8qjRD4lVccSUWD7MX+6SRK1g6O
         Cc7CYv5DR6zKN7AX9Tj7QxF7o1hpUDzyagOQ6iK1RqG3H9xpxDG0JJ0pRW2U9gl66wKC
         5gbg==
X-Gm-Message-State: AGi0PuZFIFkUo75eNzbOSlYAFUsqmNky7z9an80rlqkXlIqhsEE/odHo
        HJEEG/P3wy5zBAYNaKhFfHc=
X-Google-Smtp-Source: APiQypJSnpMObKDFwPmcE36CCeqFHQdSTP7U+46wHd9/od1bNMtQ99Fl/ebKbT2uHzTcIbyf2QQLbg==
X-Received: by 2002:a63:1c6:: with SMTP id 189mr8027728pgb.254.1586370271792;
        Wed, 08 Apr 2020 11:24:31 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id j22sm739699pfh.181.2020.04.08.11.24.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:31 -0700 (PDT)
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
Subject: [PATCH v2 17/24] i2c: digicolor: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:04 +0800
Message-Id: <20200408182311.26869-18-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-digicolor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 3adf72540db1..c199ed3334f9 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -291,7 +291,6 @@ static int dc_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct dc_i2c *i2c;
-	struct resource *r;
 	int ret = 0, irq;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct dc_i2c), GFP_KERNEL);
@@ -312,8 +311,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->clk))
 		return PTR_ERR(i2c->clk);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->regs = devm_ioremap_resource(&pdev->dev, r);
+	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-- 
2.25.0

