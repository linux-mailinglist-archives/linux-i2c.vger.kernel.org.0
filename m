Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 572F9344A1
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 12:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfFDKpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 06:45:30 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45066 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbfFDKpF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 06:45:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so552668wre.12
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=SrM3zAvHO7s4r4kfWRb3yKeFRE5PBTe75g4T6jp6QVLZ+DbjYiqMYZ/caaJl2svogL
         Dho1YX4HBmmhcjNwienKNpKLHxULynaK4RwnoYB8aEOifJlkpTWldE/+L9a6CBOW2SBV
         8TY+kVlRP8QzflACyJFTgmXnlx9rJAUzH4CNwmMUfhVqaznt97K1fxCP8/Zawp6/IgVv
         nclsKzImAAkMxU8Y2NicxZ+aWSjqdzGCXD6Uy2EN7XkkhnMLxpGxX+mLyl/mAhj77crl
         3OedRVGkpp68L5HrhDth6eUQCdIJppx09j67O+gWfpNvj+pXqJRqm3HD5nbQBk9OGfYV
         t2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ixa6PZM7Qd3yNTQ1/2lb9UJukHzNBYD4+3OM8ec4OSs=;
        b=U4kkGlFR0AoJuAImCSda++IcVPeR5p15MYy9jr9qBFTtjwuwRnKVGEjBv9P1YjB8TN
         2qTJpgfvi4zYQ3k2aEkkBz/h8kOZeK1hIKiTIsw/TWBsNd/SDqo8I2qemEr9EWidWZGr
         vgj3t2snLPcyPDGQi8DHw7EV7jUcmb3uB6RCyLuHB0NHVhlVZQMgG+9Tx4fZl5J6eTaD
         OcxfyOKmEDOtZ4sP4qQ6lA23m+GSK3rYBy6T6aN+sxuTioaN+1rjaqFv21Q0EiM+Mf/l
         22PVpgkrShQZB7XhYrCIVFjjqlCkws68heIWksjPJVsc8ufImjZXJHxtrLyxMsrEyYYJ
         mSbQ==
X-Gm-Message-State: APjAAAVhEhgJujO1XOSd/dlpSQYZIenC11x3cNU/WsLR3FQq3gOY5/Q6
        sBzQL9JigXsxV0uMPEGhzl6CbA==
X-Google-Smtp-Source: APXvYqxeY6H93q1Bt0x5h2fNrnGLPGAkTcBxIAddnWtbIbwQwr3Fz5wwwK1XYktubxlpc0VDO1ZA7Q==
X-Received: by 2002:adf:e286:: with SMTP id v6mr6228022wri.340.1559645103884;
        Tue, 04 Jun 2019 03:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 5/8] soc: qcom: geni: Add support for ACPI
Date:   Tue,  4 Jun 2019 11:44:52 +0100
Message-Id: <20190604104455.8877-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When booting with ACPI as the active set of configuration tables,
all; clocks, regulators, pin functions ect are expected to be at
their ideal values/levels/rates, thus the associated frameworks
are unavailable.  Ensure calls to these APIs are shielded when
ACPI is enabled.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 6b8ef01472e9..cff0a413e59a 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
@@ -450,6 +451,9 @@ int geni_se_resources_off(struct geni_se *se)
 {
 	int ret;
 
+	if (ACPI_HANDLE(se->dev))
+		return 0;
+
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;
@@ -487,6 +491,9 @@ int geni_se_resources_on(struct geni_se *se)
 {
 	int ret;
 
+	if (ACPI_HANDLE(se->dev))
+		return 0;
+
 	ret = geni_se_clks_on(se);
 	if (ret)
 		return ret;
@@ -724,12 +731,14 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
-	wrapper->ahb_clks[0].id = "m-ahb";
-	wrapper->ahb_clks[1].id = "s-ahb";
-	ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
-	if (ret) {
-		dev_err(dev, "Err getting AHB clks %d\n", ret);
-		return ret;
+	if (!ACPI_HANDLE(&pdev->dev)) {
+		wrapper->ahb_clks[0].id = "m-ahb";
+		wrapper->ahb_clks[1].id = "s-ahb";
+		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
+		if (ret) {
+			dev_err(dev, "Err getting AHB clks %d\n", ret);
+			return ret;
+		}
 	}
 
 	dev_set_drvdata(dev, wrapper);
-- 
2.17.1

