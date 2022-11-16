Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9B762B7CA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbiKPKWP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237364AbiKPKVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:21:54 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1EA2253B
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:53 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v1so29092442wrt.11
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhLipikR7108xt+mQGUUpQ8DfphnyPitqRKsqUFWNfk=;
        b=uzGLOFK7HLGuw5ikgGebxyMvFO/YG/0WPs2EZK7lQL9wOc+ovH2QiL5jyClmZDb++I
         TgLk9JewfYlZ/tM/I95VAvNpDv96sWTM/cY2ien470qNK+LusJG39CWx7+4JTu3oC5LA
         d/mcWzx5lhj+coxrVaUMCsjoOor4VX3d5xBRYPj136r65+oAEsXRnznn9Kwg53YgMxmX
         QKAime4lKE6UtHKOD1dnZZI6mgJ44YCn4BZS9Q4MmnBhg09XTl/sV/8qKkJ3sflK8jHA
         rm5grcfNAuPXIv3yeGhb8d0r0+GbB0tre0Q5bXNmWygQsSHHkUqG3NM/jDyMd6Z92dCx
         usiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhLipikR7108xt+mQGUUpQ8DfphnyPitqRKsqUFWNfk=;
        b=YM3eb6p4ebvrgy3rlD62J4MdqnyVxjKekr+mwJpfPbkEhY+27gaDtnlTm9swwjh854
         8jQntjoK+DLXEYfE7jmzhvlOjIDZ02JEtjbce1jADb9F1gm0hOakSCdNaT083NMPMOKY
         NRB8kvzvhWlCq6ztC4PdDXmhzBWWWMKAoO0qB6V4tZ+FZk7MOjP/aNdtSnbElvnJDQfb
         GlM8seYH/VRzhA/wdx3heMQXUcNuQ4YxNh6ZvqXuULUWv+vmC08u3GXwEafdrf6bZmua
         BVQ+6JOxjFIEDg5i7U0aCT2YqdMB0TalWnU1u5cIX+aqaZt/l8eHIsdb9r7wacpubBL5
         Y2zQ==
X-Gm-Message-State: ANoB5ply383l5FPUslZ7FUVijbJMZMVc8M7+xjPXbDvd8SdXARryWnbd
        71khteJT2vqilSo3vT+iTUojMg==
X-Google-Smtp-Source: AA0mqf6q94C59AQmoLyhgHlUnaZXMBa0QgFqdLxiqIcqlI+DAHVwL9HaiMGcAaNAwXm5105TBddUWQ==
X-Received: by 2002:adf:e2d1:0:b0:236:8638:121a with SMTP id d17-20020adfe2d1000000b002368638121amr12635622wrj.188.1668594111621;
        Wed, 16 Nov 2022 02:21:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:51 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:50 +0100
Subject: [PATCH 3/6] soc: qcom: geni-se: add desc struct to specify clocks from
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-3-64449106a148@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
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

This prepares support for the I2C Master Hub variant, by moving
the required clocks list to a new desc struct then passing it through the
compatible match data.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 57 +++++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index a0ceeede450f..f4f54d92a01a 100644
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
 
@@ -887,11 +896,21 @@ static int geni_se_probe(struct platform_device *pdev)
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
+		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
 		if (ret) {
-			dev_err(dev, "Err getting AHB clks %d\n", ret);
+			dev_err(dev, "Err getting clks %d\n", ret);
 			return ret;
 		}
 	}
@@ -901,8 +920,18 @@ static int geni_se_probe(struct platform_device *pdev)
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
