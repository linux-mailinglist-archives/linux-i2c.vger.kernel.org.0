Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDF063C306
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 15:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235817AbiK2OrO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 09:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbiK2OrJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 09:47:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899E95BD61
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:07 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso11002769wmo.1
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Y6JWzzFOsrLeYSsZTyrPv8RLHe0kfmzZcIB/TwxDDY=;
        b=eAsQnM94KJ79HWoIAreMPRGqA9dOjKyQx8pyf+51+eil8i43dJ3/S8S/S8NOVKV8Rk
         08Zw7b8yUwJ3hNxlqKXPMU61K1SLVC8pbDwmfihtATbmfPfvDJ+I5BFa0myWsBcNndd6
         pYBXuaNQF1N1Xz9RzRXFJmTSDvglgaB3OiQCjc4hIMx26OjnQHKr18/yy/N/zW0PA2Ix
         4sJlRarqKhvJ2UVFW56CpimYZATTL46NBcPI9C12d/FEK00AH2kpsh/O6sKADbC95UGH
         3Uj2vMebzQIJLY6bxrHebUBli5lXyt0gMBhWfjagtxKMqJHUnJLhVMZiYWr5wcmStk9N
         DuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Y6JWzzFOsrLeYSsZTyrPv8RLHe0kfmzZcIB/TwxDDY=;
        b=FASdhW7YYMPYm8fL5X1ulsV6E8zNfZ+TkdzKk6zxYSnCzK/qKnZQknqIRkpu/CJ8+6
         5RrGy/tOCl4pYWd6RcUrVr4cc4Brf4oPS7a74cV1TlfCvxU2C3CgzJdWxdcCHbN5i+kG
         5SmFkORQHYl+S7Jof0YLHzTNr0pgpmaRnmBftbvbtrhoPsTHX2BIk1pY9rPHr2AYzd/l
         6NdlxEFPFxrEJI8trxlSck57Ed3LpmG+CqA0exRYEF5X1bhprBXOk7KEpcrVovHpTkrO
         Nhyvt8sIAhUbnJGvbv6xJV32K3FC/pDBgWH5WB011gz2SDb7ra5/d61NJACvHDT8IGbH
         SJIw==
X-Gm-Message-State: ANoB5pkwbFoRHK9fQiaqSjNNz4gv5Z4yzI00Sl4cnqWz1Ihcvwsmu0WA
        hWZhkhuSdpHXssoimiQKluLewyKqFext8r+6
X-Google-Smtp-Source: AA0mqf7nQy2PdMiIw6iD/weOfSKulN/rAFkJMAOlhZuPJ0o71Zjh8EEe0qhEfQg66C0h1xT9tUBb8A==
X-Received: by 2002:a05:600c:1d81:b0:3cf:6ab3:4a60 with SMTP id p1-20020a05600c1d8100b003cf6ab34a60mr30379693wms.32.1669733225898;
        Tue, 29 Nov 2022 06:47:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13717792wro.96.2022.11.29.06.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:47:05 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 29 Nov 2022 15:47:03 +0100
Subject: [PATCH v3 3/6] soc: qcom: geni-se: add desc struct to specify clocks from
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-3-f6a20dc9996e@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

Prepare support for the I2C Master Hub variant by moving the required
clocks list to a new desc struct then passing it through the compatible
match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 69 ++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index a0ceeede450f..9ddee9fd11ba 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -81,19 +81,31 @@
  */
 
 #define MAX_CLK_PERF_LEVEL 32
-#define NUM_AHB_CLKS 2
+#define MAX_CLKS 2
 
 /**
  * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
  * @dev:		Device pointer of the QUP wrapper core
  * @base:		Base address of this instance of QUP wrapper core
- * @ahb_clks:		Handle to the primary & secondary AHB clocks
+ * @clks:		Handle to the primary & optional secondary AHB clocks
+ * @num_clks:		Count of clocks
  * @to_core:		Core ICC path
  */
 struct geni_wrapper {
 	struct device *dev;
 	void __iomem *base;
-	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
+	struct clk_bulk_data clks[MAX_CLKS];
+	unsigned int num_clks;
+};
+
+/**
+ * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
+ * @clks:		Name of the primary & optional secondary AHB clocks
+ * @num_clks:		Count of clock names
+ */
+struct geni_se_desc {
+	unsigned int num_clks;
+	const char * const *clks;
 };
 
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
@@ -496,8 +508,7 @@ static void geni_se_clks_off(struct geni_se *se)
 	struct geni_wrapper *wrapper = se->wrapper;
 
 	clk_disable_unprepare(se->clk);
-	clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
-						wrapper->ahb_clks);
+	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
 }
 
 /**
@@ -528,15 +539,13 @@ static int geni_se_clks_on(struct geni_se *se)
 	int ret;
 	struct geni_wrapper *wrapper = se->wrapper;
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(wrapper->ahb_clks),
-						wrapper->ahb_clks);
+	ret = clk_bulk_prepare_enable(wrapper->num_clks, wrapper->clks);
 	if (ret)
 		return ret;
 
 	ret = clk_prepare_enable(se->clk);
 	if (ret)
-		clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
-							wrapper->ahb_clks);
+		clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
 	return ret;
 }
 
@@ -887,11 +896,33 @@ static int geni_se_probe(struct platform_device *pdev)
 		return PTR_ERR(wrapper->base);
 
 	if (!has_acpi_companion(&pdev->dev)) {
-		wrapper->ahb_clks[0].id = "m-ahb";
-		wrapper->ahb_clks[1].id = "s-ahb";
-		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
+		const struct geni_se_desc *desc;
+		int i;
+
+		desc = device_get_match_data(&pdev->dev);
+		if (!desc)
+			return -EINVAL;
+
+		wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
+
+		for (i = 0; i < wrapper->num_clks; ++i)
+			wrapper->clks[i].id = desc->clks[i];
+
+		ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
+		if (ret < 0) {
+			dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
+			return ret;
+		}
+
+		if (ret < wrapper->num_clks) {
+			dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
+				dev->of_node, wrapper->num_clks);
+			return -EINVAL;
+		}
+
+		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
 		if (ret) {
-			dev_err(dev, "Err getting AHB clks %d\n", ret);
+			dev_err(dev, "Err getting clks %d\n", ret);
 			return ret;
 		}
 	}
@@ -901,8 +932,18 @@ static int geni_se_probe(struct platform_device *pdev)
 	return devm_of_platform_populate(dev);
 }
 
+static const char * const qup_clks[] = {
+	"m-ahb",
+	"s-ahb",
+};
+
+static const struct geni_se_desc qup_desc = {
+	.clks = qup_clks,
+	.num_clks = ARRAY_SIZE(qup_clks),
+};
+
 static const struct of_device_id geni_se_dt_match[] = {
-	{ .compatible = "qcom,geni-se-qup", },
+	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_se_dt_match);

-- 
b4 0.10.1
