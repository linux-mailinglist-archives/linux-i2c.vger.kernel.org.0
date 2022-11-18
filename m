Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D3462EFEC
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 09:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235187AbiKRIpj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 03:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241609AbiKRIpW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 03:45:22 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8595942D0
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:12 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j15so7516802wrq.3
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 00:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuLuAC3NrQpbK2+5jslVHChdL7XH+Vu6DE07wqFfDkg=;
        b=hJvwJEBaT5ADDuoRy8Z+xh66Nz3wsxDA5IPXT0SeocxKDV0oBgQrshHmWF+ju8Eo/t
         fghE5mGFN1gJjE+aLJXIvpWH+pfPBNLRgCYH5VS4ft890UYEt5qTIkXbnO7LsbO/4AXs
         kiuiNWKfobK5YOS8Sntu9IfuPJD8Ji+5SHj5vK5eCt3UzD4yexJEqdlTXpXRxz2y3FPM
         n1W+Js9N6DIt/tb8i72T1qnfOa7qcXpxHyMIlHKs19TddmufKLZceKdkByEOzZ/a5A3n
         D8VEiPoyMcr+nQG8y141gYrtlgc2YiHqvA7nibn0Pnqf6x5Thhgc6XHwB3L6qXmINQBW
         +i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuLuAC3NrQpbK2+5jslVHChdL7XH+Vu6DE07wqFfDkg=;
        b=4DOPSEpCB8LBo1c+GYp0Q3u4GSP4EXSUMve9prVmsfslZbOBU6jYiHsFd+GP+fWAdP
         /Pu67yhkXzu14lRY+45s4rCHeAf/3gs1NKvuLOHpKXBvj5x8xQ9w8hqiTtOzUeiL5ytS
         ifm0RUYoVfQTxhrxt2B+T212SzbD3ElyKkEYgyKq6kxPXEkEqX/3VDZ8+tunFehUdWXR
         t37op14LGcSobZeFEm2TBLKAanWrZ9/bRw5plIVwgQBJ+rklWJIAEBsRsJVoV25KUEkY
         Tqfzy5i7W7oMLiJjSOjToqIFiTTjuq/+b0aND9yLY2/2JeE6c2rcqHyNLztizBMah5f0
         hqyA==
X-Gm-Message-State: ANoB5pkKx/25gtuMrNEB9qCz7ZW50b8PBSMBApcNFQ1FXXkGxqCxcNCc
        ywE3IrStF62XVUHwvoh/UoNMgw==
X-Google-Smtp-Source: AA0mqf6spg6w/HXycPDqUbqL9+260sv3/7cncHBFilrQ6109VMs8QHJmWFd5IS1Ir0z8/ogGanlaQg==
X-Received: by 2002:adf:e0c6:0:b0:22a:34a4:8831 with SMTP id m6-20020adfe0c6000000b0022a34a48831mr3634242wri.199.1668761111025;
        Fri, 18 Nov 2022 00:45:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm2960284wrt.35.2022.11.18.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:45:10 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 09:45:07 +0100
Subject: [PATCH v2 3/6] soc: qcom: geni-se: add desc struct to specify clocks from
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-3-aadaa6997b28@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org
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
 drivers/soc/qcom/qcom-geni-se.c | 59 +++++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index a0ceeede450f..ced2a2932eda 100644
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
 
@@ -887,11 +896,23 @@ static int geni_se_probe(struct platform_device *pdev)
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
+		if (wrapper->num_clks < desc->num_clks)
+			dev_warn(dev, "too much clocks described in DT\n");
+
+		for (i = 0; i < wrapper->num_clks; ++i)
+			wrapper->clks[i].id = desc->clks[i];
+
+		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
 		if (ret) {
-			dev_err(dev, "Err getting AHB clks %d\n", ret);
+			dev_err(dev, "Err getting clks %d\n", ret);
 			return ret;
 		}
 	}
@@ -901,8 +922,18 @@ static int geni_se_probe(struct platform_device *pdev)
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
