Return-Path: <linux-i2c+bounces-10429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EEBA90CCD
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69AE15A1164
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B97C226CFE;
	Wed, 16 Apr 2025 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSmCipVi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5952226863;
	Wed, 16 Apr 2025 20:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834260; cv=none; b=gtJzlH1zILuZ7VpEc89+nCOC0q6hWE5EnEKy0+21KIbVN/99fyx6gFyNo25KfKsDGlOc/kuuqpjCGN+YScUye1Lzd4DqMvvq74oTq37WH+W3C2OHKOY9+iTuGN1LvgWMvARxJ55MWsFslRXorI3p3nkBP8it5VHfow5fA97RF3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834260; c=relaxed/simple;
	bh=SSak+u5jFVfFMUW7Av1ja2Nldu+0bF8pHTXYXRdifBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI7jBcJFL8DlDhzEJyR9HPKYiezs+1KtWizc6kpX3kBnAlCm1qEIpNPYCfsOYgK+O9K4GHdRzvA7sehGubVaZPaaSf0LfrdZQX0ZPPXsgEirqbQw3Psl3NkszVtbZbl2YVSGbkLb4yhlZdBDdjdShursG5jlCNxfHZLQFeWAe+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSmCipVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C191C4CEE2;
	Wed, 16 Apr 2025 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834259;
	bh=SSak+u5jFVfFMUW7Av1ja2Nldu+0bF8pHTXYXRdifBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSmCipViEcJV+5wzo8ibu91cJy8mSWinHenOYUSP3XrBcgNiYzN7aKvzlWIl2bQzR
	 6D6r+lCekEyI1+XiujroVPVDf0Vk1lFlRfcJjUfLQ4KnJapYGxkHYEy7tyMhgX3C4T
	 T5+NMzmiZVdY7RRytwgwu5mxOKduWHl0gEeAP+5BCc153/3UCebfPvDz/1Kn2Z5mjJ
	 5jV04x52lEniGY8jPu/HVU5XcDd1tafOVDSnM6Q5+ZER2StD3fIMzxRPC28fmzHSp6
	 kuM7dgb9X3O1KUeQKZU6GS0B6EzQV3ZRzmAErBVPcLw9WyTQ+GHgrY/fCj0C5uGcrt
	 0D2LXPLBfNeJQ==
Date: Wed, 16 Apr 2025 15:10:57 -0500
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
Subject: Re: [PATCH 02/13] dt-bindings: interrupt-controller:
 via,vt8500-intc: Convert to YAML
Message-ID: <20250416201057.GB3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com>

On Wed, Apr 16, 2025 at 12:21:27PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia interrupt
> controller as YAML schema.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../interrupt-controller/via,vt8500-intc.txt       | 16 --------
>  .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 48 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
> deleted file mode 100644
> index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -VIA/Wondermedia VT8500 Interrupt Controller
> ------------------------------------------------------
> -
> -Required properties:
> -- compatible : "via,vt8500-intc"
> -- reg : Should contain 1 register ranges(address and length)
> -- #interrupt-cells : should be <1>
> -
> -Example:
> -
> -	intc: interrupt-controller@d8140000 {
> -		compatible = "via,vt8500-intc";
> -		interrupt-controller;
> -		reg = <0xd8140000 0x10000>;
> -		#interrupt-cells = <1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3fbe985db276e6a3b65cc66c7de097ed0719c0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA and WonderMedia SoCs Interrupt Controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +
> +properties:
> +  compatible:
> +    const: via,vt8500-intc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 8

This wasn't in the original binding. Find to add, but note that in 
the commit msg. Here, what each of the 8 entries are must be defined.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@d8140000 {
> +        compatible = "via,vt8500-intc";
> +        interrupt-controller;
> +        reg = <0xd8140000 0x10000>;
> +        #interrupt-cells = <1>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c5195a98b15a39583d337fb6310b80432b0f6922..2444282096e03b301ed0e3209b4de7a114709764 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3428,6 +3428,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Odd Fixes
>  F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
> +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
>  F:	arch/arm/boot/dts/vt8500/
>  F:	arch/arm/mach-vt8500/
>  F:	drivers/clocksource/timer-vt8500.c
> 
> -- 
> 2.49.0
> 

