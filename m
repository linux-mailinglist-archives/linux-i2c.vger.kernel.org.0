Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE3D1C7A59
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbgEFTeM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgEFTeL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:34:11 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75208C061A0F;
        Wed,  6 May 2020 12:34:11 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x17so3576705wrt.5;
        Wed, 06 May 2020 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKSK5cphthcQfPGBMuVAtKcUXjQYJxmUcTC36Mj7c+A=;
        b=j+Z8aeiLn5Tj4xFrQzED6Tqk5naldEAHrXFey5y9bCpm6RtX1pf1g3hO2Ki4PRhC8Z
         fL1NOXWCRb78w6Egy/TpcjrWT9cULn8fBviG9BJdHzV31tPvHLnop84UJwJRRMrf8vM6
         TL+2czLk9RscKJJVjJ6QQxsUvm81E0xn5tcislhY8Kee/kXFaUYURiZkorTdTAIvfKzJ
         BO9uUiyWXAiyNF26gHGLqXePQkL5SqUqYwXUBIe98V9pc3GANbUcR1fRv2ax6F4wAIBh
         XzagDKGc4bBJwvqFt9x6xox+4MHy5ljsRTwsrxOadHwcfFsSde8adePrNzOqIp+JwyUt
         dfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKSK5cphthcQfPGBMuVAtKcUXjQYJxmUcTC36Mj7c+A=;
        b=DPXvbzFiAu5Z5upuhUh9rHTgj1SnRakP/wj4pJm5HQtLOeol6aKcQObOJMs44R/jm7
         XNLFX4X7RCS7YiPFf6JB0dck++fqGIHYD2JHBhrMZFqiBxsj9GoT1sqIMGPL19mEKOtx
         178gsaq5umzx/z6AUD4oqw7wtC7J4WmeGaBZIHyVWEUwObsEQwQ9xh5LELDDGJ22Lm7/
         yyPtghDGwOYg0HRRkbQ3XQIvo1+vvPIeuVARZb6+L6f5ZbTFIF3m2rdDCQDy8v1xwSvW
         y9MyvnhwKPO4hyONZF426V88EVmUvznMJ+qaH9RMX/XGZBuFh5v9IR0+SfxokmG+eNgg
         wQXQ==
X-Gm-Message-State: AGi0Pub+s47MuYVNqiqNHqzK6pB6rqLibHgSpHaId7UdhG0OlJoplDW0
        R32YwGjyDJ/V9DpTVGiHI9cu6cwvsjI=
X-Google-Smtp-Source: APiQypIj0u7pCrgVdvCzcLZZCG5zloRgcgm8Oa/fcqInowS/zFN5aVMCIlfyzakBNobeoABWsmiiAA==
X-Received: by 2002:a5d:4248:: with SMTP id s8mr11007401wrr.216.1588793650140;
        Wed, 06 May 2020 12:34:10 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id p8sm4151343wre.11.2020.05.06.12.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:34:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/5] i2c: tegra: Keep IRQs enabled during suspend/resume
Date:   Wed,  6 May 2020 21:33:56 +0200
Message-Id: <20200506193358.2807244-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506193358.2807244-1-thierry.reding@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

One of the I2C controllers on Tegra SoCs is typically connected to a
system PMIC, which provides controls for critical power supplies for
most platforms.

Some drivers, such as PCI, need to disable these regulators during a
very late stage during suspend and resume them at a very early stage
during resume.

To support these use-cases, keep interrupts disabled during suspend/
resume.

Suggested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index db142d897604..8d2a212db733 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1694,8 +1694,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
 
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
-			       tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
+	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
+			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
 		goto release_dma;
-- 
2.24.1

