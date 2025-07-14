Return-Path: <linux-i2c+bounces-11928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC9BB0366C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 08:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764C33A5DD7
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 05:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277FC20C488;
	Mon, 14 Jul 2025 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGnjOjfs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D0217F35;
	Mon, 14 Jul 2025 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472804; cv=none; b=Ca9aVF10Ww7TfYFrgh1pwOlm/c/pvqCeRfNTdZ2aBTizgu00gtQRnjRNRfSkLqMCF9/UroGv9Q6Ypeiw41NvGnpFM5FSfQbw0ZL8z/o8eku1+s+BmDxJmotrRiBU1G5OrFyNq9mkdW1bjxmeJXjYsqoW4Cl6M8GqKUrwmz3QWwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472804; c=relaxed/simple;
	bh=Gofg2FAiGaqCYmTsYqRWbAVu+L0cyhW84YpCJPH5rq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+ZsZo321m6VHwc9AaAvbwb6h8E/ZO23DHl4iIVQxwkmoOG4UBG9KZ9yUEpCmNhHJ0DfVU/qdf3IJceylvlCFCvCZr1xcGCTBO7jiq1lMGuEw7Q9L29nobaOjgWEALPRKlXRZdEWD6OVlVgyhrZPONTkFMtkleEeP1/nVIjmv+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGnjOjfs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664FAC4CEED;
	Mon, 14 Jul 2025 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752472804;
	bh=Gofg2FAiGaqCYmTsYqRWbAVu+L0cyhW84YpCJPH5rq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGnjOjfs9HUwhRkCeJM3j52KzP0uOGqHQnP1XiT3gTGSOMf6+ASzB5mc7O2Kjckjq
	 xFeKMLshESbxqmWwOKcDDX0E6UKDy9mPlCcEqrbL/ocS+jH8fL2FKxAwHhgnwvcrFH
	 HOFO0cjDXGXaaVSm39P+cTRk+lEP6xEWt6yu9APIu7ZHn+8czFJdkQV9G9JOQ9YRBg
	 XGkLFkhHsgHEbiTYRWqNFxkYiHPNnoIdF0iVlocDWMSRa60qDjSQXYevq9nB3IrOAp
	 Y5JPzBDYzk43iX1LJ2Rgdyaa++2JN0daqbyCPBlqV1XVhZmN3l3LIagYHBcQa1sBCF
	 tUrvIFj5EPr9Q==
Date: Mon, 14 Jul 2025 08:00:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: linux-i2c@vger.kernel.org, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Message-ID: <20250714-magnificent-powerful-nuthatch-afcc01@krzk-bin>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
 <20250712194255.7022-3-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250712194255.7022-3-jelonek.jonas@gmail.com>

On Sat, Jul 12, 2025 at 07:42:54PM +0000, Jonas Jelonek wrote:
>  properties:
>    compatible:
> @@ -23,7 +25,14 @@ properties:
>                - realtek,rtl9302c-i2c
>                - realtek,rtl9303-i2c
>            - const: realtek,rtl9301-i2c
> +      - items:
> +          - enum:
> +              - realtek,rtl9311-i2c
> +              - realtek,rtl9312-i2c
> +              - realtek,rtl9313-i2c
> +          - const: realtek,rtl9310-i2c
>        - const: realtek,rtl9301-i2c
> +      - const: realtek,rtl9310-i2c

So these two are just enum.

>  
>    reg:
>      items:
> @@ -35,8 +44,16 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  realtek,mst-id:
> +    $ref: /schemas/types.yaml#/definitions/uint8

uint32

> +    description:
> +      Realtek-internal ID of the I2C controller/master. Only required
> +      for RTL9310 series.

Drop last sentence, redundant.

> +    minimum: 1
> +    maximum: 2
> +
>  patternProperties:
> -  '^i2c@[0-7]$':
> +  '^i2c@([0-9]|1[0-1])$':
>      $ref: /schemas/i2c/i2c-controller.yaml
>      unevaluatedProperties: false
>  

As mentioned last time, missing constraints.

How did you solve this:

"you should clearly narrow this per variant"?

See example schema. It has EXACTLY this case.

https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L212

You also need to narrow the number of children.


Best regards,
Krzysztof


