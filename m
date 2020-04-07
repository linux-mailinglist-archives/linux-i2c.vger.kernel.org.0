Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8196F1A119E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgDGQiC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:38:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39062 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgDGQiC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:38:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id k15so1044581pfh.6;
        Tue, 07 Apr 2020 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ifslSu+C6R7yCoP7Ir0UNROtRAlXuwNeH8aNhVeP9vE=;
        b=cu7kteNBfT93LFyC0rupfTSmQTpUfT6+jKJd3vt0TLtErEER3VHkO45jxFG3eUZUe5
         m/tZrpPvAgZMdvZ9XtjzFq8kcCT2WLNuqnzA974OdT7QpDNJJ9JgRfcw5fnIV+avHLej
         8xS3lytP7+b/D5aJ3VLtatfv9AcWdo8QPDZmNLlDPgm0xp1dP8UtpirT1Son7Rccuv5F
         BkIUyEY8BQlVNoLF9B06P3oB5g1rbUFYpxLJ33qdleH5lM1wiOkuOYJlJg4aL+ftWSvq
         DTC00RFd6S/mhSJSwiuir1MI0HjmHrUb68ukOJ9LGk/NdSfp+5fXc/b5/i25B9uBcTNC
         e+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ifslSu+C6R7yCoP7Ir0UNROtRAlXuwNeH8aNhVeP9vE=;
        b=chohwTWl9C9l+2TH9mi85joSRYwDtEE+wk6ANLi7gMCNlZzIXW3BU/fMxw9Xj7YhcH
         vSXqiSNmM6cwMVYZ0V4EVlI25BKtAjeDEumaJIGuzc0LzMNdW6ElCvSZtL+CKrZ1iJvz
         8VdrltgRVGSLLsBoAOaTG/EqoSgXVmz0Om+fHRxnORwpXegr3DnycNHHMrwxlbxCF2Df
         ocJgBiDTGKoP7VJICm7aDknTESkszJsY2E8i6eAcS1YNFVb3GRN2jPhMx3+J5yB66a2f
         dmZUnvB4KA5+vwxP+uf9y9id/oxL7Am97Pi51TySfF35L3dBWCKSdcmhXZoj0FPlp4T7
         YjLA==
X-Gm-Message-State: AGi0PuYDV+vZ3/71sdqcaqzWJbp40ICRegi5rjZJqgiDvTqkDmZJ+lab
        hoaak61nPa8YB59NqPpxOns=
X-Google-Smtp-Source: APiQypK1P2EvOM/scMR7C1RLfSBA5u4++77Gd6tKzRCMSBirW+IQxIslFJ3KZqhCxgZnyPnj7svZxA==
X-Received: by 2002:a63:eb15:: with SMTP id t21mr2833603pgh.279.1586277481506;
        Tue, 07 Apr 2020 09:38:01 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id d14sm5929518pfr.35.2020.04.07.09.38.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:38:01 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        nsekhar@ti.com, bgolaszewski@baylibre.com,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, matthias.bgg@gmail.com,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com, kstewart@linuxfoundation.org,
        allison@lohutok.net, gregkh@linuxfoundation.org,
        tglx@linutronix.de, bigeasy@linutronix.de, info@metux.net,
        hslester96@gmail.com, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, fparent@baylibre.com,
        opensource@jilayne.com, swinslow@gmail.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 02/28] i2c: mv64xxx: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:15 +0800
Message-Id: <20200407163741.17615-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200407163741.17615-1-zhengdejin5@gmail.com>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-mv64xxx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index febb7c7ea72b..62fb1ecc84a2 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -877,7 +877,6 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 {
 	struct mv64xxx_i2c_data		*drv_data;
 	struct mv64xxx_i2c_pdata	*pdata = dev_get_platdata(&pd->dev);
-	struct resource	*r;
 	int	rc;
 
 	if ((!pdata && !pd->dev.of_node))
@@ -888,8 +887,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	if (!drv_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pd, IORESOURCE_MEM, 0);
-	drv_data->reg_base = devm_ioremap_resource(&pd->dev, r);
+	drv_data->reg_base = devm_platform_ioremap_resource(pd, 0);
 	if (IS_ERR(drv_data->reg_base))
 		return PTR_ERR(drv_data->reg_base);
 
-- 
2.25.0

