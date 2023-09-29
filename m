Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FFA7B34A7
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 16:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbjI2OPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 10:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbjI2OPV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 10:15:21 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199E810C9
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 07:15:15 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40566f8a093so110976035e9.3
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1695996913; x=1696601713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fo/ZMhzFTF6G7gZ+jZPeOdnwccHM0rKzSSb1DVm0Tfg=;
        b=p2glEL5fXsTtp1TuynekPMs2GvwJ289ScEdvRSWwnUCZiMKY7UvVR8Cd4M+VegASna
         NiFoLbnigJC5/1oYnSoXFfE/hBk3teNcTdB8wWp+buUYT/r0hPyfhTfxxhL82V4hVWwS
         5tgQPCbZ0Mnh3Q5QdNONzzuXBinAL9NI6Fuj7bKVjgl1j/hxbldugDjF4FmwmPIS/WlL
         0HQZkD03uThpNKmB00Rjl3+Tv2nKK9MVL+W3lQwyTfkieQtiTCw5LSk+Rp4HbYN/leyc
         Blk9AsV05zu1PvH21eqtuBS5dX+tTsg4mdBQtmrIdAba8ewANoHcCAAUR2noSBEEbNYi
         khVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996913; x=1696601713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo/ZMhzFTF6G7gZ+jZPeOdnwccHM0rKzSSb1DVm0Tfg=;
        b=ErMqJzVM4RCENhkUU3qv9vLg3IS6pgU4zDfRkz7zpu+G3W6Bqn56Tjef0obzG9BiuB
         adSuESnM9quu5qhChG7xZfjpf59D/x+lUW/b4ufeceM4ZnlT+ENWJd0nf0/FdoW+XOs5
         Fx4Qd6MALsIYjR+gXYuZH01Oa2Nv+s9zyBulBzJi3PpTpvnUZYaSDjgKKFD+j3Bbfxrf
         fqmbPr2DpTROPEn1e75ztEhux2aEl1mNVkOPz/x5UT7ZVwTMUM+6DgjtDznH9Ag2OU+R
         zEulnMza88yD2UYGuxfIwKPTqUVgBBTAxmRnQaeXiGJyeH/TQw+4Oy7Vbr2/AXZUI2fo
         8gng==
X-Gm-Message-State: AOJu0YzYPECS56RFCSBVnl3ZCs7GKq+6kavtv8UK6baYKvUwMeaqfDBD
        QMG6U1c+Cu1yAbxFy6qX4WUo6Q==
X-Google-Smtp-Source: AGHT+IEl78aziYLAgqWttNqnKzEHEnL1N0JwuOtWG4yqhPkHV7j1lZtvyST9tZptWvOWNWme4fhXlw==
X-Received: by 2002:a05:600c:2113:b0:405:1ba2:4fd1 with SMTP id u19-20020a05600c211300b004051ba24fd1mr4202922wml.24.1695996913089;
        Fri, 29 Sep 2023 07:15:13 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d698c000000b0031c8a43712asm21607937wru.69.2023.09.29.07.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 07:15:12 -0700 (PDT)
Message-ID: <1b5bd391-4bb0-44ac-88d1-e326bec4dd7d@nexus-software.ie>
Date:   Fri, 29 Sep 2023 15:15:11 +0100
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
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <8dd470e5-ce33-3d33-98f1-e66935ca7b56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29/09/2023 14:35, Konrad Dybcio wrote:
> 
> 
> On 9/29/23 10:01, Luca Weiss wrote:
>> Add the CCI busses found on sc7280 and their pinctrl states.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 136 
>> +++++++++++++++++++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 66f1eb83cca7..65550de2e4ff 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -3793,6 +3793,86 @@ videocc: clock-controller@aaf0000 {
>>               #power-domain-cells = <1>;
>>           };
>> +        cci0: cci@ac4a000 {
>> +            compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
>> +            reg = <0 0x0ac4a000 0 0x1000>;
>> +            interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CCI_0_CLK>,
>> +                 <&camcc CAM_CC_CCI_0_CLK_SRC>;
>> +            clock-names = "camnoc_axi",
>> +                      "slow_ahb_src",
>> +                      "cpas_ahb",
>> +                      "cci",
>> +                      "cci_src";
> I guess this is more of a question to e.g. Bryan, but are all of these 
> clocks actually necessary?
> 
> Konrad
Hmm its a good question, we generally take the approach of adopting all 
of the downstream clocks for these camera interfaces verbatim.

The clock plan for this part only calls out cci_X_clk and cci_x_clk_src 
for the CCI however we know that to be incomplete since we *absolutely* 
need to have the AXI for the block clocked to access those registers, 
same deal with the AHB bus.

AXI: registers
AHB: data

In the above list the only clock you might conceivably not need is 
CPAS_AHB_CLK.

Let me zap that clock from sdm845 since I have an rb3 right in front of 
me and see what happens.

Crash and reset

--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4402,13 +4402,11 @@ cci: cci@ac4a000 {
                         clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
                                 <&clock_camcc CAM_CC_SOC_AHB_CLK>,
                                 <&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
-                               <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
                                 <&clock_camcc CAM_CC_CCI_CLK>,
                                 <&clock_camcc CAM_CC_CCI_CLK_SRC>;
                         clock-names = "camnoc_axi",
                                 "soc_ahb",
                                 "slow_ahb_src",
-                               "cpas_ahb",
                                 "cci",
                                 "cci_src";


I think the list is good tbh

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
