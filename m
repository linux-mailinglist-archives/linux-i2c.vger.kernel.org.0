Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7817F62F07D
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 10:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241715AbiKRJGe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 04:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241707AbiKRJGd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 04:06:33 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2537A351
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 01:06:30 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id r12so7226563lfp.1
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 01:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5LvHXOq/S5ojYSJ40UtUFDgw1gowSS1LOpknOhOd8s=;
        b=zPZVWs55Nxluk17EmfoGgWYT6EFzaJI+8ocmQDKmhGmP44xJ4XuBTI6Rqd/yo5bW/m
         NpQ/199dGE9J2/qABCw2epv+ULw8mOd0nFdB5R5C7Uve6E+JOz6CHLGCr7xWcOan/NZ7
         Jdw2Sg8hOiYHdAwT2Bsu+3rWlGrq/+a4+/yoFEf1y7vQvWx5BCg3X//d5Hg5BFSV0/vd
         4bpJgMkRRUaLnuuQiuYcj02nzozfAc9dRWvM3rgH9BlCJAxFwCDb1bbHX/eAAjJR8CIv
         51ynbDjy2yqWcgN48rIejWHEMinMmtkwRfFoYw3Lm/ENcZMYZV6hAHQsQTCvXghxW90K
         bSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5LvHXOq/S5ojYSJ40UtUFDgw1gowSS1LOpknOhOd8s=;
        b=PjyHO4lEArAEuWlfOOZuyBUyx7DjZxbFRDqzo1hGVIW6IJv47+nnvEv+BgWiN+qLwz
         TgdNUQKatJx76aDL98Y/Xv0DeWiV70iI0/OKhvQe2IukEpFdWtmN9t23O6XvB7IW9Opb
         h9plSc9dzQcKqV6Tyc/fyykYBJmlHbVr+Cg3XcjErhmhL9MGGh5TKvleceqKTHB2BNPf
         g0m/eI1jv+0eUHsw2TA5gPQmHjusfpwFql0V6UDmBy5KqJtlOlo1n3c8irB9IhqzB8nN
         QbKLfbDUxB1853xPdjrJ/cn3RwzLtp1TQNfTTMFQhQh+ftoZqO4k44Tfpb7O7Wq0EW/w
         UAaA==
X-Gm-Message-State: ANoB5pmscgfHygbYvhhkA7UQzfYdlPXKU9UBTrvY0kcYBdQHBMnYfWmy
        vSmt9C5ISLkgL73FjoOUOCaZRw==
X-Google-Smtp-Source: AA0mqf6H/OBIYdJ/gJkaPxc3ffIWTCBSkVo0aI6Nsg/gpybN3CnGpXlJVxCKMpJ5re7L46019WEspQ==
X-Received: by 2002:a05:6512:3f1d:b0:4a2:3f29:5e8a with SMTP id y29-20020a0565123f1d00b004a23f295e8amr2094943lfa.221.1668762388938;
        Fri, 18 Nov 2022 01:06:28 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b00497ab34bf5asm48205lfr.20.2022.11.18.01.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 01:06:28 -0800 (PST)
Message-ID: <24a88a47-7556-20f1-ce9c-fe7bd0466a88@linaro.org>
Date:   Fri, 18 Nov 2022 10:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/6] soc: qcom: geni-se: add desc struct to specify
 clocks from device match data
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-3-aadaa6997b28@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-3-aadaa6997b28@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 18/11/2022 09:45, Neil Armstrong wrote:
> The I2C Master Hub is a stripped down version of the GENI Serial Engine
> QUP Wrapper Controller but only supporting I2C serial engines without
> DMA support.
> 
> Prepare support for the I2C Master Hub variant by moving the required
> clocks list to a new desc struct then passing it through the compatible
> match data.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/soc/qcom/qcom-geni-se.c | 59 +++++++++++++++++++++++++++++++----------
>   1 file changed, 45 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index a0ceeede450f..ced2a2932eda 100644
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
> @@ -887,11 +896,23 @@ static int geni_se_probe(struct platform_device *pdev)
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
> +		if (wrapper->num_clks < desc->num_clks)
This will never execute (except if somebody adding a third desc would 
make a mistake or not update MAX_CLKS), as wrapper->num_clks will only 
be < desc->num_clks if desc->num_clks > MAX_CLKS.

I was thinking about getting the number of actual clocks passed to the 
device in the DT, but I can't find a helper function for that, so it 
would probably require some kind of manual looping.. I guess we can drop 
this. Or leave it to save somebody pulling their hair out in an unlikely 
event. I guess I'm fine with both.


> +			dev_warn(dev, "too much clocks described in DT\n")
If you leave it, s/too much/Too many/


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
> @@ -901,8 +922,18 @@ static int geni_se_probe(struct platform_device *pdev)
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
