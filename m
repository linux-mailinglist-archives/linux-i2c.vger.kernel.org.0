Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E68C36B2DE
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Apr 2021 14:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhDZMRf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Apr 2021 08:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhDZMRe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Apr 2021 08:17:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15993C061574;
        Mon, 26 Apr 2021 05:16:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g14so5770492edy.6;
        Mon, 26 Apr 2021 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BBvPqfwRtTjC0FrzmC7tPuO4cFA3KhwonrlnBA8L0wA=;
        b=jaopDXe8bqhrb0WRhfAwLoZ0XJz/v7SRxMXBYcrJhubdsGsC3Gdn7eJhi9R3mvmkKP
         06Zz7sUGtZ8dPcM/Ys+ZIkKLzcuV+3r9zH8aogtxQJCMh0o3uwvg21NxznXoLNuEj7S9
         jOY35wbA2fUvNG979CUoSGFtcw/ax29xEgWB67fwyuBRBFzJZeBvUPnbVpDxT/MCu2CJ
         +/DG6jIX/x3AL7cs1a5qDUTpFGNBsHlHCWAbJno+A+B0rcR7ubotyBVIghzWyH2Uncvl
         LFzhNPCB416mWJbgY32ZyBfQeCUjQ4IEMqVjFoe+38rv3jV5BLgmapeRAWOxZAOwtDUy
         qKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BBvPqfwRtTjC0FrzmC7tPuO4cFA3KhwonrlnBA8L0wA=;
        b=SgguiOts4jMC4HrWfqLdblYRPLdxUAclLghFwdEOA0UJL+LiPeTRRRkjW8N4S09KgR
         VUivQ3+TY40HACXnjQH4osY/Pn/ba/+HApR05kTXlrjm1gaamkComUl36BwR7Q4ZkuOb
         wo4nDeqExpdgGu4y2TcylndWFJh1AXjZZ9+9ztmPYVwNS6DjJ6XHKDd5TSrjrGpVJwQ3
         AeDfcNQavVrj5aBkMvkgoBcDjgL9+FKd8AgmRlO6N3336vxTP6Z5e52igKjofb3dO+ge
         4jtTT5+WKTE3pRTpsad8gJxo1kYFWwW9ZmZpK9iYpuytI5Q31hdE6b+5WCHGepSB8tWa
         IT4w==
X-Gm-Message-State: AOAM530nPzIGtwVhaaCznbNy4MbccD6rVgpQ5r6iFN8moYLoyTHpuv+e
        Bx2BWKiIL8rqQms30dD47CG0POKjL+Csmv7I
X-Google-Smtp-Source: ABdhPJyhBsyAfiA9utw3NO7J2H2rfO7FZwA6tIRV3E16rGQQkV6hV6aPpy2qBi4i/tEkv32J7H4hug==
X-Received: by 2002:a05:6402:5189:: with SMTP id q9mr20774396edd.168.1619439411462;
        Mon, 26 Apr 2021 05:16:51 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q6sm11239212ejt.51.2021.04.26.05.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 05:16:51 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] arm64: dts: rockchip: add core dtsi for RK3568 SoC
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
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org
References: <20210425094216.25724-1-cl@rock-chips.com>
 <20210425094439.25895-1-cl@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <3d584cdc-020e-5aae-cae3-59ef45e64a9f@gmail.com>
Date:   Mon, 26 Apr 2021 14:16:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210425094439.25895-1-cl@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liang,

Some minor things to improve.
Found with the command below.

make ARCH=arm64 dtbs_check
===

pwm-rockchip.yaml is now in linux-next
Maybe add rockchip,rk3568-pwm too.

===

compatible = "rockchip,rk3568";
Maybe add this together with other rkXXXX SoCs to rockchip.yaml on top
of board list ???
Please advise.

===

Change rockchip,gpio-bank.yaml

  clocks:
    maxItems: 2

===

TODO:
rockchip,rk3568-grf
rockchip,rk3568-pmugrf

===

git am
PATCH-v2-5-7-arm64-dts-rockchip-add-generic-pinconfig-settings-used-by-most-Rockchip-socs.patch
Applying: arm64: dts: rockchip: add generic pinconfig settings used by
most Rockchip socs
.git/rebase-apply/patch:356: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

===

Change commit message in:
[PATCH v2 3/7] dt-bindings: mmc: rockchip-dw-mshc: add description for
rk3568

from:
add "rockchip,rk3568-dwcmshc", "snps,dwcmshc-sdhci" for mmc nodes on
a rk3568 platform to rockchip-dw-mshc.yaml.

to:
... "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc" ...

Do not mix dw-mshc and dwcmshc. ;)

===

Johan

On 4/25/21 11:44 AM, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> RK3568 is a high-performance and low power quad-core application processor
> designed for personal mobile internet device and AIoT equipments. This patch
> add basic core dtsi file for it.
> 
> We use scmi_clk for cortex-a55 instead of standard ARMCLK, so that
> kernel/uboot/rtos can change cpu clk with the same code in ATF, and we will
> enalbe a special high-performacne PLL when high frequency is required. The
> smci_clk code is in ATF, and clkid for cpu is 0, as below:
> 
>     cpu0: cpu@0 {
>         device_type = "cpu";
>         compatible = "arm,cortex-a55";
>         reg = <0x0 0x0>;
>         clocks = <&scmi_clk 0>;
>     };
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 3119 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  812 +++++
>  2 files changed, 3931 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
> 

[..]

> +
> +	gpio {

From gpio.yaml

properties:
  gpio:
    # 'gpio' can appear as a property or node name
    oneOf:
      - type: object
      - $ref: "/schemas/types.yaml#/definitions/phandle-array"


> +		/omit-if-no-ref/

> +		tsadc_gpio: tsadc-gpio {

From gpio-consumer.yaml

properties:
  gpios:
    $ref: "/schemas/types.yaml#/definitions/phandle-array"

patternProperties:
  "(?<!,nr)-gpios?$":
    $ref: "/schemas/types.yaml#/definitions/phandle-array"

===

Try to avoid anything with gpio.

> +			rockchip,pins =
> +				<0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> new file mode 100644
> index 000000000000..66cb50218ca1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -0,0 +1,812 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/rk3568-cru.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,boot-mode.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {

> +	compatible = "rockchip,rk3568";

Maybe add this together with other rkXXXX SoCs to rockchip.yaml on top
of board list ???
Please advise.

> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		gpio4 = &gpio4;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;

> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc0;
> +		mmc2 = &sdmmc1;
> +		mmc3 = &sdmmc2;

From a  privious discussion: aliases for mmc should go from the dtsi to
the board dts
sort mmc aliases based on reg address and availability, so no number gap

> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +		serial6 = &uart6;
> +		serial7 = &uart7;
> +		serial8 = &uart8;
> +		serial9 = &uart9;
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x0>;
> +			clocks = <&scmi_clk 0>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x200>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x300>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +	};
> +
> +	cpu0_opp_table: cpu0-opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <825000 825000 1150000>;
> +			clock-latency-ns = <40000>;
> +		};

Add all empty lines between

> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <825000 825000 1150000>;
> +		};
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <825000 825000 1150000>;
> +			opp-suspend;
> +		};
> +		opp-1104000000 {
> +			opp-hz = /bits/ 64 <1104000000>;
> +			opp-microvolt = <825000 825000 1150000>;
> +		};
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <900000 900000 1150000>;
> +		};
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <975000 975000 1150000>;
> +		};
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <1050000 1050000 1150000>;
> +		};
> +		opp-1992000000 {
> +			opp-hz = /bits/ 64 <1992000000>;
> +			opp-microvolt = <1150000 1150000 1150000>;
> +		};
> +	};
> +
> +	firmware {
> +		scmi: scmi {
> +			compatible = "arm,scmi-smc";
> +			arm,smc-id = <0x82000010>;
> +			shmem = <&scmi_shmem>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +		};
> +
> +	};
> +
> +	pmu {

> +		compatible = "arm,cortex-a55-pmu", "arm,armv8-pmuv3";

compatible: ['arm,cortex-a55-pmu', 'arm,armv8-pmuv3'] is too long

> +		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +

> +	shmem@10f000 {

shmem@10f000: $nodename:0: 'shmem@10f000' does not match '^sram(@.*)?'

> +		compatible = "mmio-sram";
> +		reg = <0x0 0x0010f000 0x0 0x100>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x0 0x0010f000 0x100>;
> +

> +		scmi_shmem: scmi-shmem@10f000 {

shmem@10f000: 'scmi-shmem@10f000' does not match any of the regexes:
'^([a-z]*-)?sram(-section)?@[a-f0-9]+$'

> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x0010f000 0x0 0x100>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	xin24m: xin24m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +		#clock-cells = <0>;
> +	};
> +
> +	xin32k: xin32k {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "xin32k";
> +		pinctrl-0 = <&clk32k_out0>;
> +		pinctrl-names = "default";
> +		#clock-cells = <0>;
> +	};
> +
> +	gic: interrupt-controller@fd400000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0xfd400000 0 0x10000>, /* GICD */
> +		      <0x0 0xfd460000 0 0xc0000>; /* GICR */
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		#interrupt-cells = <3>;

> +		#address-cells = <2>;
> +		#size-cells = <2>;

subnodes ??

> +		ranges;
> +	};
> +
> +	pmugrf: syscon@fdc20000 {

> +		compatible = "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";

TODO

> +		reg = <0x0 0xfdc20000 0x0 0x10000>;
> +
> +		reboot_mode: reboot-mode {
> +			compatible = "syscon-reboot-mode";
> +			mode-bootloader = <BOOT_BL_DOWNLOAD>;
> +			mode-fastboot = <BOOT_FASTBOOT>;
> +			mode-loader = <BOOT_BL_DOWNLOAD>;
> +			mode-normal = <BOOT_NORMAL>;
> +			mode-recovery = <BOOT_RECOVERY>;
> +			offset = <0x200>;
> +		};
> +	};
> +
> +	grf: syscon@fdc60000 {

> +		compatible = "rockchip,rk3568-grf", "syscon", "simple-mfd";

TODO

> +		reg = <0x0 0xfdc60000 0x0 0x10000>;
> +	};
> +
> +	pmucru: clock-controller@fdd00000 {

> +		compatible = "rockchip,rk3568-pmucru";
> +		reg = <0x0 0xfdd00000 0x0 0x1000>;
> +		rockchip,grf = <&grf>;
> +		rockchip,pmugrf = <&pmugrf>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +	};
> +
> +	cru: clock-controller@fdd20000 {
> +		compatible = "rockchip,rk3568-cru";
> +		reg = <0x0 0xfdd20000 0x0 0x1000>;
> +		rockchip,grf = <&grf>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +
> +		assigned-clocks =
> +			<&pmucru CLK_RTC_32K>, <&pmucru PLL_PPLL>,
> +			<&pmucru PCLK_PMU>, <&cru PLL_CPLL>,
> +			<&cru PLL_GPLL>, <&cru ACLK_BUS>,
> +			<&cru PCLK_BUS>, <&cru ACLK_TOP_HIGH>,
> +			<&cru ACLK_TOP_LOW>, <&cru HCLK_TOP>,
> +			<&cru PCLK_TOP>, <&cru ACLK_PERIMID>,
> +			<&cru HCLK_PERIMID>, <&cru PLL_NPLL>,
> +			<&cru ACLK_PIPE>, <&cru PCLK_PIPE>,
> +			<&cru ACLK_VOP>;
> +		assigned-clock-rates =
> +			<32768>, <200000000>,
> +			<100000000>, <1000000000>,
> +			<1188000000>, <150000000>,
> +			<100000000>, <500000000>,
> +			<400000000>, <150000000>,
> +			<100000000>, <300000000>,
> +			<150000000>, <1200000000>,
> +			<400000000>, <100000000>,
> +			<500000000>;
> +		assigned-clock-parents =
> +			<&pmucru CLK_RTC32K_FRAC>;
> +	};
> +
> +	i2c0: i2c@fdd40000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfdd40000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&pmucru CLK_I2C0>, <&pmucru PCLK_I2C0>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	uart0: serial@fdd50000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfdd50000 0x0 0x100>;
> +		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 0>, <&dmac0 1>;
> +		pinctrl-0 = <&uart0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	pwm0: pwm@fdd70000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70000 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm0m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm1: pwm@fdd70010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70010 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm1m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm2: pwm@fdd70020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70020 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm2m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm3: pwm@fdd70030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70030 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm3_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	sdmmc2: dwmmc@fe000000 {

dwmmc@fe000000: $nodename:0: 'dwmmc@fe000000' does not match '^mmc(@.*)?$'

> +		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x0 0xfe000000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC2>, <&cru CLK_SDMMC2>,
> +			 <&cru SCLK_SDMMC2_DRV>, <&cru SCLK_SDMMC2_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDMMC2>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +

> +	sdmmc0: dwmmc@fe2b0000 {

dwmmc@fe2b0000: $nodename:0: 'dwmmc@fe2b0000' does not match '^mmc(@.*)?$'

> +		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x0 0xfe2b0000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC0>, <&cru CLK_SDMMC0>,
> +			 <&cru SCLK_SDMMC0_DRV>, <&cru SCLK_SDMMC0_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDMMC0>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +

> +	sdmmc1: dwmmc@fe2c0000 {

dwmmc@fe2c0000: $nodename:0: 'dwmmc@fe2c0000' does not match '^mmc(@.*)?$'

> +		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x0 0xfe2c0000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC1>, <&cru CLK_SDMMC1>,
> +			 <&cru SCLK_SDMMC1_DRV>, <&cru SCLK_SDMMC1_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDMMC1>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +

> +	sdhci: sdhci@fe310000 {

sdhci@fe310000: $nodename:0: 'sdhci@fe310000' does not match '^mmc(@.*)?$'

> +		compatible = "rockchip,rk3568-dwcmshc";
> +		reg = <0x0 0xfe310000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +		assigned-clocks = <&cru BCLK_EMMC>, <&cru TCLK_EMMC>;
> +		assigned-clock-rates = <200000000>, <24000000>;
> +		clocks = <&cru CCLK_EMMC>, <&cru HCLK_EMMC>,
> +			 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
> +			 <&cru TCLK_EMMC>;
> +		clock-names = "core", "bus", "axi", "block", "timer";
> +		status = "disabled";
> +	};
> +
> +	dmac0: dmac@fe530000 {
> +		compatible = "arm,pl330", "arm,primecell";
> +		reg = <0x0 0xfe530000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,pl330-periph-burst;
> +		clocks = <&cru ACLK_BUS>;
> +		clock-names = "apb_pclk";
> +		#dma-cells = <1>;
> +	};
> +
> +	dmac1: dmac@fe550000 {
> +		compatible = "arm,pl330", "arm,primecell";
> +		reg = <0x0 0xfe550000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,pl330-periph-burst;
> +		clocks = <&cru ACLK_BUS>;
> +		clock-names = "apb_pclk";
> +		#dma-cells = <1>;
> +	};
> +
> +	i2c1: i2c@fe5a0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5a0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c1_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c2: i2c@fe5b0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5b0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c2m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c3: i2c@fe5c0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5c0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c3m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c4: i2c@fe5d0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5d0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c4m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c5: i2c@fe5e0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5e0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c5m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	wdt: watchdog@fe600000 {
> +		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
> +		reg = <0x0 0xfe600000 0x0 0x100>;

> +		clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
> +		clock-names = "tclk", "pclk";

below interrupts

> +		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;

> +	};
> +
> +	uart1: serial@fe650000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe650000 0x0 0x100>;
> +		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 2>, <&dmac0 3>;
> +		pinctrl-0 = <&uart1m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart2: serial@fe660000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe660000 0x0 0x100>;
> +		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 4>, <&dmac0 5>;
> +		pinctrl-0 = <&uart2m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart3: serial@fe670000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe670000 0x0 0x100>;
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 6>, <&dmac0 7>;
> +		pinctrl-0 = <&uart3m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart4: serial@fe680000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe680000 0x0 0x100>;
> +		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 8>, <&dmac0 9>;
> +		pinctrl-0 = <&uart4m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart5: serial@fe690000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe690000 0x0 0x100>;
> +		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 10>, <&dmac0 11>;
> +		pinctrl-0 = <&uart5m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart6: serial@fe6a0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6a0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 12>, <&dmac0 13>;
> +		pinctrl-0 = <&uart6m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart7: serial@fe6b0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6b0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 14>, <&dmac0 15>;
> +		pinctrl-0 = <&uart7m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart8: serial@fe6c0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6c0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 16>, <&dmac0 17>;
> +		pinctrl-0 = <&uart8m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart9: serial@fe6d0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6d0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 18>, <&dmac0 19>;
> +		pinctrl-0 = <&uart9m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	pwm4: pwm@fe6e0000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0000 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm4_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm5: pwm@fe6e0010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0010 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm5_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm6: pwm@fe6e0020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0020 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm6_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm7: pwm@fe6e0030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0030 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm7_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm8: pwm@fe6f0000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0000 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm8m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm9: pwm@fe6f0010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0010 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm9m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm10: pwm@fe6f0020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0020 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm10m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm11: pwm@fe6f0030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0030 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm11m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm12: pwm@fe700000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700000 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm12m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm13: pwm@fe700010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700010 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm13m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm14: pwm@fe700020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700020 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm14m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm15: pwm@fe700030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700030 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm15m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pinctrl: pinctrl {
> +		compatible = "rockchip,rk3568-pinctrl";
> +		rockchip,grf = <&grf>;
> +		rockchip,pmu = <&pmugrf>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpio0: gpio@fdd60000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfdd60000 0x0 0x100>;
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;

> +			clocks = <&pmucru PCLK_GPIO0>, <&pmucru DBCLK_GPIO0>;

> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio1: gpio@fe740000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe740000 0x0 0x100>;
> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;

> +			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;

> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio2: gpio@fe750000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe750000 0x0 0x100>;
> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;

> +			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;

gpio@fe750000: clocks: [[13, 357], [13, 358]] is too long

Change rockchip,gpio-bank.yaml

  clocks:
    maxItems: 2

> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio3: gpio@fe760000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe760000 0x0 0x100>;
> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;

> +			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;

> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio4: gpio@fe770000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe770000 0x0 0x100>;
> +			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;

> +			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;

> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +#include "rk3568-pinctrl.dtsi"
> 
