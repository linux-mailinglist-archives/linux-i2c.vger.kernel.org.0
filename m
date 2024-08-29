Return-Path: <linux-i2c+bounces-5899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E32963DA1
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35F2C1F25E3F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97AB189F3C;
	Thu, 29 Aug 2024 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRwyU2vC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6F39AD6;
	Thu, 29 Aug 2024 07:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917818; cv=none; b=A3usxvp7zRs2oF1AnMfeSbcLExpkDcR22Rhq7vCiRp3OuUAMwRw2L+QqWluchaqhgS3YFfYgX8WsvHEqQFlsRRf4Ar37nerFeBedDQFm7hw5CQ6Q6sETeCCl2b9wutqAyQ974S9EVfdCkxVn9gR4w54u3ehso7XhM5izEl8E9QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917818; c=relaxed/simple;
	bh=yySpL/UStkSDjdRhowT1Laumh/XNqtf+69LeRIoauDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsN4CY7GCmut+ddvLLIjzHMMjyLc45eYCt1ZzR2z6LDmizwXjd/laVcuu91LqYpPNEjPYd6wQ1iEN7h7j91ke6CbSrsF2Am0WnYrFeRF9eg3ikkB7gmK1AwYiJ3ExXAUuCJxAoXFxdAspih6u/cNuSI60I/Y/qcEtcZ5wiDarKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRwyU2vC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D380C4CEC1;
	Thu, 29 Aug 2024 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724917817;
	bh=yySpL/UStkSDjdRhowT1Laumh/XNqtf+69LeRIoauDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RRwyU2vCnG6/6Hga8Fu5AfTHv3fggqLke+EAS3MChePTt7pueffNy1++DOoFujSIf
	 FdT986q2huP8mXGHISnQ6P3tBzVu8cpKAlkraqVn0BsjktpQvg0eljVecjCG3yMogF
	 Smh43XrEnAQLlEgV1ow+/Z7UaJu62hAvkQN0X9ZeiKLhuFyHel/fOL+iKjM6RrJ1OF
	 ANxHke8vszJDWRc06wtbZvaB/gxlxcwbUJO3OFAN0xfB4zTgx2J5hRTNBvJspyn3Mb
	 ILHIVCK7E0OunhNoshvMDKrwp8gUNFZsch7kj4yna1D/o5yurDXK8KrJ6O8Y3AxvWn
	 5m6c/ewYlE9rw==
Message-ID: <746be896-8798-44b0-aa86-e77cf34655e1@kernel.org>
Date: Thu, 29 Aug 2024 09:49:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] arm64: dts: qcom: Add reduced functional DT for
 SA8255p Ride platform
To: Nikunj Kela <quic_nkela@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com,
 andi.shyti@kernel.org, tglx@linutronix.de, will@kernel.org, joro@8bytes.org,
 jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net
Cc: robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com,
 lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com,
 agross@kernel.org, bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com,
 robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com, quic_tsoni@quicinc.com,
 quic_shazhuss@quicinc.com
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-23-quic_nkela@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240828203721.2751904-23-quic_nkela@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 22:37, Nikunj Kela wrote:
> SA8255p Ride platform is an automotive virtual platform. This platform
> abstracts resources such as clocks, regulators etc. in the firmware VM.
> The device drivers request resources operations over SCMI using power,
> performance, reset and sensor protocols.
> 
> Multiple virtual SCMI instances are being employed for greater parallelism.
> These instances are tied to devices such that devices can have dedicated
> SCMI channel. Firmware VM (runs SCMI platform stack) is SMP enabled and
> can process requests from agents in parallel. Qualcomm smc transport is
> used for communication between SCMI agent and platform.
> 
> Let's add the reduced functional support for SA8255p Ride board.
> Subsequently, the support for PCIe, USB, UFS, Ethernet will be added.
> 
> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |    1 +
>  arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
>  arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |  149 ++
>  arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi  | 2312 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 2405 +++++++++++++++++++
>  5 files changed, 4947 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi
> 

...

> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
> new file mode 100644
> index 000000000000..1dc03051ad92
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "sa8255p.dtsi"
> +#include "sa8255p-pmics.dtsi"
> +#include "sa8255p-scmi.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SA8255P Ride";
> +	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
> +
> +	aliases {
> +		i2c11 = &i2c11;
> +		i2c18 = &i2c18;
> +		serial0 = &uart10;
> +		serial1 = &uart4;
> +		spi16 = &spi16;
> +		scmichannels = &scmichannels;

Nothing parses this.



> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +&firmware {
> +	scmi0: scmi0 {

scmi-0


> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +
> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";

status is the last property (from properties)


...

> +
> +&soc {
> +	scmichannels: sram@d0000000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "mmio-sram";
> +		reg = <0x0 0xd0000000 0x0 0x40000>;
> +		ranges = <0x0 0x0 0x0 0xffffffff>;
> +
> +		shmem0: scmi-sram@d0000000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0000000 0x1000>;
> +		};
> +
> +		shmem1: scmi-sram@d0001000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0001000 0x1000>;
> +		};
> +
> +		shmem2: scmi-sram@d0002000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0002000 0x1000>;
> +		};
> +
> +		shmem3: scmi-sram@d0003000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0003000 0x1000>;
> +		};
> +
> +		shmem4: scmi-sram@d0004000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0004000 0x1000>;
> +		};
> +
> +		shmem5: scmi-sram@d0005000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0005000 0x1000>;
> +		};
> +
> +		shmem6: scmi-sram@d0006000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0006000 0x1000>;
> +		};
> +
> +		shmem7: scmi-sram@d0007000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0007000 0x1000>;
> +		};
> +
> +		shmem8: scmi-sram@d0008000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0008000 0x1000>;
> +		};
> +
> +		shmem9: scmi-sram@d0009000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0009000 0x1000>;
> +		};
> +
> +		shmem10: scmi-sram@d000a000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd000a000 0x1000>;
> +		};
> +
> +		shmem11: scmi-sram@d000b000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd000b000 0x1000>;
> +		};
> +
> +		shmem12: scmi-sram@d000c000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd000c000 0x1000>;
> +		};
> +
> +		shmem13: scmi-sram@d000d000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd000d000 0x1000>;
> +		};
> +
> +		shmem14: scmi-sram@d000e000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd000e000 0x1000>;
> +		};
> +
> +		shmem15: scmi-sram@d000f000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd000f000 0x1000>;
> +		};
> +
> +		shmem16: scmi-sram@d0010000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0010000 0x1000>;
> +		};
> +
> +		shmem17: scmi-sram@d0011000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0011000 0x1000>;
> +		};
> +
> +		shmem18: scmi-sram@d0012000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0012000 0x1000>;
> +		};
> +
> +		shmem19: scmi-sram@d0013000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0013000 0x1000>;
> +		};
> +
> +		shmem20: scmi-sram@d0014000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0014000 0x1000>;
> +		};
> +
> +		shmem21: scmi-sram@d0015000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0015000 0x1000>;
> +		};
> +
> +		shmem22: scmi-sram@d0016000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0016000 0x1000>;
> +		};
> +
> +		shmem23: scmi-sram@d0017000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0017000 0x1000>;
> +		};
> +
> +		shmem24: scmi-sram@d0018000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0018000 0x1000>;
> +		};
> +
> +		shmem25: scmi-sram@d0019000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0019000 0x1000>;
> +		};
> +
> +		shmem26: scmi-sram@d001a000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd001a000 0x1000>;
> +		};
> +
> +		shmem27: scmi-sram@d001b000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd001b000 0x1000>;
> +		};
> +
> +		shmem28: scmi-sram@d001c000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd001c000 0x1000>;
> +		};
> +
> +		shmem29: scmi-sram@d001d000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd001d000 0x1000>;
> +		};
> +
> +		shmem30: scmi-sram@d001e000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd001e000 0x1000>;
> +		};
> +
> +		shmem31: scmi-sram@d001f000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd001f000 0x1000>;
> +		};
> +
> +		shmem32: scmi-sram@d0020000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0020000 0x1000>;
> +		};
> +
> +		shmem33: scmi-sram@d0021000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0021000 0x1000>;
> +		};
> +
> +		shmem34: scmi-sram@d0022000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0022000 0x1000>;
> +		};
> +
> +		shmem35: scmi-sram@d0023000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0023000 0x1000>;
> +		};
> +
> +		shmem36: scmi-sram@d0024000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0024000 0x1000>;
> +		};
> +
> +		shmem37: scmi-sram@d0025000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0025000 0x1000>;
> +		};
> +
> +		shmem38: scmi-sram@d0026000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0026000 0x1000>;
> +		};
> +
> +		shmem39: scmi-sram@d0027000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0027000 0x1000>;
> +		};
> +
> +		shmem40: scmi-sram@d0028000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0028000 0x1000>;
> +		};
> +
> +		shmem41: scmi-sram@d0029000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0029000 0x1000>;
> +		};
> +
> +		shmem42: scmi-sram@d002a000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd002a000 0x1000>;
> +		};
> +
> +		shmem43: scmi-sram@d002b000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd002b000 0x1000>;
> +		};
> +
> +		shmem44: scmi-sram@d002c000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd002c000 0x1000>;
> +		};
> +
> +		shmem45: scmi-sram@d002d000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd002d000 0x1000>;
> +		};
> +
> +		shmem46: scmi-sram@d002e000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd002e000 0x1000>;
> +		};
> +
> +		shmem47: scmi-sram@d002f000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd002f000 0x1000>;
> +		};
> +
> +		shmem48: scmi-sram@d0030000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0030000 0x1000>;
> +		};
> +
> +		shmem49: scmi-sram@d0031000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0031000 0x1000>;
> +		};
> +
> +		shmem50: scmi-sram@d0032000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0032000 0x1000>;
> +		};
> +
> +		shmem51: scmi-sram@d0033000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0033000 0x1000>;
> +		};
> +
> +		shmem52: scmi-sram@d0034000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0034000 0x1000>;
> +		};
> +
> +		shmem53: scmi-sram@d0035000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0035000 0x1000>;
> +		};
> +
> +		shmem54: scmi-sram@d0036000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0036000 0x1000>;
> +		};
> +
> +		shmem55: scmi-sram@d0037000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0037000 0x1000>;
> +		};
> +
> +		shmem56: scmi-sram@d0038000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0038000 0x1000>;
> +		};
> +
> +		shmem57: scmi-sram@d0039000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd0039000 0x1000>;
> +		};
> +
> +		shmem58: scmi-sram@d003a000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd003a000 0x1000>;
> +		};
> +
> +		shmem59: scmi-sram@d003b000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd003b000 0x1000>;
> +		};
> +
> +		shmem60: scmi-sram@d003c000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd003c000 0x1000>;
> +		};
> +
> +		shmem61: scmi-sram@d003d000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd003d000 0x1000>;
> +		};
> +
> +		shmem62: scmi-sram@d003e000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd003e000 0x1000>;
> +		};
> +
> +		shmem63: scmi-sram@d003f000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0xd003f000 0x1000>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sa8255p.dtsi b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
> new file mode 100644
> index 000000000000..c354f76ffa5e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
> @@ -0,0 +1,2405 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clocks {
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		gpll0_board_clk: gpll0-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			clocks = <&xo_board_clk>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {

Lowercase label.

...

Best regards,
Krzysztof


