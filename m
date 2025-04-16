Return-Path: <linux-i2c+bounces-10430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DCDA90CD6
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0F0B442AC8
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7681E226CFB;
	Wed, 16 Apr 2025 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYXPqZTW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD322371A;
	Wed, 16 Apr 2025 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834450; cv=none; b=oAHj0qV1b4A75ORJSNMQbn3yPtoYdtWvXzeqIXemmgs8/5fiLukX26+T2Oxes2MZtDqtL7FYVxY0zlugKhtkGJ8vcxSrk2R34/mmIwBFJRGyUtC6ftkICoOu3XAR18MzJKkEHBA3glJTipSYMfWKuhCDZF8oT5Qdv1P21patXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834450; c=relaxed/simple;
	bh=Hbyp2qYIwULebz/O5rS6U/XZYTxGIC5Vje0hnCXZaSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+l3bRNUkXQC2g4VlrdKN39oW+xRn4aKJUz2YN1MfpWt76EMZIfddFlSeL0OCLzSyU9EfdK0DYeNSt2msEd6BkzwZ4aaETo1UIGHOHIQvZaprY7oxaIsA+yoLjaeelrD8dep4/opYnWnO7Ywl8i1Pnb7YLLcF0SJf6AxjBA2nlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYXPqZTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3C2C4CEE2;
	Wed, 16 Apr 2025 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834449;
	bh=Hbyp2qYIwULebz/O5rS6U/XZYTxGIC5Vje0hnCXZaSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYXPqZTWE69cli1lV6YFlQpvGFrMMKKucFTo10PJSXWkST2M8/3S+SC1Whvcwc3Vx
	 QlTQDqPmBc0yWRGlf2ivEtWCRS6dha9DvolhgVeyaTEv/qpyGrAZc7dyrchzFNTUzi
	 feYk0JSpEpcXhbYLNOCytilKbAbYM0G2z3byX7zoeGq+IH6fZQO1eldPDQKiLd2EKG
	 FkbKt6Wqe/ctklnx9U6VpLnYLWOvioi0mIDO8wfxQHuvLFKnMaemkuOEnrGGp0t5U7
	 y4rWx9+/dOoZP8dxijEMLOr5HtlJJhxySd6xjztGO48YwEGQEJ9H2pDPb4DwBRz15/
	 V/J8G6QYK6AJw==
Date: Wed, 16 Apr 2025 15:14:07 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
Message-ID: <20250416201407.GC3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com>

On Wed, Apr 16, 2025 at 12:21:28PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the WonderMedia SDMMC controller
> as YAML schema, and switch the filename to follow the compatible
> string.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
>  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 62 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> deleted file mode 100644
> index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -* Wondermedia WM8505/WM8650 SD/MMC Host Controller
> -
> -This file documents differences between the core properties described
> -by mmc.txt and the properties used by the wmt-sdmmc driver.
> -
> -Required properties:
> -- compatible: Should be "wm,wm8505-sdhc".
> -- interrupts: Two interrupts are required - regular irq and dma irq.
> -
> -Optional properties:
> -- sdon-inverted: SD_ON bit is inverted on the controller
> -
> -Examples:
> -
> -sdhc@d800a000 {
> -	compatible = "wm,wm8505-sdhc";
> -	reg = <0xd800a000 0x1000>;
> -	interrupts = <20 21>;
> -	clocks = <&sdhc>;
> -	bus-width = <4>;
> -	sdon-inverted;
> -};
> -
> diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b50448201b0416efc7f787af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WonderMedia SOC SoC SDHCI Controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: wm,wm8505-sdhc
> +      - items:
> +          - const: wm,wm8650-sdhc
> +          - const: wm,wm8505-sdhc
> +      - items:
> +          - const: wm,wm8750-sdhc
> +          - const: wm,wm8505-sdhc
> +      - items:
> +          - const: wm,wm8850-sdhc
> +          - const: wm,wm8505-sdhc

Combine the last 3 entries into 1 using 'enum' for the 1st compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: SDMMC controller interrupt
> +      - description: SDMMC controller DMA interrupt
> +
> +  sdon-inverted:
> +    type: boolean
> +    description: SD_ON bit is inverted on the controller

This implies I know what the non-inverted state is. If you know, please 
state that here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mmc@d800a000 {
> +        compatible = "wm,wm8505-sdhc";
> +        reg = <0xd800a000 0x1000>;
> +        interrupts = <20>, <21>;
> +        clocks = <&sdhc>;
> +        bus-width = <4>;
> +        sdon-inverted;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2444282096e03b301ed0e3209b4de7a114709764..f106850b9d3d349d82953b672588b967a37ea27b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3429,6 +3429,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Odd Fixes
>  F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
> +F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
>  F:	arch/arm/boot/dts/vt8500/
>  F:	arch/arm/mach-vt8500/
>  F:	drivers/clocksource/timer-vt8500.c
> 
> -- 
> 2.49.0
> 

