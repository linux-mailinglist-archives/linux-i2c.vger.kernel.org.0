Return-Path: <linux-i2c+bounces-10432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FABA90CEB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A8A19E06EB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF83229B3C;
	Wed, 16 Apr 2025 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1s3VSaG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2C213E69;
	Wed, 16 Apr 2025 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834568; cv=none; b=BRfetwsixNWSaaGgh2UF/eEHXDcgpm8NLoQjwmEu+tYBWzXC6d3W4QoEmX74+7+18ZxSDR4r7ZlRzP17/i5Xxq3T35GznZvbZ9LJk8r26Oi1HyPU1K3bW3Uiq9MTJE1ubDUZiMdXJSpa1mzQR06MbUHQ9o2Q443NX3G231oWLRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834568; c=relaxed/simple;
	bh=jwbQ9oSC+bgaYojOoHSAKD8W88U01UB8bPPxIaydNTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFy/NSQsz1+dUesyDSyC5mmkcd1WDLiRd+YTQ+HFGKUvMmpRzkfigBP+pjzOu1tmFiFcJZ1iu6iZ6sQxgHgrqoPJKvpI3S8+VS6kpqSVXglLJEa6cek4Tzk5ZlKQ0w1C4BRLysUVXN6kArzs7UZBs7g80y1onTbCi2OXV7EwPw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1s3VSaG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D392C4CEE2;
	Wed, 16 Apr 2025 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834568;
	bh=jwbQ9oSC+bgaYojOoHSAKD8W88U01UB8bPPxIaydNTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1s3VSaGDcRvodSkSBu/l93+kcsVMCTj6Dd3f8waYOCnsQAFMptFDEkOb3Ebse0Bx
	 kdHqtETCZYM2/fxjfpOTH2nmmpJgXH8ONpomhRp+qWSEuOwRlrWA8kzCOh0542q/d0
	 JlhInPY2743cQ4tOTWu+mPB6g3zXGLvEqkDlaidMrlyPFTLfEImnxhh6b6GvAw94t5
	 IcgaDBPkwEfW7tqyLWYf8VR5RLsvurczVEP2OUZg1s6cgX9/042BIoEo8xkhITxD1S
	 qTTbHGQXkFOUALnb1MG5nA0YRi68BiKb56Q/kAu/UVZN58ABpl74uDKi/bTvrr3bnS
	 m4zgkoAtermnw==
Date: Wed, 16 Apr 2025 15:16:06 -0500
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
Subject: Re: [PATCH 06/13] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Message-ID: <20250416201606.GE3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com>

On Wed, Apr 16, 2025 at 12:21:31PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ---------
>  .../bindings/timer/via,vt8500-timer.yaml           | 36 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> deleted file mode 100644
> index 901c73f0d8ef05fb54d517b807d04f80eef2e736..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -VIA/Wondermedia VT8500 Timer
> ------------------------------------------------------
> -
> -Required properties:
> -- compatible : "via,vt8500-timer"
> -- reg : Should contain 1 register ranges(address and length)
> -- interrupts : interrupt for the timer
> -
> -Example:
> -
> -	timer@d8130100 {
> -		compatible = "via,vt8500-timer";
> -		reg = <0xd8130100 0x28>;
> -		interrupts = <36>;
> -	};
> diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7d9dc93b708823de9594d20ef6b7e0367c5a36f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500 Timer
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: via,vt8500-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4

Need to define what each entry is.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@d8130100 {
> +        compatible = "via,vt8500-timer";
> +        reg = <0xd8130100 0x28>;
> +        interrupts = <36>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d131004add981446b08b1b3d572a3daa8377fd61..46339ed45ad18ab2b9470c749f604d9aaf72015b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3432,6 +3432,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
>  F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
>  F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
>  F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> +F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
>  F:	arch/arm/boot/dts/vt8500/
>  F:	arch/arm/mach-vt8500/
>  F:	drivers/clocksource/timer-vt8500.c
> 
> -- 
> 2.49.0
> 

