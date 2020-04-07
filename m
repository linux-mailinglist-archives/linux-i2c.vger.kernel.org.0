Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0F61A11D1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgDGQjk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:39:40 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43392 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbgDGQjk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:39:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id v23so1432588ply.10;
        Tue, 07 Apr 2020 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S32VZFEAnLVY83PBmxOjz6G0tJ88ncuNzuF28Wc0Ifo=;
        b=ZAskMm8lxje32JHLpnnTfMRCmxIfO+80a7HMWxVA1Z/KErVtdhKFWxPmVrz7/Gxkb6
         XNyVDyTWJHfe3c47Ing9aMZHufQ695OFDt/q1jOsFgS68nLQ+kmcGY7ncY/iJk56dt5n
         nDSBxBG3Crt+x+Gze2sa6lONZmpheTxEV7dU7m6Pu9146yLfzwKFUmW0BmojCZwi9Sjv
         qEyswB9PtCaw1LoB0Q1SGL2j7X5sibSkv2V+AAVzsFA767it2oj/MwBB/Il6j3AQ9JbH
         78aESDCqvZA4Nz/nRE/oOWOILK+TYDLkXVZ0cx3e+V8ZsaeUTxzVAi4vzWkxMkhFQiC6
         J9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S32VZFEAnLVY83PBmxOjz6G0tJ88ncuNzuF28Wc0Ifo=;
        b=ckv3Fddkv3M4Mv4vn0gXNC/ujfEDPwiGnU5HRxHwnDLqc934flj610nqD4DCfRlrLm
         tLVczz1ZCveH2If5Zo7j/8T9egw4K/80Ge7k2pJk5dI0BSylTAoRlSx8HgSivOaZnfAt
         UrizxLxFzl555PcgJ2ylXVtnr1zZEqkTPn9ylDGMH8Rkg5xT8ILLx8hD5PzgT3nsIrPE
         C/zVaxgfkzgETQA4KT0SxdJ07aqqY10U541OHOGKk1Gtri8vhY2SjmYHmJz+btPFEnvI
         Q2V5AxUTz+ndlF5PEs561NobgKZZ93iF0/SkJiCUqf0XYWHKcD3idBLVtwYc1ZRQx7Hl
         lbKg==
X-Gm-Message-State: AGi0PuZPAWwyLhJ8npwiEcdcwJheOuapedDUfVAmzDUvaxoADzmSkKa8
        KZy6h7fQlnL8f+Flk0C9pFU=
X-Google-Smtp-Source: APiQypLvgv8q8oPfNaVk2AcIkj7MJf4vJ08eRXJA6Fqn9QX8Iss/Bh26ZmXDBdDf9Fzvwv+d+vR9ag==
X-Received: by 2002:a17:90a:feb:: with SMTP id 98mr232738pjz.72.1586277579024;
        Tue, 07 Apr 2020 09:39:39 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id w134sm14135232pfd.41.2020.04.07.09.39.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:39:38 -0700 (PDT)
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
Subject: [PATCH v1 24/28] i2c: stu300: convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:37 +0800
Message-Id: <20200407163741.17615-25-zhengdejin5@gmail.com>
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
 drivers/i2c/busses/i2c-stu300.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
index 42e0a53e7fa4..9a03779c149e 100644
--- a/drivers/i2c/busses/i2c-stu300.c
+++ b/drivers/i2c/busses/i2c-stu300.c
@@ -860,7 +860,6 @@ static int stu300_probe(struct platform_device *pdev)
 {
 	struct stu300_dev *dev;
 	struct i2c_adapter *adap;
-	struct resource *res;
 	int bus_nr;
 	int ret = 0;
 
@@ -876,8 +875,7 @@ static int stu300_probe(struct platform_device *pdev)
 	}
 
 	dev->pdev = pdev;
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->virtbase = devm_ioremap_resource(&pdev->dev, res);
+	dev->virtbase = devm_platform_ioremap_resource(pdev, 0);
 	dev_dbg(&pdev->dev, "initialize bus device I2C%d on virtual "
 		"base %p\n", bus_nr, dev->virtbase);
 	if (IS_ERR(dev->virtbase))
-- 
2.25.0

