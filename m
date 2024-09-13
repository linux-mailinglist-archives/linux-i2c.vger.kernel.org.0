Return-Path: <linux-i2c+bounces-6720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2F978247
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 16:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31F02B21B03
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F661DC1A4;
	Fri, 13 Sep 2024 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nyf84WlN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DDD43144;
	Fri, 13 Sep 2024 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236418; cv=none; b=Jtzb/mBoKeOXtwp3Ujkp9uOhFV08ehVqZPYkpWvvCC71WKBdfe8P2HuSPvAeu74Cw+KiPUB1chOKd32A+vfJjoEE0SpHIl/8DshucwqKRBMJxzbdr1pBZL793oWeu8flqa2aJCaE8GbO8TfAXTOioz5P9oT9VW+dFt8d0mCGIc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236418; c=relaxed/simple;
	bh=UXwyPH+Uj+G+0UKGaXTyXocMgN54SL5IhIJD9U6CYYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzsLVT6wV/JFSqXDnCbzX6glwOAUSaVKsiPfALfzXVANM5HzDOcrPPkePizKxZlRlG0Jyixe4R8t2fO+uWPYddpiF5J0X+b8QHMDUZZQA9Iiovgyqhyzkj+bOgEsRlOtn3GkC1F9nLlSpBvmnhKZWNTb2KsshjUIRWYt0Tza6C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nyf84WlN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EB9C4CEC0;
	Fri, 13 Sep 2024 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726236417;
	bh=UXwyPH+Uj+G+0UKGaXTyXocMgN54SL5IhIJD9U6CYYY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Nyf84WlNh7ncSAZOfCMWFIolG1UOZsIbD1p4oW6HX5wj8jDtDZUHqANNrjTC3zEGe
	 SIpn/62Gaj7r6WCehzGD6DZMUyEIpK2irKXY0QO4WPH+/UYIrszeaAqpNyyM1HDP7S
	 XiRBEBDqRNXQyBvNM/FaJO3sQJ150fnr68tUuqoMTFKpT6QfjxYMnQgubZQUPavzBT
	 SCt+C5zBID2FIXmzGTk5V2TBftlNdTA4XwPqYjKJY+vtALxdEf8TpNdiGftd0gJvWJ
	 BhsK28Tbr22uNFkxhQ13fdRf5U2LkfEVH+F4MZlmD6L2dwIShrGm8If9+bbJWQTDD/
	 Zd6c/kesseV5g==
Date: Fri, 13 Sep 2024 09:06:56 -0500
From: Rob Herring <robh@kernel.org>
To: Arturs Artamonovs <arturs.artamonovs@analog.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Malysa <greg.malysa@timesys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org, adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 18/21] dt-bindings: serial: adi,uart4: add adi,uart4
 driver documentation
Message-ID: <20240913140656.GA3835385-robh@kernel.org>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-18-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-18-458fa57c8ccf@analog.com>

On Thu, Sep 12, 2024 at 07:25:03PM +0100, Arturs Artamonovs wrote:
> Add serial driver bindings.

Don''t need 'documentation' in the the subject. That's redundant with 
'dt-bindings'.


> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>

Your S-o-b goes last since you are sending the patch.

> Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>

Not clear what Utsav's role was. Needs Co-developed-by?

> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  .../devicetree/bindings/serial/adi,uart.yaml       | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/adi,uart.yaml b/Documentation/devicetree/bindings/serial/adi,uart.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..de58059efa7e21acaa5b7f4984ffadca18f7f53a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/adi,uart.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/adi,uart4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices UART Driver for SC5XX-family processors

Bindings aren't a driver.

> +
> +maintainers:
> +  - Arturs Artamonovs <arturs.artamonovs@analog.com>
> +  - Utsav Agarwal <Utsav.Agarwal@analog.com>
> +
> +description: |

Don't need '|'.

> +  Analog Devices UART Driver for SC59X-family processors
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,uart

Only 1 UART implementation for all of Analog Devices ever.

compatibles should be specific to SoC.

> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +    minItems: 2
> +    description: TX and RX DMA cluster numbers
> +
> +  dma-names:
> +    maxItems: 2
> +    minItems: 2
> +    description: DMA channel names (tx and rx)

Names need to be constraints, not freeform text. Plenty of examples to 
look at...

> +
> +  clocks:
> +    maxItems: 1
> +    description: Clock being used for UART

That's obvious. Drop description or say something unique to this device.

> +
> +  clock-names:
> +    maxItems: 1
> +    description: Clock name (sclk0)
> +
> +  interrupt-names:
> +    minItems: 3
> +    maxItems: 3
> +    description: Interrupt names (tx + rx + status)
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3
> +    description: GIC interrupt numbers
> +
> +  adi,use-edbo:
> +    type: boolean
> +    description: Enable divide by one in divisor

Versus divide by ???

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupt-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/adi-sc5xx-clock.h>
> +
> +    uart0: uart@31003000 {

serial@...

Drop unused labels.

> +      compatible = "adi,uart";
> +      reg = <0x31003000 0x40>;
> +      clocks = <&clk ADSP_SC598_CLK_CGU0_SCLK0>;
> +      clock-names = "sclk0";
> +      interrupt-parent = <&gic>;
> +      interrupt-names = "tx", "rx", "status";
> +      interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +      adi,use-edbo;
> +      status = "disabled";

Examples should be enabled. Drop.

> +    };
> +
> 
> -- 
> 2.25.1
> 

