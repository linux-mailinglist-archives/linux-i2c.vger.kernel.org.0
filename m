Return-Path: <linux-i2c+bounces-7981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C86889C83A5
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 08:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0401F23402
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 07:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68931EBA13;
	Thu, 14 Nov 2024 07:06:09 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFB41EABA9;
	Thu, 14 Nov 2024 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731567969; cv=none; b=g5fmM0KWaZmV815WqYP8SPpFKRth/GmbUoqwbji1EPWLq6oBK1GHj5bbLWgzMX37I4wyYfeXoZbwJzQmUc82/GBtPxi28nvyBjnDvSLEr8tmyoWBYeBK679qG303h/Ie3CDF9vVm8x6/zOFrmzkJT7FFHpwsA5U+T+qdSiisEQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731567969; c=relaxed/simple;
	bh=s9+yE6EWvbV+CXOwEgtNLb0gY6LWIVlrlrPXHyfyjd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYth2Y2M92VNNqzDMpy4hlayf5CdWloxJKo/aHwDrmQqLwUUpycdOJp3dW7/N0BkZIGoQetz/gODoT8HctbNEtA93Ul5cOGNXpmGx3gOZsZUg24GDQ0NqHgrjlElRsWpegUJUIfhqsuJk7sVli9vRopaQ1iSAB2CJF85TvwVeQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Thu, 14 Nov 2024 15:06:01 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <20241114070601-GYA1001363@gentoo>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
 <20241112-aged-trailing-cffda6af0944@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-aged-trailing-cffda6af0944@spud>

On 18:03 Tue 12 Nov     , Conor Dooley wrote:
> On Tue, Nov 12, 2024 at 11:07:39AM +0800, Troy Mitchell wrote:
> > From: Troy Mitchell <troymitchell988@gmail.com>
> > 
> > The I2C of K1 supports fast-speed-mode and high-speed-mode,
> > and supports FIFO transmission.
> > 
> > Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > new file mode 100644
> > index 000000000000..e8cce360bf03
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: I2C controller embedded in SpacemiT's K1 SoC
> > +
> > +maintainers:
> > +  - Troy Mitchell <troymitchell988@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-i2c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description:
> > +      Desired I2C bus clock frequency in Hz.
> > +      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
while we are here, I'd suggest rephrase the sentence above to align it better with the doc

K1 support three different modes which running different frequencies
standard speed mode: up to 100000 (100Hz)
fast speed mode    : up to 400000 (400Hz)
high speed mode    : up to 3300000 (3.3Mhz)

> > +    default: 100000
> > +    minimum: 1
> > +    maximum: 3300000
> 
> It's sufficient to define just default and max btw, the min is set in
> i2c-controller.yaml (in dt-schema itself). Don't respin for that alone.
+1, the minimum settings isn't really useful, clearly not apply in the practical case

> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c@d4010800 {
> > +        compatible = "spacemit,k1-i2c";
> > +        reg = <0xd4010800 0x38>;
> > +        interrupt-parent = <&plic>;
> > +        interrupts = <36>;
> > +        clocks = <&ccu 90>;
> > +        clock-frequency = <100000>;
> > +    };
> > +
> > +...
> > 
> > -- 
> > 2.34.1
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

