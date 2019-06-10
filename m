Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8E43B0F0
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 10:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387890AbfFJImT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 04:42:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54770 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388045AbfFJImS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 04:42:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so7607710wme.4
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2019 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Dg3oC3jeSqKLOMc1HRQAN+HlqdHVv5WaH1kaddbCmVU=;
        b=N579Ut3169MDjhrrsBHmt//MQCwAN9tpPt3Zo1dy964bOck+NE2epVrhRBU1VblB2u
         argmebVwjEfyM0/+EdEoAX0b5Fq5NxYGpIQuKYxcRm3f6DrXYUp9+3Phnsrs72hPDxLY
         9FeO0ZoZfziqPPQ5Sabb6aQTkrkkpKHrgStbDGRScUYfIpJ7xF3SyWOxHQOwYZqwhKcz
         EniNcgCcFjDzdPD/Gnpf3RA+qXhbvSAs16aNmMS2qJDjp6tBrLfK6Mgb0HZOpg+9qNwL
         oQ6VHz8UKkO2idUdzyEKI+GrwcIaOp0HZzEmgPvcIdAyT9BdrZ+vROzlL53L0fsTHRCe
         Amsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Dg3oC3jeSqKLOMc1HRQAN+HlqdHVv5WaH1kaddbCmVU=;
        b=R15kOkt0SXtvBRZjrkKWDZShv0/qEH2p53kgl4MJyh/CX5YYUZXYwHw13cu4OS6/mi
         Qeu9EkHv5wu+VcXzXCXKIdfSjWUTo8RrafelDc/VEeWz2+9OEj8YTzcJ2pcNU38w4b/m
         7+MSjw2PWjFCgvzAm8ER5PDUR09PVz/PwYrX0BfXCgZtkIiLjicrk53oKs2ufC+XpGtC
         FK8rLL+xlVoRJpdOEhY47qL9YK0ygoqDfBtarcoFCSijuE8R3/s8TyZrZny8uGBNZn0u
         OjefiYwzy3wHJza3PjP8hu4Gxz3GFgNO25xeR3EwLUb0Xrh82aXVfPb0VSpQc8mcbol/
         bC0A==
X-Gm-Message-State: APjAAAVSypETo446b2A6TjwAW22w8iAEmOLOzwMacqQdIl8qSCgZrdL7
        629CXShjTiaEIUZCeLkGoq799w==
X-Google-Smtp-Source: APXvYqxdxCdZ2/sBtdJ+/F3Df3JCTp8kjj6xUmL6L4kDCCYLWsWmFp9Vfz2ZkU8np8UWYiu6QPITaA==
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr7642789wme.29.1560156136449;
        Mon, 10 Jun 2019 01:42:16 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:42:15 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
Date:   Mon, 10 Jun 2019 09:42:06 +0100
Message-Id: <20190610084213.1052-1-lee.jones@linaro.org>
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
 drivers/i2c/busses/i2c-qcom-geni.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index db075bc0d952..9e3b8a98688d 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -483,6 +484,14 @@ static const struct i2c_algorithm geni_i2c_algo = {
 	.functionality	= geni_i2c_func,
 };
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id geni_i2c_acpi_match[] = {
+	{ "QCOM0220"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
+#endif
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -502,7 +511,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(gi2c->se.base);
 
 	gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
-	if (IS_ERR(gi2c->se.clk)) {
+	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(&pdev->dev)) {
 		ret = PTR_ERR(gi2c->se.clk);
 		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
 		return ret;
@@ -516,6 +525,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	if (has_acpi_companion(&pdev->dev))
+		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
+
 	gi2c->irq = platform_get_irq(pdev, 0);
 	if (gi2c->irq < 0) {
 		dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
@@ -660,6 +672,7 @@ static struct platform_driver geni_i2c_driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
 		.of_match_table = geni_i2c_dt_match,
+		.acpi_match_table = ACPI_PTR(geni_i2c_acpi_match),
 	},
 };
 
-- 
2.17.1

