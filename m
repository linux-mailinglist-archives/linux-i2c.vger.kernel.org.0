Return-Path: <linux-i2c+bounces-12297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF497B2719D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 00:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9D7A5814E2
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 22:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0E0280018;
	Thu, 14 Aug 2025 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8NZu8Q2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8229C277819;
	Thu, 14 Aug 2025 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755210653; cv=none; b=TVcuxR4AiKn4YniYA9LXxiY1PiRTHnhhmlqfKCL7eccK13e/Oy8+v5hdqVcC5WRAXoJXi1v2VkYe7PpG8+5QHhXSH3jPZzvd+3gfJuQ9pMDYvgjuCCrbcHHUGUQPodktAFfeDceaBhKirrc1aYPYU+q7trJ+ut8gzjfnWL6lqFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755210653; c=relaxed/simple;
	bh=N5VWGitysz6JFmoe9n2FhghAKkO8HINQCHJY2U2kRIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ockeZoBVjiRR3/2rqs7Ksm2UgX64FVbx0fqIEUF7DF9ZshtIsmtyKoaYlW4hQ2A8+4BKuZLE/vaYY2AVYqjQ30KwsjvO6Jk0leyZXrWuSqE8ayxsDwHcfDWqGltHuVU8jbHsdxWkskZvjZXJXcAvsM0RIEkET8EzKJaKBUAqKRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8NZu8Q2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FBC4CEED;
	Thu, 14 Aug 2025 22:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755210653;
	bh=N5VWGitysz6JFmoe9n2FhghAKkO8HINQCHJY2U2kRIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8NZu8Q23AcSpDXYfCjfS+nijpycYbRazO8ud7muK7v/NQSmnieFRpVKZ9HpE+Se3
	 ihK/DheTyy0oiRrb1M1422BzweCx9GFLH23gWJEy8hhRFRngUNMiGhj74MtotNPhtF
	 yqrUOurUhDDUC58YxblyH88j6+KNNTcK/igm+HoklMSc/qyxQ5KQz0I5OYmUnqEyQb
	 hSHC3P59PHrQpHRwdNhYBEJf+FY2XgcEMPuuTzqg6Z4f866bnKk9VJKWj+onG9pmFj
	 gWnmU3joyDUmkrHXStOUAiu75Y3Os4fO4BMRMQVIFbAidL1DN8rkqKZOMOECpHF6et
	 Ltq0O6AyGRRpQ==
Date: Thu, 14 Aug 2025 17:30:52 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Message-ID: <20250814223052.GA4004307-robh@kernel.org>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
 <20250814084156.1650432-2-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814084156.1650432-2-ryan_chen@aspeedtech.com>

On Thu, Aug 14, 2025 at 04:41:54PM +0800, Ryan Chen wrote:
> - Add property "aspeed,global-regs" to get phandle set global
> register, for register mode selection and clock divider control.
> - Add an optional property "aspeed,transfer-mode" to
> allow device tree to specify the desired transfer method used
> by each I2C controller instance.
> - Update example to demonstrate usage of 'aspeed,global-regs' and
> 'aspeed,transfer-mode' for AST2600 I2C controller.

All of this is evident reading the patch. Explain here why you need this 
change.

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 5b9bd2feda3b..2a9f7d1d2ea1 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -44,6 +44,34 @@ properties:
>      description: frequency of the bus clock in Hz defaults to 100 kHz when not
>        specified
>  
> +  aspeed,transfer-mode:
> +    description: |
> +      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
> +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
> +      share a DMA engine.
> +      Select I2C transfer mode for this controller. Supported values are:
> +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
> +                    Better performance then byte mode.

If no 'aspeed,transfer-mode' property defaults to buffer mode, you never 
need 'aspeed,transfer-mode = "buffer"'.

When would you ever use "byte" mode? Sometimes you want worse 
performance? That makes no sense.

I feel like we already discussed this, but I'm not going to dig thru 17 
versions to see.

> +        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
> +                 provides a single DMA engine shared for 16 I2C controllers,
> +                 so only a limited number of controllers can use DMA simultaneously.
> +                 Therefore, the DTS must explicitly assign which controllers are
> +                 configured to use DMA.
> +      Only one mode can be selected per controller.

The only thing that really makes sense is dma, and you need 1 boolean 
property for that. IOW, what you had on v10 which we gave reviewed-by 2+ 
years ago.

Do you have any actual test results or usecase that show DMA is useful 
here? Typical I2C xfers are not streaming large amounts of data to 
justify the setup costs of DMA. It wouldn't surprise me if DMA was 
actually slower.

> +      On AST2600, each controller supports all three modes.
> +      If not specified, buffer mode is used by default.
> +    enum:
> +      - byte
> +      - buffer
> +      - dma
> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Don't need '|'. Read the documentation about when it is needed or not 
needed.

> +      The phandle of i2c global register node, For control the i2c register
> +      define selection, clock divider mode selection and clock divider control.
> +
>  required:
>    - reg
>    - compatible
> @@ -66,3 +94,14 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      compatible = "aspeed,ast2600-i2c-bus";
> +      reg = <0x80 0x80>, <0xc00 0x20>;
> +      aspeed,global-regs = <&i2c_global>;
> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      aspeed,transfer-mode = "buffer";
> +    };
> -- 
> 2.34.1
> 

