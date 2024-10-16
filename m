Return-Path: <linux-i2c+bounces-7419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC6B9A01A1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 08:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B317F288B08
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 06:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D031925B0;
	Wed, 16 Oct 2024 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyFyecfA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6035A18C331;
	Wed, 16 Oct 2024 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729060912; cv=none; b=omo6mn/znt0HCC24W/nJj+ow0IsFhzGq8roN1XhUSm5bAQN05TkDVyuYV49mtNjzNbOGUOnP+95Fa50A37R4RbOgON2ul+5kSm3kIMjzRK53k4JRVt5Vr9n0fF6eYjVi3Le7W8rO2poS9y/MuMaWn2VaVP4OzfJ/SOKuEOuh8Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729060912; c=relaxed/simple;
	bh=aoLwjkxNy0vcgsVcm5uZE6gXEy4GMp6/pd19nTjUGOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiVmZ8W/M0QESJDEeE2nrrOILKOgZXqczk7DKS90LwXS+NlrkCUbfq2NZ15GrfpNpeEMKxrprwl4kMZhLW4vDK/NIb7GtM+4kNOiKavSUBs7a7htQA5IRyLRoEloVjbPy8Jsadi3a+ujzDR5yBJ8U6b4PjMr/TTCQPDKERFLYoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyFyecfA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2866C4CEC5;
	Wed, 16 Oct 2024 06:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729060912;
	bh=aoLwjkxNy0vcgsVcm5uZE6gXEy4GMp6/pd19nTjUGOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyFyecfAnEOmCpd7KuqyMAfFlgm4u3RWtvIuk7mvx3OWBbK9hlc7tVvGPZOjBQo+p
	 n/zDRcLTAr1F4FneMJx1mz0Rw0fKIYrnyiFhOzc22naVx+nn841/DB4NLULGyE5IOX
	 lhM7XEif8cGcLEvaaeIhJt/cAv3f7GZcMgCJPpUt1yVAS5EY3ibh4Ja3yI038yC6/u
	 B+6bwZ6L+hVjI3yzh/0dOCpymiZtlgU3RD2rvzfk+3EKh6V9hroD7Z1XCoU9qadRWh
	 zn8IYvRT98WTSmu47xDXTrbL49WhopaXpBnymIn2VZdDP4logrKASU2c2Y5yDR277J
	 eQpvaNFBcgTdg==
Date: Wed, 16 Oct 2024 08:41:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	markus.stockhausen@gmx.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v6 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Message-ID: <5o77wkohvujnfnm4xm73b65gpx5by7chhyhdbuw3dkpota53us@5x6jlcabjoes>
References: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
 <20241015225948.3971924-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015225948.3971924-4-chris.packham@alliedtelesis.co.nz>

On Wed, Oct 16, 2024 at 11:59:45AM +1300, Chris Packham wrote:
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - realtek,rtl9302b-i2c
> +              - realtek,rtl9302c-i2c
> +              - realtek,rtl9303-i2c
> +          - const: realtek,rtl9301-i2c
> +      - const: realtek,rtl9301-i2c
> +
> +  reg:
> +    description: Register offset and size this I2C controller.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  '^i2c@[0-7]$':
> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description: The SDA pin associated with the I2C bus.
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

This has to be: additionalProperties: false

> +
> +examples:
> +  - |
> +    i2c@36c {
> +      compatible = "realtek,rtl9301-i2c";
> +      reg = <0x36c 0x14>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      i2c@0 {
> +        reg = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        gpio@20 {
> +          compatible = "nxp,pca9555";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          reg = <0x20>;
> +        };
> +      };
> +
> +      i2c@2 {
> +        reg = <2>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        gpio@20 {
> +          compatible = "nxp,pca9555";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          reg = <0x20>;
> +        };
> +      };
> +    };
> +    i2c@388 {
> +      compatible = "realtek,rtl9301-i2c";
> +      reg = <0x388 0x14>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      i2c@7 {
> +        reg = <7>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +      };
> +    };

Yoy have now multiple same examples. Keep only one, complete in the parent
schema.

> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> new file mode 100644
> index 000000000000..f053303ab1e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2

Best regards,
Krzysztof


