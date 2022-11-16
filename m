Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D3B62BA01
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238790AbiKPKtq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbiKPKtW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:49:22 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BC12CDE1
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:38:13 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s8so11683107lfc.8
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqCc/GOgSVJZ5AurbG5SzvEMTnpnV++hf1m1Zs8crF4=;
        b=wrwFH1SyiJKUYiqgDrci0/DfqgYLKXKWCtZuFhUGdVy5Wpz52Gq0+3AjBV2Lgf44Gl
         uao7HjQbNLdEFFb1wBUxrWJt2SLwWuSE0NJdHcNZ4l0EsiGMx1Lqneme/HZB98+ObvSE
         xdAzSVB1AIH9y2bTYjOrlh111umaQafeuNat9J2A/Rzpq5ILaxx8ki4YASlq5OeNp2Du
         8TW8hFDJWxnxglhkMr39HA4SEhSF5ENPur0dyQGVJw+cGYhrZZixRAsQT3CwAz0ODRYi
         Esg/tJQZ7PjGlIKeqhXMTL/1GbnLY+fOygQpJBODZWqbDlxumTO/GHPQjCGAyYqkJXgx
         u7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LqCc/GOgSVJZ5AurbG5SzvEMTnpnV++hf1m1Zs8crF4=;
        b=iE18GdSZG+AsMCSigwLR+tBgX7zXzzg1GIBy0HRJKjhsDfG9X9x0jLckil6wnPJ/Ux
         GvV4Ceam98XgqO4P9YAk4Sg5Z9ByVpvHSLE30kNOXpgrf6aFVa2eBVt9pOfI2RHpZjIE
         NM1EK4qhQnZJT7EcNAiD7aedX/A6tWzJnPapEiQR3boiM9tHI2wxPoTgcYLPKPRGgUA2
         4gYYGHeiN3qJwoTXFEDB2B9lyarCsqJtMSnI0AhOn91Zb/Xo50Cvq5nt0uMfTu5R41NE
         3pvmEIWRsGu7bnJ0h5nkmab8Mzh/xNCE5yjcul02/cEj6gfKO7BN3xSdmD2HWZlAPVeG
         3TYw==
X-Gm-Message-State: ANoB5plqz1iJUCLPKJ0w4Epcd8pjpV/G+gEqYu/EZXjyjjOkw4gCue+d
        ZU7ApaMdkNqaIVkIpj1o3ngxNA==
X-Google-Smtp-Source: AA0mqf7v4ql1my2L29OuYX6RCZqNvFLQrc4yTzeJ9zjilyuGHO0KOUdc0oA5P2JzUFg65NIsJ0GoYw==
X-Received: by 2002:a05:6512:2a87:b0:4ac:5faa:654d with SMTP id dt7-20020a0565122a8700b004ac5faa654dmr6412409lfb.684.1668595091820;
        Wed, 16 Nov 2022 02:38:11 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id t12-20020a2e8e6c000000b0027755f52a94sm2938078ljk.80.2022.11.16.02.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:38:11 -0800 (PST)
Message-ID: <56d54377-aa0d-8e2f-cf8e-5b3a3a414534@linaro.org>
Date:   Wed, 16 Nov 2022 11:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 5/6] i2c: qcom-geni: add desc struct to prepare support
 for I2C Master Hub variant
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-5-64449106a148@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-5-64449106a148@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 16/11/2022 11:21, Neil Armstrong wrote:
> The I2C Master Hub is a stripped down version of the GENI Serial Engine
> QUP Wrapper Controller but only supporting I2C serial engines without
> DMA support.
> 
> Those I2C serial engines variants have some requirements:
> - a separate "core" clock
> - doesn't support DMA, thus no memory interconnect path
> - fixed FIFO size not discoverable in the HW_PARAM_0 register
> 
> This adds a desc struct specifying all those requirements which
> will be used in a next change when adding the I2C Master Hub
> serial engine compatible.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/i2c/busses/i2c-qcom-geni.c | 50 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 84a77512614d..75dd0718c5a1 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -88,6 +88,7 @@ struct geni_i2c_dev {
>   	int cur_wr;
>   	int cur_rd;
>   	spinlock_t lock;
> +	struct clk *core_clk;
>   	u32 clk_freq_out;
>   	const struct geni_i2c_clk_fld *clk_fld;
>   	int suspended;
> @@ -100,6 +101,13 @@ struct geni_i2c_dev {
>   	bool abort_done;
>   };
>   
> +struct geni_i2c_desc {
> +	bool has_core_clk;
> +	char *icc_ddr;
> +	bool no_dma_support;
> +	unsigned int tx_fifo_depth;
> +};
> +
>   struct geni_i2c_err_log {
>   	int err;
>   	const char *msg;
> @@ -764,6 +772,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	u32 proto, tx_depth, fifo_disable;
>   	int ret;
>   	struct device *dev = &pdev->dev;
> +	const struct geni_i2c_desc *desc = NULL;
>   
>   	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
>   	if (!gi2c)
> @@ -776,6 +785,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(gi2c->se.base))
>   		return PTR_ERR(gi2c->se.base);
>   
> +	desc = device_get_match_data(&pdev->dev);
> +
> +	if (desc && desc->has_core_clk) {
> +		gi2c->core_clk = devm_clk_get(dev, "core");
> +		if (IS_ERR(gi2c->core_clk))
> +			return PTR_ERR(gi2c->core_clk);
> +	}
> +
>   	gi2c->se.clk = devm_clk_get(dev, "se");
>   	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
>   		return PTR_ERR(gi2c->se.clk);
> @@ -819,7 +836,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	gi2c->adap.dev.of_node = dev->of_node;
>   	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>   
> -	ret = geni_icc_get(&gi2c->se, "qup-memory");
> +	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
>   	if (ret)
>   		return ret;
>   	/*
> @@ -829,12 +846,17 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	 */
>   	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>   	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
> -	gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
> +	if (!desc || desc->icc_ddr)
> +		gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
>   
>   	ret = geni_icc_set_bw(&gi2c->se);
>   	if (ret)
>   		return ret;
>   
> +	ret = clk_prepare_enable(gi2c->core_clk);
> +	if (ret)
> +		return ret;
> +
>   	ret = geni_se_resources_on(&gi2c->se);
>   	if (ret) {
>   		dev_err(dev, "Error turning on resources %d\n", ret);
> @@ -844,10 +866,15 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	if (proto != GENI_SE_I2C) {
>   		dev_err(dev, "Invalid proto %d\n", proto);
>   		geni_se_resources_off(&gi2c->se);
> +		clk_disable_unprepare(gi2c->core_clk);
>   		return -ENXIO;
>   	}
>   
> -	fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> +	if (desc && desc->no_dma_support)
> +		fifo_disable = false;
> +	else
> +		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> +
>   	if (fifo_disable) {
>   		/* FIFO is disabled, so we can only use GPI DMA */
>   		gi2c->gpi_mode = true;
> @@ -859,6 +886,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	} else {
>   		gi2c->gpi_mode = false;
>   		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
> +
> +		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
> +		if (!tx_depth && desc)
> +			tx_depth = desc->tx_fifo_depth;
> +
> +		if (!tx_depth) {
> +			dev_err(dev, "Invalid TX FIFO depth\n");
> +			return -EINVAL;
> +		}
> +
>   		gi2c->tx_wm = tx_depth - 1;
>   		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
>   		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
> @@ -867,6 +904,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>   	}
>   
> +	clk_disable_unprepare(gi2c->core_clk);
>   	ret = geni_se_resources_off(&gi2c->se);
>   	if (ret) {
>   		dev_err(dev, "Error turning off resources %d\n", ret);
> @@ -932,6 +970,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>   		gi2c->suspended = 1;
>   	}
>   
> +	clk_disable_unprepare(gi2c->core_clk);
> +
>   	return geni_icc_disable(&gi2c->se);
>   }
>   
> @@ -944,6 +984,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> +	ret = clk_prepare_enable(gi2c->core_clk);
> +	if (ret)
> +		return ret;
> +
>   	ret = geni_se_resources_on(&gi2c->se);
>   	if (ret)
>   		return ret;
> 
