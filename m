Return-Path: <linux-i2c+bounces-5417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD23952C46
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FC82B2290A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 10:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE231714BF;
	Thu, 15 Aug 2024 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="s7BTOevv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189831714AA;
	Thu, 15 Aug 2024 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723714821; cv=none; b=nx48kP9aoYMLVtog3u8GJrfG934iweyaRJOV8j9yAVQwF+KZ+PCx/r36wGXzmjaGxlPeK+kktIFtlTfHQit9PChu1JMRmv8VOYK8q7OXBXQ5GMxU9m/flmQnvQ6BUyopMtCfJeq92i991upfo2Ira5yCaGlB/hntTscpuRLJJdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723714821; c=relaxed/simple;
	bh=hHRLqBr+54KeYXqLfHR/xpoQz9e9b/mHhS+fZOIXtrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaH/bfkZcjKrVPSwA4ShVoB9DzhJPo8nCclsROEiYN3x0oQGyF/Ij+WsYVAJ1DJ2lMMrhx/rizLWzxuKoGTv4JRBPtUvIyg80JupaDqiN92lz9sKGTVfJEqlXmTf2vPEPnswhJuQT/vOHkqShXeEKjHYYRHXvq8Qc9msSugKsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=s7BTOevv; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Received: from mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea0:0:640:da19:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 1E0406128E;
	Thu, 15 Aug 2024 12:30:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id QUEcpv4Hk4Y0-UhkQn8oc;
	Thu, 15 Aug 2024 12:30:32 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1723714232; bh=R4tun9PXUYJLsqC80SlDr16BLkuJJ0cpb+rbUByGWYs=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=s7BTOevv5CeY5wohdlWoWG/1654k1XE3CDf4kzINoZD4Rc3AiZk++oH0oqDX7GhWu
	 lzMxmvkKdmMTMHEqAzob1HvtPT5P5SkZCt8khQgEKr7jXm5ncfiLfeabAH1qrhtZ6R
	 IYh4wW5yIEjoNhV821r07YrwDzGmyLa3QTtNY4Yg=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <c5014fe3-130b-4ace-a66e-8773a9a4f1dc@yandex.com>
Date: Thu, 15 Aug 2024 11:30:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] arm64: dts: rockchip: Add rk3576 SoC base DT
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Chris Morgan <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Lunn <tim@feathertop.org>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>,
 Dragan Simic <dsimic@manjaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Alexey Charkov <alchark@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, kernel@collabora.com
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-10-detlev.casanova@collabora.com>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <20240802214612.434179-10-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some comments below. Whenever useful.

On 8/2/24 23:45, Detlev Casanova wrote:
> This device tree contains all devices necessary for booting from network
> or SD Card.
> 
> It supports CPU, CRU, PM domains, dma, interrupts, timers, UART and
> SDHCI (everything necessary to boot Linux on this system on chip) as
> well as Ethernet, I2C, SPI and OTP.
> 
> Also add the necessary DT bindings for the SoC.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> [rebase, squash and reword commit message]
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---

[..]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> new file mode 100644
> index 0000000000000..00c4d2a153ced
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -0,0 +1,1635 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2023 Rockchip Electronics Co., Ltd.
> + */
> +

> +#include <dt-bindings/clock/rockchip,rk3576-cru.h>
> +#include <dt-bindings/reset/rockchip,rk3576-cru.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/power/rk3576-power.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,boot-mode.h>

Sort includes.

> +
> +/ {
> +	compatible = "rockchip,rk3576";
> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
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
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
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
> +		serial10 = &uart10;
> +		serial11 = &uart11;
> +		spi0 = &spi0;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +		spi3 = &spi3;
> +		spi4 = &spi4;
> +	};
> +

[..]

For uart0..uart11:

> +
> +	uart1: serial@27310000 {
> +		compatible = "rockchip,rk3576-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0x27310000 0x0 0x100>;

> +		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;

"interrupts" are sort just like other properties. A mix of sort styles exists, so check all nodes.

> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +		clock-names = "baudclk", "apb_pclk";

> +		reg-shift = <2>;
> +		reg-io-width = <4>;

Move below "reg". 

> +		dmas = <&dmac0 8>, <&dmac0 9>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart1m0_xfer>;
> +		status = "disabled";
> +	};
> +
> +	pmu: power-management@27380000 {
> +		compatible = "rockchip,rk3576-pmu", "syscon", "simple-mfd";
> +		reg = <0x0 0x27380000 0x0 0x800>;
> +
> +		power: power-controller {
> +			compatible = "rockchip,rk3576-power-controller";
> +			#power-domain-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;

> +			status = "okay";

Remove.

> +
> +			power-domain@RK3576_PD_NPU {
> +				reg = <RK3576_PD_NPU>;

> +				#power-domain-cells = <0>;

				#power-domain-cells = <1>;

      "#power-domain-cells":
        enum: [0, 1]
        description:
          Must be 0 for nodes representing a single PM domain and 1 for nodes
          providing multiple PM domains.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				power-domain@RK3576_PD_NPUTOP {
> +					reg = <RK3576_PD_NPUTOP>;

> +					#power-domain-cells = <0>;


					#power-domain-cells = <1>;
      "#power-domain-cells":
        enum: [0, 1]
        description:
          Must be 0 for nodes representing a single PM domain and 1 for nodes
          providing multiple PM domains.

> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					clocks = <&cru ACLK_RKNN0>,
> +						 <&cru ACLK_RKNN1>,
> +						 <&cru ACLK_RKNN_CBUF>,
> +						 <&cru CLK_RKNN_DSU0>,
> +						 <&cru HCLK_RKNN_CBUF>,
> +						 <&cru HCLK_RKNN_ROOT>,
> +						 <&cru HCLK_NPU_CM0_ROOT>,
> +						 <&cru PCLK_NPUTOP_ROOT>;
> +					pm_qos = <&qos_npu_mcu>,
> +						 <&qos_npu_nsp0>,
> +						 <&qos_npu_nsp1>,
> +						 <&qos_npu_m0ro>,
> +						 <&qos_npu_m1ro>;
> +
> +					power-domain@RK3576_PD_NPU0 {
> +						reg = <RK3576_PD_NPU0>;
> +						#power-domain-cells = <0>;
> +						clocks = <&cru HCLK_RKNN_ROOT>,
> +							 <&cru ACLK_RKNN0>;
> +						pm_qos = <&qos_npu_m0>;
> +					};
> +					power-domain@RK3576_PD_NPU1 {
> +						reg = <RK3576_PD_NPU1>;
> +						#power-domain-cells = <0>;
> +						clocks = <&cru HCLK_RKNN_ROOT>,
> +							 <&cru ACLK_RKNN1>;
> +						pm_qos = <&qos_npu_m1>;
> +					};
> +				};
> +			};
> +
> +			power-domain@RK3576_PD_GPU {
> +				reg = <RK3576_PD_GPU>;
> +				#power-domain-cells = <0>;
> +				clocks = <&cru CLK_GPU>;
> +				pm_qos = <&qos_gpu>;
> +			};
> +
> +			power-domain@RK3576_PD_NVM {
> +				reg = <RK3576_PD_NVM>;

> +				#power-domain-cells = <0>;

				#power-domain-cells = <1>;
      "#power-domain-cells":
        enum: [0, 1]
        description:
          Must be 0 for nodes representing a single PM domain and 1 for nodes
          providing multiple PM domains.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&cru ACLK_EMMC>, <&cru HCLK_EMMC>;
> +				pm_qos = <&qos_emmc>,
> +					 <&qos_fspi0>;
> +
> +				power-domain@RK3576_PD_SDGMAC {
> +					reg = <RK3576_PD_SDGMAC>;

> +				#power-domain-cells = <0>;

TAB ??

> +					clocks = <&cru ACLK_HSGPIO>,
> +						 <&cru ACLK_GMAC0>,
> +						 <&cru ACLK_GMAC1>,
> +						 <&cru CCLK_SRC_SDIO>,
> +						 <&cru CCLK_SRC_SDMMC0>,
> +						 <&cru HCLK_HSGPIO>,
> +						 <&cru HCLK_SDIO>,
> +						 <&cru HCLK_SDMMC0>;
> +					pm_qos = <&qos_fspi1>,
> +						 <&qos_gmac0>,
> +						 <&qos_gmac1>,
> +						 <&qos_sdio>,
> +						 <&qos_sdmmc>,
> +						 <&qos_flexbus>;
> +				};
> +			};
> +			power-domain@RK3576_PD_PHP {
> +				reg = <RK3576_PD_PHP>;

> +				#power-domain-cells = <0>;

				#power-domain-cells = <1>;
      "#power-domain-cells":
        enum: [0, 1]
        description:
          Must be 0 for nodes representing a single PM domain and 1 for nodes
          providing multiple PM domains.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&cru ACLK_PHP_ROOT>,
> +					 <&cru PCLK_PHP_ROOT>,
> +					 <&cru ACLK_MMU0>,
> +					 <&cru ACLK_MMU1>;
> +				pm_qos = <&qos_mmu0>,
> +					 <&qos_mmu1>;
> +
> +				power-domain@RK3576_PD_SUBPHP {
> +					reg = <RK3576_PD_SUBPHP>;

> +				#power-domain-cells = <0>;

TAB??

> +				};
> +			};
> +			power-domain@RK3576_PD_AUDIO {
> +				reg = <RK3576_PD_AUDIO>;
> +				#power-domain-cells = <0>;
> +			};
> +			power-domain@RK3576_PD_VEPU1 {

> +				clocks = <&cru ACLK_VEPU1>,
> +					 <&cru HCLK_VEPU1>;
> +				reg = <RK3576_PD_VEPU1>;

sort

> +				#power-domain-cells = <0>;
> +				pm_qos = <&qos_vepu1>;
> +			};
> +			power-domain@RK3576_PD_VPU {
> +				reg = <RK3576_PD_VPU>;
> +				#power-domain-cells = <0>;
> +				clocks = <&cru ACLK_EBC>,
> +					 <&cru HCLK_EBC>,
> +					 <&cru ACLK_RGA2E_0>,
> +					 <&cru HCLK_RGA2E_0>,
> +					 <&cru ACLK_RGA2E_1>,
> +					 <&cru HCLK_RGA2E_1>,
> +					 <&cru ACLK_JPEG>,
> +					 <&cru HCLK_JPEG>,
> +					 <&cru ACLK_VDPP>,
> +					 <&cru HCLK_VDPP>;
> +				pm_qos = <&qos_ebc>,
> +					 <&qos_rga0>,
> +					 <&qos_rga1>,
> +					 <&qos_jpeg>,
> +					 <&qos_vdpp>;
> +			};
> +			power-domain@RK3576_PD_VDEC {
> +				reg = <RK3576_PD_VDEC>;
> +				#power-domain-cells = <0>;
> +				clocks = <&cru ACLK_RKVDEC_ROOT>,
> +					 <&cru HCLK_RKVDEC>;
> +				pm_qos = <&qos_rkvdec>;
> +			};
> +			power-domain@RK3576_PD_VI {
> +				reg = <RK3576_PD_VI>;

> +				#power-domain-cells = <0>;

				#power-domain-cells = <1>;
      "#power-domain-cells":
        enum: [0, 1]
        description:
          Must be 0 for nodes representing a single PM domain and 1 for nodes

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&cru ACLK_VICAP>,
> +					 <&cru HCLK_VICAP>,
> +					 <&cru DCLK_VICAP>,
> +					 <&cru ACLK_VI_ROOT>,
> +					 <&cru HCLK_VI_ROOT>,
> +					 <&cru PCLK_VI_ROOT>,
> +					 <&cru CLK_ISP_CORE>,
> +					 <&cru ACLK_ISP>,
> +					 <&cru HCLK_ISP>,
> +					 <&cru CLK_CORE_VPSS>,
> +					 <&cru ACLK_VPSS>,
> +					 <&cru HCLK_VPSS>;
> +				pm_qos = <&qos_isp_mro>,
> +					 <&qos_isp_mwo>,
> +					 <&qos_vicap_m0>,
> +					 <&qos_vpss_mro>,
> +					 <&qos_vpss_mwo>;
> +
> +				power-domain@RK3576_PD_VEPU0 {
> +					reg = <RK3576_PD_VEPU0>;
> +					#power-domain-cells = <0>;
> +					clocks = <&cru ACLK_VEPU0>,
> +						 <&cru HCLK_VEPU0>;
> +					pm_qos = <&qos_vepu0>;
> +				};
> +			};
> +			power-domain@RK3576_PD_VOP {
> +				reg = <RK3576_PD_VOP>;

> +				#power-domain-cells = <0>;

				#power-domain-cells = <1>;
      "#power-domain-cells":
        enum: [0, 1]
        description:
          Must be 0 for nodes representing a single PM domain and 1 for nodes
          providing multiple PM domains.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&cru ACLK_VOP>,
> +					 <&cru HCLK_VOP>,
> +					 <&cru HCLK_VOP_ROOT>;
> +				pm_qos = <&qos_vop_m0>,
> +					 <&qos_vop_m1ro>;
> +
> +				power-domain@RK3576_PD_USB {

Since when is USB part of VOP?
Recheck?

> +					reg = <RK3576_PD_USB>;
> +					#power-domain-cells = <0>;
> +					clocks = <&cru PCLK_PHP_ROOT>,
> +						 <&cru ACLK_USB_ROOT>,
> +						 <&cru ACLK_MMU2>,
> +						 <&cru ACLK_SLV_MMU2>,
> +						 <&cru ACLK_UFS_SYS>;
> +					pm_qos = <&qos_mmu2>,
> +						 <&qos_ufshc>;
> +				};
> +				power-domain@RK3576_PD_VO0 {
> +					reg = <RK3576_PD_VO0>;
> +					#power-domain-cells = <0>;
> +					clocks = <&cru ACLK_HDCP0>,
> +						 <&cru HCLK_HDCP0>,
> +						 <&cru ACLK_VO0_ROOT>,
> +						 <&cru PCLK_VO0_ROOT>,
> +						 <&cru HCLK_VOP_ROOT>;
> +					pm_qos = <&qos_hdcp0>;
> +				};
> +				power-domain@RK3576_PD_VO1 {
> +					reg = <RK3576_PD_VO1>;
> +					#power-domain-cells = <0>;
> +					clocks = <&cru ACLK_HDCP1>,
> +						 <&cru HCLK_HDCP1>,
> +						 <&cru ACLK_VO1_ROOT>,
> +						 <&cru PCLK_VO1_ROOT>,
> +						 <&cru HCLK_VOP_ROOT>;
> +					pm_qos = <&qos_hdcp1>;
> +				};
> +			};
> +		};
> +	};
> +

[..]

> +

> +	rktimer: timer@2acc0000 {

timer0: .....

> +		compatible = "rockchip,rk3576-timer", "rockchip,rk3288-timer";
> +		reg = <0x0 0x2acc0000 0x0 0x20>;

> +		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;

sort

> +		clocks = <&cru PCLK_BUSTIMER0>, <&cru CLK_TIMER0>;
> +		clock-names = "pclk", "timer";
> +	};
> +
> +	wdt: watchdog@2ace0000 {

> +		compatible = "snps,dw-wdt";

Must be SoC related.
Add something to snps,dw-wdt.yaml

> +		reg = <0x0 0x2ace0000 0x0 0x100>;
> +		clocks = <&cru TCLK_WDT0>, <&cru PCLK_WDT0>;
> +		clock-names = "tclk", "pclk";
> +		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +	};
> +

For spi0..spi4:


> +	spi0: spi@2acf0000 {

> +		compatible = "rockchip,rk3066-spi";

Must be SoC related.
Add something to spi-rockchip.yaml

> +		reg = <0x0 0x2acf0000 0x0 0x1000>;

> +		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;

sort

> +		#address-cells = <1>;
> +		#size-cells = <0>;

Move things that start with # down the list as posible.

> +		clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>;
> +		clock-names = "spiclk", "apb_pclk";
> +		dmas = <&dmac0 14>, <&dmac0 15>;
> +		dma-names = "tx", "rx";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spi0m0_csn0 &spi0m0_csn1 &spi0m0_pins>;
> +		num-cs = <2>;
> +		status = "disabled";
> +	};
> +
> +	spi1: spi@2ad00000 {

> +	spi2: spi@2ad10000 {

> +	spi3: spi@2ad20000 {

> +	spi4: spi@2ad30000 {

> +	uart0: serial@2ad40000 {

> +	uart2: serial@2ad50000 {

> +	uart3: serial@2ad60000 {

> +	uart4: serial@2ad70000 {

> +	uart5: serial@2ad80000 {

> +	uart6: serial@2ad90000 {

> +	uart7: serial@2ada0000 {

> +	uart8: serial@2adb0000 {

> +	uart9: serial@2adc0000 {

> +	saradc: adc@2ae00000 {
> +		compatible = "rockchip,rk3576-saradc", "rockchip,rk3588-saradc";
> +		reg = <0x0 0x2ae00000 0x0 0x10000>;

> +		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;

sort

> +		#io-channel-cells = <1>;

Things that start with "#" are used to interpreted the DT, so down the list as possible.

> +		clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
> +		clock-names = "saradc", "apb_pclk";
> +		resets = <&cru SRST_P_SARADC>;
> +		reset-names = "saradc-apb";
> +		status = "disabled";
> +	};
> +

[..]

> +
> +	uart10: serial@2afc0000 {
> +
> +	uart11: serial@2afd0000 {
> +

[..]

> +
> +	pinctrl: pinctrl {
> +		compatible = "rockchip,rk3576-pinctrl";
> +		rockchip,grf = <&ioc_grf>;
> +		rockchip,sys-grf = <&sys_grf>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +

> +		gpio0: gpio@27320000 {

The use of gpio nodes as subnode of pinctrl is deprecated.

patternProperties:
  "gpio@[0-9a-f]+$":
    type: object

    $ref: /schemas/gpio/rockchip,gpio-bank.yaml#
    deprecated: true

    unevaluatedProperties: false

> +			compatible = "rockchip,gpio-bank";

When in use as separate node the compatible must be SoC related.

Question for the maintainers: Extra entry to rockchip,gpio-bank.yaml ??

> +			reg = <0x0 0x27320000 0x0 0x200>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 0 32>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio1: gpio@2ae10000 {
> +
> +		gpio2: gpio@2ae20000 {
> +
> +		gpio3: gpio@2ae30000 {
> +
> +		gpio4: gpio@2ae40000 {
> +	};
> +};
> +
> +#include "rk3576-pinctrl.dtsi"

