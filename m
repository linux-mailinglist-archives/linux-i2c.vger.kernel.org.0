Return-Path: <linux-i2c+bounces-10759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B9AA8CE3
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 09:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271FF3A540A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 07:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF04C1A3169;
	Mon,  5 May 2025 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Us9Q1sqH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239116F0FE
	for <linux-i2c@vger.kernel.org>; Mon,  5 May 2025 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429373; cv=none; b=tNEVsjqcfQf8IftXCgK6V8+qGzMkYEcVZBnC9F09h2zVHbV9Dml7TUG6fF7+tPbMl47KUqI2NFR3mWO9UZ2NqI3UpTor1hBbTA9Jl28w3Anp+C7B92/P0yvBvsiu+I+qCxVtE8DW9HXS7WDDy5vMv8/Vr6Su7G/C/IiHiZVNpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429373; c=relaxed/simple;
	bh=dWsgs3StDp5NfrqEmNwBsxpG0yY5EeSOTheWPqbEBfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxyMZOQF+ERBtEZdEY6RuDbh4zowcSXFXuDRA68c844JCJ5NUQaauhVYNj/clK29U6cEQlGcGr5KF3djtnynM555Vv0LT2KdANVcLv1irMNLtzUU3BzyuXJ1sTUU0Xfn4fYGjtfJ9BtEiTW2BcmRT4LS/XQO16BgXLsZmsEN0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Us9Q1sqH; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746429371;
 bh=uCAJ/1smKtAmYm+WKYPnozKlTBBJTpkCk5xD4ZLhIP8=;
 b=Us9Q1sqHAmZrYcY83ISen4PTXBhChQ6uQAfgQkqElm+O3GKRoWTygphpWVOYJQefh8d2MRhMZ
 Q6NzMHTVAZoe81h3fT+NZMSrSNtyIqmVvP1GYxVQ54axnX1OZbyCTHhrarmKDT2NnbBTUwENzsG
 aaWawX2w7NmwaTjL7qXUz55CLwY98fq/Jh0VjJXmJXHMnfyiZzgAdNYeEXFynOwRdHYUpsqWXOS
 aRVRx+99V2Tx/ZxcSeuJyQ8u/O36umGCGtpO/lxKL5tknXjtzNVRM/vNFgbRiMDtp9v1D2DueEK
 XNpEQc16LbXOr/oGm7AcE10dowMdinkTHIBnH9J3t4Tg==
X-Forward-Email-ID: 6818635ebaed44ffca19f3f7
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <727f7797-3a0c-426a-8f74-6adfb3215dc7@kwiboo.se>
Date: Mon, 5 May 2025 09:06:01 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add I2C controllers for
 RK3528
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-5-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417120118.17610-5-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-17 14:01, Yao Zi wrote:
> Describe I2C controllers shipped by RK3528 in devicetree. For I2C-2,
> I2C-4 and I2C-7 which come with only a set of possible pins, a default
> pin configuration is included.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reading from the i2c EEPROM on a E20C works with this, so this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 110 +++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 826f9be0be19..2c9780069af9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -24,6 +24,14 @@ aliases {
>  		gpio2 = &gpio2;
>  		gpio3 = &gpio3;
>  		gpio4 = &gpio4;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> @@ -465,6 +473,108 @@ uart7: serial@ffa28000 {
>  			status = "disabled";
>  		};
>  
> +		i2c0: i2c@ffa50000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa50000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@ffa58000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa58000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@ffa60000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa60000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c2m1_xfer>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@ffa68000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa68000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@ffa70000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa70000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c4_xfer>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@ffa78000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa78000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@ffa80000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa80000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@ffa88000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa88000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C7>, <&cru PCLK_I2C7>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c7_xfer>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		saradc: adc@ffae0000 {
>  			compatible = "rockchip,rk3528-saradc";
>  			reg = <0x0 0xffae0000 0x0 0x10000>;


