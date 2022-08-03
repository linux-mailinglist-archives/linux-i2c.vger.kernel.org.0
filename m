Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADB6588F98
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 17:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238169AbiHCPoS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 11:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238176AbiHCPoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 11:44:18 -0400
X-Greylist: delayed 514 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 03 Aug 2022 08:44:16 PDT
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08A33E767
        for <linux-i2c@vger.kernel.org>; Wed,  3 Aug 2022 08:44:16 -0700 (PDT)
Received: from [192.168.1.101] (abxi232.neoplus.adsl.tpnet.pl [83.9.2.232])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E29413F751;
        Wed,  3 Aug 2022 17:35:39 +0200 (CEST)
Message-ID: <e53cee9d-8eb8-6f8c-4b88-5dedb394a758@somainline.org>
Date:   Wed, 3 Aug 2022 17:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] ARM: dts: qcom: use GPIO flags for tlmm
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
 <20220802153947.44457-5-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220802153947.44457-5-krzysztof.kozlowski@linaro.org>
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
>  arch/arm/boot/dts/qcom-apq8074-dragonboard.dts           | 3 ++-
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi            | 3 ++-
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi            | 4 ++--
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts          | 5 +++--
>  arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
>  5 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 3051a861ff0c..91716298ec5e 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/gpio/gpio.h>
>  #include "qcom-msm8974.dtsi"
>  #include "qcom-pm8841.dtsi"
>  #include "qcom-pm8941.dtsi"
> @@ -261,7 +262,7 @@ &sdhc_1 {
>  &sdhc_2 {
>  	status = "okay";
>  
> -	cd-gpios = <&tlmm 62 0x1>;
> +	cd-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
>  	vmmc-supply = <&pm8941_l21>;
>  	vqmmc-supply = <&pm8941_l13>;
>  
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> index 03bb9e1768c4..0505270cf508 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> @@ -14,6 +14,7 @@
>   *
>   */
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include "qcom-ipq4019.dtsi"
>  
>  / {
> @@ -72,7 +73,7 @@ spi@78b5000 {
>  			pinctrl-0 = <&spi_0_pins>;
>  			pinctrl-names = "default";
>  			status = "okay";
> -			cs-gpios = <&tlmm 54 0>;
> +			cs-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
>  
>  			mx25l25635e@0 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
> index 44a9597d8bfd..c2f5222e72de 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
> @@ -87,7 +87,7 @@ spi@78b5000 { /* BLSP1 QUP1 */
>  			pinctrl-0 = <&spi_0_pins>;
>  			pinctrl-names = "default";
>  			status = "okay";
> -			cs-gpios = <&tlmm 12 0>;
> +			cs-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
>  
>  			flash@0 {
>  				#address-cells = <1>;
> @@ -100,7 +100,7 @@ flash@0 {
>  
>  		pci@40000000 {
>  			status = "okay";
> -			perst-gpio = <&tlmm 38 0x1>;
> +			perst-gpio = <&tlmm 38 GPIO_ACTIVE_LOW>;
>  		};
>  
>  		qpic-nand@79b0000 {
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
> index c7a6e77da272..7fc33149060c 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include "qcom-ipq4019-ap.dk07.1.dtsi"
>  
>  / {
> @@ -10,7 +11,7 @@ / {
>  	soc {
>  		pci@40000000 {
>  			status = "okay";
> -			perst-gpio = <&tlmm 38 0x1>;
> +			perst-gpio = <&tlmm 38 GPIO_ACTIVE_LOW>;
>  		};
>  
>  		spi@78b6000 {
> @@ -50,7 +51,7 @@ spi@78b5000 {
>  			pinctrl-0 = <&spi_0_pins>;
>  			pinctrl-names = "default";
>  			status = "okay";
> -			cs-gpios = <&tlmm 12 0>;
> +			cs-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
>  
>  			flash@0 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index ec5d340562b6..6daceaa87802 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -175,7 +175,7 @@ i2c-gate {
>  			ak8963@f {
>  				compatible = "asahi-kasei,ak8963";
>  				reg = <0x0f>;
> -				gpios = <&tlmm 67 0>;
> +				gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
>  				vid-supply = <&pm8941_lvs1>;
>  				vdd-supply = <&pm8941_l17>;
>  			};
