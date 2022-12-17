Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9714764F8CC
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 11:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiLQK6r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 05:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbiLQK6q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 05:58:46 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EF5636A
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:58:45 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m29so6952720lfo.11
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vH+Qf1qNqoa6LSK/oJrnU6JcVq/+Xdmk69TeAJOsb8o=;
        b=ZL43STlBtL4OnrYlLeBaoXrhcJMiyesIgktxakTbHyqVQD1xLW25KgMfHRRry3Zs/d
         s8lIoWv79qZnZpGyJynxcVzPsrP+DwfhRdn6Ets+oVM+NjhrSAcWu+Qbg7a3S/I3S77U
         Brv4b7Z5WxfvKGTob7f6fZlG2/MnO1ekvouX6O0oV/W4VtX44c/BaoV83f97BcJcCjMA
         UL4sN52FwccT10wWLn7gi+AnFnhAsJshtxXO/wbsBjUhkZEt7jpsOio1Xj6sSoL4klSk
         6BA68G4XrNN9gX6jUuHSFSglzuyZ13uQIXR3zK+73HnPxqenB9vQkz5OoyzaUebVwuo3
         OUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vH+Qf1qNqoa6LSK/oJrnU6JcVq/+Xdmk69TeAJOsb8o=;
        b=l37qnrZJqAgQC5GC754kMHBiiphI3NLMJBk2avDv7CWO5E0Z/0hNljfSrqBez4k11d
         TVblzpcJ6PidLAGRoqxgWBquxsRVT3KNzxZyGM62Qr+7DsBcZ79ACUeb7MWKCEBtavTW
         TyJ7unuOKu3hsupnx7j69NPUFYVO0HRtAOurp1w4RKsWGInUVwPLGAhr83/9B0Sz60XO
         qtIZxnQSPwZP0nvyb2/sb7BCk8jZ94sxQZANnPvc0q+gZdgd0cCPY+DBV3mUYsyjSvDP
         +N5t36viOLFieLwD138OmNqNh1NvnigoRHhn9tqontpygTztvttxsRlnPowLv55x/yX9
         hiFA==
X-Gm-Message-State: ANoB5pnNvmGSPBdpL8vwAfMHOhF4QT7sESb+Qa2qGu1Ehf2WPoCQlGOr
        TAUvutHVc8hL0QsxRwG7Cd9vWQ==
X-Google-Smtp-Source: AA0mqf5wT3ntTMt+i8dtAJ3QoNcyWZIS38qjTI7TINNrwlleIXai4do90gsEtW/4Rzzd6MSGiqsSWg==
X-Received: by 2002:a05:6512:3d2:b0:4b3:9fdc:1697 with SMTP id w18-20020a05651203d200b004b39fdc1697mr9243579lfp.47.1671274724079;
        Sat, 17 Dec 2022 02:58:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bd8-20020a05651c168800b00279e0b8bae7sm295980ljb.65.2022.12.17.02.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 02:58:43 -0800 (PST)
Message-ID: <0a537c59-acd7-3f7f-8618-cc0e91a6a58a@linaro.org>
Date:   Sat, 17 Dec 2022 11:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 4/6] ARM: dts: hpe: Add I2C Topology
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
 <20221216183532.78933-5-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216183532.78933-5-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/12/2022 19:35, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add 9 I2C Engines, 2 MUXs, and a EEPROM to the device tree.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm/boot/dts/hpe-bmc-dl360gen10.dts |  72 ++++++++++++++
>  arch/arm/boot/dts/hpe-gxp.dtsi           | 115 +++++++++++++++++++++++
>  2 files changed, 187 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> index 3a7382ce40ef..d9008e2cfed3 100644
> --- a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> +++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> @@ -23,4 +23,76 @@
>  		device_type = "memory";
>  		reg = <0x40000000 0x20000000>;
>  	};
> +
> +	i2cmux@4 {
> +		compatible = "i2c-mux-reg";
> +		i2c-parent = <&i2c4>;
> +		reg = <0xd1000074 1>;

Did you check this? `dtbs_check` and `dtbs W=1`? Reg looks different
than unit.

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c4@1 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

i2c@

> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +> +		i2c4@3 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c4@4 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	i2cmux@6 {
> +		compatible = "i2c-mux-reg";
> +		i2c-parent = <&i2c6>;
> +		reg = <0xd1000076 1>;

Same question.

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c6@1 {

and so on...

> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c6@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c6@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c6@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c6@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		pagesize = <8>;
> +		reg = <0x50>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/hpe-gxp.dtsi b/arch/arm/boot/dts/hpe-gxp.dtsi
> index cf735b3c4f35..27e68932021c 100644
> --- a/arch/arm/boot/dts/hpe-gxp.dtsi
> +++ b/arch/arm/boot/dts/hpe-gxp.dtsi
> @@ -122,6 +122,121 @@
>  				interrupts = <6>;
>  				interrupt-parent = <&vic0>;
>  			};
> +
> +			sysreg_system_controller: syscon@f8 {
> +				compatible = "hpe,gxp-sysreg", "syscon";
> +				reg = <0xf8 0x8>;
> +			};
> +
> +			i2c0: i2c@2000 {
> +				compatible = "hpe,gxp-i2c";
> +				reg = <0x2000 0x70>;
> +				interrupts = <9>;
> +				interrupt-parent = <&vic0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				hpe,sysreg-phandle = <&sysreg_system_controller>;
> +				hpe,i2c-max-bus-freq = <100000>;

Busses should stay disabled in DTSI and only enabled by specific board,
when needed.

> +			};
> +
> +			i2c1: i2c@2100 {
> +				compatible = "hpe,gxp-i2c";
> +				reg = <0x2100 0x70>;
> +				interrupts = <9>;
> +				interrupt-parent = <&vic0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				hpe,sysreg-phandle = <&sysreg_system_controller>;
> +				hpe,i2c-max-bus-freq = <100000>;
> +			};
> +

Best regards,
Krzysztof

