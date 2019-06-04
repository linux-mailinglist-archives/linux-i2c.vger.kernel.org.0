Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC45344B0
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 12:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfFDKpv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 06:45:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35617 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbfFDKpB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 06:45:01 -0400
Received: by mail-wm1-f67.google.com with SMTP id c6so11255372wml.0
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=nQjqkj1EN8NC8Ay0yEHmwn6X2HJX2TtkXyONunIjoOQ=;
        b=LgaFtLgo69Z61g+GbWOW59qkBgcDUOxjNGAQFne/2sNXo+5nvlREiDIDiZ5YaY5F9N
         Eyv3uRxa6TWCtsMCUJWb9Z8oapmFfry/+Ssw7nMD9REJirzVscIqSBPbu0EB+tXDsrFJ
         oz9y18iFepuQyqmb98O7GQYfNCXa6ElADnlthp5IzMl8S1xTIWDKver4ZF2aPfftF/WZ
         CeRdv9BwD+LaDbuC4g0tzV0AMVmDUGL4/e5N0YOscBVmeAlZUeRwdhH6/g9pHq7/a/rA
         fdQ8GAvTL8rb31m81z4MDhX0+POnf3oemi4gmNJYx+AMv8NuAF1EMYqp8A85NWygnW/u
         Tz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nQjqkj1EN8NC8Ay0yEHmwn6X2HJX2TtkXyONunIjoOQ=;
        b=BQXRmA2pQOaN6Q7LIBexvob8uYoleGbkdBDNEU+NzaCfuVg56CWifybieeGhGBjrzA
         EAoYMchn58wZr5GVKz3rdVs508IXVJXvwcthQUFWaH5aiK6S3sxYLG3l8wZF8ausAZmA
         WfUv9+pYg+c5lcMKyHUl7IZKZyX3R7MT+fBso+DSrvSw2UrYJUsUYmTENUjrgFa8Dm7O
         mBy4sHqyXPJnAK4EQ1jNu1CzUBq0+vkdiwKFEJs6YPOAhYja2T6gzsQYlRG6l1RtPRxv
         iPzoC8Z7nGSid/I2+nfxnasZzqGXsgqp+fl8G3+EFVj9uKK9ad8kM+CCD/wyVuIoo+PR
         03kQ==
X-Gm-Message-State: APjAAAWiRFvLeAs2VixKShH0SACRqhNgzeQ06dq94SCfG8Cm7Q8umnpW
        69cXSQa4LYeAWHU/1aZVoD6tRw==
X-Google-Smtp-Source: APXvYqwy7Wly0XpVwU2R8jBLlrTc45c8pBpyc8Qd+lEsf451U2b70fbSQiSGxtDiciO8fcfvfWZ8aw==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr5943280wma.114.1559645099469;
        Tue, 04 Jun 2019 03:44:59 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.44.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:44:58 -0700 (PDT)
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
Subject: [PATCH 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
Date:   Tue,  4 Jun 2019 11:44:48 +0100
Message-Id: <20190604104455.8877-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a match table to allow automatic probing of ACPI device
QCOM0220.  Ignore clock attainment errors.  Set default clock
frequency value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index db075bc0d952..0fa93b448e8d 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -483,6 +484,12 @@ static const struct i2c_algorithm geni_i2c_algo = {
 	.functionality	= geni_i2c_func,
 };
 
+static const struct acpi_device_id geni_i2c_acpi_match[] = {
+	{ "QCOM0220"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -502,7 +509,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(gi2c->se.base);
 
 	gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
-	if (IS_ERR(gi2c->se.clk)) {
+	if (IS_ERR(gi2c->se.clk) && !ACPI_HANDLE(&pdev->dev)) {
 		ret = PTR_ERR(gi2c->se.clk);
 		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
 		return ret;
@@ -510,12 +517,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
 							&gi2c->clk_freq_out);
-	if (ret) {
+	if (ret && !ACPI_HANDLE(&pdev->dev)) {
 		dev_info(&pdev->dev,
 			"Bus frequency not specified, default to 100kHz.\n");
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	if (ACPI_HANDLE(&pdev->dev)) {
+		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
+
+		/* Using default, same as the !ACPI case above */
+		gi2c->clk_freq_out = KHZ(100);
+	}
+
 	gi2c->irq = platform_get_irq(pdev, 0);
 	if (gi2c->irq < 0) {
 		dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
@@ -660,6 +674,7 @@ static struct platform_driver geni_i2c_driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
 		.of_match_table = geni_i2c_dt_match,
+		.acpi_match_table = ACPI_PTR(geni_i2c_acpi_match),
 	},
 };
 
-- 
2.17.1

