Return-Path: <linux-i2c+bounces-1803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C128573C6
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 03:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1391C21F60
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 02:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF901DF78;
	Fri, 16 Feb 2024 02:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiTloFP9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80313EADD;
	Fri, 16 Feb 2024 02:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708050150; cv=none; b=AJt4l4FkzIRe2bqaBrPwP85j47Bk1rCUufNz2SKkBLgQRy2wcH5dt8KsOxiI8kU4Ae93+NNAo0Y8juA1IUvSnqcRUHz9PY0bUEbbqHjJVnIhN7neGRNP+K/ikQN23BzlfusLvwUlTp8BBQ4oeyzvVo3UxvAhcQTntFj86OdWd7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708050150; c=relaxed/simple;
	bh=zg+Z3Wah5eTVPItwO6FJ2RVvEQEJ1NRiUkZF3MelZyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRXLvnamIvCjInnqoMRTLxgqAtyaOtW0xSj1p4OLssp/mX0Im7WjrjqDdjLN4PECPszYBC4vkVMT19VLGYJqwlId4luECkS6FGMIfdpzrjh6EAdHfKV5p2bhYHYzjnvwBTI/K7C2aIFjCw3ijqfFJItRebVeEzYXdgadigHwAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiTloFP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DA0C433C7;
	Fri, 16 Feb 2024 02:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708050150;
	bh=zg+Z3Wah5eTVPItwO6FJ2RVvEQEJ1NRiUkZF3MelZyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uiTloFP9XrJcN+hTsBncpqBBToqTcyRkpfQGYFEb7jX0T6QhJLr7dhhforheQ1OnY
	 hOKsoQYD15EtK1JanYTgt3QHZ66GXGMFVjaodGoA+hVZTDB8i3cDm50tn4rDrRDbuq
	 bsbTV5XbS0NnZDxIeXvN8ozdK2TvKfgaVor2pNNmJ9ccHVKtkxKhdz5D0/3mgLs3cA
	 +wWfH/4Vhm6XSxA6YKT5gqvXUsDBc1JsWvAZOA7PxsYYUZrvPIe908+NGC8JCQ3dDj
	 H2dBs4ws3mEIEtEN4VLkciePiNEhwKKHP7zmoADBNVWac1UEnNZjWtCwfyzP7O7D3q
	 tx3uV9IaevnjA==
Date: Thu, 15 Feb 2024 20:22:27 -0600
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
Subject: Re: [PATCH 02/13] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
Message-ID: <20240216022227.GA850600-robh@kernel.org>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>

On Thu, Feb 15, 2024 at 05:52:09PM +0100, Théo Lebrun wrote:
> Add EyeQ5 bindings to the existing Nomadik I2C dt-bindings. Add the two
> EyeQ5-specific properties behind a conditional. Add an example for this
> compatible.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 44 ++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> index e6b95e3765ac..eaade14b6d4c 100644
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
> @@ -83,6 +85,25 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mobileye,eyeq5-i2c
> +    then:
> +      properties:
> +        mobileye,olb:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description: A phandle to the OLB syscon.

Define properties at the top-level and then restrict them in if/then 
schemas.

> +        mobileye,id:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description: Platform-wide controller ID (integer starting from zero).

instance indexes are a NAK. You can use i2cN aliases if you must.

Why do you need it? To access OLB? If so, add cell args to the OLB 
phandle instead.

Rob

