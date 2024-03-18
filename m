Return-Path: <linux-i2c+bounces-2388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D31387EAD7
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 15:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9408C283E76
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FB44BA88;
	Mon, 18 Mar 2024 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRjjCllk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9D14D9E2;
	Mon, 18 Mar 2024 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710771807; cv=none; b=EGlPxOnkGpC8CxHyWVtTg6GgJsftjQZMACmpPqHOmlYDPHuGqHpF9Vck8SbHHWmJ7dd+XeNpMhYlgoA/RSkCPMpmNUxHn2M23WdNt9rmoQ23Ft480IvElpcK8bI87By8IFOuKFVRULIkbIfh2fIjayhLaZxBcUgIiTf2RAkxMgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710771807; c=relaxed/simple;
	bh=1S454b/v1LRtIQfIbFgwbzDLfDonxj8EstN2d0gsixY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQO+KNgtu4Wo4H2eFS0PquaO1y6W+SFc9/M6elSdMBG6g4kXY8eS9hUcI2ZYDvxtaKmMapTPqiDmpV6U4lihRYiAdyGVpubmQ2y0xJ4k7U0/0rHk+GISSvMT0p6JBvG7XjpfSpRxFvTgCp5H6asGbTDTdKOAODBNjVMXzOCIz40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRjjCllk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1790EC433C7;
	Mon, 18 Mar 2024 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710771807;
	bh=1S454b/v1LRtIQfIbFgwbzDLfDonxj8EstN2d0gsixY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRjjCllkJF/Wv2VJFeMOgua0k3foxFu1rAkgxNaiK6duS2rfNjSyJUbX91BjB8LK8
	 0GTeTUvJ6cz1xoLFcOdlvPwsod0NODf4luGzWPqpXmUqcjY3BKD63wCo46YvJE2STX
	 oY660GJb3ciqp/61rk43/Eq2Fhj9baNgTaI9SRWp1JcGZxmDCREkw71DrnqGjIk3ux
	 FyBNFSAK/o/ZzXP4PakhaBgsEGbOMae71xiHBl8A1nb7XDc46CG6IYhob0UrjNGTVS
	 DiRx/kVj+cD4tQ+EJEQXQ7hV2zGxfiMs3oAnb0WBNolL+4UGEvPN/0vNdS/OpauY0p
	 sN5eqGv1qiEHQ==
Date: Mon, 18 Mar 2024 09:23:24 -0500
From: Rob Herring <robh@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nxp,i2c-pnx: Convert to dtschema
Message-ID: <20240318142324.GA3960676-robh@kernel.org>
References: <20240318091911.13426-1-animeshagarwal28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318091911.13426-1-animeshagarwal28@gmail.com>

On Mon, Mar 18, 2024 at 02:49:05PM +0530, Animesh Agarwal wrote:
> Convert the NXP PNX I2C Controller bindings to DT schema.
> Keep only one example in DT schema to remove redundancy.
> 
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> ---
>  .../devicetree/bindings/i2c/i2c-pnx.txt       | 34 ------------
>  .../devicetree/bindings/i2c/nxp,i2c-pnx.yaml  | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-pnx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml

> diff --git a/Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml b/Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml
> new file mode 100644
> index 000000000000..b44e4f995b73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nxp,i2c-pnx.yaml

Doesn't quite match the compatible string.

> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/nxp,i2c-pnx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PNX I2C Controller
> +
> +maintainers:
> +  - Animesh Agarwal<animeshagarwal28@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,pnx-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These 2 are defined in i2c-controller.yaml, so drop.

> +
> +  clock-frequency:
> +    default: 100000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c1: i2c@400a0000 {

Drop unused labels.

> +        compatible = "nxp,pnx-i2c";
> +        reg = <0x400a0000 0x100>;
> +        interrupt-parent = <&mic>;
> +        interrupts = <51 0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };
> -- 
> 2.44.0
> 

