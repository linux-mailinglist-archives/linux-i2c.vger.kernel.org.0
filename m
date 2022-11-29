Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D269E63C0E8
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 14:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbiK2NVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 08:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbiK2NVi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 08:21:38 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1ADE58BD8
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 05:21:35 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id d3so16921252ljl.1
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTqB0Cx9TQ+/AdH8ZuJQ7GAbENMQcgVBmVbbVWR1xuY=;
        b=ExkVn/7btMn7c7EEocrrMeg7Td2aYNz+mZSi9MzJDcPM4/BtLHZopKHtrPiRYRxDQD
         R7UQqafRAPO4f0cOBC8L+8jNL0bXE0yMxDCDVDRvqJR51FIepN1vvXwOvUHgE0dcQVqy
         tup2H9Imur+Ak42MhsqzrRUyhzSUeiYBa3RRUuyz5Zo1cLSgOv/69FVoyxfquqUSW6mQ
         3je7RrVcIBdNN6+jxf21vuSC4YxepGMx9Fb13i57X13rcabO5Poqobq0xO2CQq7KnSOx
         cOx2Fway75c+v9BKOY8ny6ZCR8ZbSz5yuuvJENghP+B/gPdeXXefXycRffci193xi30A
         SGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qTqB0Cx9TQ+/AdH8ZuJQ7GAbENMQcgVBmVbbVWR1xuY=;
        b=MsNN7HndIwjYPZbjOwPPUBCDyvZNQ5ztaMIlM1j2096CtLEac/UvtNC8O2lCw4foBY
         n4+XJ4AA6/dwoBQQ6OO7BdwtKM+yMDJvOoUeTKtD6nhJ9y4hqxwyjuCwBjQM4B6h4nal
         Lbv/ybu2S3HOozH/h2nCXx4OBGF+D9WElANLaG+66GcWr9f6dY02g6YEQaa1cW/8yC3Z
         kU5jMKZ5zU+bwjgojF8Fi7hCBTxDdMLPGm1kenNzhHbUFVhxHKuaPj964XbCa3NilksH
         5W8WKnvWwBO+A5UBl39laEbgX0luVN3Hiwfn5LKTqSFOKcNqizgtQ4sZoPoa9wv11qzo
         R26g==
X-Gm-Message-State: ANoB5pnt8q/Ns73ZGCHN+5/vx1xHFFKmxWjJuepNtENISYfTPvAdnHxz
        CdeXAz8c2kOfB5uwUAJNKLJHJw==
X-Google-Smtp-Source: AA0mqf5w36l0Ci6tmjvtVDe42fgeeWY1YhGWg1N9YeU7TPwfwy1jL/ywNOM7+edyvpgNSSDFYd7W2w==
X-Received: by 2002:a2e:8943:0:b0:279:b56b:8ee8 with SMTP id b3-20020a2e8943000000b00279b56b8ee8mr950946ljk.184.1669728094255;
        Tue, 29 Nov 2022 05:21:34 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id c28-20020ac25f7c000000b004ae394b6a6fsm2221432lfc.246.2022.11.29.05.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:21:33 -0800 (PST)
Message-ID: <92b39c01-1283-0b7c-6ba9-3edd2d4de002@linaro.org>
Date:   Tue, 29 Nov 2022 14:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/6] soc: qcom: geni-se: add desc struct to specify
 clocks from device match data
To:     neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-3-aadaa6997b28@linaro.org>
 <24a88a47-7556-20f1-ce9c-fe7bd0466a88@linaro.org>
 <cbccbcbe-5006-cdc9-f3af-39c53d87b8a5@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <cbccbcbe-5006-cdc9-f3af-39c53d87b8a5@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 29.11.2022 09:24, Neil Armstrong wrote:
> On 18/11/2022 10:06, Konrad Dybcio wrote:
>>
>>
>> On 18/11/2022 09:45, Neil Armstrong wrote:
>>> The I2C Master Hub is a stripped down version of the GENI Serial Engine
>>> QUP Wrapper Controller but only supporting I2C serial engines without
>>> DMA support.
>>>
>>> Prepare support for the I2C Master Hub variant by moving the required
>>> clocks list to a new desc struct then passing it through the compatible
>>> match data.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>   drivers/soc/qcom/qcom-geni-se.c | 59 +++++++++++++++++++++++++++++++----------
>>>   1 file changed, 45 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>> index a0ceeede450f..ced2a2932eda 100644
>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>> @@ -81,19 +81,31 @@
>>>    */
>>>   #define MAX_CLK_PERF_LEVEL 32
>>> -#define NUM_AHB_CLKS 2
>>> +#define MAX_CLKS 2
>>>   /**
>>>    * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
>>>    * @dev:        Device pointer of the QUP wrapper core
>>>    * @base:        Base address of this instance of QUP wrapper core
>>> - * @ahb_clks:        Handle to the primary & secondary AHB clocks
>>> + * @clks:        Handle to the primary & optional secondary AHB clocks
>>> + * @num_clks:        Count of clocks
>>>    * @to_core:        Core ICC path
>>>    */
>>>   struct geni_wrapper {
>>>       struct device *dev;
>>>       void __iomem *base;
>>> -    struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>>> +    struct clk_bulk_data clks[MAX_CLKS];
>>> +    unsigned int num_clks;
>>> +};
>>> +
>>> +/**
>>> + * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
>>> + * @clks:        Name of the primary & optional secondary AHB clocks
>>> + * @num_clks:        Count of clock names
>>> + */
>>> +struct geni_se_desc {
>>> +    unsigned int num_clks;
>>> +    const char * const *clks;
>>>   };
>>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>> @@ -496,8 +508,7 @@ static void geni_se_clks_off(struct geni_se *se)
>>>       struct geni_wrapper *wrapper = se->wrapper;
>>>       clk_disable_unprepare(se->clk);
>>> -    clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
>>> -                        wrapper->ahb_clks);
>>> +    clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>>>   }
>>>   /**
>>> @@ -528,15 +539,13 @@ static int geni_se_clks_on(struct geni_se *se)
>>>       int ret;
>>>       struct geni_wrapper *wrapper = se->wrapper;
>>> -    ret = clk_bulk_prepare_enable(ARRAY_SIZE(wrapper->ahb_clks),
>>> -                        wrapper->ahb_clks);
>>> +    ret = clk_bulk_prepare_enable(wrapper->num_clks, wrapper->clks);
>>>       if (ret)
>>>           return ret;
>>>       ret = clk_prepare_enable(se->clk);
>>>       if (ret)
>>> -        clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
>>> -                            wrapper->ahb_clks);
>>> +        clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>>>       return ret;
>>>   }
>>> @@ -887,11 +896,23 @@ static int geni_se_probe(struct platform_device *pdev)
>>>           return PTR_ERR(wrapper->base);
>>>       if (!has_acpi_companion(&pdev->dev)) {
>>> -        wrapper->ahb_clks[0].id = "m-ahb";
>>> -        wrapper->ahb_clks[1].id = "s-ahb";
>>> -        ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
>>> +        const struct geni_se_desc *desc;
>>> +        int i;
>>> +
>>> +        desc = device_get_match_data(&pdev->dev);
>>> +        if (!desc)
>>> +            return -EINVAL;
>>> +
>>> +        wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
>>> +        if (wrapper->num_clks < desc->num_clks)
>> This will never execute (except if somebody adding a third desc would make a mistake or not update MAX_CLKS), as wrapper->num_clks will only be < desc->num_clks if desc->num_clks > MAX_CLKS.
> 
> You're right, I did read too fast.
> 
>>
>> I was thinking about getting the number of actual clocks passed to the device in the DT, but I can't find a helper function for that, so it would probably require some kind of manual looping.. I guess we can drop this. Or leave it to save somebody pulling their hair out in an unlikely event. I guess I'm fine with both.
> 
> This would be:
> 
> of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells")
> 
> but ultimately if the number of clocks is lower than requested, it will fail
> in the call to devm_clk_bulk_get().
> 
> Would we warn if the DT clocks count is higher ? or simply fail if lower ?
Just "fail if lower" sounds good.

Konrad
> 
> Neil
> 
>>
>>
>>> +            dev_warn(dev, "too much clocks described in DT\n")
>> If you leave it, s/too much/Too many/
>>
>>
>> Konrad
>>> +
>>> +        for (i = 0; i < wrapper->num_clks; ++i)
>>> +            wrapper->clks[i].id = desc->clks[i];
>>> +
>>> +        ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
>>>           if (ret) {
>>> -            dev_err(dev, "Err getting AHB clks %d\n", ret);
>>> +            dev_err(dev, "Err getting clks %d\n", ret);
>>>               return ret;
>>>           }
>>>       }
>>> @@ -901,8 +922,18 @@ static int geni_se_probe(struct platform_device *pdev)
>>>       return devm_of_platform_populate(dev);
>>>   }
>>> +static const char * const qup_clks[] = {
>>> +    "m-ahb",
>>> +    "s-ahb",
>>> +};
>>> +
>>> +static const struct geni_se_desc qup_desc = {
>>> +    .clks = qup_clks,
>>> +    .num_clks = ARRAY_SIZE(qup_clks),
>>> +};
>>> +
>>>   static const struct of_device_id geni_se_dt_match[] = {
>>> -    { .compatible = "qcom,geni-se-qup", },
>>> +    { .compatible = "qcom,geni-se-qup", .data = &qup_desc },
>>>       {}
>>>   };
>>>   MODULE_DEVICE_TABLE(of, geni_se_dt_match);
>>>
> 
