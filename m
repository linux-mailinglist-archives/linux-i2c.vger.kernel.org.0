Return-Path: <linux-i2c+bounces-6772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B941F979BD2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 09:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D36651C22DF1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 07:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFF012CD8B;
	Mon, 16 Sep 2024 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwBSzI0D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217271BDC8;
	Mon, 16 Sep 2024 07:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726470313; cv=none; b=iONgZcCsaprUD853DjC8/XS+Bi4MpfaRNRAwu5II2p87VIWiNEADaIAkBiVRmTKcux3g6fCKGrUw1gox/sVXG2b+QYGUY0BKscrcpn+mRTcAnRwypF+bP2+L+e9oL3ZJ6FPrfCj4b/AhR3TpMOMs1IrHrc6Y6bqwcmzu1EPkNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726470313; c=relaxed/simple;
	bh=sLD8gZ+5WWCc3phVvhYizgaea8uaK6uzmMaR+dMCXkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MU2kquo7/GVKa7vX1GTJf7auZRu6VETzujxUnFZC5IQ87CgcOWaf5r/hNY0fuHxqK6ilet2H+YIONOR8VPHc+ngf8TqnDtBUBTSqOtXzdGtvZ6Yfzn8lo4DFha5GV3V1tqj7PlJ5Fpb7BF/rjPMxL0OOTrTiiyZCxqqNALkeIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwBSzI0D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2676C4CEC4;
	Mon, 16 Sep 2024 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726470312;
	bh=sLD8gZ+5WWCc3phVvhYizgaea8uaK6uzmMaR+dMCXkE=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=mwBSzI0D6ZUIkr8DrIDPCCfCjRCpiZJBw2btBbHyuRdmqLbyDMtgz7DCVdzcZ9FOH
	 RlOJP+HEeZVH5gilRboRXunGwt74vUL9OuPBcokIxJ7HOE7jGx+8xzCmLZIWKuJWfP
	 7Tvx72HP8s+UF6NEWAoftHYpuNNXe8i5ZXcwo5wKVk8f9aYXMVZf6TexxK7Sb1zXtH
	 IGc5ldHKyz1ggdFD6rxLws8tPp3IeUM4jm2AZYxF4J8qcvkENStq37m6Z40Iid1Mqx
	 svaij4ieP0oLJKmjy+5bhnxS+94F+XvULFGbWnWnidb+aBgloYOx1VqhqXa8Xf4Bpi
	 KQlr0wWpKgz5w==
Message-ID: <19e3d0a1-02e3-44bf-ae42-cd090bfde471@kernel.org>
Date: Mon, 16 Sep 2024 09:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] arm64: dts: adi: sc598: add device tree
To: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Utsav Agarwal <Utsav.Agarwal@analog.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, adsp-linux@analog.com,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-19-458fa57c8ccf@analog.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240912-test-v1-19-458fa57c8ccf@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 20:25, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
> 
> Add ADI SC598-EZKIT device tree.
> Support UART console as output.
> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  arch/arm64/boot/dts/Makefile                |   1 +
>  arch/arm64/boot/dts/adi/Makefile            |   2 +
>  arch/arm64/boot/dts/adi/sc598-som-ezkit.dts |  14 ++
>  arch/arm64/boot/dts/adi/sc598-som.dtsi      |  58 +++++
>  arch/arm64/boot/dts/adi/sc59x-64.dtsi       | 367 ++++++++++++++++++++++++++++
>  5 files changed, 442 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 21cd3a87f385309c3a655a67a3bee5f0abed7545..9b3996a8e01d8e7d264c44c075d7a50ee350ba44 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += actions
> +subdir-y += adi
>  subdir-y += airoha
>  subdir-y += allwinner
>  subdir-y += altera
> diff --git a/arch/arm64/boot/dts/adi/Makefile b/arch/arm64/boot/dts/adi/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..1bf54bc97095e1ea3577953d379746fbc0ea02a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/adi/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SC59X_64) += sc598-som-ezkit.dtb
> diff --git a/arch/arm64/boot/dts/adi/sc598-som-ezkit.dts b/arch/arm64/boot/dts/adi/sc598-som-ezkit.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8db6d5ea764f917faa6839d3d4f0b5217b927b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/adi/sc598-som-ezkit.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2021-2024 - Analog Devices Inc.
> + * Author: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sc598-som.dtsi"
> +
> +/ {
> +	model = "ADI 64-bit SC598 SOM EZ Kit";
> +	compatible = "adi,sc598-som-ezkit", "adi,sc59x-64";

Where is adi,sc598-som-ezlite?

> +};
> diff --git a/arch/arm64/boot/dts/adi/sc598-som.dtsi b/arch/arm64/boot/dts/adi/sc598-som.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..3b90f367db1a24de1e1dddc4db3c219736c5b90f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/adi/sc598-som.dtsi
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2021-2024 - Analog Devices Inc.
> + * Author: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/adi-adsp.h>
> +#include "sc59x-64.dtsi"
> +
> +/ {
> +	chosen {
> +		stdout-path = &uart1;
> +		bootargs = "earlycon=adi_uart,0x31003000 console=ttySC0,115200 mem=224M";

Drop entire bootargs. Look how other SoCs do it, if you need port speed.

> +	};
> +
> +	memory@90000000 {
> +		device_type = "memory";
> +		reg = <0x90000000 0x0e000000>;
> +	};
> +
> +	memory@20040000 {
> +		device_type = "memory";
> +		reg = <0x20040000 0x40000>;
> +	};
> +
> +	scb: scb-bus {

What is this?

> +		sec: sec@31089000 {

And this?

> +			adi,sharc-cores = <2>;
> +		};
> +	};

Drop entire node.

> +

Fix redundant blank lines.
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_default>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "disabled";
> +};
> +
> +&pinctrl0 {
> +	uart0_default: uart0-default-pins {
> +		pins {
> +			pinmux = <ADI_ADSP_PINMUX('A', 6, ADI_ADSP_PINFUNC_ALT1)>,
> +				 <ADI_ADSP_PINMUX('A', 7, ADI_ADSP_PINFUNC_ALT1)>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/adi/sc59x-64.dtsi b/arch/arm64/boot/dts/adi/sc59x-64.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..4a9aa08b4acb0936c97e683562e05da063a4e193
> --- /dev/null
> +++ b/arch/arm64/boot/dts/adi/sc59x-64.dtsi
> @@ -0,0 +1,367 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2021-2024 - Analog Devices Inc.
> + * Author: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> + */
> +
> +#include <dt-bindings/clock/adi-sc5xx-clock.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "ADI 64-bit SC59X";
> +	compatible = "adi,sc59x-64";
> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	chosen { };

Drop

> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};


Drop or move to board DTS. Not a property of the SoC.


> +
> +	cpus {
> +		#address-cells = <0x2>;
> +		#size-cells = <0x0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0xdeadbeef>;
> +			clocks = <&clk ADSP_SC598_CLK_ARM>, <&clk ADSP_SC598_CLK_DDR>;
> +		};
> +	};
> +
> +	pmu {

Order nodes alphabetically. See DTS coding style.

> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +	};
> +
> +	gic: interrupt-controller@31200000 {


This cannot be outside of SoC. See writing-bindings and DTS coding style.

> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x31200000 0x40000>, /* GIC Dist */
> +		      <0x31240000 0x40000>; /* GICR */
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
> +	};
> +
> +	clocks {
> +		sys_clkin0: oscillator@1 {

There is no way you tested it. It's obvious W=1 warning.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +			clock-output-names = "sys_clkin0";
> +		};
> +
> +		sys_clkin1: oscillator@2 {

How are these properties of the SoC? Where are they located physically?
See DTS coding style.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +			clock-output-names = "sys_clkin1";
> +		};
> +	};
> +
> +	clk: clocks@3108d000 {
> +		compatible = "adi,sc598-clocks";
> +		reg = <0x3108d000 0x1000>,
> +		      <0x3108e000 0x1000>,
> +		      <0x3108f000 0x1000>,
> +		      <0x310a9000 0x1000>;
> +		#clock-cells = <1>;
> +		clocks = <&sys_clkin0>, <&sys_clkin1>;
> +		clock-names = "sys_clkin0", "sys_clkin1";
> +		status = "okay";

Drop... everywhere.

> +	};
> +
> +	scb: scb-bus {

What is scb-bus?

See DTS coding style or any other SoC. This is supposed to be just sco@
with proper unit address.

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		rcu: rcu@3108c000 {
> +			compatible = "adi,reset-controller";
> +			reg = <0x3108c000 0x1000>;
> +			status = "okay";

Oh...

> +		};
> +
> +		sec: sec@31089000 {

Random order of nodes? See DTS coding style.

> +			compatible = "adi,system-event-controller";
> +			reg = <0x31089000 0x1000>;
> +			adi,rcu = <&rcu>;
> +			status = "okay";
> +		};
> +
> +		uart0: uart@31003000 {

Never tested.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
> +			compatible = "adi,uart";
> +			reg = <0x31003000 0x40>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			interrupt-parent = <&gic>;
> +			interrupt-names = "tx", "rx", "status";
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			adi,use-edbo;
> +			status = "disabled";
> +		};
> +
> +		uart1: uart@31003400 {
> +			compatible = "adi,uart";
> +			reg = <0x31003400 0x40>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			interrupt-parent = <&gic>;
> +			interrupt-names = "tx", "rx", "status";
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +			adi,use-edbo;
> +			status = "disabled";
> +		};
> +
> +		uart2: uart@31003800 {
> +			compatible = "adi,uart";
> +			reg = <0x31003800 0x40>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			interrupt-parent = <&gic>;
> +			interrupt-names = "tx", "rx", "status";
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +			adi,use-edbo;
> +			status = "disabled";
> +		};
> +
> +		uart3: uart@31003c00 {
> +			compatible = "adi,uart";
> +			reg = <0x31003C00 0x40>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			interrupt-parent = <&gic>;
> +			interrupt-names = "tx", "rx", "status";
> +			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +			adi,use-edbo;
> +			status = "disabled";
> +		};
> +
> +		i2c0: twi@31001400 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Completely wrong order of properties. Please follow DTS coding style.


> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "adi,twi";

You cannot have generic compatibles in the SoC.

> +			reg = <0x31001400 0xFF>;

I already commented on lower case hex.

> +			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-khz = <100>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			status = "disabled";
> +		};
> +
> +		i2c1: twi@31001500 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "adi,twi";
> +			reg = <0x31001500 0xFF>;
> +			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-khz = <100>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			status = "disabled";
> +		};
> +
> +		i2c3: twi@31001000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "adi,twi";
> +			reg = <0x31001000 0xFF>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-khz = <100>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			status = "disabled";
> +		};
> +
> +		i2c4: twi@31001100 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "adi,twi";
> +			reg = <0x31001100 0xFF>;
> +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-khz = <100>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			status = "disabled";
> +		};
> +
> +		i2c5: twi@31001200 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "adi,twi";
> +			reg = <0x31001200 0xFF>;
> +			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-khz = <100>;
> +			clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +			clock-names = "sclk0";
> +			status = "disabled";
> +		};
> +
> +		pinctrl0: pinctrl@31004600 {
> +			compatible = "adi,adsp-pinctrl";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x31004600 0x400>;
> +			adi,port-sizes = <16 16 16 16 16 16 16 16 7>;
> +		};
> +
> +		pint0: pint@31005000 {
> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005000 0xFF>;
> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pint1: pint@31005100 {
> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005100 0xFF>;
> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pint2: pint@31005200 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005200 0xFF>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pint3: pint@31005300 {
> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005300 0xFF>;
> +			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pint4: pint@31005400 {
> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005400 0xFF>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pint5: pint@31005500 {
> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005500 0xFF>;
> +			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pint6: pint@31005600 {
> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005600 0xFF>;
> +			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pint7: pint@31005700 {
> +			compatible = "adi,adsp-pint";
> +			reg = <0x31005700 0xFF>;
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		gpa: gport@31004000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004000 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 0 16>;
> +			adi,pint = <&pint0 1>;
> +			status = "okay";
> +		};
> +
> +		gpb: gport@31004080 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004080 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 16 16>;
> +			adi,pint = <&pint0 0>;
> +			status = "okay";
> +		};
> +
> +		gpc: gport@31004100 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004100 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 32 16>;
> +			adi,pint = <&pint2 1>;
> +			status = "okay";
> +		};
> +
> +		gpd: gport@31004180 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004180 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 48 16>;
> +			adi,pint = <&pint2 0>;
> +		};
> +
> +		gpe: gport@31004200 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004200 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 64 16>;
> +			adi,pint = <&pint4 1>;
> +		};
> +
> +		gpf: gport@31004280 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004280 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 80 16>;
> +			adi,pint = <&pint4 0>;
> +		};
> +
> +		gpg: gport@31004300 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004300 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 96 16>;
> +			adi,pint = <&pint6 1>;
> +		};
> +
> +		gph: gport@31004380 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004380 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 112 16>;
> +			adi,pint = <&pint6 0>;
> +		};
> +
> +		gpi: gport@31004400 {
> +			compatible = "adi,adsp-port-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0x31004400 0x7F>;
> +			gpio-ranges = <&pinctrl0 0 128 7>;
> +			adi,pint = <&pint7 1>;
> +		};
> +

All your patches have such sloppy blank lines here and there.

> +	};
> +};
> 

Best regards,
Krzysztof


