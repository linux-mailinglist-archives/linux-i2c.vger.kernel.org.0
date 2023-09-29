Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 127767B33B6
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 15:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbjI2NfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 09:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjI2NfT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 09:35:19 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29484DB
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 06:35:17 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9b2cee55056so191547666b.3
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695994515; x=1696599315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlAAhroIKSpL8+fyShtvqU4a0850NAbVSPJtR3BZY+4=;
        b=WaY5wUNgvCKUIzxujyB0gQfeq17jhI3LlZKWLsy+fDvAe73SivI9fxvp4GLq0qzpk0
         4vH9TIaVczXttp7p5Z8xzHnJL3e3Hc0LZhvwtBOWnrNrT2qztL7/YooxSDME9fhAHTFs
         tA59MT75IlhbKs8+z283q2ddFZ154mSYrtfgvjbjEaWnN59nbm/Ne7d73CoYFcwiTDlQ
         g19ZsszQsne5pTN6b1UjFlL2fB2cag1bQEC/rVfEz8npNLCyYqVyCrf3E5CywAyU/nHk
         Knurg91QzrwLPv/vpu8i9f/fiY9VxblPKNiMdkfFVvLulfSakoorttimMKm3gMtAIakO
         qrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994515; x=1696599315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlAAhroIKSpL8+fyShtvqU4a0850NAbVSPJtR3BZY+4=;
        b=e2f1eBqQLAhwUbKqYFSbq+gZqmbpM7Cqj1LIofoA/a7lqoyDjKuWi6yA1Dsr6q7LoA
         Ppo48UiBwo4khHpYanxxuPT5lPq9slJQYb2GqFDIcGFqGU+LOISK9Ufr/GfVyAMAHi9s
         xdRXMvsgrUCidRT6PZP0FHSoLKFtXyIR4vlqI8nvPLsWtWgqBgbesEtgpI1/s1OAMi9w
         YLSs8dA2tuRr6iPnKJ/NemCX5IHO5u8etMqeUwei8OqaybXXEoXR4n1EaRiuVpajojgP
         AYamaawD+mvYz3UkT9jmt+WHYCT0+7FjBpbhxSlReRU7o8yYNWailJoK6oAWxPI0+IMU
         7yIg==
X-Gm-Message-State: AOJu0Yx+0uHGnzTh09Vy4DEsStvyNUNqAOzzygby4mjLXTMD+8f+8onp
        u+R1t73VyeS191xwOCrZc9xggw==
X-Google-Smtp-Source: AGHT+IFB0gWCRdIz3y4FpDLEeFeD/l2I4205KcVLY5FFCUf6mhKQfziV+cURqsALwr4kjpJ9713mCQ==
X-Received: by 2002:a17:906:2189:b0:9b2:7584:80dc with SMTP id 9-20020a170906218900b009b2758480dcmr3707193eju.20.1695994515614;
        Fri, 29 Sep 2023 06:35:15 -0700 (PDT)
Received: from [192.168.0.123] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b009a193a5acffsm12231752ejk.121.2023.09.29.06.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 06:35:15 -0700 (PDT)
Message-ID: <8dd470e5-ce33-3d33-98f1-e66935ca7b56@linaro.org>
Date:   Fri, 29 Sep 2023 15:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Add Camera Control
 Interface busses
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230929-sc7280-cci-v1-2-16c7d386f062@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/29/23 10:01, Luca Weiss wrote:
> Add the CCI busses found on sc7280 and their pinctrl states.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 136 +++++++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 66f1eb83cca7..65550de2e4ff 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3793,6 +3793,86 @@ videocc: clock-controller@aaf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac4a000 {
> +			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac4a000 0 0x1000>;
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
I guess this is more of a question to e.g. Bryan, but are all of these 
clocks actually necessary?

Konrad
