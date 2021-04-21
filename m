Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3D8366957
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Apr 2021 12:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237528AbhDUKiu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Apr 2021 06:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234705AbhDUKir (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Apr 2021 06:38:47 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4791AC06174A;
        Wed, 21 Apr 2021 03:38:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id w3so62822826ejc.4;
        Wed, 21 Apr 2021 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=86K3DqgdI6PmMZ1PotS8DuNX9pS7zE6BvMTj90x596g=;
        b=Y659qs29TOqgE5P8ePUqNq3xMEK+Hfto4RTgCeuc6yKZSA042xIEOSavqdhqNA+WlA
         hbLa2lQVcYvcKrVKWr4GDPwXqwEIHhiBrEcdyuwWJEPzWVW3aJZ03ssIT9WfvwmLR5vv
         mDQVnxws/7vsIqTf9yKf3UZmv2Q/hO1gIK+2IylUX+w4zw6YeW6Kk9Q9LwYXEh+k03lv
         xIGEW5KU6ahDwsYzX9MXs9Kr+daYmwi3UmT0JHukNJ0NhXFkg2RI6uaXGRAxvldJmEip
         1rMogEwFf0YcRhimbh66dNfRGXeWj6zBgrQjELAxQfDy5H1ZOWy3rSueEF2xNPUfrGik
         OxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=86K3DqgdI6PmMZ1PotS8DuNX9pS7zE6BvMTj90x596g=;
        b=frnJL3BYqU+vr+R5GDcNVY5QGEbYULyjazGTT8TQoJ4/BF7iwCaesJVcMjk6k6773a
         yguX5r/b3yv9ZbYji9dCD2ScwYAPpYcFwRdfVOATPfbBCVEa0VjqJv465o8Mc1keEmr4
         Z1U0aCUx9+2+hiabJKwaVMBTrSju99GQWp/cOcOBSQit6oAT+4FDszrL/ExA6ZbkQo31
         JkH2He1QKvCXNIIjJo4JS9JSyxT7qMX2MYoFcidDUPf9QWdUj6ql8UJjsv+EWVVXHzws
         2kuqZqRUANsrMwrttl7PPXr9zWZV7tLLfiN7g8sKomiN+7B/tfQ4kFz/On9tu1K61Jgk
         e+GA==
X-Gm-Message-State: AOAM530IulNyLvDytffph1NtzSWWbQBG6z0fGaoWc+r0PQ6w33zfiqqj
        xwnCP1VCbuaykhbDLIck82U=
X-Google-Smtp-Source: ABdhPJwbWWZmQM6tijiQ0M4mvq1Y/300ScRabGg7M6edrJdQUrXFbai/lLfbmMBXv0T9CVtVwOzGBQ==
X-Received: by 2002:a17:906:85cb:: with SMTP id i11mr31118454ejy.311.1619001491938;
        Wed, 21 Apr 2021 03:38:11 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id y11sm2789410eds.10.2021.04.21.03.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 03:38:11 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] arm64: dts: rockchip: add basic dts for RK3568 EVB
To:     cl@rock-chips.com, heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com
References: <20210421065921.23917-1-cl@rock-chips.com>
 <20210421070115.24000-1-cl@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <cfc45d41-d16b-a643-4d13-5ff898739f02@gmail.com>
Date:   Wed, 21 Apr 2021 12:38:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210421070115.24000-1-cl@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liang,

Add and convert a few more documents.

> cat rk3568.dtsi | grep compatible | sort -u
> 		compatible = "arm,armv8-timer";
> 			compatible = "arm,cortex-a55";
> 		compatible = "arm,cortex-a55-pmu", "arm,armv8-pmuv3";
> 		compatible = "arm,gic-v3";
> 		compatible = "arm,pl330", "arm,primecell";
> 		compatible = "arm,psci-1.0";
> 		compatible = "arm,scmi-shmem";
> 			compatible = "arm,scmi-smc";
> 		compatible = "fixed-clock";
> 		compatible = "operating-points-v2";

> 			compatible = "rockchip,gpio-bank";

pending

> 	compatible = "rockchip,rk3568";
> 		compatible = "rockchip,rk3568-cru";

pending

> 		compatible = "rockchip,rk3568-dwcmshc", "snps,dwcmshc-sdhci";
> 		compatible = "rockchip,rk3568-dw-mshc",

Keep string in one line for sdmmcX.

> 		compatible = "rockchip,rk3568-grf", "syscon", "simple-mfd";
> 		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";

> 		compatible = "rockchip,rk3568-pinctrl";

pending

> 		compatible = "rockchip,rk3568-pmucru";
> 		compatible = "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";
> 		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> 		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";

> 		compatible = "snps,dw-wdt";

Change this to:
              "rockchip,rk3568-wdt", "snps,dw-wdt"

Compatible strings should be SoC orientated.

> 			compatible = "syscon-reboot-mode";


On 4/21/21 9:01 AM, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> This patch add rk3568-evb1-v10.dts for RK3568 evaluation board.
> add uart/emmc/i2c/rk809 node for basic function.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 382 ++++++++++++++++++
>  3 files changed, 388 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 4a6f772c1043..d26b062a9f0e 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -560,6 +560,11 @@ properties:
>            - const: rockchip,rk3368-evb-act8846
>            - const: rockchip,rk3368
>  

> +      - description: Rockchip RK3568 Evaluation board
> +        items:
> +          - const: rockchip,rk3568-evb1-v10
> +          - const: rockchip,rk3568
> +

Move this below rockchip,rk3399-evb board.

>        - description: Rockchip RK3399 Evaluation board
>          items:
>            - const: rockchip,rk3399-evb
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index c3e00c0e2db7..7fdb41de01ec 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -51,3 +51,4 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-evb1-v10.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> new file mode 100644
> index 000000000000..be8aae2e8c67
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "rk3568.dtsi"
> +
> +/ {
> +	model = "Rockchip RK3568 EVB1 DDR4 V10 Board";
> +	compatible = "rockchip,rk3568-evb1-v10", "rockchip,rk3568";
> +
> +	chosen: chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	dc_12v: dc-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_12v";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	vcc3v3_sys: vcc3v3-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&dc_12v>;
> +	};
> +
> +	vcc5v0_sys: vcc5v0-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&dc_12v>;
> +	};
> +
> +	vcc5v0_host: vcc5v0-host-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc5v0_host_en>;
> +		regulator-name = "vcc5v0_host";
> +		regulator-always-on;
> +	};
> +
> +	vcc5v0_otg: vcc5v0-otg-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc5v0_otg_en>;
> +		regulator-name = "vcc5v0_otg";
> +	};
> +
> +	vcc3v3_lcd0_n: vcc3v3-lcd0-n {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_lcd0_n";
> +		regulator-boot-on;

Add empty line between a node.
Change all of them.

> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc3v3_lcd1_n: vcc3v3-lcd1-n {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_lcd1_n";
> +		regulator-boot-on;

dito

> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	rk809: pmic@20 {
> +		compatible = "rockchip,rk809";
> +		reg = <0x20>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default", "pmic-sleep",
> +				"pmic-power-off", "pmic-reset";
> +		pinctrl-0 = <&pmic_int>;
> +		pinctrl-1 = <&soc_slppin_slp>, <&rk817_slppin_slp>;
> +		pinctrl-2 = <&soc_slppin_gpio>, <&rk817_slppin_pwrdn>;
> +		pinctrl-3 = <&soc_slppin_gpio>, <&rk817_slppin_rst>;
> +
> +		rockchip,system-power-controller;
> +		wakeup-source;
> +		#clock-cells = <1>;
> +		clock-output-names = "rk808-clkout1", "rk808-clkout2";

> +		//fb-inner-reg-idxs = <2>;
> +		/* 1: rst regs (default in codes), 0: rst the pmic */

Where is documented?

> +		pmic-reset-func = <0>;

Where is documented?

> +
> +		vcc1-supply = <&vcc3v3_sys>;
> +		vcc2-supply = <&vcc3v3_sys>;
> +		vcc3-supply = <&vcc3v3_sys>;
> +		vcc4-supply = <&vcc3v3_sys>;
> +		vcc5-supply = <&vcc3v3_sys>;
> +		vcc6-supply = <&vcc3v3_sys>;
> +		vcc7-supply = <&vcc3v3_sys>;
> +		vcc8-supply = <&vcc3v3_sys>;
> +		vcc9-supply = <&vcc3v3_sys>;
> +

> +		pwrkey {
> +			status = "okay";
> +		};
> +

Where is documented?

> +		pinctrl_rk8xx: pinctrl_rk8xx {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			rk817_slppin_null: rk817_slppin_null {
> +				pins = "gpio_slp";
> +				function = "pin_fun0";
> +			};
> +
> +			rk817_slppin_slp: rk817_slppin_slp {
> +				pins = "gpio_slp";
> +				function = "pin_fun1";
> +			};
> +
> +			rk817_slppin_pwrdn: rk817_slppin_pwrdn {
> +				pins = "gpio_slp";
> +				function = "pin_fun2";
> +			};
> +
> +			rk817_slppin_rst: rk817_slppin_rst {
> +				pins = "gpio_slp";
> +				function = "pin_fun3";
> +			};
> +		};


Where is documented?

> +
> +		regulators {
> +			vdd_logic: DCDC_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-init-microvolt = <900000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-initial-mode = <0x2>;

> +				regulator-name = "vdd_logic";

regulator-name above all other regulator properties.
Change all of them.

> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_gpu: DCDC_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-init-microvolt = <900000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-initial-mode = <0x2>;
> +				regulator-name = "vdd_gpu";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-initial-mode = <0x2>;
> +				regulator-name = "vcc_ddr";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vdd_npu: DCDC_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-init-microvolt = <900000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-initial-mode = <0x2>;
> +				regulator-name = "vdd_npu";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdda0v9_image: LDO_REG1 {
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-name = "vdda0v9_image";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdda_0v9: LDO_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-name = "vdda_0v9";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdda0v9_pmu: LDO_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-name = "vdda0v9_pmu";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <900000>;
> +				};
> +			};
> +
> +			vccio_acodec: LDO_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vccio_acodec";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vccio_sd: LDO_REG5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vccio_sd";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc3v3_pmu: LDO_REG6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc3v3_pmu";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcca_1v8: LDO_REG7 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcca_1v8";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcca1v8_pmu: LDO_REG8 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcca1v8_pmu";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcca1v8_image: LDO_REG9 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcca1v8_image";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8: DCDC_REG5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc_1v8";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3: SWITCH_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vcc_3v3";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc3v3_sd: SWITCH_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vcc3v3_sd";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +
> +&pinctrl {
> +	pmic {
> +		pmic_int: pmic_int {
> +			rockchip,pins =
> +				<0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		soc_slppin_gpio: soc_slppin_gpio {
> +			rockchip,pins =
> +				<0 RK_PA2 RK_FUNC_GPIO &pcfg_output_low>;
> +		};
> +
> +		soc_slppin_slp: soc_slppin_slp {
> +			rockchip,pins =
> +				<0 RK_PA2 1 &pcfg_pull_none>;
> +		};
> +
> +		soc_slppin_rst: soc_slppin_rst {
> +			rockchip,pins =
> +				<0 RK_PA2 2 &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb {

> +		vcc5v0_host_en: vcc5v0-host-en {
> +			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		vcc5v0_otg_en: vcc5v0-otg-en {
> +			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;


Keep the same indent as in pmic and rk3568.dtsi for rockchip,pins

> +		};
> +	};
> +};
> +
> +&sdhci {
> +	bus-width = <8>;

> +	non-removable;
> +	rockchip,txclk-tapnum = <0x8>;
> +	max-frequency = <200000000>;

sort

> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> 

