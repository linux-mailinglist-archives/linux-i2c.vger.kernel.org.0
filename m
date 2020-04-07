Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 247321A11D3
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgDGQjo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:44 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33593 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbgDGQjo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id d17so1996269pgo.0;
        Tue, 07 Apr 2020 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YU2vTvD7/lZm/87Z2CKVZciCXF20+w/1PWpHraQ16/E=;
        b=XnAei8ls9JV+0DT1W8p2dHqgCBoF/Mbw3U4OmpW5hPCJUaUqIU7pt3W6NY7Ie63e1N
         YILL1CXek48oQHTAuxtodgk/ngIFCgb1im9FEXg8WvfKyL0aS/SqrwWbzM/5YYQzBK52
         mSvvIzJkwSwqLSw7bs8tWEYnY8nhOC2vrKLueWd1RGIzYK7IY8Q7yQJkgk7KsClDU556
         dwvWke98+7Aqwi2p9lfsPgIjnUzilOWEGZtDfhsuMdJW13Tjsvv5SpbxaJ69E4q7JBHS
         AiHQE6zI/k75nGNcKrP+9Cb4l7w1rQ+ifmQSqLtyWxS1TWA5cC6z9QknElJnw95QV8XE
         cerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YU2vTvD7/lZm/87Z2CKVZciCXF20+w/1PWpHraQ16/E=;
        b=KcCdALA6/1EGzM6EMJvnzxNKihlwTKd2t3iCpLKhgsH+zo89cXnyI/hQLc4a5mOIbb
         OdcEZPLKC6+z49TY9REIGCNSdZ6O/iYCrKWWCIQ+5mnDOezde5mObHWAxmWRSogRnl9c
         WXuAq0snyaAam+aNAEmM1pYmERGwyEsUSZgVb/wrgkIMe1j/7lwjM1upgBvTJfGyhdyX
         wXLCOI4R+fiDnt3PE4c50nf2koLL643cGhNtRjASm/PH2nB9Mk0Y7QQTBPg2JlSNQRhu
         luPyv9UWR24WUoejqlirZXdeJnLLeXBQL6uP73Jny2Ux9CcrKc3D6YIpzT3pvdtScjTy
         KnvA==
X-Gm-Message-State: AGi0PubAZyEJQS8U69TQZhlBgBMQ1hLQ1bLw3Oe1AdtcZXmUA2sQbTqg
        EJG02/JlNqbJSXdSrsF3vtw=
X-Google-Smtp-Source: APiQypKNl0zM+fvfb72fdDQ4gtDTSPog/Rg3oeZ/8mJ8OvJpldnUoAecxMC3o17SYSdQYz/32rfyaA==
X-Received: by 2002:a63:7a4f:: with SMTP id j15mr2858299pgn.45.1586277582927;
        Tue, 07 Apr 2020 09:39:42 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 13sm14418909pfn.131.2020.04.07.09.39.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:42 -0700 (PDT)
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
Subject: [PATCH v1 25/28] i2c: sun6i-p2wi: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:38 +0800
Message-Id: <20200407163741.17615-26-zhengdejin5@gmail.com>
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

