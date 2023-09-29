Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA0A7B34B9
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 16:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbjI2OTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 10:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjI2OTF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 10:19:05 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E806DDB
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 07:19:02 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-49d0f24a815so440771e0c.2
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 07:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695997142; x=1696601942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aeAmu5zRzHvoDH022+dw4lZnAM1RJWZc8yHpGYazk38=;
        b=IAR2otZA0wOBAfulY51fm5VEDd7sQpNpQRLsH19GJyrgN0A6mKpe5s2Qg3Qa3eLTTs
         4xHFLBHn8YT5dPvBfBWVGzsFvHhjZTrVerNAiPu1W0NIhjP75wJAIY/hA3Msh1AxNY+S
         leUzg5FEf3NT/oUfXEYpIzM2GmA+zKF8DILIK17CKUOv0bov21+mugtYqNRhvCmGv+2s
         K0olfdhSyI+W669SG5uPpfvA0/dGSdYXYXSXCTU/g5oPrG7Hmjm/KB1WkvbO6eSM/8AV
         G8TnWG0Crek5TjyPZktdkuVciDMYx888Ii8hH8anI7JlDNU2SxNp0setm1a506+Upfjw
         SCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695997142; x=1696601942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeAmu5zRzHvoDH022+dw4lZnAM1RJWZc8yHpGYazk38=;
        b=JF0mu7huunBqldWq9vqOfwl99CfqbKKSs10ojYm83Ug/X1GCugcZIB9M4KD7KfVo6f
         P0fFOQrik+Q5C4kjx7Fr2uDiHW/C50sJAB7XFfU4JQ0m+ziEj40K1kEesj1kLc+8RsVS
         6Bm1KteFzgrqSQEy5y/VMsChUiES+j9dWUTizpS4ap96nCDuNXg6d9xMRZC8WbTpi4EZ
         Qu5I3J9UgLqz7A/p95N1CMJXUIXdg6aYBk8AyL2zakweSfqNhZhxNO5IlCKeEiN+eE53
         qlBtw3l3m2YNc6IGq9v36lajmfkyLsQYyWQZzVGiykZJn5iVhjVLmP1ZCZIdEVYxOkDX
         26dA==
X-Gm-Message-State: AOJu0YzbfJlGKnwwDPERSBixH687h44aVteifc96mmpkrVOciyI+ePMb
        6CpIlbhuKzxjt4+ofPDP7naexw==
X-Google-Smtp-Source: AGHT+IG8PNXy1FiVTC84HeixjWp13xFTszyacFLiA9jqmSZuIb0y0MLVqqRjAZo1hAHWMru/kiHa3A==
X-Received: by 2002:a1f:e641:0:b0:49a:850b:107b with SMTP id d62-20020a1fe641000000b0049a850b107bmr3260039vkh.5.1695997141781;
        Fri, 29 Sep 2023 07:19:01 -0700 (PDT)
Received: from [192.168.33.189] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id g27-20020ac5c5db000000b0049d1de0fa44sm102807vkl.28.2023.09.29.07.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 07:19:01 -0700 (PDT)
Message-ID: <acc606a6-c46c-43f5-86e0-84bf876001dd@linaro.org>
Date:   Fri, 29 Sep 2023 16:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Add Camera Control
 Interface busses
Content-Language: en-US
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
 <20230929-sc7280-cci-v1-2-16c7d386f062@fairphone.com>
 <8dd470e5-ce33-3d33-98f1-e66935ca7b56@linaro.org>
 <1b5bd391-4bb0-44ac-88d1-e326bec4dd7d@nexus-software.ie>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <1b5bd391-4bb0-44ac-88d1-e326bec4dd7d@nexus-software.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29.09.2023 16:15, Bryan O'Donoghue wrote:
> On 29/09/2023 14:35, Konrad Dybcio wrote:
>>
>>
>> On 9/29/23 10:01, Luca Weiss wrote:
>>> Add the CCI busses found on sc7280 and their pinctrl states.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 136 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 136 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> index 66f1eb83cca7..65550de2e4ff 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> @@ -3793,6 +3793,86 @@ videocc: clock-controller@aaf0000 {
>>>               #power-domain-cells = <1>;
>>>           };
>>> +        cci0: cci@ac4a000 {
>>> +            compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
>>> +            reg = <0 0x0ac4a000 0 0x1000>;
>>> +            interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>> +
>>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>>> +                 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>>> +                 <&camcc CAM_CC_CCI_0_CLK>,
>>> +                 <&camcc CAM_CC_CCI_0_CLK_SRC>;
>>> +            clock-names = "camnoc_axi",
>>> +                      "slow_ahb_src",
>>> +                      "cpas_ahb",
>>> +                      "cci",
>>> +                      "cci_src";
>> I guess this is more of a question to e.g. Bryan, but are all of these clocks actually necessary?
>>
>> Konrad
> Hmm its a good question, we generally take the approach of adopting all of the downstream clocks for these camera interfaces verbatim.
> 
> The clock plan for this part only calls out cci_X_clk and cci_x_clk_src for the CCI however we know that to be incomplete since we *absolutely* need to have the AXI for the block clocked to access those registers, same deal with the AHB bus.
> 
> AXI: registers
> AHB: data
> 
> In the above list the only clock you might conceivably not need is CPAS_AHB_CLK.
> 
> Let me zap that clock from sdm845 since I have an rb3 right in front of me and see what happens.
> 
> Crash and reset
> 
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4402,13 +4402,11 @@ cci: cci@ac4a000 {
>                         clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
>                                 <&clock_camcc CAM_CC_SOC_AHB_CLK>,
>                                 <&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> -                               <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
>                                 <&clock_camcc CAM_CC_CCI_CLK>,
>                                 <&clock_camcc CAM_CC_CCI_CLK_SRC>;
>                         clock-names = "camnoc_axi",
>                                 "soc_ahb",
>                                 "slow_ahb_src",
> -                               "cpas_ahb",
>                                 "cci",
>                                 "cci_src";
> 
> 
> I think the list is good tbh
WDYT about camcc consuming ahb, like dispcc does?
AXI, hmm.. not quite sure what to do with it

Konrad
