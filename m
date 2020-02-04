Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A348A152120
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 20:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgBDTb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Feb 2020 14:31:57 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34099 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbgBDTb5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Feb 2020 14:31:57 -0500
Received: by mail-pl1-f196.google.com with SMTP id j7so7694237plt.1
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 11:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0feqpjiIoHn9/Mmqog1G13Nvzq6P+/4k/jXqeGN5W4=;
        b=G3JESj+dNoN1RTcDn6NVnvw+kbOcW38OQAUJL0SPzI3QJKq+Tan5slIeUBMtnTsq2O
         Z3Css13xCcrTLB463unY2yR1kaWJhFijMvduMNUAHLjL5LnR2S7J0J+wtw4IGcBenzbD
         3F/WZE6q3n39bxrLJi2p3Avvri0iwIGtI+mC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0feqpjiIoHn9/Mmqog1G13Nvzq6P+/4k/jXqeGN5W4=;
        b=abySqQxREBHl1XrL3d7kF3ceMwOXeSGChuyg8h6Ow2NFaXBQ4u8u5R8Na+pwpouyHE
         jtQ633UoqfWxpZnXf+XCruZ32OLEspufZkLIOIPxc37Ef3NiKqd6b2KSeqx+KoW4xn6j
         EB6TomX+hMYM/DmTABPVhqxoXszBIseY74rVjCCs6egN9OeLJgH9UwFn01NOTz5JWqzI
         Rw8QwxrMjL6SJ4q7AhUnrKslWGcHra8fFovqMKdrXSbPwXXfZPH8Kq5hAJtMy0vjF9/H
         NfIZyOmLWm75d9fQLaaeu0xLiBc+q78MroxH0AY/3kkzwIB9pC0oaPaKmj5/nUMAwzff
         EHFw==
X-Gm-Message-State: APjAAAVhhG/jo6AP1FxerF+F0a3/MDZHgkAk4jKFaWELhYZbKZLoONd3
        ex7/flo+xOxrZPf8m4ovOHbaxg==
X-Google-Smtp-Source: APXvYqyUm6HojgglzaDuVY1G0FhMILDd2qS6iQYa38TUfUC+nG0OxhpbEMlDDvYGfJITKEfcR7fzvA==
X-Received: by 2002:a17:90a:c706:: with SMTP id o6mr801929pjt.82.1580844716160;
        Tue, 04 Feb 2020 11:31:56 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g18sm24956626pfi.80.2020.02.04.11.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:31:55 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] i2c: qcom-geni: Grow a dev pointer to simplify code
Date:   Tue,  4 Feb 2020 11:31:51 -0800
Message-Id: <20200204193152.124980-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204193152.124980-1-swboyd@chromium.org>
References: <20200204193152.124980-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some lines are long here. Use a struct dev pointer to shorten lines and
simplify code. The clk_get() call can fail because of EPROBE_DEFER
problems too, so just remove the error print message because it isn't
useful.

Cc: Girish Mahadevan <girishm@codeaurora.org>
Cc: Dilip Kota <dkota@codeaurora.org>
Cc: Alok Chauhan <alokc@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 51 ++++++++++++++----------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3e13b54ce3f8..192a8f622f3d 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -502,45 +502,42 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	struct resource *res;
 	u32 proto, tx_depth;
 	int ret;
+	struct device *dev = &pdev->dev;
 
-	gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
+	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
 		return -ENOMEM;
 
-	gi2c->se.dev = &pdev->dev;
-	gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
+	gi2c->se.dev = dev;
+	gi2c->se.wrapper = dev_get_drvdata(dev->parent);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
+	gi2c->se.base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-	gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
-	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(&pdev->dev)) {
+	gi2c->se.clk = devm_clk_get(dev, "se");
+	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev)) {
 		ret = PTR_ERR(gi2c->se.clk);
-		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
 		return ret;
 	}
 
-	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
-							&gi2c->clk_freq_out);
+	ret = device_property_read_u32(dev, "clock-frequency",
+				       &gi2c->clk_freq_out);
 	if (ret) {
-		dev_info(&pdev->dev,
-			"Bus frequency not specified, default to 100kHz.\n");
+		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
-	if (has_acpi_companion(&pdev->dev))
-		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
+	if (has_acpi_companion(dev))
+		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
 	gi2c->irq = platform_get_irq(pdev, 0);
-	if (gi2c->irq < 0) {
-		dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
+	if (gi2c->irq < 0)
 		return gi2c->irq;
-	}
 
 	ret = geni_i2c_clk_map_idx(gi2c);
 	if (ret) {
-		dev_err(&pdev->dev, "Invalid clk frequency %d Hz: %d\n",
+		dev_err(dev, "Invalid clk frequency %d Hz: %d\n",
 			gi2c->clk_freq_out, ret);
 		return ret;
 	}
@@ -550,28 +547,28 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
-			       dev_name(&pdev->dev), gi2c);
+			       dev_name(dev), gi2c);
 	if (ret) {
-		dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
+		dev_err(dev, "Request_irq failed:%d: err:%d\n",
 			gi2c->irq, ret);
 		return ret;
 	}
 	/* Disable the interrupt so that the system can enter low-power mode */
 	disable_irq(gi2c->irq);
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = &pdev->dev;
-	gi2c->adap.dev.of_node = pdev->dev.of_node;
+	gi2c->adap.dev.parent = dev;
+	gi2c->adap.dev.of_node = dev->of_node;
 	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
-		dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
+		dev_err(dev, "Error turning on resources %d\n", ret);
 		return ret;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
 	tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 	if (proto != GENI_SE_I2C) {
-		dev_err(&pdev->dev, "Invalid proto %d\n", proto);
+		dev_err(dev, "Invalid proto %d\n", proto);
 		geni_se_resources_off(&gi2c->se);
 		return -ENXIO;
 	}
@@ -581,11 +578,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 							true, true, true);
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
-		dev_err(&pdev->dev, "Error turning off resources %d\n", ret);
+		dev_err(dev, "Error turning off resources %d\n", ret);
 		return ret;
 	}
 
-	dev_dbg(&pdev->dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
 
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
@@ -595,12 +592,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
-		dev_err(&pdev->dev, "Error adding i2c adapter %d\n", ret);
+		dev_err(dev, "Error adding i2c adapter %d\n", ret);
 		pm_runtime_disable(gi2c->se.dev);
 		return ret;
 	}
 
-	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
+	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
 	return 0;
 }
-- 
Sent by a computer, using git, on the internet

