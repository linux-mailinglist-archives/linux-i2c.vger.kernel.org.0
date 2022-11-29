Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7854863C309
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 15:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbiK2OrP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 09:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbiK2OrK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 09:47:10 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EECA58BE5
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:08 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m19so1936153wms.5
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 06:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8Au/1u0YFc5wyAQ+jpg2qjjEheMb69WJesiWy0RQrA=;
        b=sqVV6mE5EDGMLCdQ0r2xOMxQYA/ZiB+py+Zu5HitjrgvKRSlD/3xogpgtlk9Fi7De2
         MBruJUji9QX7cgkXHXg9So8hpIeosiveFPMLJMUa0gMlGfS1I49ad803GetMB8lzcoSM
         Er/O6qdjw9lI7kzs4B7kd5MyU8j8bcgvTzZHym5B1CDpo7Kra3u1NMk4ybOnAKWMpxmE
         7g2vBpH1vX8GmKG5w5Fsed3Tp2mgZ9oSiIQ/P/h5o/RT7GSkolSX7TiLbOQl7JkXVH+A
         DlYGqNKc/Rbq8XXaMR8zz4YvicNjRlzmqS/MQboUBZ41TOAK6ZYV92GWFqpRJAALJmCM
         k+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8Au/1u0YFc5wyAQ+jpg2qjjEheMb69WJesiWy0RQrA=;
        b=aQc0/oZbcYAT+iROZLeVTxOpW9l2ig9I5y/kEPV7J5fvCUYUpTykPBHLxI5MhfsiDa
         uOOtawY/2eb6ikVnyaGwuYkLaEtluPqehIsuj7yiDH8YZn9s/J8kZRF4+6ksankGRTC1
         Pe7P5TD/SqJ88ieZeJc58BY6c9YRL5rin1pVCTxzPPbpyy2GcbA8qUY3R86U55X7m5PE
         PS6N13xdtcFCMF46WloLHOXZL2Qb3uXBjKSTpjJGB16lNBr3WpIfl5ot9P0KRFxzZDaH
         fSdCUl6fNoSkLsi5ArAs0xBdr5HBJi8GOfkuFq6JY2Rdeg2PvCvAObcPpLaJLcYLnyDN
         pvnQ==
X-Gm-Message-State: ANoB5plaYim/gZx3mYF9luq6yUHFsNMvVvKmwTU6gtdvJmsgMKvGES0a
        yhlZp+NjsrF2KIsFKKua76Qc925S4jnvqAdI
X-Google-Smtp-Source: AA0mqf7s4DMmTBdo0+HD1SGfzOoK0yl8tS4opOjcQMyXT3Q9m6LbsxEH2hD7kcHPEEdWGlSwnuO6Zw==
X-Received: by 2002:a05:600c:4e47:b0:3cf:5657:4717 with SMTP id e7-20020a05600c4e4700b003cf56574717mr45112311wmq.87.1669733227577;
        Tue, 29 Nov 2022 06:47:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13717792wro.96.2022.11.29.06.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:47:07 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 29 Nov 2022 15:47:05 +0100
Subject: [PATCH v3 5/6] i2c: qcom-geni: add desc struct to prepare support for I2C
 Master Hub variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-5-f6a20dc9996e@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

Those I2C serial engines variants have some requirements:
- a separate "core" clock
- doesn't support DMA, thus no memory interconnect path
- fixed FIFO size not discoverable in the HW_PARAM_0 register

Add a desc struct specifying all those requirements which will be used in
a next change when adding the I2C Master Hub serial engine compatible.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 50 +++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 84a77512614d..75dd0718c5a1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -88,6 +88,7 @@ struct geni_i2c_dev {
 	int cur_wr;
 	int cur_rd;
 	spinlock_t lock;
+	struct clk *core_clk;
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	int suspended;
@@ -100,6 +101,13 @@ struct geni_i2c_dev {
 	bool abort_done;
 };
 
+struct geni_i2c_desc {
+	bool has_core_clk;
+	char *icc_ddr;
+	bool no_dma_support;
+	unsigned int tx_fifo_depth;
+};
+
 struct geni_i2c_err_log {
 	int err;
 	const char *msg;
@@ -764,6 +772,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
+	const struct geni_i2c_desc *desc = NULL;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -776,6 +785,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
+	desc = device_get_match_data(&pdev->dev);
+
+	if (desc && desc->has_core_clk) {
+		gi2c->core_clk = devm_clk_get(dev, "core");
+		if (IS_ERR(gi2c->core_clk))
+			return PTR_ERR(gi2c->core_clk);
+	}
+
 	gi2c->se.clk = devm_clk_get(dev, "se");
 	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
 		return PTR_ERR(gi2c->se.clk);
@@ -819,7 +836,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
-	ret = geni_icc_get(&gi2c->se, "qup-memory");
+	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
 	if (ret)
 		return ret;
 	/*
@@ -829,12 +846,17 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	 */
 	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
 	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-	gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
+	if (!desc || desc->icc_ddr)
+		gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
 
 	ret = geni_icc_set_bw(&gi2c->se);
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(gi2c->core_clk);
+	if (ret)
+		return ret;
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning on resources %d\n", ret);
@@ -844,10 +866,15 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (proto != GENI_SE_I2C) {
 		dev_err(dev, "Invalid proto %d\n", proto);
 		geni_se_resources_off(&gi2c->se);
+		clk_disable_unprepare(gi2c->core_clk);
 		return -ENXIO;
 	}
 
-	fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	if (desc && desc->no_dma_support)
+		fifo_disable = false;
+	else
+		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+
 	if (fifo_disable) {
 		/* FIFO is disabled, so we can only use GPI DMA */
 		gi2c->gpi_mode = true;
@@ -859,6 +886,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	} else {
 		gi2c->gpi_mode = false;
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+
+		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
+		if (!tx_depth && desc)
+			tx_depth = desc->tx_fifo_depth;
+
+		if (!tx_depth) {
+			dev_err(dev, "Invalid TX FIFO depth\n");
+			return -EINVAL;
+		}
+
 		gi2c->tx_wm = tx_depth - 1;
 		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
 		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
@@ -867,6 +904,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
 	}
 
+	clk_disable_unprepare(gi2c->core_clk);
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning off resources %d\n", ret);
@@ -932,6 +970,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		gi2c->suspended = 1;
 	}
 
+	clk_disable_unprepare(gi2c->core_clk);
+
 	return geni_icc_disable(&gi2c->se);
 }
 
@@ -944,6 +984,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(gi2c->core_clk);
+	if (ret)
+		return ret;
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret)
 		return ret;

-- 
b4 0.10.1
