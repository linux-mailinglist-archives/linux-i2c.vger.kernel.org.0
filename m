Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AF11C3883
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 13:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgEDLo1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 07:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726782AbgEDLo0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 May 2020 07:44:26 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29F2C061A0E;
        Mon,  4 May 2020 04:44:26 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 207so2712383pgc.6;
        Mon, 04 May 2020 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KE1E6Qa3R2pfEpOWk7MxtXJqUgD9w91BRweLgLc6m/I=;
        b=DoLS6r/Y/Yq6S/rgQycBopx94B6CehgYivKU/+UXsQu2n+Uc9RJCBf7ol4yyYHbq8l
         eRoI1QVG4NX6LNePy+OFPSHt6VKWjZ5y2n/pYcEZ40Zd1IfXpaJf51sjo0kgzaOYeOwE
         KPrxp7VlGPXk7fyFzfsBg+zEO9HOgdHJSk7DfWrj1FUN4s1hEYODkk5yeDBV4SWH9g7M
         bsuIEBwLFuILx130410g3bk8j381PnOoletAhT7YvmGTJp57ce5JMBPZ5R4mv+3GNYdS
         Tfd5ksb26j28n6oOQW2VtoXlmb0VudzdbkwG1Qm8P376KjSDXrV4JPlaRqRqEh/t9aI/
         4FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KE1E6Qa3R2pfEpOWk7MxtXJqUgD9w91BRweLgLc6m/I=;
        b=VS1Mhtm5N0TRIW72+7C4uG74RRnkoacBPPRnHkM63HeMPVVhPKQssH7lOtuI66oOBz
         ppbsmaxQaOF/+D3gWPFh5udXJxIaYq7B/7FTJdfu9noYI4DFdVZ4Pusq2oii8JL3Na1f
         xFu8UoNJigxxJq6S/Dk9Uu1wvN/ZECcgOlCSGQms+6PdX399P/Vmp+7r6PwmYUAS6svG
         53h4CIfHFBqBzYQJ9XIaZQ/gGQHg8uY0dGKwo6RAg+PqtHopvbmpaSLHJxMDgy743zfU
         6jEz/k/K/47r9xXioV+ScQ1iRqVNQ9AZy4UCgNjKZ6UbSfdea5MTD0udMr4SLDhCbRe0
         YfcQ==
X-Gm-Message-State: AGi0Pua02tMab97jasZhWtOgo7IVHN8WUEAHurr10FsjhZyNQtkQ600R
        NcworBuaQNjf6MQ1GSlfhKo=
X-Google-Smtp-Source: APiQypK6Y0ETyZi/tK8Fo012jOB3XHEpY8XYWd7UJbcUvZpongTD58JgYc0v6ieSgnN+Z4hU8KnDxQ==
X-Received: by 2002:a63:7b42:: with SMTP id k2mr10622412pgn.299.1588592666223;
        Mon, 04 May 2020 04:44:26 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:20a:c836:7c28:bcca:10e4:5523])
        by smtp.gmail.com with ESMTPSA id w30sm8646930pfj.25.2020.05.04.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 04:44:25 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To:     Thor Thayer <thor.thayer@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: drivers: Remove superfluous error message
Date:   Mon,  4 May 2020 17:14:06 +0530
Message-Id: <20200504114408.9128-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200503120847.13528-1-aishwaryarj100@gmail.com>
References: <20200503120847.13528-1-aishwaryarj100@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The function platform_get_irq can log an error by itself.
This omit a redundant message for exception handling in the
calling function.

Suggested by Coccinelle.

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/i2c/busses/i2c-altera.c   | 4 +---
 drivers/i2c/busses/i2c-cht-wc.c   | 4 +---
 drivers/i2c/busses/i2c-img-scb.c  | 4 +---
 drivers/i2c/busses/i2c-lpc2k.c    | 4 +---
 drivers/i2c/busses/i2c-uniphier.c | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index f5c00f903df3..af6985f0ae63 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -395,10 +395,8 @@ static int altr_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(idev->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "missing interrupt resource\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(idev->i2c_clk)) {
diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 35e55feda763..343ae5754e6e 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -314,10 +314,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	int ret, reg, irq;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Error missing irq resource\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	adap = devm_kzalloc(&pdev->dev, sizeof(*adap), GFP_KERNEL);
 	if (!adap)
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 422097a31c95..2f6de763816a 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1344,10 +1344,8 @@ static int img_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
 	if (IS_ERR(i2c->sys_clk)) {
diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 13b0c12e2dba..43dc9b7043e4 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -362,10 +362,8 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0) {
-		dev_err(&pdev->dev, "can't get interrupt resource\n");
+	if (i2c->irq < 0)
 		return i2c->irq;
-	}
 
 	init_waitqueue_head(&i2c->wait);
 
diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 668b1fa2b0ef..ee00a44bf4c7 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -324,10 +324,8 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->membase);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get IRQ number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
 		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
-- 
2.17.1

