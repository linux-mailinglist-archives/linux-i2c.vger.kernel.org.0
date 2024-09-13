Return-Path: <linux-i2c+bounces-6737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9D978B3F
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 00:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B1801C21DF4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 22:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB5516F287;
	Fri, 13 Sep 2024 22:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sugiPAUB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF32F860;
	Fri, 13 Sep 2024 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726265389; cv=none; b=cS+iWkyL6Jj/+SPs7cdJg2C9oro0oD6/hZrjHGiR3mCKLqfozT6Jf4GTvMEX+yRhJtSvfmJcVLDM6BxIyDVKN+btUqAuqG20dxnN2cnIZTPEgFsNANzhed+YJtRYNpvf90TOX0KFQdWymSI8zvL/shPkzoR1+V6SvW6Dpw3Jxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726265389; c=relaxed/simple;
	bh=K/iEXjVUhgmzM3lXfypy6y/N+L0OGi5s2QOtiMvs+NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE/GY3W2s51JAudM9Um0m1Nw5vykoiU2UhER2dZSxyZR4xOfNtvJP+4WiqHOjHwYa6CU3f2drxMvVpuzLv8egPTDHYm1IvAaZmukjYXrI2Ah+Jnz5p+bNaP300Ojm02lbEHI7yqpGm4wYPdnenvJBHjFyAafmWCGvLSxfPbMLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sugiPAUB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6015EC4CEC6;
	Fri, 13 Sep 2024 22:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726265388;
	bh=K/iEXjVUhgmzM3lXfypy6y/N+L0OGi5s2QOtiMvs+NA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=sugiPAUB2t+bXCDe68rkGJRIiJBSnKdBxmCxpDWNuRsgH1tZMYWcGul/RTq2jrlrs
	 76PXW0GCAi4J1tHaUI4858jMiHEemjVRRO6t+31QcEEo93vQWefe5eJXhe1z7fEYqh
	 MpdESXl5fNPeavJgsMzJ+3T3LJlKe4vmiFBOvsisMZnJpjUw7qBPftV8K3jebn5CYt
	 UeSZSBYwBNtIuayWAchGgeC94n7UMvaPyVvE7/hanW29RcoKRLNLsj3ieurSaZeWM3
	 IdCqK33ugnZ/DTRBpkBcC6jLCy3Uw/RhsMP6MFF1HttlM8FB/nQcDnJh3n2zljZsPl
	 bpNticQuMAaGw==
Date: Fri, 13 Sep 2024 17:09:42 -0500
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
Subject: Re: [PATCH 14/21] dt-bindings: pinctrl: adi,adsp-pinctrl: add
 bindings
Message-ID: <20240913220942.GC878799-robh@kernel.org>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-14-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-14-458fa57c8ccf@analog.com>

On Thu, Sep 12, 2024 at 07:24:59PM +0100, Arturs Artamonovs wrote:
> Add PINCTRL driver bindings.
> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  .../bindings/pinctrl/adi,adsp-pinctrl.yaml         | 83 ++++++++++++++++++++++
>  include/dt-bindings/pinctrl/adi-adsp.h             | 19 +++++
>  2 files changed, 102 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/adi,adsp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/adi,adsp-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..073442b4f680bf536f631b4c17a1d3195c2233d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/adi,adsp-pinctrl.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/adi,adsp-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices Pinmuxing Control for SC5XX Processor Family
> +
> +maintainers:
> +  - Arturs Artamonovs <arturs.artamonovs@analog.com>
> +  - Utsav Agarwal <Utsav.Agarwal@analog.com>
> +
> +description: |
> +  Pinmuxing Control Driver for Configuring Processor Pins/Pads
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adsp-pinctrl
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  "adi,port-sizes":

Don't need quotes.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 9
> +    description: Space delimited integer list denoting number of pins per port
> +      Ports A-I exist, so this is up to 9 items long

No constraints on the entries?

> +
> +  "adi,no-drive-strength":
> +    type: boolean
> +    description: Indicate missing drive strength registers
> +
> +  "adi,no-pull-up-down":
> +    type: boolean
> +    description: Indicate missing pull up/down enable registers
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      pins:
> +        type: object
> +        description: |
> +          A pinctrl node should contain a pin property, specifying the actual
> +          pins to use.
> +
> +        properties:
> +          pinmux:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            description: |
> +              pinmux is used to specify which of the available functionalities
> +              for a given pin are actually used.
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - reg
> +  - "adi,port-sizes"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl0: pinctrl@31004600 {
> +      compatible = "adi,adsp-pinctrl";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      reg = <0x31004600 0x400>;
> +      adi,port-sizes = <16 16 16 16 16 16 16 16 7>;
> +    };
> +
> diff --git a/include/dt-bindings/pinctrl/adi-adsp.h b/include/dt-bindings/pinctrl/adi-adsp.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc5b86a0d9190acdd242a6ba4972c3aac7a61821
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/adi-adsp.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0*/

Missing space                         ^

New bindings should be dual licensed.


> +/*
> + * Macros for populating pinmux properties on the pincontroller
> + *
> + * Copyright 2022-2024 - Analog Devices Inc.
> + */
> +
> +#ifndef DT_BINDINGS_PINCTRL_ADI_ADSP_H
> +#define DT_BINDINGS_PINCTRL_ADI_ADSP_H
> +
> +#define ADI_ADSP_PINFUNC_GPIO     0
> +#define ADI_ADSP_PINFUNC_ALT0     1
> +#define ADI_ADSP_PINFUNC_ALT1     2
> +#define ADI_ADSP_PINFUNC_ALT2     3
> +#define ADI_ADSP_PINFUNC_ALT3     4
> +
> +#define ADI_ADSP_PINMUX(port, pin, func) ((((port - 'A')*16 + pin) << 8) + func)
> +
> +#endif
> 
> -- 
> 2.25.1
> 

