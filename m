Return-Path: <linux-i2c+bounces-8056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC429D2DE1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 19:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE22FB2B941
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 18:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D5E1D1F43;
	Tue, 19 Nov 2024 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHwEy2jd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46740BE0;
	Tue, 19 Nov 2024 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732040194; cv=none; b=Q2As/B89VwTBPQgEiJ8Lr2B/0MuovCGaL3ZJag4kk1v7RBsmJxPDndfv5CnSnY3QgMujO+pFQHBVWP+9IWYEf0NCG7nTsTx5zyhOz3qMLZcqYrtRlho5xaBh+i9EVXlZXJSdPqlkWGLYQpvcrY0crV0044N8VIUsIkMJvrHvRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732040194; c=relaxed/simple;
	bh=YEyHF7qNpdjYiVOL7NYzxys2GSXjpUHFTISRNu/EFNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSLoJA/wMIPzT0m1XRBMkNDA53pbgr4kfqp4QZHxTdfxdzaekiRomIqeeZqPWtpR0wDaSDWOG3/EFTXTRLowFnVOnRHLqB7ZlL1cR2dG3XTEGHUGsiZ/ZlqIISRYGaQXvuFDA6esGBWOFpqcoiIyKb1RxDrGTs0iYQkxl51g/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHwEy2jd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F12C4CECF;
	Tue, 19 Nov 2024 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732040194;
	bh=YEyHF7qNpdjYiVOL7NYzxys2GSXjpUHFTISRNu/EFNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHwEy2jdbpbbXM9Rmn9rrT9dPGJzmy5r+SGvXoSKtIGbJv+1vZ5wC9fhnN0HmW1Gk
	 aFIPGj7BAwwAaxWiOz3LTuUnoB5s0B5eCMDCJV208zgdnFc1GbbzC9w/4cCx1Y5QTp
	 bNpEkcbNVUGmFjhs7Hc1NLiqBCIYU3QiA7OYZnMhCCTuMNL4nqBXlruVCkxfsBWTzh
	 tSese9MGcZbtEewgiiJAQIoPKTQ8REOCrrue0uvzYyKgROHhf9mATmO8oYcNz5pPLc
	 42gRLbWrXCI3861qN3nRbC+6kvC4dG3SibKMhByf3a3psVpcSXzM4XdAc46QsfeSGn
	 CulDQVY0MiFNQ==
Date: Tue, 19 Nov 2024 12:16:32 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Message-ID: <20241119181632.GA1957312-robh@kernel.org>
References: <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
 <20241118-fpc202-v2-1-744e4f192a2d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-fpc202-v2-1-744e4f192a2d@bootlin.com>

On Mon, Nov 18, 2024 at 11:13:00AM +0100, Romain Gantois wrote:
> The FPC202 dual port controller serves as a low speed signal aggregator for
> common port types, notably SFP. It provides access to I2C and low-speed
> GPIO signals of a downstream device through a single upstream control
> interface.
> 
> Up to two logical I2C addresses can be accessed on each of the FPC202's
> ports. The port controller acts as an I2C translator (ATR). It converts
> addresses of incoming and outgoing I2C transactions. One use case of this
> is accessing two SFP modules at logical address 0x50 from the same upstream
> I2C controller, using two different client aliases.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  .../devicetree/bindings/misc/ti,fpc202.yaml        | 83 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1c7243f0325211d8cea3736cbe777c4318065b12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/ti,fpc202.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI FPC202 dual port controller with expanded IOs
> +
> +maintainers:
> +  - Romain Gantois <romain.gantois@bootlin.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,fpc202
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  enable-gpios:
> +    description:
> +      Specifier for the GPIO connected to the EN pin.
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^i2c@[0-1]$":
> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    description: Downstream device ports 0 and 1

'reg' is not covered by i2c-controller.yaml, so it needs to be 
documented here. Along with a 'unevaluatedProperties: false'.

> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - i2c@0
> +  - i2c@1
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        i2c-atr@f {
> +            compatible = "ti,fpc202";
> +            reg = <0xf>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +
> +            i2c@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +            };
> +
> +            i2c@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b878ddc99f94e7f6e8fa2c479c5a3f846c514730..8e702cefd2070790330eebf6d2a2b592cadb682d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23181,6 +23181,12 @@ F:	drivers/misc/tifm*
>  F:	drivers/mmc/host/tifm_sd.c
>  F:	include/linux/tifm.h
>  
> +TI FPC202 DUAL PORT CONTROLLER
> +M:	Romain Gantois <romain.gantois@bootlin.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> +
>  TI FPD-LINK DRIVERS
>  M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
> 
> -- 
> 2.47.0
> 

