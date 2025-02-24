Return-Path: <linux-i2c+bounces-9547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC352A418C0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 10:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AECB3B7193
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 09:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEC024C673;
	Mon, 24 Feb 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVDyb9A6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFF0245014;
	Mon, 24 Feb 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740388264; cv=none; b=amQyDAFNHPrlB//ylP769XjRgHXhxSWY+8z6WgLV8+5Ti2UN4d/4EpVGyc+B2gLyCPehJhkc6VSEakBQ2AM/vqVUE5xlcVAm1TAiw+/grzHsZfFBGVU/EJaAc1lqSf+mU4eKYZSpD+hs49UMcFA/BslQwyfte638Q/WbM+CaIIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740388264; c=relaxed/simple;
	bh=paqcVaN+9js9H2BBnIzPb/KQmMraUhcTcdEAOrrYxGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWNDXSeehvblZ+6SZit5jAHemjCdbaaTDDVldCdmGlQILx3uFb6kV/YMjN1/42aANW08lxsPzJTKUw8yvWVkWjq2aG14jMj4CH/NuKXO6m90xNFE5Xurp6wzLbvzj/iR4+DvMlZrAwMZxkPRWkvXsTnIAIwmpXbMJw0Q3Du1xRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVDyb9A6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571D5C4CED6;
	Mon, 24 Feb 2025 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740388264;
	bh=paqcVaN+9js9H2BBnIzPb/KQmMraUhcTcdEAOrrYxGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVDyb9A6iSFEZR+LjdELpEgVGyTrHax22CwW4kimVb/iLXTObfEsv95EuplSKgtBc
	 5oUowBkfia/PWtbiRSow61VRZSQVmbFYD6RuAi+aQDfk5QP5t3a5vTE1HHtVr+B9CK
	 myk1UQDUe+goU/zFwEjgPNeMwTMX64NNYwl34jsmeunRzgU+oexHDv6r+OlHpWtxyt
	 TzfKctNBcaeHe1aHUHgRjNE+k5yxN2tN4eH9gAfY5kzqN7cN0P4vy0gQFGtG/5nylJ
	 p1CFFYYDurj9gQex5jiwi5Ba5lGwPbayQsy2BFTfJ4wzexIHkq5cC4FjIqPAZZz+Rd
	 260/jfeD3TjfQ==
Date: Mon, 24 Feb 2025 10:11:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Message-ID: <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>

On Mon, Feb 24, 2025 at 01:59:34PM +0800, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 5b9bd2feda3b..356033d18f90 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -44,12 +44,60 @@ properties:
>      description: frequency of the bus clock in Hz defaults to 100 kHz when not
>        specified
>  
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus

Except that this wasn't ever tested...

Don't duplicate properties. i2c-controller schema has it already.

> +
> +  aspeed,enable-dma:
> +    type: boolean
> +    description: |
> +      I2C bus enable dma mode transfer.
> +
> +      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
> +      single DMA engine. DTS files can specify the data transfer mode to/from
> +      the device, either DMA or programmed I/O. However, hardware limitations

so what is byte mode?

> +      may require a DTS to manually allocate which controller can use DMA mode.
> +      The "aspeed,enable-dma" property allows control of this.
> +
> +      In cases where one the hardware design results in a specific
> +      controller handling a larger amount of data, a DTS would likely
> +      enable DMA mode for that one controller.
> +
> +  aspeed,enable-byte:
> +    type: boolean
> +    description: |
> +      I2C bus enable byte mode transfer.

No, either this is expressed as lack of dma mode property or if you have
three modes, then rather some enum (aspeed,transfer-mode ?)



> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.

For what? Same question as usual: do not repeat property name, but say
what is this used for and what exactly it points to.

s/i2c/I2C/ but then what is "I2C global register node"? This is how you
call your device in datasheet?


> +
>  required:
>    - reg
>    - compatible
>    - clocks
>    - resets
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-i2cv2

NAK, undocumented compatible.

> +
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2


Best regards,
Krzysztof


