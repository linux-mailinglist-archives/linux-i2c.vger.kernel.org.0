Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA55B50C8B9
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Apr 2022 11:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbiDWJp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Apr 2022 05:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234555AbiDWJp2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Apr 2022 05:45:28 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C093EF1B
        for <linux-i2c@vger.kernel.org>; Sat, 23 Apr 2022 02:42:31 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id be20so4781039edb.12
        for <linux-i2c@vger.kernel.org>; Sat, 23 Apr 2022 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JyJCHnFqV/teN11xc8Ra0BCGSJBCzawqxSj6rs9BuY=;
        b=KRIHh6Zrfwkp2eXxHzhPObVxfGRom4pBnvXTWIy7F3cY7E1s9yx48UvMha7lXDbBya
         OX5dfInbZCEwbtUFcdbSrhTi6+bgxN1xf3CnMvFti1rCilXVUlzJBhG14tLiesnmDLly
         Mm8U3Xdngj8V8ydkZq5U7UYrB00dgci1gWG9RpabssvWH+ePN37KWQi7c+dDNNCJKupw
         r0n7EyuwjT9bOB/DuPguKR5Mv8LL98Z52jvv5Bg1D15p+v6rj9mCWgihl28r9aocPcjf
         C7BwIb5mS7iRzrVHLj0xriZ2YCHz8XcEsAKZSLQaFj5IIW9v8JOZt5Qfk++ossQsQ4+c
         /6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JyJCHnFqV/teN11xc8Ra0BCGSJBCzawqxSj6rs9BuY=;
        b=NDvnRy8CVeMEduc3OUwYw6Wnoov53sax+3m/iLeDbSc7vzmQyNGqGmLMmEx8F0KiYO
         rAGq+gCtRYKs7T11UVcfe2S7NkezNRTlduZxp5GewL3KHTtr+0t3B0GqvIu8DfTeu1mk
         7qVIPFGJXskrkp/GDqxQSMRLgiJ5knYlHCFYGWSBG1dfpyTVLnTRS3dT92415hW7dS0V
         Y5VqlLfM95uIPv2NX08ry70aLDKCVwKgnAwa0CAV5N0IwrcJgD0XNbzSrwA3wvEz7+Fu
         4o/TGKAT4FoHcN0YWdAo9qXlMm6rl7HarO0v+0xvLQWIhLJo6SiP0tBwL39G+zO3em8x
         8LIA==
X-Gm-Message-State: AOAM532EDgMPzPniljsiQu0twu4ENXlchR7Tli9uHh88yKBUMRIzPZt3
        o0VXfb6Wx7Yr0xfU4/USmVMs1w==
X-Google-Smtp-Source: ABdhPJzQWKCnu49QHC1FYDxk/aID7ZSBrgOlJHXY7G9WJEGQtcGMlBNQWVAYRg+IQQKA1LyqY4MHNA==
X-Received: by 2002:a05:6402:b1c:b0:41d:798c:78e3 with SMTP id bm28-20020a0564020b1c00b0041d798c78e3mr9309747edb.188.1650706950418;
        Sat, 23 Apr 2022 02:42:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h22-20020a056402281600b004206bd9d0c6sm2069067ede.8.2022.04.23.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 02:42:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map() return value
Date:   Sat, 23 Apr 2022 11:42:26 +0200
Message-Id: <20220423094227.33148-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: f48e699ddf70 ("irqchip/aspeed-i2c-ic: Add I2C IRQ controller for Aspeed")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct the return value passed further.
---
 drivers/irqchip/irq-aspeed-i2c-ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index a47db16ff960..9c9fc3e2967e 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -77,8 +77,8 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
 	}
 
 	i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
-	if (i2c_ic->parent_irq < 0) {
-		ret = i2c_ic->parent_irq;
+	if (!i2c_ic->parent_irq) {
+		ret = -EINVAL;
 		goto err_iounmap;
 	}
 
-- 
2.32.0

