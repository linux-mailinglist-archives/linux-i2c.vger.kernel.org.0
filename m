Return-Path: <linux-i2c+bounces-3196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA218B3091
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAB131F214A2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8794213AA31;
	Fri, 26 Apr 2024 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XP7Ni1uw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE1A13AA20;
	Fri, 26 Apr 2024 06:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714113348; cv=none; b=lpDvwmWW0P/vUkAsn8En+M+BeNn5YeYdWMTZvN/MkQElf+1oJDicZBrXLDwmkxtfSZ/17EkDICVujPeFfWsf+PQXvYghrx8MNPGYWmYZIZDdRRIlgDMFVIn/nub/KHICEDrmAVDHYByoKCzQT2Ujl0Pf7cvbh1jQwnXj1zTTK7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714113348; c=relaxed/simple;
	bh=RbWSL3rKRB91eZg18rXGPl0tISwD1FwO73TKO3S0/Co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrkrGV+ZsRIexwKz7ATrpW6lO+uYl7SIq0gBFCZFKpolh9c2ig+3rEJqT1kyRoRv0eqbvjJkmveYV3x9YynYWT9Jjl1Yl1iPBn6mWD79BC8xrKRc8XyDCrM0ztIy7AP/cMqltr82K7Q6SRaX2+tUhxDoBvWWZZSq2OBmV4X3yXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XP7Ni1uw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCABC113CD;
	Fri, 26 Apr 2024 06:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714113347;
	bh=RbWSL3rKRB91eZg18rXGPl0tISwD1FwO73TKO3S0/Co=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XP7Ni1uwiLiVNbxUnHuL6grl8pY4gjDS6VtBBEGujfo8z4Ilot/CDCenM7IE08AsX
	 gRKEQb2n25SYqppry361qlDAoggc3hY8BEFKSfNeD8Q3phPfroogtrx+wFyflo1NkP
	 9HCybdLIUrcQPpWdEI8XWY1IvGzAqMYmfgdynl5omGgogUPcdaBkXbLK37RYs/FRdr
	 8jEPgPyEd8U58DuRC7EdkUmRFCfEq0aCIWkgasfKeaYCYkcC5WiFLV6V2IDy3be7C8
	 Xx/itasF49P05JSx1Otjr/Mi0/WtTIM4GsBKakHJa6mEnq6Fp5AE8HS1JIJCbQa3Dw
	 YTBcCXVZf6DRg==
Message-ID: <b6c54d2e-9906-4607-bc19-e0de077c25b9@kernel.org>
Date: Fri, 26 Apr 2024 08:35:40 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] ARM: dts: aspeed: Add IBM P11 Blueridge BMC
 system
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-14-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240425213701.655540-14-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2024 23:37, Eddie James wrote:
> Add the device tree for the new BMC system. The Blueridge is a
> P11 system with four processors.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1711 +++++++++++++++++
>  1 file changed, 1711 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
> new file mode 100644
> index 000000000000..8503ce2480b5
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
> @@ -0,0 +1,1711 @@
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
> +	model = "Blueridge";
> +	compatible = "ibm,blueridge-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +		i2c16 = &i2c2mux0;
> +		i2c17 = &i2c2mux1;
> +		i2c18 = &i2c2mux2;
> +		i2c19 = &i2c2mux3;
> +		i2c20 = &i2c4mux0chn0;
> +		i2c21 = &i2c4mux0chn1;
> +		i2c22 = &i2c4mux0chn2;
> +		i2c23 = &i2c5mux0chn0;
> +		i2c24 = &i2c5mux0chn1;
> +		i2c25 = &i2c6mux0chn0;
> +		i2c26 = &i2c6mux0chn1;
> +		i2c27 = &i2c6mux0chn2;
> +		i2c28 = &i2c6mux0chn3;
> +		i2c29 = &i2c11mux0chn0;
> +		i2c30 = &i2c11mux0chn1;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8 earlycon";

Drop bootargs. ALWAYS.


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

No underscores.

Didn't you already received such basic review?


> +			no-map;
> +			reg = <0xb3d00000 0x100000>;
> +		};
> +
> +		ramoops@b3e00000 {
> +			compatible = "ramoops";
> +			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
> +			record-size = <0x8000>;
> +			console-size = <0x8000>;
> +			ftrace-size = <0x8000>;
> +			pmsg-size = <0x8000>;
> +			max-reason = <3>; /* KMSG_DUMP_EMERG */
> +		};
> +
> +		/* LPC FW cycle bridge region requires natural alignment */
> +		flash_memory: region@b4000000 {
> +			no-map;
> +			reg = <0xb4000000 0x04000000>; /* 64M */
> +		};
> +
> +		/* VGA region is dictated by hardware strapping */
> +		vga_memory: region@bf000000 {
> +			no-map;
> +			compatible = "shared-dma-pool";
> +			reg = <0xbf000000 0x01000000>;  /* 16M */
> +		};
> +	};
> +
> +	i2c2mux: i2cmux {
> +		compatible = "i2c-mux-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";

??? Drop


> +
> +		i2c-parent = <&i2c2>;
> +		mux-gpios = <&gpio0 ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>,
> +			    <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
> +		idle-state = <0>;
> +
> +		i2c2mux0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		i2c2mux1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		i2c2mux2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		i2c2mux3: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		/* BMC Card fault LED at the back */
> +		led-bmc-ingraham0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* Enclosure ID LED at the back */
> +		led-rear-enc-id0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* Enclosure fault LED at the back */
> +		led-rear-enc-fault0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* PCIE slot power LED */
> +		led-pcieslot-power {
> +			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		poll-interval = <1000>;
> +
> +		event-fan0-presence {
> +			label = "fan0-presence";
> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <6>;
> +		};
> +
> +		event-fan1-presence {
> +			label = "fan1-presence";
> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <7>;
> +		};
> +
> +		event-fan2-presence {
> +			label = "fan2-presence";
> +			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
> +			linux,code = <8>;
> +		};
> +
> +		event-fan3-presence {
> +			label = "fan3-presence";
> +			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
> +			linux,code = <9>;
> +		};
> +
> +		event-fan4-presence {
> +			label = "fan4-presence";
> +			gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
> +			linux,code = <10>;
> +		};
> +
> +		event-fan5-presence {
> +			label = "fan5-presence";
> +			gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
> +			linux,code = <11>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc1 7>;
> +	};
> +};
> +
> +&adc1 {
> +	status = "okay";
> +	aspeed,int-vref-microvolt = <2500000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +		&pinctrl_adc10_default &pinctrl_adc11_default
> +		&pinctrl_adc12_default &pinctrl_adc13_default
> +		&pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&uhci {
> +	status = "okay";
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","","","","",
> +	/*B0-B7*/	"","","","","","","checkstop","",
> +	/*C0-C7*/	"","","","","","","","",
> +	/*D0-D7*/	"","","","","","","","",
> +	/*E0-E7*/	"","","","","","","","",
> +	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","","factory-reset-toggle","",
> +	/*G0-G7*/	"","","","","","","","",
> +	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
> +	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"","","","","","","","",
> +	/*O0-O7*/	"","","","usb-power","","","","",
> +	/*P0-P7*/	"","","","","pcieslot-power","","","",
> +	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
> +	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
> +	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
> +	"power-ffs-sync-history","","","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","","","","","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","";
> +
> +	i2c3_mux_oe_n-hog {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_LOW>;
> +		output-high;
> +		line-name = "I2C3_MUX_OE_N";
> +	};
> +
> +	usb_power-hog {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
> +		output-high;
> +	};
> +};
> +
> +&emmc_controller {
> +	status = "okay";
> +};
> +
> +&pinctrl_emmc_default {
> +	bias-disable;
> +};
> +
> +&emmc {
> +	status = "okay";
> +	clk-phase-mmc-hs200 = <180>, <180>;
> +};
> +
> +&ibt {
> +	status = "okay";
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
> +	tca_pres1: tca9554@20{

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Also missing space before {


> +		compatible = "ti,tca9554";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names = "",
> +			"RUSSEL_FW_I2C_ENABLE_N",
> +			"RUSSEL_OPPANEL_PRESENCE_N",
> +			"BLYTH_OPPANEL_PRESENCE_N",
> +			"CPU_TPM_CARD_PRESENT_N",
> +			"DASD_BP2_PRESENT_N",
> +			"DASD_BP1_PRESENT_N",
> +			"DASD_BP0_PRESENT_N";
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	power-supply@68 {
> +		compatible = "ibm,cffps";
> +		reg = <0x68>;
> +	};
> +
> +	power-supply@69 {
> +		compatible = "ibm,cffps";
> +		reg = <0x69>;
> +	};
> +
> +	pca_pres1: pca9552@61 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "nxp,pca9552";
> +		reg = <0x61>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names =
> +			"SLOT0_PRSNT_EN_RSVD", "SLOT1_PRSNT_EN_RSVD",
> +			"SLOT2_PRSNT_EN_RSVD", "SLOT3_PRSNT_EN_RSVD",
> +			"SLOT4_PRSNT_EN_RSVD", "SLOT0_EXPANDER_PRSNT_N",
> +			"SLOT1_EXPANDER_PRSNT_N", "SLOT2_EXPANDER_PRSNT_N",
> +			"SLOT3_EXPANDER_PRSNT_N", "SLOT4_EXPANDER_PRSNT_N",
> +			"", "", "", "", "", "";
> +	};
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	tmp275@48 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {

So it's everywhere...

> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";

Why? Drop

> +		i2c-mux-idle-disconnect;
> +
> +		i2c4mux0chn0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c64";
> +				reg = <0x50>;
> +			};
> +
> +			pca9551@60 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +				compatible = "nxp,pca9551";
> +				reg = <0x60>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				led@0 {
> +					label = "cablecard0-cxp-top";
> +					reg = <0>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +
> +				led@1 {
> +					label = "cablecard0-cxp-bot";
> +					reg = <1>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +			};
> +		};
> +
> +		i2c4mux0chn1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;

reg is after compatible, which means if there is no compatible, reg is
always first. This applies you all your DTS patches. This patchset and
future.


> +
> +			eeprom@51 {
> +				compatible = "atmel,24c64";
> +				reg = <0x51>;
> +			};
> +		};
> +
> +		i2c4mux0chn2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +
> +			eeprom@52 {
> +				compatible = "atmel,24c64";
> +				reg = <0x52>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	tmp275@48 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {
> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";

Drop


> +		i2c-mux-idle-disconnect;
> +
> +		i2c5mux0chn0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c64";
> +				reg = <0x50>;
> +			};
> +
> +			pca9551@60 {
> +				compatible = "nxp,pca9551";
> +				reg = <0x60>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				led@0 {
> +					label = "cablecard3-cxp-top";
> +					reg = <0>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +
> +				led@1 {
> +					label = "cablecard3-cxp-bot";
> +					reg = <1>;
> +					retain-state-shutdown;
> +					default-state = "keep";
> +					type = <PCA955X_TYPE_LED>;
> +				};
> +			};
> +		};
> +
> +		i2c5mux0chn1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +
> +			eeprom@51 {
> +				compatible = "atmel,24c64";
> +				reg = <0x51>;
> +			};
> +
> +			pca9551@61 {
> +				compatible = "nxp,pca9551";
> +				reg = <0x61>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;


And here you have correct order of properties...



Best regards,
Krzysztof


