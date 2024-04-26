Return-Path: <linux-i2c+bounces-3197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 773928B3095
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5B42827D8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62AF13A88F;
	Fri, 26 Apr 2024 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u59GTOxM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A46613A884;
	Fri, 26 Apr 2024 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714113411; cv=none; b=CC5BcEtOuQI6cRCVca9V16XSX1o7YsAXfneLFPqLxwMnY4pQqBvTiaZTI5Io7MYzI8lboWo6364+VGKMxsuglB2S5pv1eFYY9u8MelHdSl9svqc0C42JlUynRHS8KviRuJ9bwogXCO/bALhgQfOIwMPnnafp/Hddyab5XQHQIQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714113411; c=relaxed/simple;
	bh=zBK7g+qN+gxsF4rU5ggqp4pY12D4FPO/9gwC8bpG/xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMmMXr+mDXovr4M6DWUoptXD4w1/ggU4Win/fYwtyxFMNcSppdMkgJahYSDumm0kg1BQfDQuJ0mAcjm5H77kQ4xbPEDzkYliTzgjhS7y12duU/nY6OzdqHujjfqiq5cpzaIlzqp6y0g9vl4JBQjj1WqooXjk93oLZI+i9V07nn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u59GTOxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAA5C113CE;
	Fri, 26 Apr 2024 06:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714113411;
	bh=zBK7g+qN+gxsF4rU5ggqp4pY12D4FPO/9gwC8bpG/xs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u59GTOxMKUWP0seE3ch5bNiWlzz5FiCoGmZFdzS7MAlro7/mxaoaf+cikdza94Zf5
	 +vLVKn0mhLA9TMfrrrePm0ZPtwPtiLuSLCU5ZqywhRdZxoaLelXvfC1IW7zC8rfEYx
	 Y3h7l+Kn62M4s0sjZWAf9ez9Fht/vNezOuRgA9qKa30DIjBVRH9GDetRFHbHY2bfbm
	 xnBl7ToKADoIxBWAL3vVmrI03hd6IWHj7BWVHYEiniMQX5so4EvUymP5IXCQImY+yU
	 C2XtczL7r4dWoWF8tHEsPmRGufqYtSkDTnpWrSx1oTwWpvzgDOMfTdoWqwS6wpR+6I
	 KP+Tvnyr9ho3A==
Message-ID: <e13eca2b-b4aa-4583-878c-e88cebec0753@kernel.org>
Date: Fri, 26 Apr 2024 08:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] ARM: dts: aspeed: Add IBM P11 Fuji BMC system
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-15-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240425213701.655540-15-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2024 23:37, Eddie James wrote:
> Add the device tree for the new BMC system. The Fuji is a P11
> system with eight processors.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |    2 +
>  .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3984 +++++++++++++++++
>  2 files changed, 3986 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 715106b3baa1..783409b7c206 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -33,8 +33,10 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-facebook-yosemitev2.dtb \
>  	aspeed-bmc-facebook-yosemite4.dtb \
> +	aspeed-bmc-ibm-blueridge.dtb \
>  	aspeed-bmc-ibm-bonnell.dtb \
>  	aspeed-bmc-ibm-everest.dtb \
> +	aspeed-bmc-ibm-fuji.dtb \
>  	aspeed-bmc-ibm-rainier.dtb \
>  	aspeed-bmc-ibm-rainier-1s4u.dtb \
>  	aspeed-bmc-ibm-rainier-4u.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
> new file mode 100644
> index 000000000000..dc41fa815761
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
> @@ -0,0 +1,3984 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2024 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +	model = "Fuji";
> +	compatible = "ibm,fuji-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		i2c500 = &cfam4_i2c0;
> +		i2c501 = &cfam4_i2c1;
> +		i2c510 = &cfam4_i2c10;
> +		i2c511 = &cfam4_i2c11;
> +		i2c512 = &cfam4_i2c12;
> +		i2c513 = &cfam4_i2c13;
> +		i2c514 = &cfam4_i2c14;
> +		i2c515 = &cfam4_i2c15;
> +		i2c602 = &cfam5_i2c2;
> +		i2c603 = &cfam5_i2c3;
> +		i2c610 = &cfam5_i2c10;
> +		i2c611 = &cfam5_i2c11;
> +		i2c614 = &cfam5_i2c14;
> +		i2c615 = &cfam5_i2c15;
> +		i2c616 = &cfam5_i2c16;
> +		i2c617 = &cfam5_i2c17;
> +		i2c700 = &cfam6_i2c0;
> +		i2c701 = &cfam6_i2c1;
> +		i2c710 = &cfam6_i2c10;
> +		i2c711 = &cfam6_i2c11;
> +		i2c712 = &cfam6_i2c12;
> +		i2c713 = &cfam6_i2c13;
> +		i2c714 = &cfam6_i2c14;
> +		i2c715 = &cfam6_i2c15;
> +		i2c802 = &cfam7_i2c2;
> +		i2c803 = &cfam7_i2c3;
> +		i2c810 = &cfam7_i2c10;
> +		i2c811 = &cfam7_i2c11;
> +		i2c814 = &cfam7_i2c14;
> +		i2c815 = &cfam7_i2c15;
> +		i2c816 = &cfam7_i2c16;
> +		i2c817 = &cfam7_i2c17;
> +
> +		i2c16 = &i2c4mux0chn0;
> +		i2c17 = &i2c4mux0chn1;
> +		i2c18 = &i2c4mux0chn2;
> +		i2c19 = &i2c5mux0chn0;
> +		i2c20 = &i2c5mux0chn1;
> +		i2c21 = &i2c5mux0chn2;
> +		i2c22 = &i2c5mux0chn3;
> +		i2c23 = &i2c6mux0chn0;
> +		i2c24 = &i2c6mux0chn1;
> +		i2c25 = &i2c6mux0chn2;
> +		i2c26 = &i2c6mux0chn3;
> +		i2c27 = &i2c14mux0chn0;
> +		i2c28 = &i2c14mux0chn1;
> +		i2c29 = &i2c14mux0chn2;
> +		i2c30 = &i2c14mux0chn3;
> +		i2c31 = &i2c14mux1chn0;
> +		i2c32 = &i2c14mux1chn1;
> +		i2c33 = &i2c14mux1chn2;
> +		i2c34 = &i2c14mux1chn3;
> +		i2c35 = &i2c15mux0chn0;
> +		i2c36 = &i2c15mux0chn1;
> +		i2c37 = &i2c15mux0chn2;
> +		i2c38 = &i2c15mux0chn3;
> +		i2c39 = &i2c15mux1chn0;
> +		i2c40 = &i2c15mux1chn1;
> +		i2c41 = &i2c15mux1chn2;
> +		i2c42 = &i2c15mux1chn3;
> +		i2c43 = &i2c15mux2chn0;
> +		i2c44 = &i2c15mux2chn1;
> +		i2c45 = &i2c15mux2chn2;
> +		i2c46 = &i2c15mux2chn3;
> +		i2c47 = &i2c8mux0chn0;
> +		i2c48 = &i2c8mux0chn1;
> +
> +		serial4 = &uart5;
> +
> +		sbefifo500 = &sbefifo500;
> +		sbefifo501 = &sbefifo501;
> +		sbefifo510 = &sbefifo510;
> +		sbefifo511 = &sbefifo511;
> +		sbefifo512 = &sbefifo512;
> +		sbefifo513 = &sbefifo513;
> +		sbefifo514 = &sbefifo514;
> +		sbefifo515 = &sbefifo515;
> +		sbefifo602 = &sbefifo602;
> +		sbefifo603 = &sbefifo603;
> +		sbefifo610 = &sbefifo610;
> +		sbefifo611 = &sbefifo611;
> +		sbefifo614 = &sbefifo614;
> +		sbefifo615 = &sbefifo615;
> +		sbefifo616 = &sbefifo616;
> +		sbefifo617 = &sbefifo617;
> +		sbefifo700 = &sbefifo700;
> +		sbefifo701 = &sbefifo701;
> +		sbefifo710 = &sbefifo710;
> +		sbefifo711 = &sbefifo711;
> +		sbefifo712 = &sbefifo712;
> +		sbefifo713 = &sbefifo713;
> +		sbefifo714 = &sbefifo714;
> +		sbefifo715 = &sbefifo715;
> +		sbefifo802 = &sbefifo802;
> +		sbefifo803 = &sbefifo803;
> +		sbefifo810 = &sbefifo810;
> +		sbefifo811 = &sbefifo811;
> +		sbefifo814 = &sbefifo814;
> +		sbefifo815 = &sbefifo815;
> +		sbefifo816 = &sbefifo816;
> +		sbefifo817 = &sbefifo817;
> +
> +		scom500 = &scom500;
> +		scom501 = &scom501;
> +		scom510 = &scom510;
> +		scom511 = &scom511;
> +		scom512 = &scom512;
> +		scom513 = &scom513;
> +		scom514 = &scom514;
> +		scom515 = &scom515;
> +		scom602 = &scom602;
> +		scom603 = &scom603;
> +		scom610 = &scom610;
> +		scom611 = &scom611;
> +		scom614 = &scom614;
> +		scom615 = &scom615;
> +		scom616 = &scom616;
> +		scom617 = &scom617;
> +		scom700 = &scom700;
> +		scom701 = &scom701;
> +		scom710 = &scom710;
> +		scom711 = &scom711;
> +		scom712 = &scom712;
> +		scom713 = &scom713;
> +		scom714 = &scom714;
> +		scom715 = &scom715;
> +		scom802 = &scom802;
> +		scom803 = &scom803;
> +		scom810 = &scom810;
> +		scom811 = &scom811;
> +		scom814 = &scom814;
> +		scom815 = &scom815;
> +		scom816 = &scom816;
> +		scom817 = &scom817;
> +
> +		spi50 = &cfam4_spi0;
> +		spi51 = &cfam4_spi1;
> +		spi52 = &cfam4_spi2;
> +		spi53 = &cfam4_spi3;
> +		spi60 = &cfam5_spi0;
> +		spi61 = &cfam5_spi1;
> +		spi62 = &cfam5_spi2;
> +		spi63 = &cfam5_spi3;
> +		spi70 = &cfam6_spi0;
> +		spi71 = &cfam6_spi1;
> +		spi72 = &cfam6_spi2;
> +		spi73 = &cfam6_spi3;
> +		spi80 = &cfam7_spi0;
> +		spi81 = &cfam7_spi1;
> +		spi82 = &cfam7_spi2;
> +		spi83 = &cfam7_spi3;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8";


Drop bootargs. Everywhere.

> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		event_log: tcg_event_log@b3d00000 {

Same problem



> +
> +	usb_power-hog {

No underscores.

> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
> +		output-high;
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c64";
> +		reg = <0x51>;
> +	};
> +
> +	pca1: pca9552@62 {

All my previous comments apply.



Best regards,
Krzysztof


