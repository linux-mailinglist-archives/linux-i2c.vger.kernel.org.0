Return-Path: <linux-i2c+bounces-2098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CFD86E411
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 16:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8C0D285DF3
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250FD6997C;
	Fri,  1 Mar 2024 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOvpOu8S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36F915CC;
	Fri,  1 Mar 2024 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709305909; cv=none; b=LGjuSFYJQ41ztVentBh5ulHzhX+fQdW0YcIID4oR+bcWktwthulv4WMzcNOdsa93r86Co07cF6Ph4qI4PRtmBRnxi22crlCY/qJHUUFEKvwfuU4jFjuusERUw5KNGuSfDiCXtjTTJNuZ3a1L10nRBe7eqwkSq/194shDDRJo3RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709305909; c=relaxed/simple;
	bh=yYWhC8o+k18yDFAE/PF3lPXCt5+FY+PFPMPV0qxvv6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABQVCHiqyCOuwJOlJcpgEKAf2LtX8jJ534fst2oo7KgWXIdT0xbae/UvHWxMSvweOfbZ786dTvvSVpC1IUzskt2StsU9Cmh75/VIpiOEwibv7LlaWEh9qc/VJuzLVVmRdMBSC3HuQZEAPDvIFwlhAvoIavgbcp5UbCIlh5bkkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOvpOu8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE22C433F1;
	Fri,  1 Mar 2024 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709305909;
	bh=yYWhC8o+k18yDFAE/PF3lPXCt5+FY+PFPMPV0qxvv6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOvpOu8ShoCHhRTbOwgSdne2Nc8JrVDe/apVggW4vE+x9ZWPmsaHpLbwQs8k7iECK
	 KDhJCQwsTHbOy15eco9mq4BYcuTkKiIy06RTezuC/KV1SMAA+kGqXw7G6xJlyIhCVF
	 JlQT2p1DFVlCbLNV50n1UaKMYutdlGvdN8qJCNIb3gnFvKsDru6ROfg/qAmeXELm3w
	 cXdJcY3yRGcM99GU7BGEtNhq3m6vJhD0oLaUxD+yS4LFVlcWnJCnSaMLbpBpatk3Kv
	 HKiJ6BhC16aLH1HwewnvNNml2ttHCwXxUz0RmxbbQRsot4X+c8oJtkMBunR/pYmyd1
	 dMhgduJmYskcQ==
Date: Fri, 1 Mar 2024 09:11:46 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: i2c: nomadik: add
 mobileye,eyeq5-i2c bindings and example
Message-ID: <20240301151146.GA2114576-robh@kernel.org>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-1-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229-mbly-i2c-v2-1-b32ed18c098c@bootlin.com>

On Thu, Feb 29, 2024 at 07:10:49PM +0100, Théo Lebrun wrote:
> Add EyeQ5 bindings to the existing Nomadik I2C dt-bindings. Add the
> EyeQ5-specific property behind a conditional. Add an example for this
> compatible.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 48 ++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> index 16024415a4a7..2d9d5b276762 100644
> --- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> @@ -14,9 +14,6 @@ description: The Nomadik I2C host controller began its life in the ST
>  maintainers:
>    - Linus Walleij <linus.walleij@linaro.org>
>  
> -allOf:
> -  - $ref: /schemas/i2c/i2c-controller.yaml#
> -
>  # Need a custom select here or 'arm,primecell' will match on lots of nodes
>  select:
>    properties:
> @@ -24,6 +21,7 @@ select:
>        contains:
>          enum:
>            - st,nomadik-i2c
> +          - mobileye,eyeq5-i2c
>    required:
>      - compatible
>  
> @@ -39,6 +37,10 @@ properties:
>            - const: stericsson,db8500-i2c
>            - const: st,nomadik-i2c
>            - const: arm,primecell
> +      # The variant found on Mobileye EyeQ5

Kind of obvious from the compatible string, but maybe you are keeping 
the existing style...

> +      - items:
> +          - const: mobileye,eyeq5-i2c
> +          - const: arm,primecell
>  
>    reg:
>      maxItems: 1
> @@ -55,7 +57,7 @@ properties:
>        - items:
>            - const: mclk
>            - const: apb_pclk
> -      # Clock name in DB8500
> +      # Clock name in DB8500 or EyeQ5
>        - items:
>            - const: i2cclk
>            - const: apb_pclk
> @@ -70,6 +72,16 @@ properties:
>      minimum: 1
>      maximum: 400000
>  
> +  mobileye,olb:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: Phandle to OLB system controller node.
> +          - description: Platform-wide controller ID (integer starting from zero).

Rather than a made up ID, just store the shift value you ultimately 
need.

These properties are fragile because they break if anything that's not 
defined in DT changes whether that's register offset, bit offset, 
bitfield size or values. Or also if there are additional fields to 
access. 

Rob

