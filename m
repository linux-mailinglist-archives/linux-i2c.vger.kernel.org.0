Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A5863BB6F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 09:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiK2IYw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 03:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiK2IYv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 03:24:51 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707F25655C
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 00:24:48 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id bs21so20828189wrb.4
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 00:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tYLYGC4+NF53GSUK1U1BbaDChlHeYLa+kefmGNsOQLo=;
        b=tlInaQk5JAdGJVixJIEPxHZ5uO4OP/98WWK0YcFd2CuALpz3daEqqlCCAYHVJsF5b3
         Nz7og1BmUP/MlZ8IdBZTYfSCknxLkCIFk8N4FRErZW58FqUwEoi8I1QKtXJJoSnV4izM
         N0ZnVfdo0hh5UC4p9RYTh4sZi0jyPOkF2sc6eM6Xgjaf8SHEVLE9TFEmLW0ISzEhsZ/4
         SCNrtq7k79C/GS5SAWC2O7kvvuAk2t09OKdfTCqhJr7nKBbkQoEKXRSeP6AfClUR7w/X
         +WHmT7Aceuxtl59hzgZABCSGuNG43zvJC9kqXnAh1cQE41z62OKLZkWEC+COlTQcJPwR
         Zajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYLYGC4+NF53GSUK1U1BbaDChlHeYLa+kefmGNsOQLo=;
        b=2xiUoiAxNt8SQIt0rWC8tJ5wZBmVteANiBdARKIFk/MgMkAme4vyQV2kyVcavjo97K
         M3uRaj7xPhD6+ikmu9nJGjuMpsUgT+sYcuyNhoHeowhrIxTlhE2YG61d7luc5KXxCnJc
         rn99Xp9pDVH/SY7iT8Rx445cDyT1sPGF1rZTYEqLfetc3zayF31RwLDQvmy7C/JvDRKj
         2Y7a9DXRXp6GRPb1b3PIy4Wl0qM2ZZ6KXQvhj3o63F0Ggs5CmndbNl62sPzzOuj2CcdK
         A8l3FPcfAg98yFsaEz8G+dfYhsde5xPPqmFW6q2rJEIxwugfLoXVd2qpClwq2KjxEHyW
         t/rA==
X-Gm-Message-State: ANoB5pkp3AvUyAgMO6tnZ4PteLwo9Ig5DhZN9z6qJxu0J6OEh3V+BYsj
        cnwnxwfiCY0RSP+Hvh+bYrPFkA==
X-Google-Smtp-Source: AA0mqf47saa479iipml8biPhf2KL71g5Xo9YVRuTvBi/IBp5oYvCer6s+8sxPyzl8Yb1uTtMK5YUJQ==
X-Received: by 2002:a5d:5709:0:b0:241:d71c:5dde with SMTP id a9-20020a5d5709000000b00241d71c5ddemr25813602wrv.678.1669710286827;
        Tue, 29 Nov 2022 00:24:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2? ([2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2])
        by smtp.gmail.com with ESMTPSA id 124-20020a1c1982000000b003cfa81e2eb4sm1177399wmz.38.2022.11.29.00.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:24:46 -0800 (PST)
Message-ID: <cbccbcbe-5006-cdc9-f3af-39c53d87b8a5@linaro.org>
Date:   Tue, 29 Nov 2022 09:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/6] soc: qcom: geni-se: add desc struct to specify
 clocks from device match data
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-3-aadaa6997b28@linaro.org>
 <24a88a47-7556-20f1-ce9c-fe7bd0466a88@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <24a88a47-7556-20f1-ce9c-fe7bd0466a88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/11/2022 10:06, Konrad Dybcio wrote:
> 
> 
> On 18/11/2022 09:45, Neil Armstrong wrote:
>> The I2C Master Hub is a stripped down version of the GENI Serial Engine
>> QUP Wrapper Controller but only supporting I2C serial engines without
>> DMA support.
>>
>> Prepare support for the I2C Master Hub variant by moving the required
>> clocks list to a new desc struct then passing it through the compatible
>> match data.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 59 +++++++++++++++++++++++++++++++----------
>>   1 file changed, 45 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index a0ceeede450f..ced2a2932eda 100644
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
>> @@ -887,11 +896,23 @@ static int geni_se_probe(struct platform_device *pdev)
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
>> +        if (wrapper->num_clks < desc->num_clks)
> This will never execute (except if somebody adding a third desc would make a mistake or not update MAX_CLKS), as wrapper->num_clks will only be < desc->num_clks if desc->num_clks > MAX_CLKS.

You're right, I did read too fast.

> 
> I was thinking about getting the number of actual clocks passed to the device in the DT, but I can't find a helper function for that, so it would probably require some kind of manual looping.. I guess we can drop this. Or leave it to save somebody pulling their hair out in an unlikely event. I guess I'm fine with both.

This would be:

of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells")

but ultimately if the number of clocks is lower than requested, it will fail
in the call to devm_clk_bulk_get().

Would we warn if the DT clocks count is higher ? or simply fail if lower ?

Neil

> 
> 
>> +            dev_warn(dev, "too much clocks described in DT\n")
> If you leave it, s/too much/Too many/
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
>> @@ -901,8 +922,18 @@ static int geni_se_probe(struct platform_device *pdev)
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

