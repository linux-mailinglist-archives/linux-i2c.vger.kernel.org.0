Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDD11A7FB2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 16:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390698AbgDNO1D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 10:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390695AbgDNO1A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Apr 2020 10:27:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163CFC061A0C;
        Tue, 14 Apr 2020 07:27:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id z9so5268856pjd.2;
        Tue, 14 Apr 2020 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WH0wZE6uzzA+a4e5P2qc0W40GDZZ9BneKHmXZLZLm18=;
        b=Gxpg4uqB8pTwf64kuCO6WCL4wKc87NfZQkmnBDLVsXjiS4BRKT4lEK63M+qjksSIqS
         BnowqgotjG2fDVoYtOzVdywfwQJlMhyk0xrPOyWWxGI3VJUwOdR+fCSQabLY4wLKBVXv
         e0ObYzePX4rF67B5iCdGCRhrjzBrAMVj+bnzHZJVz3MqNMN0W0KCzkDbuVmIGtOfllYF
         4zuK8LxPTtyME/gehxKOcrpZtP70YI553CWgOZOhd+TG6vqXmJpiXwU0/1Ws0KL9kX1+
         s7R8xYS2e9bJJd8E3dKUzv8zCHCox3S530GQ7H6GPF4dVR65YQwI/ZridBtFTbKE2H+W
         0X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WH0wZE6uzzA+a4e5P2qc0W40GDZZ9BneKHmXZLZLm18=;
        b=twy0+0QR5Qk29oVwiuSN6kW0OSbZrc42FIBrBe2PvaGJkj7qBdV77G+s1uM1Z9TkzG
         GoBwk/0lAfUQMYUvzJDMSofbVNA9uYEDsmU35T3LM+ZIK0Q+6uptIQ1ncLiCU/yZyeZ/
         vHLFteblj0ORHoQ0lxzdMeJ+uCrDZOlbzK8VsvKqBIDnNdQhLcqWFhSr3/Xmm/8ggaMW
         8tyeagiCeKWqqITQ0JWA9KDh4JvXJO3Xxn8jFbDBX5lCFbb5j1U/Ve1SIoAYBsalOEQ3
         nyhgFS0a8me97AGz2/JDCvgQ1M5sNcM8yk7UFN9B1CSYJ/9BlwWxWvqMN6f8vDcBfZQp
         /9Kg==
X-Gm-Message-State: AGi0PuZCbpnrVZ5oVV2pPytPfTSYLe+fNptmnCQz6PN7SNTWFwd6tEN9
        Kaazg/fl37RpopW+FzjRhmA=
X-Google-Smtp-Source: APiQypJP0tHAzlwgJYQawKPZOPISY5KMkVWcTjEk+bBRGr09thwu5jRGbw/ykfTLNLKlfbIzaAyC4Q==
X-Received: by 2002:a17:90b:3648:: with SMTP id nh8mr357049pjb.153.1586874419453;
        Tue, 14 Apr 2020 07:26:59 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id d23sm11228901pfq.210.2020.04.14.07.26.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 07:26:59 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     linus.walleij@linaro.org, patrice.chotard@st.com, info@metux.net,
        allison@lohutok.net, nehal-bakulchandra.shah@amd.com,
        andriy.shevchenko@linux.intel.com, tglx@linutronix.de,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
Date:   Tue, 14 Apr 2020 22:26:50 +0800
Message-Id: <20200414142650.29359-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

it will print an error message by itself when platform_get_irq()
goes wrong. so don't need dev_err() in here again.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
-- 
2.25.0

