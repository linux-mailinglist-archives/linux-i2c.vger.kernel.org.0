Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4BF756E70
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 22:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjGQUjC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 16:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjGQUjB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 16:39:01 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4048E1A5
        for <linux-i2c@vger.kernel.org>; Mon, 17 Jul 2023 13:39:00 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-78666994bc2so227365939f.0
        for <linux-i2c@vger.kernel.org>; Mon, 17 Jul 2023 13:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689626339; x=1692218339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tT6FOFtH3ohDgShMpbLWtPrL0RbY5dikqjcrYpu9jQ=;
        b=ZvGwKqxG6qgetzFMhWNfLscpg66l0U3YhjbK/Ssw/IcZUjPhffiOgaYsXEhF629moB
         fW2K6+Ow084JYJjlSQj0Ro0m7VIIzYfdQrfNw8RSErsKuZp/6IaO+b1d+5XbvOIUdDv7
         RtXyxdHgpk4KNMFOCvQxrBAlrJyQSfEa89Z9bf8EbErqmmylx3B0iUMcKembc8C1LHHI
         1C5cmTZNRnINvGRpn4X1X9rKbV0HcgZRiIUsH1ySZ9ndIhrpI277pWbPTs+yTLN8y/PU
         bUBPBJYWE/XNVbb3u/puEI8oj3BDPKm+j7euUAkiA6wUBefxer7hwSMkpDZBEIdl9OOd
         mokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689626339; x=1692218339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tT6FOFtH3ohDgShMpbLWtPrL0RbY5dikqjcrYpu9jQ=;
        b=fBcjRKRiTbDGeSBegk4uAoW8IxYIwuOxPT4tdhFfDuJGBfDudgNi9Mi+FI66Uojr7P
         8Ar8gO4jT3dbfw68rnTlaEiB9fe9UEEessUuvsf2EdINR/1/0BW5z617/1M7weSW4me8
         FHFfABhdRw5laZOjuFqyksNsV7AE9i8gBEyaelt09F/Op0O2USy2f+o1I6UElQAoE4tj
         AcSBjASrqZEHBNbKs6ATspaDNOOot2Hpu8QESQDKXa0J3AC6VhXCEhMJsL2CPdeI9AUW
         vyh2dok6/n1lK0Yt13Mr8VyfPyj3IO0zChfRrFrNjaZWbWx//TZ1mHxFt3MRASYxMFjM
         bPTg==
X-Gm-Message-State: ABy/qLYrFFjIl7emovOWld9zRMkwGKJigtciorVk32BCZSHYaLR3ZtZg
        sDKEU+aaewAeeZ+QIA3lKE5ylg==
X-Google-Smtp-Source: APBJJlEwgqsXD6KpQ063dooGbgHTJ7bZ45zotpxEDjkEvbhmfbFxcp59BZLFxxHNaGjnOJMcmbfrdA==
X-Received: by 2002:a05:6e02:1bae:b0:348:1a1d:79a5 with SMTP id n14-20020a056e021bae00b003481a1d79a5mr857769ili.15.1689626339606;
        Mon, 17 Jul 2023 13:38:59 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a1a4600b0025eaeaae318sm254143pjl.7.2023.07.17.13.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 13:38:59 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>
Cc:     Samuel Holland <samuel.holland@sifive.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: ocores: Move system PM hooks to the NOIRQ phase
Date:   Mon, 17 Jul 2023 13:38:57 -0700
Message-Id: <20230717203857.2626773-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
the regmap-irq code must be able to perform I2C transactions during
suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
be suspended/resumed during the NOIRQ phase.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/i2c/busses/i2c-ocores.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 4ac77e57bbbf..b1f621d42910 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -743,7 +743,6 @@ static void ocores_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ocores_i2c_suspend(struct device *dev)
 {
 	struct ocores_i2c *i2c = dev_get_drvdata(dev);
@@ -772,11 +771,9 @@ static int ocores_i2c_resume(struct device *dev)
 	return ocores_init(dev, i2c);
 }
 
-static SIMPLE_DEV_PM_OPS(ocores_i2c_pm, ocores_i2c_suspend, ocores_i2c_resume);
-#define OCORES_I2C_PM	(&ocores_i2c_pm)
-#else
-#define OCORES_I2C_PM	NULL
-#endif
+static const struct dev_pm_ops ocores_i2c_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(ocores_i2c_suspend, ocores_i2c_resume)
+};
 
 static struct platform_driver ocores_i2c_driver = {
 	.probe   = ocores_i2c_probe,
@@ -784,7 +781,7 @@ static struct platform_driver ocores_i2c_driver = {
 	.driver  = {
 		.name = "ocores-i2c",
 		.of_match_table = ocores_i2c_match,
-		.pm = OCORES_I2C_PM,
+		.pm = &ocores_i2c_pm_ops,
 	},
 };
 
-- 
2.40.1

