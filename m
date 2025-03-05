Return-Path: <linux-i2c+bounces-9728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8152DA4F529
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 04:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6E16188FBCD
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 03:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E32D1A23AF;
	Wed,  5 Mar 2025 03:05:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67D19E997;
	Wed,  5 Mar 2025 03:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143953; cv=none; b=frz9TXNWxzMSfzlUlkDlwuW4X1hp5zBLjKBW5acmMkTb81QGyfMIdcJM8t3LTZMmwLJrxLdSxfh1vLTGNDUNRXj2pkIsgdrguaG5kmNLeZHA8rvJDUDXrJQByzn44apU7N8KMC8klWrxkmzd/M6NH7P5MS/sLjN1Hc47/cJvVlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143953; c=relaxed/simple;
	bh=1ueDenyw8US27XjXIKTEVWL1cb6lLOGKUUZ+JroTBnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNOw8jviiZSNJO9qZRvkp3A7QxCIa+9LiRYAShth8IuvKyw2B0UDx04eetTdnzc0bXeajywPfh+NrGtDoL/G0qR44ik7xpd0sothz0nC81yO7S8NadpUIQ+T0cDuNXYoY/u4Gun6QTmXHWtPau+qbOTS6eKY4tZ0Odkzsig+RXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B94D7342FDB;
	Wed, 05 Mar 2025 03:05:50 +0000 (UTC)
Date: Wed, 5 Mar 2025 03:05:40 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support
 for K1 SoC
Message-ID: <20250305030540-GYA62563@gentoo>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
 <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>

Hi Samuel Holland:

On 20:11 Tue 04 Mar     , Samuel Holland wrote:
> Hi Troy,
> 
> On 2025-03-03 3:35 AM, Yixun Lan wrote:
> > On 13:30 Mon 03 Mar     , Troy Mitchell wrote:
> >> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> >> and supports FIFO transmission.
> >>
> >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> >> ---
> >>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
> >>  1 file changed, 59 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> >> @@ -0,0 +1,59 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: I2C controller embedded in SpacemiT's K1 SoC
> >> +
> >> +maintainers:
> >> +  - Troy Mitchell <troymitchell988@gmail.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: spacemit,k1-i2c
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> > ..
> >> +  clocks:
> >> +    minItems: 2
> >> +    maxItems: 2
> >> +
> >> +  clock-names:
> >> +    minItems: 2
> >> +    maxItems: 2
> > I'd suggest to give a brief description and explicit clock name here,
> > you can consult marvell,mv64xxx-i2c.yaml for example
> > 
> >> +
> >> +  clock-frequency:
> >> +    description: |
> >> +      K1 support three different modes which running different frequencies
> >> +      standard speed mode: up to 100000 (100Hz)
> >> +      fast speed mode    : up to 400000 (400Hz)
> >> +      high speed mode    : up to 3300000 (3.3Mhz)
> >> +    default: 400000
> >> +    maximum: 3300000
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +
> >> +unevaluatedProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    i2c@d4010800 {
> >> +        compatible = "spacemit,k1-i2c";
> >> +        reg = <0xd4010800 0x38>;
> >> +        interrupt-parent = <&plic>;
> >> +        interrupts = <36>;
> >> +        clocks = <&ccu 176>, <&ccu 90>;
> >> +        clock-names = "apb", "twsi";
> > 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
> > https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
> > from above docs, there are two clocks 
> > bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
> > bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
> > 
> > I'd suggest to name it according to the functionality, thus 'func', 'bus'
> > clock, not its source.. which would make it more system wide consistent
> 
> Also in that same register is:
> 
> 2	RST	RW	0x1	TWSI0 Reset Generation
> This field resets both the APB and functional domain.
> - 0: No Reset
> - 1: Reset
> 
> Which means you need a 'resets' property in the binding as well.
> 
right, there is reset needed

I'd suggest to add it as an incremental patch later, when we
implement real reset driver, and also complete the calling reset
consumer API in i2c driver

but, let me know if this is not the right way to go

> Regards,
> Samuel
> 
> >> +        clock-frequency = <100000>;
> >> +    };
> >> +
> >> +...
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

