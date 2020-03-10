Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86F3B180222
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 16:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgCJPoE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 11:44:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46290 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgCJPoD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 11:44:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id c19so4356412pfo.13
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YQMgw4onS7FYvZF2VW45lULLnLK0rhd5KenGX8WSLvA=;
        b=Sb1E2FOijH4BfyCkzZ0RZwS9hRXkjddNhse0zTcVjxOaCtN32kstTVDR2jHw6lqbDC
         f8dNQ+pRyE6HzzjnXWqHZzQV+Gx4NpAYxzeFD1K+nHJCcZwMIML7ErZeZED6UTFkiqPK
         xH+Zx6c5n7KOR9BMVl1j85HBOPzEy3ukp68do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQMgw4onS7FYvZF2VW45lULLnLK0rhd5KenGX8WSLvA=;
        b=IXp8T03r2XPJkogE9RX0IAoWNCSBi6Qjy6UXj3MsdwYtb2JsbqhsA1Rn7t2+x1SN3m
         extf9fy4EVLS2txSyogz+vl3H7VvtufFKhtxVtyrwfFHm6bemIOCpGQAlEPsjOhA8w1+
         B4YoYwgC7r9rGy//UdxkF/TDEsZ2jcY2aW95DFfbxaDUN1FIME++z9G0vzUU9MMMxocf
         9oUbe+D0PQMl2U9AdanyVvv28XfXQH5VKLntcg8PRS9BJf62vcy/FZSqGcLyq+BkgssQ
         KvBEJ7okye/iutjDHJ6e64EpaAwYNgpI0WQA3cGAfahfo6c9VFG4pOM6+lKPYUiSpY//
         NX3w==
X-Gm-Message-State: ANhLgQ1tzsgfUb5HbMuEC0mME8CZzGW5qlGcpfsrD5H96B0ZjrdR1EDP
        BBJmn3ZgeZNxH0pvbpWzYYR5rw==
X-Google-Smtp-Source: ADFU+vs3d2zziy6CeMLfcQUBmesbL7I7gSQFrOsUzbom/pkMx3RujdMdaYjkE7i+o2qlykL8vNGK3w==
X-Received: by 2002:a62:3854:: with SMTP id f81mr12979360pfa.81.1583855042280;
        Tue, 10 Mar 2020 08:44:02 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m12sm2731090pjk.20.2020.03.10.08.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:44:01 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 2/3] i2c: qcom-geni: Grow a dev pointer to simplify code
Date:   Tue, 10 Mar 2020 08:43:57 -0700
Message-Id: <20200310154358.39367-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200310154358.39367-1-swboyd@chromium.org>
References: <20200310154358.39367-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some lines are long here. Use a struct dev pointer to shorten lines and
simplify code. The clk_get() call can fail because of EPROBE_DEFER
problems too, so just remove the error print message because it isn't
useful. Finally, platform_get_irq() already prints an error so just
remove that error message.

Cc: Alok Chauhan <alokc@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 57 ++++++++++++++----------------
 1 file changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 4efca130035a..2f5fb2e83f95 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -502,45 +502,40 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
-		ret = PTR_ERR(gi2c->se.clk);
-		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
-		return ret;
-	}
+	gi2c->se.clk = devm_clk_get(dev, "se");
+	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
+		return PTR_ERR(gi2c->se.clk);
 
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
@@ -549,29 +544,29 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq, 0,
-			       dev_name(&pdev->dev), gi2c);
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
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
@@ -581,11 +576,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
@@ -595,12 +590,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
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

