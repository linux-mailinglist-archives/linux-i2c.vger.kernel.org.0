Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3347462B9A9
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238822AbiKPKog (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbiKPKoR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:44:17 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60A2303D7
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:32:21 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d6so28771043lfs.10
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwyFNRAInk1h3zxkgK4Dc60SMg4RqLO5fb7HB19VPtE=;
        b=ebZbo8SQRAPuhwbxLNIQ6piRqZch36b7WNtc3x1W+MxqJ5HVkIFyFBFWjCUBxFpic+
         ffriLhqbEHBRa9ML8yarZnUokg8mwEWf5pHmOdHUf3exbcjqxLUdChLHSdCptnbw4gcV
         dbYT6XfDqgdxcWC9UH+jG6WR729lvkWnlxEfHigO8sH8LbJAzffJRSIMIcjbdnqPlsJY
         HwzbfpT2o3B9nNxOfbe8HJaTtLJu04FNDEETsPpzSgun2n3DlMSBgT19pAmtn+ScmIv1
         qV68UPhXnw5sVFnHx5gmG9t5WZ4Y6asyucdeY8/InMaLcHNznhlh+gqLEYoNrDUZgiQm
         PPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dwyFNRAInk1h3zxkgK4Dc60SMg4RqLO5fb7HB19VPtE=;
        b=GfCSHlSxlivl9LVDyMNgr4hawnpZHgrpbOc/jkgQ26tw84NpLX0iukN7uFHAZNJJqE
         JXX9+OyQx6h4jxtx3BDlQxRrWgkipbsk1U4vXb89Tm+5JGFdMgfWJ+sPddFjwV5o9ycJ
         BJlxtKHEjDFwLvwIucuLglNhcev9NlMdLiEpvqvj8j8re3+1VyZgvMlY9yzY2YtEZr0C
         LfaDK4l6dBWHAVgTsoliCLl5BnuSWfzvBqYT+4Y9hg/bOe+qhSCeoxnU7/vSxtZyhcq8
         qo/QwyZh+C2WaNojoVcTcv62H6K7Y/KsqcPak2+f63s/eoyOZRJzF7dJ14ujCLJmUh0z
         bzqw==
X-Gm-Message-State: ANoB5plsg+ICvn1PmodTQg2YWrKSk95icpBzbEMgWPgaPzUi4WaWvpm6
        0rvPn+zRwEAmE6VOCYotMOTS1g==
X-Google-Smtp-Source: AA0mqf5zvd0sPp5LyUgO6mZgz0dknxQva+j/b73SXL8qNuhm3qkQdfP9dPCZctLTXkIy3xVBKTxs9w==
X-Received: by 2002:a05:6512:3b21:b0:4af:b846:2687 with SMTP id f33-20020a0565123b2100b004afb8462687mr6588194lfv.685.1668594740117;
        Wed, 16 Nov 2022 02:32:20 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k2-20020a2ea262000000b0026dcf81d804sm2940763ljm.31.2022.11.16.02.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:32:19 -0800 (PST)
Message-ID: <16d6c50b-f7da-a2b3-0b95-726b843e50c0@linaro.org>
Date:   Wed, 16 Nov 2022 11:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 3/6] soc: qcom: geni-se: add desc struct to specify clocks
 from device match data
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-3-64449106a148@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-3-64449106a148@linaro.org>
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
> This prepares support for the I2C Master Hub variant, by moving
> the required clocks list to a new desc struct then passing it through the
> compatible match data.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/soc/qcom/qcom-geni-se.c | 57 +++++++++++++++++++++++++++++++----------
>   1 file changed, 43 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index a0ceeede450f..f4f54d92a01a 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -81,19 +81,31 @@
>    */
>   
>   #define MAX_CLK_PERF_LEVEL 32
> -#define NUM_AHB_CLKS 2
> +#define MAX_CLKS 2
>   
>   /**
>    * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
>    * @dev:		Device pointer of the QUP wrapper core
>    * @base:		Base address of this instance of QUP wrapper core
> - * @ahb_clks:		Handle to the primary & secondary AHB clocks
> + * @clks:		Handle to the primary & optional secondary AHB clocks
> + * @num_clks:		Count of clocks
>    * @to_core:		Core ICC path
>    */
>   struct geni_wrapper {
>   	struct device *dev;
>   	void __iomem *base;
> -	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
> +	struct clk_bulk_data clks[MAX_CLKS];
> +	unsigned int num_clks;
> +};
> +
> +/**
> + * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
> + * @clks:		Name of the primary & optional secondary AHB clocks
> + * @num_clks:		Count of clock names
> + */
> +struct geni_se_desc {
> +	unsigned int num_clks;
> +	const char * const *clks;
>   };
>   
>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
> @@ -496,8 +508,7 @@ static void geni_se_clks_off(struct geni_se *se)
>   	struct geni_wrapper *wrapper = se->wrapper;
>   
>   	clk_disable_unprepare(se->clk);
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
> -						wrapper->ahb_clks);
> +	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>   }
>   
>   /**
> @@ -528,15 +539,13 @@ static int geni_se_clks_on(struct geni_se *se)
>   	int ret;
>   	struct geni_wrapper *wrapper = se->wrapper;
>   
> -	ret = clk_bulk_prepare_enable(ARRAY_SIZE(wrapper->ahb_clks),
> -						wrapper->ahb_clks);
> +	ret = clk_bulk_prepare_enable(wrapper->num_clks, wrapper->clks);
>   	if (ret)
>   		return ret;
>   
>   	ret = clk_prepare_enable(se->clk);
>   	if (ret)
> -		clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
> -							wrapper->ahb_clks);
> +		clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>   	return ret;
>   }
>   
> @@ -887,11 +896,21 @@ static int geni_se_probe(struct platform_device *pdev)
>   		return PTR_ERR(wrapper->base);
>   
>   	if (!has_acpi_companion(&pdev->dev)) {
> -		wrapper->ahb_clks[0].id = "m-ahb";
> -		wrapper->ahb_clks[1].id = "s-ahb";
> -		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> +		const struct geni_se_desc *desc;
> +		int i;
> +
> +		desc = device_get_match_data(&pdev->dev);
> +		if (!desc)
> +			return -EINVAL;
> +
> +		wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
Maybe a warning would be suitable if num mismatch happens?

Other than that,
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Konrad
> +
> +		for (i = 0; i < wrapper->num_clks; ++i)
> +			wrapper->clks[i].id = desc->clks[i];
> +
> +		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
>   		if (ret) {
> -			dev_err(dev, "Err getting AHB clks %d\n", ret);
> +			dev_err(dev, "Err getting clks %d\n", ret);
>   			return ret;
>   		}
>   	}
> @@ -901,8 +920,18 @@ static int geni_se_probe(struct platform_device *pdev)
>   	return devm_of_platform_populate(dev);
>   }
>   
> +static const char * const qup_clks[] = {
> +	"m-ahb",
> +	"s-ahb",
> +};
> +
> +static const struct geni_se_desc qup_desc = {
> +	.clks = qup_clks,
> +	.num_clks = ARRAY_SIZE(qup_clks),
> +};
> +
>   static const struct of_device_id geni_se_dt_match[] = {
> -	{ .compatible = "qcom,geni-se-qup", },
> +	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, geni_se_dt_match);
> 
