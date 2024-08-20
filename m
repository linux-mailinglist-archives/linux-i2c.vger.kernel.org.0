Return-Path: <linux-i2c+bounces-5601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A32958826
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 15:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD811F22C06
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 13:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5AA1917C8;
	Tue, 20 Aug 2024 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="bhu5URS2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88E19067A;
	Tue, 20 Aug 2024 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724161440; cv=none; b=ANYTGfpkMLBti1L83xeoxXPJyHZgy20H/fX4ztEZdJtjO/keUYlD7ezs+djCoChWaa9yEY/nL8SvJH4PMsHG+2UWc+8e1kN9UxrHYFaD4hUKCDTWt3/snx6+1BxA+wPgg2KLgXU7AS7HiIpHzh9uf62nr5nB9rJtKyNJZoEdyTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724161440; c=relaxed/simple;
	bh=qTsnJN49+aS05L1oPB0ek5eAdQnTO8MqCs+X6kYnMq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUa/GSXq36hb/z6eb03xhGSytxAk6OQ3JJmnkn3IsIeXvdP9o8BHqUd++Ra1/Lp+7vtozlOejXwO0mG6mzFcwM63Wp17jR7xPCcD4sdvrHXsd2IGD4UAR52KwUl9T+qaS5i3TeCtIFiRm9wXFGQAZVT3zt1VKyQFR4X6UxNzebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=bhu5URS2; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Received: from mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net [IPv6:2a02:6b8:c2b:1d5:0:640:773e:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id C0386613DD;
	Tue, 20 Aug 2024 16:35:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id wYNd7uDTquQ0-i9SdytvD;
	Tue, 20 Aug 2024 16:35:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1724160904; bh=Yc+SkPJPd/j9LC0nYHlrZb5VAOmJ1MFJRkiKmb/ch6A=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=bhu5URS2bSD/fVC8Dzn+eKEyID2HpY0mlyRqNtDTSUdfHvfOHvpoG8f/DIwhJOPxu
	 eOMB7ZhqdzATeB1LPxOZQSQkmYA8bGSktt/+FWQxImxAPvg/JVNww43A4AKyEx+azv
	 l024ikWXXXUw7S/kMhF9tVYCOBmo0Gs0gSpiSQ8A=
Authentication-Results: mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <1d7ffd09-99b9-43d8-a2f5-6e5455b4e5a1@yandex.com>
Date: Tue, 20 Aug 2024 15:34:58 +0200
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
 <c5014fe3-130b-4ace-a66e-8773a9a4f1dc@yandex.com>
 <1944590.atdPhlSkOF@trenzalore>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <1944590.atdPhlSkOF@trenzalore>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/19/24 22:06, Detlev Casanova wrote:
> Hi Johan,
> 
> On Thursday, 15 August 2024 05:30:25 EDT Johan Jonker wrote:
>> Some comments below. Whenever useful.
>>
>> On 8/2/24 23:45, Detlev Casanova wrote:
>>> This device tree contains all devices necessary for booting from network
>>> or SD Card.
>>>
>>> It supports CPU, CRU, PM domains, dma, interrupts, timers, UART and
>>> SDHCI (everything necessary to boot Linux on this system on chip) as
>>> well as Ethernet, I2C, SPI and OTP.
>>>
>>> Also add the necessary DT bindings for the SoC.
>>>
>>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>>> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
>>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>>> [rebase, squash and reword commit message]
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>
>> [..]
>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>>> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi new file mode 100644
>>> index 0000000000000..00c4d2a153ced
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> [..]
>>
>> For uart0..uart11:
>>> +
>>> +	uart1: serial@27310000 {
>>> +		compatible = "rockchip,rk3576-uart", "snps,dw-apb-
> uart";
>>> +		reg = <0x0 0x27310000 0x0 0x100>;
>>>
>>> +		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
>>
>> "interrupts" are sort just like other properties. A mix of sort styles
>> exists, so check all nodes.
> 
> Ok, so it should be sorted alphabetically with the following exceptions:
> - 'compatible' and 'reg.*' on top
> - "#.*" at the end, sorted
> - "status" last.
> 
> Is that right ?

The dts-coding-style.rst does not say much about things with "#",
so below a property they refer to or at the end looks nicer.
No strict rule, but do it in a consistent style in file. 

Original comment by robh for things with "reg":
"It makes more sense to keep reg-io-width together with reg."
https://lore.kernel.org/all/20240131135955.GA966672-robh@kernel.org/

> 
>>> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
>>> +		clock-names = "baudclk", "apb_pclk";
>>>
>>> +		reg-shift = <2>;
>>> +		reg-io-width = <4>;
>>
>> Move below "reg".
>>
>>> +		dmas = <&dmac0 8>, <&dmac0 9>;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&uart1m0_xfer>;
>>> +		status = "disabled";
>>> +	};
>>> +
>>> +	pmu: power-management@27380000 {
> 
> [...]
> 
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&cru ACLK_VOP>,
>>> +					 <&cru HCLK_VOP>,
>>> +					 <&cru HCLK_VOP_ROOT>;
>>> +				pm_qos = <&qos_vop_m0>,
>>> +					 <&qos_vop_m1ro>;
>>> +
>>> +				power-domain@RK3576_PD_USB {
>>
>> Since when is USB part of VOP?
>> Recheck?
> 
> The TRM doesn't tell me anything, but If I don't put it as a child of VOP, it 
> just hangs when the kernel tries to shut it down.

Could the people from Rockchip disclose the USB PD location?

> 
> [...]
> 
>>> +
>>> +	pinctrl: pinctrl {
>>> +		compatible = "rockchip,rk3576-pinctrl";
>>> +		rockchip,grf = <&ioc_grf>;
>>> +		rockchip,sys-grf = <&sys_grf>;
>>> +		#address-cells = <2>;
>>> +		#size-cells = <2>;
>>> +		ranges;
>>> +
>>>
>>> +		gpio0: gpio@27320000 {
>>
>> The use of gpio nodes as subnode of pinctrl is deprecated.
>>
>> patternProperties:
>>   "gpio@[0-9a-f]+$":
>>     type: object
>>
>>     $ref: /schemas/gpio/rockchip,gpio-bank.yaml#
>>     deprecated: true
>>
>>     unevaluatedProperties: false
> 

> I tried putting the gpio nodes out of the pinctrl node, they should work 
> because they already have a gpio-ranges field.
> But unfortunately, that seem to break the pinctrl driver which hangs at some 
> point. Maybe some adaptations are needed to support this, or am I missing 
> something ?

The aliases that we added to the DT files are a work around to prevent damage when we moved to generic gpio node names.
There just happened to be some code for it in the driver...
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpio/gpio-rockchip.c#n719

Comment by robh:
"GPIO shouldn't really have an alias either IMO."
https://lore.kernel.org/linux-arm-kernel/20230118153236.GA33699-robh@kernel.org/

Mainline Rockchip gpio driver is not so to the standard.
The file gpio-rockchip.c currently does nothing with "gpio-ranges" vs. bank and node relation.
My simple patch was acked, but never applied. There's no public maintainer response of what to improve.
Guess, probably something more complicated idiot prove "gpio-ranges" parsing/bank linking is needed?
https://lore.kernel.org/linux-arm-kernel/890be9a0-8e82-a8f4-bc15-d5d1597343c2@gmail.com/

I leave this subject up to the experts to find out what is needed to improve.
Don't ask me.

Johan
> 
>>> +			compatible = "rockchip,gpio-bank";
>>
>> When in use as separate node the compatible must be SoC related.
>>
>> Question for the maintainers: Extra entry to rockchip,gpio-bank.yaml ??
>>
>>> +			reg = <0x0 0x27320000 0x0 0x200>;
>>> +			interrupts = <GIC_SPI 153 
> IRQ_TYPE_LEVEL_HIGH>;
>>> +			clocks = <&cru PCLK_GPIO0>, <&cru 
> DBCLK_GPIO0>;
>>> +
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			gpio-ranges = <&pinctrl 0 0 32>;
>>> +			interrupt-controller;
>>> +			#interrupt-cells = <2>;
>>> +		};
>>> +
>>> +		gpio1: gpio@2ae10000 {
>>> +
>>> +		gpio2: gpio@2ae20000 {
>>> +
>>> +		gpio3: gpio@2ae30000 {
>>> +
>>> +		gpio4: gpio@2ae40000 {
>>> +	};
>>> +};
>>> +
>>> +#include "rk3576-pinctrl.dtsi"
> 
> Regards,
> 
> Detlev
> 
> 
> 

