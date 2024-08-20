Return-Path: <linux-i2c+bounces-5605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C02958E93
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 21:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437DE1F231B4
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 19:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC17115AAB6;
	Tue, 20 Aug 2024 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="g04M+uYG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC619478;
	Tue, 20 Aug 2024 19:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724181848; cv=pass; b=jtO7v0QEwZoYtM2Bcqo88RdxW9o4GUqZoS1zOj7N1Ch7GkNUyuVhupqWIrJfQIMQ/EHbVTuyYx1xkjnE8I0I3r6B2lltiC3SjHcv0aJFat5xDCN6W+ISYtXkzlTfkdArdTvksi5fumiu/AK0vsPxeShFJSTK2z22f6LSCnI36GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724181848; c=relaxed/simple;
	bh=z3GuI3y4MsMq2tzsuXHVTmg5sDQk0xPIA4ZUAtiO+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMEMV9LIFQYBeMxWWoxe5DtHHVUVViMUt1gx3gUVnspOQ/rPqI3ru0RB8T1YDC62aKsVNyRjuJlEmtWruZL93R5DgklpqCtqfsarj8qE74iE43zUj47SiVUdgWfMukINwI8bt9Wd6vo0CHtbdxLpLkGbCAflGMkQql4H7S9G1HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=g04M+uYG; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724181757; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jk3LVacixiOG0aJjhPGszugbAOO81rVHA7Y1Sr9RyHG7ZFdP9IcEh7umfkvxEfiV3Wo3H+EMNFFQU8eSXaUEGxi8ycBbbCNlug9GYWpp9DfoIw5AAQh/Tku3vTk7csJN2Eatq11UCYNqmz1ONPgrfqKaUXqXsi+eQrdklOhUXhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724181757; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AfJrCQJKAavx21ngm+ZjM4R3GCjrEmAM7/Ae1wSjgGM=; 
	b=SaUutyxDt7d4a8CkGfmYPK+GL104NlYaVCMLror7rUoKoLvGBcrtOBzFwej6XZtXeMMDVzhX2ht6oQrPO/WXYEsSRhq9/upWFVGuLPAcjZcJ3NPH7HLV5Ddc9Cs93oqsIlh5Y4PkG563E0v09YpuLyAU9/sy8HMjNvGWqxSr3aE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724181757;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=AfJrCQJKAavx21ngm+ZjM4R3GCjrEmAM7/Ae1wSjgGM=;
	b=g04M+uYGBCTVj6Yq5/Aw/6DayBdPVt7+gQn4SWjQtwOdh9Z1So9dgkBVLoIUnRSd
	clqOLIgORf9rkgaZWkoWnguTbOLXk3CV2b72uF2b4jCGfs7QVkyrUf2S7jhByEDLPl+
	mxGT0gNSUQLearVZUxw+Yb9f4hf+sUeInfsnETK0=
Received: by mx.zohomail.com with SMTPS id 1724181754738255.10140579420602;
	Tue, 20 Aug 2024 12:22:34 -0700 (PDT)
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
Date: Tue, 20 Aug 2024 15:22:30 -0400
Message-ID: <3785092.MHq7AAxBmi@bootstrap>
In-Reply-To: <1d7ffd09-99b9-43d8-a2f5-6e5455b4e5a1@yandex.com>
References:
 <20240802214612.434179-1-detlev.casanova@collabora.com>
 <1944590.atdPhlSkOF@trenzalore>
 <1d7ffd09-99b9-43d8-a2f5-6e5455b4e5a1@yandex.com>
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

On Tuesday, 20 August 2024 09:34:58 EDT Johan Jonker wrote:
> On 8/19/24 22:06, Detlev Casanova wrote:
> > Hi Johan,
> > 
> > On Thursday, 15 August 2024 05:30:25 EDT Johan Jonker wrote:
> >> Some comments below. Whenever useful.
> >> 
> >> On 8/2/24 23:45, Detlev Casanova wrote:
> >>> This device tree contains all devices necessary for booting from network
> >>> or SD Card.
> >>> 
> >>> It supports CPU, CRU, PM domains, dma, interrupts, timers, UART and
> >>> SDHCI (everything necessary to boot Linux on this system on chip) as
> >>> well as Ethernet, I2C, SPI and OTP.
> >>> 
> >>> Also add the necessary DT bindings for the SoC.
> >>> 
> >>> Signed-off-by: Liang Chen <cl@rock-chips.com>
> >>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> >>> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> >>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> >>> [rebase, squash and reword commit message]
> >>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> >>> ---
> >> 
> >> [..]
> >> 
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >>> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi new file mode 100644
> >>> index 0000000000000..00c4d2a153ced
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >> 
> >> [..]
> >> 
> >> For uart0..uart11:
> >>> +
> >>> +	uart1: serial@27310000 {
> >>> +		compatible = "rockchip,rk3576-uart", "snps,dw-apb-
> > 
> > uart";
> > 
> >>> +		reg = <0x0 0x27310000 0x0 0x100>;
> >>> 
> >>> +		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> >> 
> >> "interrupts" are sort just like other properties. A mix of sort styles
> >> exists, so check all nodes.
> > 
> > Ok, so it should be sorted alphabetically with the following exceptions:
> > - 'compatible' and 'reg.*' on top
> > - "#.*" at the end, sorted
> > - "status" last.
> > 
> > Is that right ?
> 
> The dts-coding-style.rst does not say much about things with "#",
> so below a property they refer to or at the end looks nicer.
> No strict rule, but do it in a consistent style in file.
> 
> Original comment by robh for things with "reg":
> "It makes more sense to keep reg-io-width together with reg."
> https://lore.kernel.org/all/20240131135955.GA966672-robh@kernel.org/

Ok, I'll fix the consistency in the file then, thanks for the clarification.

> >>> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> >>> +		clock-names = "baudclk", "apb_pclk";
> >>> 
> >>> +		reg-shift = <2>;
> >>> +		reg-io-width = <4>;
> >> 
> >> Move below "reg".
> >> 
> >>> +		dmas = <&dmac0 8>, <&dmac0 9>;
> >>> +		pinctrl-names = "default";
> >>> +		pinctrl-0 = <&uart1m0_xfer>;
> >>> +		status = "disabled";
> >>> +	};
> >>> +
> >>> +	pmu: power-management@27380000 {
> > 
> > [...]
> > 
> >>> +				#address-cells = <1>;
> >>> +				#size-cells = <0>;
> >>> +				clocks = <&cru ACLK_VOP>,
> >>> +					 <&cru HCLK_VOP>,
> >>> +					 <&cru HCLK_VOP_ROOT>;
> >>> +				pm_qos = <&qos_vop_m0>,
> >>> +					 <&qos_vop_m1ro>;
> >>> +
> >>> +				power-domain@RK3576_PD_USB {
> >> 
> >> Since when is USB part of VOP?
> >> Recheck?
> > 
> > The TRM doesn't tell me anything, but If I don't put it as a child of VOP,
> > it just hangs when the kernel tries to shut it down.
> 
> Could the people from Rockchip disclose the USB PD location?
> 
> > [...]
> > 
> >>> +
> >>> +	pinctrl: pinctrl {
> >>> +		compatible = "rockchip,rk3576-pinctrl";
> >>> +		rockchip,grf = <&ioc_grf>;
> >>> +		rockchip,sys-grf = <&sys_grf>;
> >>> +		#address-cells = <2>;
> >>> +		#size-cells = <2>;
> >>> +		ranges;
> >>> +
> >>> 
> >>> +		gpio0: gpio@27320000 {
> >> 
> >> The use of gpio nodes as subnode of pinctrl is deprecated.
> >> 
> >> patternProperties:
> >>   "gpio@[0-9a-f]+$":
> >>     type: object
> >>     
> >>     $ref: /schemas/gpio/rockchip,gpio-bank.yaml#
> >>     deprecated: true
> >>     
> >>     unevaluatedProperties: false
> > 
> > I tried putting the gpio nodes out of the pinctrl node, they should work
> > because they already have a gpio-ranges field.
> > But unfortunately, that seem to break the pinctrl driver which hangs at
> > some point. Maybe some adaptations are needed to support this, or am I
> > missing something ?
> 
> The aliases that we added to the DT files are a work around to prevent
> damage when we moved to generic gpio node names. There just happened to be
> some code for it in the driver...
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dri
> vers/gpio/gpio-rockchip.c#n719

Just above that, it tries to get the pinctrl_dev from the parent node. So the 
rockchip,gpio-bank nodes have to be children of the pinctrl node or the gpio 
driver will just return -EPROBE_DEFER. 

> Comment by robh:
> "GPIO shouldn't really have an alias either IMO."
> https://lore.kernel.org/linux-arm-kernel/20230118153236.GA33699-robh@kernel.
> org/
>
> Mainline Rockchip gpio driver is not so to the standard.
> The file gpio-rockchip.c currently does nothing with "gpio-ranges" vs. bank
> and node relation. My simple patch was acked, but never applied. There's no
> public maintainer response of what to improve. Guess, probably something
> more complicated idiot prove "gpio-ranges" parsing/bank linking is needed?
> https://lore.kernel.org/linux-arm-kernel/890be9a0-8e82-a8f4-bc15-d5d1597343
> c2@gmail.com/

Indeed, the driver could use the gpio-ranges to determine the node's bank 
number. Currently it uses the aliases or falls back to the order of parsing 
nodes.
 
> I leave this subject up to the experts to find out what is needed to
> improve. Don't ask me.

My opinion on this is that the rockchip driver needs to be adapted if we want 
the gpio nodes out of the pinctrl. I'm willing to have a look at this, but I 
don't think it is in the scope for this patch set and don't think it should be 
a blocker.

> Johan
> 

Regards,
Detlev.




