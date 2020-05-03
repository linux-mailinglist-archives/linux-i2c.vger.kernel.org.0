Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41AB1C2CA5
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 15:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgECNKc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 09:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728378AbgECNKb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 May 2020 09:10:31 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14A4C061A0C;
        Sun,  3 May 2020 06:10:31 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z6so5673111plk.10;
        Sun, 03 May 2020 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=HPO6k65ImqEnfaL+we0qFzrQP+hQAQ35nSDiLuw05GM=;
        b=UrHOkhy6JyWGSEgUshCOl6LbN9yc1T4DXgCNfoJk6ma5wapSCnidGaXmB5tn5lPaS5
         F8CE7aJUxCyE8ZXDEeIvDbxsC00Ufqv8bbinoyJoGfRR/TOVmWUgsEyp3BsSXIvS/zW9
         5abCqAsttz4CaJZAmqY8i+ztbtBS2sEXEztP7ohdTjQ8W6dlX5uJ1pSQMJsl3i2scNRe
         DeOkl7D4uw05ssqTy8xi6JZfGCOCR+C6yhBA4vZZL4NtgSnZCn3wP9tb7f15lFtnFi46
         mJA1gMu4WbJbuNSIyln/u1dagk8StI8jvT7Vvbjvv6xbFJ5q4yydqQ1RUrQjUAFp3p5t
         qexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=HPO6k65ImqEnfaL+we0qFzrQP+hQAQ35nSDiLuw05GM=;
        b=CahZqPsps0oJakDFJCNS15IkQr3+ZbV96BA+Uek2IkwtpEgU2MgkcuLXH34RlDz55y
         TiRM5ktqxwhjYoH0LNPAeQxeIZg4VSEradxSwJMEwic+Fwt50EHuqQYOONNw9LXmkQAJ
         1LHiAiNngTRFR8aguPn1BsZtGsD5UExvpsptMXf0W7ftzBqd/QvW7yhLDukgUVMqSC0x
         d2BcdSZVJ99HLlqllQcBu9hOY4nalj0BVKk/NRp0lpfl/J39S1NqjvijX6yI/Vd27yns
         wp6DIiujalitQ5P3r9aS56AGrWQ5KNCInmiGAESKIr8ZeGggSSew6+O3Lcyirpvl60AV
         3RRQ==
X-Gm-Message-State: AGi0PuYkBNEP23uIL7ePiqr4NptA9t5ZcdLbIf4mILJorwVyyd4UqpBg
        BNzkwaO0qFbFar0iSgn97zA=
X-Google-Smtp-Source: APiQypK2ml7rYX+bhpT3/q+Z4ibV3Cp+kU63Iv1q3sjMj2drC/Z7qW/MZIImiOkLLzkxg+7b2LUqtw==
X-Received: by 2002:a17:902:b402:: with SMTP id x2mr13602667plr.42.1588511431056;
        Sun, 03 May 2020 06:10:31 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8b:8746:9817:f6e9:c9f8:6a59])
        by smtp.gmail.com with ESMTPSA id o63sm4386802pjb.40.2020.05.03.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 06:10:30 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: img-scb: Use devm_platform_ioremap_resource and remove superfluous error message.
Date:   Sun,  3 May 2020 18:40:18 +0530
Message-Id: <20200503131021.16575-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the helper function that wraps the calls to
platform_get_resource() and devm_ioremap_resource()
together.

The function platform_get_irq can log an error by itself.
Omit a redundant message for exception handling in the
calling function.

Suggested by coccinelle.

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 422097a31c95..98a89301ed2a 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1330,7 +1330,6 @@ static int img_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct img_i2c *i2c;
-	struct resource *res;
 	int irq, ret;
 	u32 val;
 
@@ -1338,16 +1337,13 @@ static int img_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
 	if (IS_ERR(i2c->sys_clk)) {
-- 
2.17.1

