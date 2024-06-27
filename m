Return-Path: <linux-i2c+bounces-4425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B191B0FB
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 22:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2CA1F2701C
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 20:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E40619F475;
	Thu, 27 Jun 2024 20:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB9+zb4f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3154619E827;
	Thu, 27 Jun 2024 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719521530; cv=none; b=MnHxM2XCNwAG6BVGfiaDBZVMsN4OkkhETfBeufnjsKYi2cJoQpkiKNZLkm6F+hYdnirAqps2+Foz7QgyqFUKvleyZQOuCHt0rF2KueDGZd2b+KwYSBbZo3spw/exPwHksI4nMn1i28gguTKK1LKySlES7vEhqZdxFFHVOPKJkFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719521530; c=relaxed/simple;
	bh=5Vyce4zAfgV6w1pp20rVTEDgRdD2Xvdyh3QIPHWLvM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugRYauJai9asLveAJxXvOVu884NfrNZ06s3ULc6B3MFXXRlcLOj3PRqFquyKZFBBDV/GJ7Rej/xPWk4yH77ts9l8YsEfgilBjBY0ESmZQXQqtztq/H49grA83t0DP62a3ujn9nSFlJWUp9OCWSeUjfC85kvDihGeyV9bHl5A0pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB9+zb4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40C0C2BBFC;
	Thu, 27 Jun 2024 20:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719521529;
	bh=5Vyce4zAfgV6w1pp20rVTEDgRdD2Xvdyh3QIPHWLvM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YB9+zb4fy/LqQzIgsBPmOperiqxnf1JPNL3XS8J+X33MBU2A3KTvIceo6iHMpM6R2
	 S1xhgzD60JQ4+KL8CuXH+nBXMtBcpeMEo9MKFKXQqUN2v5vDgujfsySo8uXLYR5yJ9
	 uiURiNm/+5u8zb3pnVzJ0kzVnIFNInqQSxwHJ4lsPso0+apkYmHLPnO7v5iDFHJxNY
	 PAz5dvifK4510KQIJiAMw6Gpq34U2kYIUYbWowg8z4OMxOAusAmaWqen370jtEkFGo
	 9eAIMPo+VbzAtozXMmee0Q52GoHV8WVb5jtUKwZeP+KuBEBZdSElZ3aSPesZwByGX8
	 bcWBaqY7Oy8Qg==
Date: Thu, 27 Jun 2024 14:52:07 -0600
From: Rob Herring <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/9] dt-bindings: mfd: add support for mule
Message-ID: <20240627205207.GA492473-robh@kernel.org>
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <20240618-dev-mule-i2c-mux-v4-3-5462d28354c8@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-dev-mule-i2c-mux-v4-3-5462d28354c8@cherry.de>

On Tue, Jun 18, 2024 at 06:06:45PM +0200, Farouk Bouabid wrote:
> Mule is an MCU that emulates a set of I2C devices, among which an amc6821
> device and an I2C mux that exposes more emulated devices. These two devices
> share the same I2C address. Only the I2C mux uses register (0xff) as a
> config register.

Everywhere (or the first place in any section (subject, commit msg, 
title, description, etc.) you say 'mule' I think should be preceeded 
with the vendor because 'mule' has no meaning on its own unless we are 
talking animals.

> 
> Add dt-binding support for the Mule I2C multi-function device.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>  .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 48 +++++++++++++
>  .../devicetree/bindings/mfd/tsd,mule.yaml          | 82 ++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
> new file mode 100644
> index 000000000000..ac9dfc936272
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/tsd,mule-i2c-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mule I2C multiplexer
> +
> +maintainers:
> +  - Farouk Bouabid <farouk.bouabid@cherry.de>
> +  - Quentin Schulz <quentin.schulz@cherry.de>
> +
> +description: |
> +  This module is part of the Mule I2C multi-function device. For more
> +  details see ../mfd/tsd,mule.yaml.
> +
> +  Mule I2C-mux configures the active device that can be accessed on address
> +  0x6f through the config register.
> +
> +      +--------------------------------------------------+
> +      | Mule                                             |
> +  0x18|    +---------------+                             |
> +  -------->|Config register|----+                        |
> +      |    +---------------+    |                        |
> +      |                         V_                       |
> +      |                        |  \          +--------+  |
> +      |                        |   \-------->| dev #0 |  |
> +      |                        |   |         +--------+  |
> +  0x6f|                        | M |-------->| dev #1 |  |
> +  ---------------------------->| U |         +--------+  |
> +      |                        | X |-------->| dev #2 |  |
> +      |                        |   |         +--------+  |
> +      |                        |   /-------->| dev #3 |  |
> +      |                        |__/          +--------+  |
> +      +--------------------------------------------------+
> +
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-mux.yaml#
> +
> +properties:
> +  compatible:
> +    const: tsd,mule-i2c-mux
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/tsd,mule.yaml b/Documentation/devicetree/bindings/mfd/tsd,mule.yaml
> new file mode 100644
> index 000000000000..ab532340a17c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tsd,mule.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/tsd,mule.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mule I2C multi function device
> +
> +maintainers:
> +  - Farouk Bouabid <farouk.bouabid@cherry.de>
> +  - Quentin Schulz <quentin.schulz@cherry.de>
> +
> +description:
> +  Mule is an MCU that emulates a set of I2C devices, among which an amc6821
> +  device and an I2C mux that exposes more emulated devices. These two devices
> +  share the same I2C address. Only the I2C mux uses register (0xff) as a config
> +  register.
> +
> +properties:
> +  compatible:
> +    const: tsd,mule
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^fan(@[0-9a-f]+)?$":
> +    $ref: /schemas/trivial-devices.yaml

That doesn't really define which device. You should do something like 
this:

additionalProperties: true
properties:
  compatible:
    contains:
      const: ti,amc6821

If the compatible is correct, then the schema for it will be applied 
separately.

> +
> +  "^i2c-mux(@[0-9a-f]+)?$":
> +    $ref: /schemas/i2c/tsd,mule-i2c-mux.yaml
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mule@18 {
> +            compatible = "tsd,mule";
> +            reg = <0x18>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            fan@18 {
> +                compatible = "ti,amc6821";
> +                reg = <0x18>;
> +            };
> +
> +            i2c-mux {
> +                compatible = "tsd,mule-i2c-mux";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                i2c@0 {
> +                    reg = <0x0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    rtc@6f {
> +                        compatible = "isil,isl1208";
> +                        reg = <0x6f>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

