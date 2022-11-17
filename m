Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDB9A62D47F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 08:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239205AbiKQH62 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 02:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238951AbiKQH61 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 02:58:27 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1464D91
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 23:58:24 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id bs21so2314679wrb.4
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 23:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hM8BQcdwBxLXfEtfq7sGjS/dHJrVj14bOfYseYvsWQI=;
        b=SmNykQahRoLaPjhrzoF43A9aDFrnnM4l4LWYdgyrnMNGh2ld3eAQDkzDZoUfyB66yn
         vG+8P4Nuew4u7D7Fd5bgRSjzhaEzfa8FwvgFtBWyEovuuWp6C4X7PoUYXvNHXm9L4+M/
         OJTRebB26s0Nh8Z+y9P4BPdH3u7dhd9/vYGOwZLb/IIiMKgQiLlG8dwzgB3uJiXvT6xW
         rVhb8h78hcM0wDny2bOMbrVQ2FXY7O8Mo6cX8r48HYAODmNoBMcKqUyla1yha8iDWRPC
         xlSjCu0QZ1PdcxmUGbi/J1uDRHMlQToSa1F+QK8k6RiQvgMCNzumdJL8BFRPTkR3rhQ4
         8ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hM8BQcdwBxLXfEtfq7sGjS/dHJrVj14bOfYseYvsWQI=;
        b=F6z5siYSdbLFX130ecy3yRV7ukN2ikI49E3dy0jtaIb7e1B7cwT55+1/lEiodqFGeZ
         i+Efm5tfLclvnNRTTAxBuS6GvGhhrFY2MHzMqpUXPlXRGHi/RK6uXgDC4a0isJ0UHhpO
         iG6211ukHP5wsmQ6lIXLvI5UMP1feqyykbU5tNyr59mWtyLYTU41cjokey/fByKQcCnf
         r5sLZ9zW4AVr8B19RPhUBjmChHDK2A4lLwZe08zNGu+O8OxFTtvC3FUVYUF8rXDya15e
         dvq9Z6efID8Qlkc8mB8doR4Mp5T+Um7PLQm98YZC/B3LjgrKvj7EhlEldpXwGS0MdtcZ
         94AQ==
X-Gm-Message-State: ANoB5pm51bwYv+qIjtrzzV58m9lgBJCfNNF8IwGtoi7touGPRphK7yVI
        59UN6foJNPGYTml63ES6yrOv4g==
X-Google-Smtp-Source: AA0mqf7z8wquf9ieqUd+81O3fKI2FalZ/xqrNkQArMkHhTZfk0bCbAt5a8xqA+HuYrnqMzbo5td7Cw==
X-Received: by 2002:adf:fe52:0:b0:236:6ab6:a51c with SMTP id m18-20020adffe52000000b002366ab6a51cmr725698wrs.54.1668671903315;
        Wed, 16 Nov 2022 23:58:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b? ([2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b])
        by smtp.gmail.com with ESMTPSA id d9-20020adfe889000000b0024166413a4fsm227398wrm.37.2022.11.16.23.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 23:58:22 -0800 (PST)
Message-ID: <ddb4cb6b-538e-0c56-679d-7ec7fdf5d041@linaro.org>
Date:   Thu, 17 Nov 2022 08:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] soc: qcom: geni-se: add desc struct to specify clocks
 from device match data
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-3-64449106a148@linaro.org>
 <16d6c50b-f7da-a2b3-0b95-726b843e50c0@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <16d6c50b-f7da-a2b3-0b95-726b843e50c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/11/2022 11:32, Konrad Dybcio wrote:
> 
> 
> On 16/11/2022 11:21, Neil Armstrong wrote:
>> The I2C Master Hub is a stripped down version of the GENI Serial Engine
>> QUP Wrapper Controller but only supporting I2C serial engines without
>> DMA support.
>>
>> This prepares support for the I2C Master Hub variant, by moving
>> the required clocks list to a new desc struct then passing it through the
>> compatible match data.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 57 +++++++++++++++++++++++++++++++----------
>>   1 file changed, 43 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index a0ceeede450f..f4f54d92a01a 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -81,19 +81,31 @@
>>    */
>>   #define MAX_CLK_PERF_LEVEL 32
>> -#define NUM_AHB_CLKS 2
>> +#define MAX_CLKS 2
>>   /**
>>    * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
>>    * @dev:        Device pointer of the QUP wrapper core
>>    * @base:        Base address of this instance of QUP wrapper core
>> - * @ahb_clks:        Handle to the primary & secondary AHB clocks
>> + * @clks:        Handle to the primary & optional secondary AHB clocks
>> + * @num_clks:        Count of clocks
>>    * @to_core:        Core ICC path
>>    */
>>   struct geni_wrapper {
>>       struct device *dev;
>>       void __iomem *base;
>> -    struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>> +    struct clk_bulk_data clks[MAX_CLKS];
>> +    unsigned int num_clks;
>> +};
>> +
>> +/**
>> + * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
>> + * @clks:        Name of the primary & optional secondary AHB clocks
>> + * @num_clks:        Count of clock names
>> + */
>> +struct geni_se_desc {
>> +    unsigned int num_clks;
>> +    const char * const *clks;
>>   };
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>> @@ -496,8 +508,7 @@ static void geni_se_clks_off(struct geni_se *se)
>>       struct geni_wrapper *wrapper = se->wrapper;
>>       clk_disable_unprepare(se->clk);
>> -    clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
>> -                        wrapper->ahb_clks);
>> +    clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>>   }
>>   /**
>> @@ -528,15 +539,13 @@ static int geni_se_clks_on(struct geni_se *se)
>>       int ret;
>>       struct geni_wrapper *wrapper = se->wrapper;
>> -    ret = clk_bulk_prepare_enable(ARRAY_SIZE(wrapper->ahb_clks),
>> -                        wrapper->ahb_clks);
>> +    ret = clk_bulk_prepare_enable(wrapper->num_clks, wrapper->clks);
>>       if (ret)
>>           return ret;
>>       ret = clk_prepare_enable(se->clk);
>>       if (ret)
>> -        clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
>> -                            wrapper->ahb_clks);
>> +        clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>>       return ret;
>>   }
>> @@ -887,11 +896,21 @@ static int geni_se_probe(struct platform_device *pdev)
>>           return PTR_ERR(wrapper->base);
>>       if (!has_acpi_companion(&pdev->dev)) {
>> -        wrapper->ahb_clks[0].id = "m-ahb";
>> -        wrapper->ahb_clks[1].id = "s-ahb";
>> -        ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
>> +        const struct geni_se_desc *desc;
>> +        int i;
>> +
>> +        desc = device_get_match_data(&pdev->dev);
>> +        if (!desc)
>> +            return -EINVAL;
>> +
>> +        wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
> Maybe a warning would be suitable if num mismatch happens?

Indeed, will add that, thx.

> 
> Other than that,
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> 
> Konrad
>> +
>> +        for (i = 0; i < wrapper->num_clks; ++i)
>> +            wrapper->clks[i].id = desc->clks[i];
>> +
>> +        ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
>>           if (ret) {
>> -            dev_err(dev, "Err getting AHB clks %d\n", ret);
>> +            dev_err(dev, "Err getting clks %d\n", ret);
>>               return ret;
>>           }
>>       }
>> @@ -901,8 +920,18 @@ static int geni_se_probe(struct platform_device *pdev)
>>       return devm_of_platform_populate(dev);
>>   }
>> +static const char * const qup_clks[] = {
>> +    "m-ahb",
>> +    "s-ahb",
>> +};
>> +
>> +static const struct geni_se_desc qup_desc = {
>> +    .clks = qup_clks,
>> +    .num_clks = ARRAY_SIZE(qup_clks),
>> +};
>> +
>>   static const struct of_device_id geni_se_dt_match[] = {
>> -    { .compatible = "qcom,geni-se-qup", },
>> +    { .compatible = "qcom,geni-se-qup", .data = &qup_desc },
>>       {}
>>   };
>>   MODULE_DEVICE_TABLE(of, geni_se_dt_match);
>>

