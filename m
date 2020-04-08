Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D28A1A2880
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729788AbgDHSX4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:56 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55055 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729702AbgDHSXz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:55 -0400
Received: by mail-pj1-f67.google.com with SMTP id np9so164052pjb.4;
        Wed, 08 Apr 2020 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EteoUTTw30/QRdz23KBioXnJipLwry6OSZdt5fk/wwk=;
        b=SXF1UnWz6sDx9UQ7FlAECbOeWwokEBWAQQc3Sf4TbT4CEXUtppSExJp4eKtzGZaBKo
         x/XlN4CcwdjIltJxLe81C4PUuY05JoLcrtXclFrBd9lNuh6UBkbbPTDkWZxVo1Q/tcaD
         Tqm5pFUM9LllneXTTs22LyXTeV8m4RJFxrZ4in4umLKCy7FlUN6xio1xjjWEVP9+OTAE
         276GFJFi44FCZTP/HTB1g1YXlmKGEvI9r4lzLuG4aVBRQaD5Ah2mAh43t6LjSKfVM/XN
         opMqkXqCNFLtWbmr6ZkQ8SMbvFTojG5gH6JCKXleqbalE4x+XiWwwcgqr0zKcmamEq6G
         ySEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EteoUTTw30/QRdz23KBioXnJipLwry6OSZdt5fk/wwk=;
        b=Y94GC/nUjbUF9hjbVB43+U1/s7ISTJwIXKA1oCLmU3jpzHcHjEstushj8aL82IidUo
         CmSSe4tBN6POYIplqQK/Mw1eJMVbNrwY+YIhtQymSKDsorTzZ785p4x+peqsCV3PlMu+
         qb5dwTX3qTX7jFn2lE4kGaSc66VCfpupjH2NBWI+ZHv9ete8qFwf3+sCyOyZ6wvNWjJ1
         Xe8V7RTwzgsxGReQL2F7M4gmNQOy79IojqgFgFpCAFr9kBtWTaGQbuIyZz14ASkeoghB
         7zvfJb02IdqQOuzJQLnwRn/DZ3dRRzfrluA29SBVaUGOGd3I8cECu5G+D1tynMknXdh4
         7cFw==
X-Gm-Message-State: AGi0PuadIwHAGTyhMLUHJh2OTCf0JhttFC1Wm1QdAR0zqY2ZYIAex0SO
        VOFjCVwIjGlEfL7eI9NoaGw=
X-Google-Smtp-Source: APiQypJR2GzyrP1pYsrYDI200gizcUY3xQ+5DiZJfgHeCZFKxZQwaIagHaYrR6U4ibny0FeeHsk3Lw==
X-Received: by 2002:a17:902:59c1:: with SMTP id d1mr8584280plj.215.1586370232819;
        Wed, 08 Apr 2020 11:23:52 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id z6sm16006422pgg.39.2020.04.08.11.23.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:52 -0700 (PDT)
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
Subject: [PATCH v2 07/24] i2c: synquacer: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:54 +0800
Message-Id: <20200408182311.26869-8-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-synquacer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index 86026798b4f7..be389e95b57a 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -536,7 +536,6 @@ static const struct i2c_adapter synquacer_i2c_ops = {
 static int synquacer_i2c_probe(struct platform_device *pdev)
 {
 	struct synquacer_i2c *i2c;
-	struct resource *r;
 	u32 bus_speed;
 	int ret;
 
@@ -574,8 +573,7 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->base = devm_ioremap_resource(&pdev->dev, r);
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-- 
2.25.0

