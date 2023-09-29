Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17547B3693
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 17:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbjI2PWQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 11:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjI2PWN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 11:22:13 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293F41BE
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 08:22:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-406618d0992so3864925e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696000928; x=1696605728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JnHwM58QYMx5KAYuIRR4soj4Wvym3trDgG+7yy7IYc=;
        b=Tgj/FJmfNgjHixtlKW+mSV/eTr2w9kabcGE6ECigKjfGAcdR4FX9qXfJpTqm96teMR
         ckk4ap1wOFE7lGgjDPDlX+55SN+botgwAvzUZrtbWhDK2NuA7b/wORcyWmxSqUSlpz9h
         fOxc3MOPeFAVP0ZSne0NKFaSzoQQsnv8XYkFFQ81T0BF7wcZ7D1RiNcbje9R7HK85thy
         zi5Pc83MOis3NoNzHUYRWbiCAWW36vsWY0qkBfGRYd87rV2RFOV6fcQ+k0lGySlCJgTv
         cmN+hSNsGSqnAscUKDHmeVbAl9E3NmbKLvXlRXfHUQ5Sy8sf/Rhe2R3UVliuBqCmljpY
         wdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696000928; x=1696605728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+JnHwM58QYMx5KAYuIRR4soj4Wvym3trDgG+7yy7IYc=;
        b=UCfivbjuGpMhSgvw/o7f9wYUHeYAK0uJu9ilqbHmgjQFWyPNmLjUYXyoC+ulFAUU73
         UqhcqdzpVoMB8ai0dxZFXbtWki6N1pieowmUYY1l6W5eOVJgGDDPdYkPHRJ6ifM2A2a7
         qxgXJ3AEJE7aYGnJCg0X4mZGbMZZuQwuWKFp7NDSp3Z2kCm9uK4b0Oj7wINZ4ofkhfFH
         l1f2tliKN9Qbh30ktX7j4IySyRjy55SZPIkDKQoxTlj6Nv2+ksguLqMkO+rklvdGbTVv
         EJEHjT1Rw4mzf324BKRiqlNMoyNnJ91XDXaPniqta2MrZhdFYBShElmfsMC2yuEx65p1
         ke9A==
X-Gm-Message-State: AOJu0YyLwEKPhahH9PcjMM587ZCwUxtuXRvQIWmpLlYU0uNy2Au2zQ39
        XCH7fnhpmBHllQAiqLHthdM82w==
X-Google-Smtp-Source: AGHT+IG07vHmV3KpBTNzAoYbqJrwxGGwCodtJJb0vTpZBD5IVXpgOb/iBVrM0Soa8DbJ9w5vhMoMSA==
X-Received: by 2002:a05:600c:1d17:b0:406:545a:f8fe with SMTP id l23-20020a05600c1d1700b00406545af8femr4001499wms.29.1696000928477;
        Fri, 29 Sep 2023 08:22:08 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f7-20020a7bcc07000000b004053a2138bfsm1637486wmh.12.2023.09.29.08.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 08:22:08 -0700 (PDT)
Message-ID: <db5d00b5-5d18-4144-88c2-ff6cfb8c176a@linaro.org>
Date:   Fri, 29 Sep 2023 16:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Add Camera Control
 Interface busses
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <acc606a6-c46c-43f5-86e0-84bf876001dd@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <acc606a6-c46c-43f5-86e0-84bf876001dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 29/09/2023 15:18, Konrad Dybcio wrote:
> On 29.09.2023 16:15, Bryan O'Donoghue wrote:
>> On 29/09/2023 14:35, Konrad Dybcio wrote:
>>>
>>>
>>> On 9/29/23 10:01, Luca Weiss wrote:
>>>> Add the CCI busses found on sc7280 and their pinctrl states.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sc7280.dtsi | 136 +++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 136 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> index 66f1eb83cca7..65550de2e4ff 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> @@ -3793,6 +3793,86 @@ videocc: clock-controller@aaf0000 {
>>>>                #power-domain-cells = <1>;
>>>>            };
>>>> +        cci0: cci@ac4a000 {
>>>> +            compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
>>>> +            reg = <0 0x0ac4a000 0 0x1000>;
>>>> +            interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>>>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>>> +
>>>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>>>> +                 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>>>> +                 <&camcc CAM_CC_CCI_0_CLK>,
>>>> +                 <&camcc CAM_CC_CCI_0_CLK_SRC>;
>>>> +            clock-names = "camnoc_axi",
>>>> +                      "slow_ahb_src",
>>>> +                      "cpas_ahb",
>>>> +                      "cci",
>>>> +                      "cci_src";
>>> I guess this is more of a question to e.g. Bryan, but are all of these clocks actually necessary?
>>>
>>> Konrad
>> Hmm its a good question, we generally take the approach of adopting all of the downstream clocks for these camera interfaces verbatim.
>>
>> The clock plan for this part only calls out cci_X_clk and cci_x_clk_src for the CCI however we know that to be incomplete since we *absolutely* need to have the AXI for the block clocked to access those registers, same deal with the AHB bus.
>>
>> AXI: registers
>> AHB: data
>>
>> In the above list the only clock you might conceivably not need is CPAS_AHB_CLK.
>>
>> Let me zap that clock from sdm845 since I have an rb3 right in front of me and see what happens.
>>
>> Crash and reset
>>
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -4402,13 +4402,11 @@ cci: cci@ac4a000 {
>>                          clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
>>                                  <&clock_camcc CAM_CC_SOC_AHB_CLK>,
>>                                  <&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>> -                               <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
>>                                  <&clock_camcc CAM_CC_CCI_CLK>,
>>                                  <&clock_camcc CAM_CC_CCI_CLK_SRC>;
>>                          clock-names = "camnoc_axi",
>>                                  "soc_ahb",
>>                                  "slow_ahb_src",
>> -                               "cpas_ahb",
>>                                  "cci",
>>                                  "cci_src";
>>
>>
>> I think the list is good tbh
> WDYT about camcc consuming ahb, like dispcc does?
> AXI, hmm.. not quite sure what to do with it
> 
> Konrad

Hmm on which platform, camcc clock depds on sdm845 looks very sparse to me.

8550 OTOH

dispcc: clock-controller@af00000 {
        compatible = "qcom,sm8550-dispcc";
        reg = <0 0x0af00000 0 0x20000>;
        clocks = <&bi_tcxo_div2>,
                 <&bi_tcxo_ao_div2>,
                 <&gcc GCC_DISP_AHB_CLK>,

videocc: clock-controller@aaf0000 {
        compatible = "qcom,sm8550-videocc";
        reg = <0 0x0aaf0000 0 0x10000>;
        clocks = <&bi_tcxo_div2>,
                 <&gcc GCC_VIDEO_AHB_CLK>;

sm8250

camcc: clock-controller@ad00000 {
         compatible = "qcom,sm8250-camcc";
         reg = <0 0x0ad00000 0 0x10000>;
         clocks = <&gcc GCC_CAMERA_AHB_CLK>,

I think those DISP_AHB, VIDEO_AHB_CLK, CAMERA_AHB_CLKs should live in 
the display, video and camss blocks i.e. they are not clocks that you 
require to access the clock controller registers themselves...

I'm seeing for the most part these MEDIAIPBLOCK_AHB_CLKs don't come from 
the GCC AHB clock but from another root clock generator.

bi_tcxo ->
cam_cc_pll0_out_main ->
cam_cc_pll0_out_even ->
cam_cc_pll0_out_odd ->
cam_cc_pll2_out_main ->
                         cam_cc_slow_ahb_clk_src ->
                                    camcc_bps_ahb_clk
                                    camcc_ipe_0_ahb_clk
                                    ...
                                    camcc_core_ahb_clk

Lets see what happens to sm8250 if we remove CAMERA_AHB_CLK from the 
camera clock controller @ camcc: clock-controller@ad00000 {} I don't 
believe that is required.

...

Yep.. does SFA

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi 
b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1efa07f2caff4..1e7d9ee25eeae 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4172,11 +4172,10 @@ port@5 {
                 camcc: clock-controller@ad00000 {
                         compatible = "qcom,sm8250-camcc";
                         reg = <0 0x0ad00000 0 0x10000>;
-                       clocks = <&gcc GCC_CAMERA_AHB_CLK>,
-                                <&rpmhcc RPMH_CXO_CLK>,
+                       clocks = <&rpmhcc RPMH_CXO_CLK>,
                                  <&rpmhcc RPMH_CXO_CLK_A>,
                                  <&sleep_clk>;
-                       clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", 
"sleep_clk";
+                       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
                         power-domains = <&rpmhpd SM8250_MMCX>;
                         required-opps = <&rpmhpd_opp_low_svs>;
                         status = "disabled";

Not actually a required clock for the clock controller.

I suspect the same is true for dispcc and videocc though it would also 
mean the respective drivers would need to switch on <&gcc 
DISPx_CAMERA_AHB_CLK> or <&gcc GCC_VIDEO_AHB_CLK> prior to accessing 
registers inside the ip blocks which may not currently be the case.

Feels like a bit of a contrary answer but my reading is the 
GCC_IPBLOCK_AHB_CLK clocks belong in the drivers not the clock 
controllers..  or at least that's true for sm8250/camcc

ymmv

---
bod
