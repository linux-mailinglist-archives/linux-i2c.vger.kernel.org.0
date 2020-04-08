Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACAFD1A289A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730851AbgDHSYh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:37 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38451 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730840AbgDHSYh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:37 -0400
Received: by mail-pj1-f65.google.com with SMTP id t40so168116pjb.3;
        Wed, 08 Apr 2020 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ErEIUYPQuwJL+gz/B/ioHgfa02LxYycDfKs2Fi66Ys=;
        b=neSONIh4ZVmHWtUSLb0sqJ86ZbX5tCj8kStV7NLwE2BUQoF/r+XR4FSK6/Hv0GsPRH
         vK393tYIE/5qu8RbIl46NKBluMapHWdWr05g+g6b1LW+TLZ1W1HYrTnLu9OdQllPklJn
         rUFKOkdBrxc5if8kYG8cVt7CTERz+9OjPFDb0z5fmKt5tpPnPgod+EXX8kUXi/jGP7gW
         5ewR/BKvPnXe/bE1u4xfdlqVAwMS5Nh8fTOqbsUahpyJdBwM3E2Jb0zlYS0gMKitD2SX
         3/FT/EE2efjgHL89jeHUvY4SAScfeOp304q9qZXV0KhV0LE9TLzliSPBHcxj0TjXnQ7M
         0rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ErEIUYPQuwJL+gz/B/ioHgfa02LxYycDfKs2Fi66Ys=;
        b=We7l7GMyhKq7G22STHYPfUJqa1EMauXlla4vxw57p8dwhDyLjWzGLgTBYcLbu4q4Ms
         d340tC2uZq5XnhETbXSEKhVbMbPkH9e9qg4QfDS5/QDHqVLpDgbbw0/KwwMrX2PFf7sl
         OB8eKIXR4Omjx43cAPoH8Zw+MH30oHUOcYp0aQm30ePaTpvn4FDYoCTFhmctsxjcBAyv
         frpd2XH36jgRJTSu4LKkBSXLuzMvWk84UgM/hD6jEvgSIwuRcwvORJbqKD3FQbauokDM
         mo9azPuC5RHCu9yEzLsIQm9J+MG331tu/eEqEceVgDWHkkb9f11J/fziwFMOWpT5601V
         FVrg==
X-Gm-Message-State: AGi0Puby0qwIANplizNSl7zSjoxqGgLUcXR5M03yx8FfSHlPFWc5Iw0u
        39CQAcMu75h9HnCRkk+SwqizwTib
X-Google-Smtp-Source: APiQypKfBfYivLEY5TF2J2SWQbyJvU2/jEhBXAJlMeLQ4XrMzfS4orlBY0+nPj9EU+6E3OQUG+LpvA==
X-Received: by 2002:a17:90a:c983:: with SMTP id w3mr7135192pjt.102.1586370275600;
        Wed, 08 Apr 2020 11:24:35 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id mq6sm202421pjb.38.2020.04.08.11.24.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:35 -0700 (PDT)
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
Subject: [PATCH v2 18/24] i2c: lpc2k: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:05 +0800
Message-Id: <20200408182311.26869-19-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-lpc2k.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index deea18b14add..30f6dd1d37c7 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -346,7 +346,6 @@ static const struct i2c_algorithm i2c_lpc2k_algorithm = {
 static int i2c_lpc2k_probe(struct platform_device *pdev)
 {
 	struct lpc2k_i2c *i2c;
-	struct resource *res;
 	u32 bus_clk_rate;
 	u32 scl_high;
 	u32 clkrate;
@@ -356,8 +355,7 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-- 
2.25.0

