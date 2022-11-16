Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1434B62B7D0
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237441AbiKPKWS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:22:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237884AbiKPKV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:21:57 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E9822538
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:54 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l14so29131496wrw.2
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkbrSGkXjUoGGQbQrtygV/yUrGDEgUuitud5fT9j05k=;
        b=QaEt+UMqmob1rJTuN+76JXEU2jZFvVKHks7j75gSzRAnkaZZRJe5Obt7dzyweq5QoH
         nRJVJOYjoON0J6xJWPs0WXnK5Khfj1RbhQdGHn/Ua5LO5mbHFCSnuW6RxrfWQq8zMJzL
         aw8cB/HWvyBLY90pbw2sLWqIBpTGUHXnbh2mgxl0B4VqC4HPQHH0RzjSmYt1SmyL0cZq
         BT2otJ4g7ty4ROgr0sDBT0AcLrmBPtqa8rKN2bnou18ymluuUji/KlRSau015i7QKzn4
         pFC9wfeUHmdmCvm2emBKpfEpVDhgbvmnXlh1U3FJm2vvQe5MrU9hsomK/q6nleA7YLf+
         xb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkbrSGkXjUoGGQbQrtygV/yUrGDEgUuitud5fT9j05k=;
        b=m7TxFHrzZxzA/Pc5vYQjewvdhRjILLkwp9IzwijA5YlasikbX2kaFzGnr7kt/9GBEc
         hzLgQ+ckwn6iRF/FsEJQ3A+o+Iucafzkb+YhlkHbR8MoZbktAzHskM0499vuNoKfMNyJ
         CQrDLSCN4+HamupVFPltX84KyepfPZjTVrjgQuHT2Dv/2povSF1ExKnLtqDady9IPVBd
         BzmecsoIVGXrr6WPgxfqWWw4DFl758th7OQ7bRyTAn9RssafVXnDO6jVxUv0UuOPySFP
         cbzY9XN0KypbpqaU8tk2pTUBtnSvtMyDu3BgNwi6+pOKgrc6TaIsljKlvDk2+p8hhHrD
         sbsg==
X-Gm-Message-State: ANoB5pm1BsN4ZYtHlLvYfTqgsbacpB4ed6AzlisiVVBSh/R3H8DdGvJt
        LDeAOlRqqWvBdDt409WVlxN0rw==
X-Google-Smtp-Source: AA0mqf5hvaPeFF0ydiYLErgiprfapPzYftQ29dqm8m89+2NXa8J5UEtFnpabWVvlzVfbOFRshECG3g==
X-Received: by 2002:a5d:5603:0:b0:22e:2ecc:663d with SMTP id l3-20020a5d5603000000b0022e2ecc663dmr14077458wrv.633.1668594113310;
        Wed, 16 Nov 2022 02:21:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:52 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:52 +0100
Subject: [PATCH 5/6] i2c: qcom-geni: add desc struct to prepare support for I2C
 Master Hub variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-5-64449106a148@linaro.org>
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

Those I2C serial engines variants have some requirements:
- a separate "core" clock
- doesn't support DMA, thus no memory interconnect path
- fixed FIFO size not discoverable in the HW_PARAM_0 register

This adds a desc struct specifying all those requirements which
will be used in a next change when adding the I2C Master Hub
serial engine compatible.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
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
