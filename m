Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0B5675588
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 14:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjATNTS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 08:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjATNSh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 08:18:37 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48677C458A
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:16:09 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id s3so6729335edd.4
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gafe9P/3LkcqiXBJGXaZu00WTSPzwj/fCBVH8Ff8/6E=;
        b=H87wx7re1NhxJvF9wmt5LosXLmkltHWG4ikLnS2OFWmmRddGF1eCQZTFReJs5hC01S
         jT7hwVyZEAhueKavri13CGz50cCIGGznDjHAPGF0+ba6WYGm+PA9bHO2082nUOhJPX7g
         A69c3eXJE1v5RyDl/EBfy4/jBUybaFcejoDEH6ORWdtRmvbtxf4b6buU0dJeWX8hg4F6
         4s5kdG2Shlcr8+dbrYQCHWASLaQ8wprkF9hCdAXWdHFzmdk8oZMC4QUw5plnogXWE4+0
         3jPtH8b/rzwhX6gjw02TY5ZNLZMckrzcSiBKsMTWfdcHQ2nUMEsLhCUoJ6uW9THFewaR
         IShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gafe9P/3LkcqiXBJGXaZu00WTSPzwj/fCBVH8Ff8/6E=;
        b=iojPlVx5i7gWxIBNhb1P2xZ7xlOAwXaaujGi3J/EJgH5raOj8wwT5Gbgq7rwBY5UC+
         EUC9ndqJaGfC30BAekOdrlEIxSSrBi6C72On7IFJ86MPFTndj7p1m8fWvj0UCgKeo6Y8
         6tpjhgiW5LMJjmVLwHS4Y1/2GUW7KfV/1myRf7fPeE42IIq4lXwG9A2vqOL6g/mB7ueK
         55aJGV5IQ6Gee5I/sT5Dwgb0DUgoZrbPxIC93m7ux6cxcxFKRHbEULckLivWFBx4vIOm
         zoVL1b1ddPootOK9+MEOAEEK6yb2EUfoXpypnRX2kDCnqb/TZ3qa16vgvyKiJ+8dQxfU
         B4zw==
X-Gm-Message-State: AFqh2ko2PtqrRrke9NEx9dVhzitF5WFokxpJXAG9YERrg0Di1HeiWnw/
        Fwgs8vDqpRqX5FEa+qRcYZHIDw==
X-Google-Smtp-Source: AMrXdXtaBT/vlbufvsp44/JbzjNu62RrYibeiuVZ1/NI+JOP4CQ8dGXg9onBP/ZwQfjw8yUdu8DbNw==
X-Received: by 2002:aa7:de87:0:b0:49c:d620:4bf8 with SMTP id j7-20020aa7de87000000b0049cd6204bf8mr15535309edv.24.1674220567847;
        Fri, 20 Jan 2023 05:16:07 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906c30500b008552bc8399dsm14086113ejz.172.2023.01.20.05.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 05:16:07 -0800 (PST)
Message-ID: <ac74d330-713a-fd68-efce-9c01cc120a45@linaro.org>
Date:   Fri, 20 Jan 2023 14:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm6350: Add CCI nodes
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
 <20221213-sm6350-cci-v2-3-15c2c14c34bb@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221213-sm6350-cci-v2-3-15c2c14c34bb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 20.01.2023 14:13, Luca Weiss wrote:
> Add nodes for the two CCI blocks found on SM6350.
> 
> The first contains two i2c busses and while the second one might also
> contains two busses, the downstream kernel only has one configured, and
> some boards use the GPIOs for the potential cci1_i2c1 one other
> purposes, so leave that one unconfigured.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 132 +++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 300ced5cda57..802d7f494162 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/clock/qcom,gcc-sm6350.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm6350-camcc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
> @@ -1435,6 +1436,95 @@ usb_1_dwc3: usb@a600000 {
>  			};
>  		};
>  
> +		cci0: cci@ac4a000 {
> +			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac4a000 0 0x1000>;
> +			interrupts = <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAMCC_SOC_AHB_CLK>,
> +				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAMCC_CPAS_AHB_CLK>,
> +				 <&camcc CAMCC_CCI_0_CLK>,
> +				 <&camcc CAMCC_CCI_0_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "soc_ahb",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
> +
> +			assigned-clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +					  <&camcc CAMCC_CCI_0_CLK>;
> +			assigned-clock-rates = <80000000>, <37500000>;
> +
> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac4b000 {
> +			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac4b000 0 0x1000>;
> +			interrupts = <GIC_SPI 462 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAMCC_SOC_AHB_CLK>,
> +				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAMCC_CPAS_AHB_CLK>,
> +				 <&camcc CAMCC_CCI_1_CLK>,
> +				 <&camcc CAMCC_CCI_1_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "soc_ahb",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
> +
> +			assigned-clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +					  <&camcc CAMCC_CCI_1_CLK>;
> +			assigned-clock-rates = <80000000>, <37500000>;
> +
> +			pinctrl-0 = <&cci2_default>;
> +			pinctrl-1 = <&cci2_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
> +		};
> +
>  		camcc: clock-controller@ad00000 {
>  			compatible = "qcom,sm6350-camcc";
>  			reg = <0 0x0ad00000 0 0x16000>;
> @@ -1522,6 +1612,48 @@ tlmm: pinctrl@f100000 {
>  			#interrupt-cells = <2>;
>  			gpio-ranges = <&tlmm 0 0 157>;
>  
> +			cci0_default: cci0-default-state {
> +				pins = "gpio39", "gpio40";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				pins = "gpio39", "gpio40";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci2_default: cci2-default-state {
> +				pins = "gpio43", "gpio44";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci2_sleep: cci2-sleep-state {
> +				pins = "gpio43", "gpio44";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>  			sdc2_off_state: sdc2-off-state {
>  				clk-pins {
>  					pins = "sdc2_clk";
> 
