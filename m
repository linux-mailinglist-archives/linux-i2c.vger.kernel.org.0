Return-Path: <linux-i2c+bounces-5548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF9957540
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32B91C23210
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C41C1DD38D;
	Mon, 19 Aug 2024 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="a0e9wlXC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFF18E0E;
	Mon, 19 Aug 2024 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097954; cv=pass; b=dxI+/YmzoZ/JEqmCqHZAyxKZq/O51H5e733OB6wBFDklXw+wUza6AXQdl7Ib7iYVeyZerxhPFvlUVnjuWb9D1A779JeYUDzKQ/9NRS/ijrwliSQvf1v8JfBXXhUgbnn7zuAUniGc/tDe3NzVlDZeOJJQnXXT2aV4eTMCv1S6D8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097954; c=relaxed/simple;
	bh=MOMyK03eJyKQOGb8+b6fAg9EwcsINxYUyot/w6sRaY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvaryNk+7Mu9Z1Mk6fiuVZuC0og0OcdbLUhbr4wzRgUawfcl5hg7UkCyXcoVt52vnm2gDr6PVS2ZDBDmQYLgzJCkq4LxgDJYPDQ1+hblSSZ7EKwRc+K4QJqua0nPlTKKF6to+PML8++EutVQSDrShm1ch3jrpWuBeH3Z1vt8GgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=a0e9wlXC; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724097881; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mbUnXMxQcnVKk11zc5ntwAcnrBBrfHYc79EHMLCWKn5hDAToFvfc1vAp5I5LFLVjWZs2zmZPiSirc7dLrhBI4q5l3AtUKYh7X+HG6aExvhm7g9A9hvCGVaF7El7Jz3FsX13HGkUqFZtihZdJcmQkOAGMks1+LHxIihLvEp6swpw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724097881; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iAA8ouM6M/6kyeb+SrOHPtwZsGUYRPGPpNqj8UiAUpY=; 
	b=hjLtvJj3FSGEcuvYGirBRak9OxSZhSZlPIHBMWr0SkonXTpJDgubKmg8jrLlvb8JRD8nrfa8DHQJI0Np3p9H7NeF0KEzPhrteVhuBBt08xFIMqqXukhBw91DCXeE0ZPfvIyZO8xMcaAbHjjubPtUCwpCpwNLmUeakzt8B2B1nRc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724097881;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=iAA8ouM6M/6kyeb+SrOHPtwZsGUYRPGPpNqj8UiAUpY=;
	b=a0e9wlXCB7HKm0DAbBwhKl41bOz9h4d/rV3kzgUZKYrlZ8h7gQImGySlTwv571zT
	8iNGG6SiTKkMvinFqdhrbHNxMVjc8OVup8C2rybL+BooMVy1wPV6zvLLl2H7GIzOoFA
	oWALsvdVit+8vfOcXWLluYpzi0Pk50AFsez/ojE0=
Received: by mx.zohomail.com with SMTPS id 1724097879493204.13829241998803;
	Mon, 19 Aug 2024 13:04:39 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Johan Jonker <jbx6244@yandex.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Muhammed Efe Cetin <efectn@protonmail.com>, Andy Yan <andyshrk@163.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Alexey Charkov <alchark@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 09/10] arm64: dts: rockchip: Add rk3576 SoC base DT
Date: Mon, 19 Aug 2024 16:06:12 -0400
Message-ID: <1944590.atdPhlSkOF@trenzalore>
In-Reply-To: <c5014fe3-130b-4ace-a66e-8773a9a4f1dc@yandex.com>
References:
 <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-10-detlev.casanova@collabora.com>
 <c5014fe3-130b-4ace-a66e-8773a9a4f1dc@yandex.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Johan,

On Thursday, 15 August 2024 05:30:25 EDT Johan Jonker wrote:
> Some comments below. Whenever useful.
> 
> On 8/2/24 23:45, Detlev Casanova wrote:
> > This device tree contains all devices necessary for booting from network
> > or SD Card.
> > 
> > It supports CPU, CRU, PM domains, dma, interrupts, timers, UART and
> > SDHCI (everything necessary to boot Linux on this system on chip) as
> > well as Ethernet, I2C, SPI and OTP.
> > 
> > Also add the necessary DT bindings for the SoC.
> > 
> > Signed-off-by: Liang Chen <cl@rock-chips.com>
> > Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> > Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > [rebase, squash and reword commit message]
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> 
> [..]
> 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3576.dtsi new file mode 100644
> > index 0000000000000..00c4d2a153ced
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> [..]
> 
> For uart0..uart11:
> > +
> > +	uart1: serial@27310000 {
> > +		compatible = "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +		reg = <0x0 0x27310000 0x0 0x100>;
> > 
> > +		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> 
> "interrupts" are sort just like other properties. A mix of sort styles
> exists, so check all nodes.

Ok, so it should be sorted alphabetically with the following exceptions:
- 'compatible' and 'reg.*' on top
- "#.*" at the end, sorted
- "status" last.

Is that right ?

> > +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> > +		clock-names = "baudclk", "apb_pclk";
> > 
> > +		reg-shift = <2>;
> > +		reg-io-width = <4>;
> 
> Move below "reg".
> 
> > +		dmas = <&dmac0 8>, <&dmac0 9>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&uart1m0_xfer>;
> > +		status = "disabled";
> > +	};
> > +
> > +	pmu: power-management@27380000 {

[...]

> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				clocks = <&cru ACLK_VOP>,
> > +					 <&cru HCLK_VOP>,
> > +					 <&cru HCLK_VOP_ROOT>;
> > +				pm_qos = <&qos_vop_m0>,
> > +					 <&qos_vop_m1ro>;
> > +
> > +				power-domain@RK3576_PD_USB {
> 
> Since when is USB part of VOP?
> Recheck?

The TRM doesn't tell me anything, but If I don't put it as a child of VOP, it 
just hangs when the kernel tries to shut it down.

[...]

> > +
> > +	pinctrl: pinctrl {
> > +		compatible = "rockchip,rk3576-pinctrl";
> > +		rockchip,grf = <&ioc_grf>;
> > +		rockchip,sys-grf = <&sys_grf>;
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > 
> > +		gpio0: gpio@27320000 {
> 
> The use of gpio nodes as subnode of pinctrl is deprecated.
> 
> patternProperties:
>   "gpio@[0-9a-f]+$":
>     type: object
> 
>     $ref: /schemas/gpio/rockchip,gpio-bank.yaml#
>     deprecated: true
> 
>     unevaluatedProperties: false

I tried putting the gpio nodes out of the pinctrl node, they should work 
because they already have a gpio-ranges field.
But unfortunately, that seem to break the pinctrl driver which hangs at some 
point. Maybe some adaptations are needed to support this, or am I missing 
something ?

> > +			compatible = "rockchip,gpio-bank";
> 
> When in use as separate node the compatible must be SoC related.
> 
> Question for the maintainers: Extra entry to rockchip,gpio-bank.yaml ??
> 
> > +			reg = <0x0 0x27320000 0x0 0x200>;
> > +			interrupts = <GIC_SPI 153 
IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cru PCLK_GPIO0>, <&cru 
DBCLK_GPIO0>;
> > +
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			gpio-ranges = <&pinctrl 0 0 32>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <2>;
> > +		};
> > +
> > +		gpio1: gpio@2ae10000 {
> > +
> > +		gpio2: gpio@2ae20000 {
> > +
> > +		gpio3: gpio@2ae30000 {
> > +
> > +		gpio4: gpio@2ae40000 {
> > +	};
> > +};
> > +
> > +#include "rk3576-pinctrl.dtsi"

Regards,

Detlev




