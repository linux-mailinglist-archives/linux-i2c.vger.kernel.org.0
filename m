Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D27F1C2C78
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 14:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgECMsn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 08:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgECMsn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 May 2020 08:48:43 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A99EC061A0C;
        Sun,  3 May 2020 05:48:43 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id z6so5662365plk.10;
        Sun, 03 May 2020 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=A+kYgIXhPpnbF20dGR3Ntj0HbDnG3Ux93VPlAZngCjU=;
        b=MPT8Hm7y6XBLc1Ir4CqSlY4SiOkYFzLSaGCfuSOanZtxlJpvI3fIY2RudVU+lWQ3zR
         6OWa+RjbVT9Y1skDUPZ2JYzAzw4eJ6HSusIjM/c4ggSUtfxy8CjCG6FTJgASzzbJTots
         g5ar6isfGMFKZTAaP5nPtp8qGdyE+gmieZHbXMguPrC+x5H4adAiE1fnjJ/t60D03jdK
         W345NnqJDl1QnJ+5kU6tCxutGXBbEjahuqUi8OuAJQt8TdIgZyayKBsTOnlDyMeucjgX
         ijxCns7sthRs/ICd1zGXIzf4OJQZEnIt2OKj+DZ+S2dFNuHtgCkamcrEBBTknB6Y0lrG
         i09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=A+kYgIXhPpnbF20dGR3Ntj0HbDnG3Ux93VPlAZngCjU=;
        b=cRdYFYwHVrXFtmfsz7VEPhOF1lzmu+yJsMieXI3ACZsVHWnNBYvUhxZ0wpc2L7vSKf
         eR0yq6ILXx7Svrg7CIod15LoivKUp5UvbDt2eYtdlAOOJW/vfhZfunkfiqvjlIImhBwG
         j71tkFZ+ad834ZKd1wGgo5PugY6niyMyWg9jyzx60B7VeJTQUh83cYoDHLAfcjClbXPk
         mTofQNwFYjBd1EoWBdemSa1bf5FUizw00CpsZQlvZyu9AH3Thg7/OVB9N1M99GbC9J2g
         k5MTJqjZkyq7Sq/kG1AmKBNR7oxSwG1vCYeLdUHgJPIJnjQLpXzt8HBharfJ3hXdV2Le
         RUZQ==
X-Gm-Message-State: AGi0PuY/wrfIu4MLTaWCKSH6OlNEJlHiUZNavoD0Zxa+qoJMOJOLMLW1
        rTfXi+nur2wf5gRAMxot/umMJzRb
X-Google-Smtp-Source: APiQypKNfST86XEioxy/4zzUNsERmVfmrQVn//+BjF2IG6siv5KWr7f3fC05Mvn6dNpXGvu4g/tIqw==
X-Received: by 2002:a17:90a:718c:: with SMTP id i12mr11195240pjk.58.1588510122936;
        Sun, 03 May 2020 05:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8b:8746:9817:f6e9:c9f8:6a59])
        by smtp.gmail.com with ESMTPSA id z1sm4245123pjn.43.2020.05.03.05.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 05:48:42 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To:     Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     aishwaryarj100@gmail.com
Subject: [PATCH] i2c: altera: Remove superfluous error message in altr_i2c_probe()
Date:   Sun,  3 May 2020 18:18:33 +0530
Message-Id: <20200503124833.15070-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 drivers/i2c/busses/i2c-altera.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
-- 
2.17.1

