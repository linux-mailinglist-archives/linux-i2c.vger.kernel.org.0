Return-Path: <linux-i2c+bounces-10431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DEBA90CE1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979057A537A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C5E229B30;
	Wed, 16 Apr 2025 20:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttCdY27V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811B227BA9;
	Wed, 16 Apr 2025 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834525; cv=none; b=f9+2y7BsCgWI5rWv0uvytJXdDCkLHVgfcbpQFTs2YUVR2uaBhYkkzia9wsCAljQ0J9IEzi1rU8/UN1KDxdtdlH3D+lHkcVZfVsITB/8ZNAHqlgXPg1KBS+tUyGCHJaaczdY7OkOffmtPBqnPC2IHekx19P/J/Xd+7i/UyLhg1/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834525; c=relaxed/simple;
	bh=2wkHVrSpRFb9zHvS2pMnzRDNmuP5IaR09Mwm8aKfwyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZQQ9FYE5nRNG2wzm1QQiD7UYCFq3GBgB4uoqjFw81YhP51U9ILGtwYOtF13+it7K/hK5peT/pbTlPEg87/WSJY5oaoZNn/zQNaXNGTtojV18iueUVZc/2DoPMkmRQHo4/UdMazPd2enm+j/IKT4zDPCMiKj62PHMbuYtqG0hOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttCdY27V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE78C4CEE2;
	Wed, 16 Apr 2025 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834525;
	bh=2wkHVrSpRFb9zHvS2pMnzRDNmuP5IaR09Mwm8aKfwyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttCdY27VQu6ureDFgFuO6onjpbgtQ72z5/knPNgZBekYP5Gv+O2Fifgb4P4bnfd9J
	 DtrKCSBCeW9Agk1o+JMFNiVULtZU8yfW0UARIEOUtTtq3WwDeiaIAiWgZ5sm0RsrG5
	 uUEjEWSCre/r3YFbo3ytjiTjHBxarmnw8bARLpmf8X8l/kyKODfMaeHOsLlMoi02W/
	 ARaGavkNhUheyRtPN72ueSBamHQFm/jmwwRvYHf/FOvVh8+G8dSu4q2napoon9MT49
	 reAbE99tPcDFGGaKWoIXvW7wpKbC2ZJlSLrlhxs8GbzH8vPOhEcffSrZbG29KYIwEB
	 ZXWnKSBVWBjsA==
Date: Wed, 16 Apr 2025 15:15:23 -0500
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
Subject: Re: [PATCH 05/13] dt-bindings: pwm: vt8500-pwm: Convert to YAML
Message-ID: <20250416201523.GD3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com>

On Wed, Apr 16, 2025 at 12:21:30PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the WonderMedia PWM controller
> as YAML schema, and switch the filename to follow the compatible
> string.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++++++++++
>  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 44 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a5f77fa848e0f604bed63c36b8e0996cf599cec0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/via,vt8500-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: via,vt8500-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#pwm-cells':
> +    const: 3
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm1: pwm@d8220000 {
> +        #pwm-cells = <3>;
> +        compatible = "via,vt8500-pwm";
> +        reg = <0xd8220000 0x1000>;
> +        clocks = <&clkpwm>;

Same order as in 'properties'.

> +    };

