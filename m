Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA4C7B36C7
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 17:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbjI2P0L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 11:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbjI2P0I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 11:26:08 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD23193
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 08:26:02 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ad8d47ef2fso1862077566b.1
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696001161; x=1696605961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRjRxESnxGZ8aiamezaiD8zKeBhrLQcAQ0nK38FQ9LE=;
        b=Rd1gHtLYa8ab5kQ3+qLWS91uGfAZlX5aHBuXajBLq84UMocKXtDgwgAL5mqB68TQyh
         AXuawrULy5RTRMnrjTGel5y+PR75k4j8ph+edShzxzmn0TRTG6YZ6F6zhtzWitlzN9pP
         7Qq1lb8NaIfZ8d0kgzWUnn+Rpd3YB/aG69a2RFEChpwTbo8E4CQgqLfzj0uDOwSb49/N
         vWlnOXsiqU6UvawXRF61LHsbjaeX92Q0VAfo7kaVMUU94wFqLBLKx8Dcx+09JlgjpJc8
         7Ue9MjmWhhRCP0Hb/AFyz479rzceSQGgzK8pgO59OFkXOrgCGPP+leO6OaUd29oPO1qa
         bdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696001161; x=1696605961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRjRxESnxGZ8aiamezaiD8zKeBhrLQcAQ0nK38FQ9LE=;
        b=ioK4sqmc6DqjxibOomMTn713D8qIGt4+9oRxIYUR0Xz+flK4QQnfDPHquT5A0bZUME
         sXj9y3bQlMX2ZJgHq1+wUlkcJJ6mMlkxY/SA75PKgYlYuHUPtmO2/5jBdQt+Tu7LjFGN
         bg1wTeg9hjOkzwvDHEqkZAAd2UtyusFbwVzWeVzSkLP0iB1vzG63LFqMhS+O07Dwgzmm
         +masjkyYKLTdS9qDUGx9O3+IfllJP6lieXkRHwcbiKQGm4fLAG4oeYk6bTdgozSSX0v1
         i7d5y5N1LltddUr5GIITBao7maukaxOnAmlrGkdedoWCFIV/9J+vEWmkPllG7bQtWosb
         QGhA==
X-Gm-Message-State: AOJu0YziiipH/8krvJUFkWsXXrGj5ZcPwYpkwX0iZRWnveS1O8nOdS7H
        rSGTSH8CRSDxNWLlioc7vOnOPQ==
X-Google-Smtp-Source: AGHT+IFD+weK/Hg9X6BWQ21ZocegAzC8sUeYlMloB8BjIoO+hG96p5S6kz2Hpqm4ZLZeS4E+kSRYcQ==
X-Received: by 2002:a17:906:8455:b0:9ae:6a8b:f8aa with SMTP id e21-20020a170906845500b009ae6a8bf8aamr4269613ejy.26.1696001160804;
        Fri, 29 Sep 2023 08:26:00 -0700 (PDT)
Received: from [192.168.33.189] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b009adc77fe165sm12388062ejo.118.2023.09.29.08.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 08:26:00 -0700 (PDT)
Message-ID: <b6f801fc-1d8b-420b-a439-ea0cdd12f7f6@linaro.org>
Date:   Fri, 29 Sep 2023 17:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Add Camera Control
 Interface busses
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
 <20230929-sc7280-cci-v1-2-16c7d386f062@fairphone.com>
 <8dd470e5-ce33-3d33-98f1-e66935ca7b56@linaro.org>
 <1b5bd391-4bb0-44ac-88d1-e326bec4dd7d@nexus-software.ie>
 <acc606a6-c46c-43f5-86e0-84bf876001dd@linaro.org>
 <db5d00b5-5d18-4144-88c2-ff6cfb8c176a@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <db5d00b5-5d18-4144-88c2-ff6cfb8c176a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29.09.2023 17:22, Bryan O'Donoghue wrote:
> On 29/09/2023 15:18, Konrad Dybcio wrote:
>> On 29.09.2023 16:15, Bryan O'Donoghue wrote:
>>> On 29/09/2023 14:35, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 9/29/23 10:01, Luca Weiss wrote:
>>>>> Add the CCI busses found on sc7280 and their pinctrl states.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sc7280.dtsi | 136 +++++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 136 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>> index 66f1eb83cca7..65550de2e4ff 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>> @@ -3793,6 +3793,86 @@ videocc: clock-controller@aaf0000 {
>>>>>                #power-domain-cells = <1>;
>>>>>            };
>>>>> +        cci0: cci@ac4a000 {
>>>>> +            compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
>>>>> +            reg = <0 0x0ac4a000 0 0x1000>;
>>>>> +            interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>>>>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>>>> +
>>>>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>>>>> +                 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>>>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>>>>> +                 <&camcc CAM_CC_CCI_0_CLK>,
>>>>> +                 <&camcc CAM_CC_CCI_0_CLK_SRC>;
>>>>> +            clock-names = "camnoc_axi",
>>>>> +                      "slow_ahb_src",
>>>>> +                      "cpas_ahb",
>>>>> +                      "cci",
>>>>> +                      "cci_src";
>>>> I guess this is more of a question to e.g. Bryan, but are all of these clocks actually necessary?
>>>>
>>>> Konrad
>>> Hmm its a good question, we generally take the approach of adopting all of the downstream clocks for these camera interfaces verbatim.
>>>
>>> The clock plan for this part only calls out cci_X_clk and cci_x_clk_src for the CCI however we know that to be incomplete since we *absolutely* need to have the AXI for the block clocked to access those registers, same deal with the AHB bus.
>>>
>>> AXI: registers
>>> AHB: data
>>>
>>> In the above list the only clock you might conceivably not need is CPAS_AHB_CLK.
>>>
>>> Let me zap that clock from sdm845 since I have an rb3 right in front of me and see what happens.
>>>
>>> Crash and reset
>>>
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -4402,13 +4402,11 @@ cci: cci@ac4a000 {
>>>                          clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
>>>                                  <&clock_camcc CAM_CC_SOC_AHB_CLK>,
>>>                                  <&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>>> -                               <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
>>>                                  <&clock_camcc CAM_CC_CCI_CLK>,
>>>                                  <&clock_camcc CAM_CC_CCI_CLK_SRC>;
>>>                          clock-names = "camnoc_axi",
>>>                                  "soc_ahb",
>>>                                  "slow_ahb_src",
>>> -                               "cpas_ahb",
>>>                                  "cci",
>>>                                  "cci_src";
>>>
>>>
>>> I think the list is good tbh
>> WDYT about camcc consuming ahb, like dispcc does?
>> AXI, hmm.. not quite sure what to do with it
>>
>> Konrad
> 
> Hmm on which platform, camcc clock depds on sdm845 looks very sparse to me.
> 
> 8550 OTOH
> 
> dispcc: clock-controller@af00000 {
>        compatible = "qcom,sm8550-dispcc";
>        reg = <0 0x0af00000 0 0x20000>;
>        clocks = <&bi_tcxo_div2>,
>                 <&bi_tcxo_ao_div2>,
>                 <&gcc GCC_DISP_AHB_CLK>,
> 
> videocc: clock-controller@aaf0000 {
>        compatible = "qcom,sm8550-videocc";
>        reg = <0 0x0aaf0000 0 0x10000>;
>        clocks = <&bi_tcxo_div2>,
>                 <&gcc GCC_VIDEO_AHB_CLK>;
> 
> sm8250
> 
> camcc: clock-controller@ad00000 {
>         compatible = "qcom,sm8250-camcc";
>         reg = <0 0x0ad00000 0 0x10000>;
>         clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> 
> I think those DISP_AHB, VIDEO_AHB_CLK, CAMERA_AHB_CLKs should live in the display, video and camss blocks i.e. they are not clocks that you require to access the clock controller registers themselves...
> 
> I'm seeing for the most part these MEDIAIPBLOCK_AHB_CLKs don't come from the GCC AHB clock but from another root clock generator.
> 
> bi_tcxo ->
> cam_cc_pll0_out_main ->
> cam_cc_pll0_out_even ->
> cam_cc_pll0_out_odd ->
> cam_cc_pll2_out_main ->
>                         cam_cc_slow_ahb_clk_src ->
>                                    camcc_bps_ahb_clk
>                                    camcc_ipe_0_ahb_clk
>                                    ...
>                                    camcc_core_ahb_clk
> 
> Lets see what happens to sm8250 if we remove CAMERA_AHB_CLK from the camera clock controller @ camcc: clock-controller@ad00000 {} I don't believe that is required.
> 
> ...
> 
> Yep.. does SFA
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 1efa07f2caff4..1e7d9ee25eeae 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4172,11 +4172,10 @@ port@5 {
>                 camcc: clock-controller@ad00000 {
>                         compatible = "qcom,sm8250-camcc";
>                         reg = <0 0x0ad00000 0 0x10000>;
> -                       clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> -                                <&rpmhcc RPMH_CXO_CLK>,
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&rpmhcc RPMH_CXO_CLK_A>,
>                                  <&sleep_clk>;
> -                       clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> +                       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
>                         power-domains = <&rpmhpd SM8250_MMCX>;
>                         required-opps = <&rpmhpd_opp_low_svs>;
>                         status = "disabled";
> 
> Not actually a required clock for the clock controller.
> 
> I suspect the same is true for dispcc and videocc though it would also mean the respective drivers would need to switch on <&gcc DISPx_CAMERA_AHB_CLK> or <&gcc GCC_VIDEO_AHB_CLK> prior to accessing registers inside the ip blocks which may not currently be the case.
> 
> Feels like a bit of a contrary answer but my reading is the GCC_IPBLOCK_AHB_CLK clocks belong in the drivers not the clock controllers..  or at least that's true for sm8250/camcc
I believe the idea here would be that registering GCC_IP_AHB_CLK
as a pm_clk for the clock controller would make that clock turn
on when IPBLOCK_CC is accessed (e.g. when we turn on
IPBLOCK_CORE_CLK), so that it doesn't need to be duplicated in
each and every end device.

Konrad
