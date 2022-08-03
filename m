Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CF3588F99
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 17:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbiHCPoT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 11:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbiHCPoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 11:44:18 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05C419299
        for <linux-i2c@vger.kernel.org>; Wed,  3 Aug 2022 08:44:16 -0700 (PDT)
Received: from [192.168.1.101] (abxi232.neoplus.adsl.tpnet.pl [83.9.2.232])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 15FA43F6D1;
        Wed,  3 Aug 2022 17:36:23 +0200 (CEST)
Message-ID: <ca31bcd1-84ae-fbb4-74b0-c214969eecf2@somainline.org>
Date:   Wed, 3 Aug 2022 17:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: use GPIO flags for tlmm
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     corbet@lwn.net
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
 <20220802153947.44457-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220802153947.44457-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2.08.2022 17:39, Krzysztof Kozlowski wrote:
> Use respective GPIO_ACTIVE_LOW/HIGH flags for tlmm GPIOs.  Include
> gpio.h header if this is first usage of that flag.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts               | 2 +-
>  arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8994.dtsi                      | 3 ++-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi                      | 3 ++-
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                 | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts       | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts         | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts       | 2 +-
>  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts           | 2 +-
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts                    | 2 +-
>  10 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> index 567b33106556..92f264891d84 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> @@ -368,7 +368,7 @@ &sdhc2 {
>  
>  	bus-width = <4>;
>  
> -	cd-gpios = <&tlmm 38 0x1>;
> +	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
>  
>  	vmmc-supply = <&vreg_l21a_2p95>;
>  	vqmmc-supply = <&vreg_l13a_2p95>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
> index f430d797196f..ff60b7004d26 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
> @@ -471,7 +471,7 @@ &sdhc1 {
>  &sdhc2 {
>  	status = "okay";
>  
> -	cd-gpios = <&tlmm 100 0>;
> +	cd-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
>  	vmmc-supply = <&pm8994_l21>;
>  	vqmmc-supply = <&pm8994_l13>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 8bc6c070e306..86ef0091caff 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,gcc-msm8994.h>
>  #include <dt-bindings/clock/qcom,mmcc-msm8994.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  
>  / {
> @@ -502,7 +503,7 @@ sdhc2: mmc@f98a4900 {
>  			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
>  			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
>  
> -			cd-gpios = <&tlmm 100 0>;
> +			cd-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
>  			bus-width = <4>;
>  			status = "disabled";
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 742eac4ce9b3..0815b31c9e10 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/interconnect/qcom,msm8996.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/thermal/thermal.h>
> @@ -3337,7 +3338,7 @@ wcd9335: codec@1{
>  					interrupt-names = "intr1", "intr2";
>  					interrupt-controller;
>  					#interrupt-cells = <1>;
> -					reset-gpios = <&tlmm 64 0>;
> +					reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>  
>  					slim-ifc-dev = <&tasha_ifd>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index f313f6964810..dff49e3dfe56 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1081,7 +1081,7 @@ &wcd9340{
>  	pinctrl-names = "default";
>  	clock-names = "extclk";
>  	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> -	reset-gpios = <&tlmm 64 0>;
> +	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>  	vdd-buck-supply = <&vreg_s4a_1p8>;
>  	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
>  	vdd-tx-supply = <&vreg_s4a_1p8>;
> @@ -1251,7 +1251,7 @@ camera@60 {
>  		reg = <0x60>;
>  
>  		// CAM3_RST_N
> -		enable-gpios = <&tlmm 21 0>;
> +		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam3_default>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index 82c27f90d300..0f470cf1ed1c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> @@ -546,7 +546,7 @@ &wcd9340{
>  	pinctrl-names = "default";
>  	clock-names = "extclk";
>  	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> -	reset-gpios = <&tlmm 64 0>;
> +	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>  	vdd-buck-supply = <&vreg_s4a_1p8>;
>  	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
>  	vdd-tx-supply = <&vreg_s4a_1p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> index 7747081b9887..6a2b98c23628 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> @@ -126,7 +126,7 @@ vreg_tp_vddio: vreg-tp-vddio {
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <1800000>;
>  
> -		gpio = <&tlmm 23 0>;
> +		gpio = <&tlmm 23 GPIO_ACTIVE_HIGH>;
>  		regulator-always-on;
>  		regulator-boot-on;
>  		enable-active-high;
> @@ -712,7 +712,7 @@ &wcd9340 {
>  	pinctrl-names = "default";
>  	clock-names = "extclk";
>  	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> -	reset-gpios = <&tlmm 64 0>;
> +	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>  	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
>  	vdd-buck-supply = <&vreg_s4a_1p8>;
>  	vdd-tx-supply = <&vreg_s4a_1p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index a7af1bed4312..be59a8ba9c1f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -772,7 +772,7 @@ &wcd9340{
>  	pinctrl-names = "default";
>  	clock-names = "extclk";
>  	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> -	reset-gpios = <&tlmm 64 0>;
> +	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>  	vdd-buck-supply = <&vreg_s4a_1p8>;
>  	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
>  	vdd-tx-supply = <&vreg_s4a_1p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> index b0315eeb1320..f954fe5cb61a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> @@ -704,7 +704,7 @@ &wcd9340{
>  	pinctrl-names = "default";
>  	clock-names = "extclk";
>  	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> -	reset-gpios = <&tlmm 64 0>;
> +	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>  	vdd-buck-supply = <&vreg_s4a_1p8>;
>  	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
>  	vdd-tx-supply = <&vreg_s4a_1p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> index 7ab3627cc347..a102aa5efa32 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> @@ -635,7 +635,7 @@ &soc {
>  	wcd938x: codec {
>  		compatible = "qcom,wcd9380-codec";
>  		#sound-dai-cells = <1>;
> -		reset-gpios = <&tlmm 32 0>;
> +		reset-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
>  		vdd-buck-supply = <&vreg_s4a_1p8>;
>  		vdd-rxtx-supply = <&vreg_s4a_1p8>;
>  		vdd-io-supply = <&vreg_s4a_1p8>;
