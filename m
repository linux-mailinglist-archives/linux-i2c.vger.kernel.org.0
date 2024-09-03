Return-Path: <linux-i2c+bounces-6054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF496A4CC
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 18:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C5D11C23891
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758AA18BC13;
	Tue,  3 Sep 2024 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLY1YqOn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBA81E492;
	Tue,  3 Sep 2024 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725382041; cv=none; b=ptKfYKhy8yj0+b736TZi30hkqAtUcgHl4h+WNm1wOsnZ5/FSqyGk+Jw4CsYAuKI6PO5hCb3tfMbfheIL4mTHKtyZwjVDrqB8ZOd34UgRgfmeqzeNC5zG2eRieXF9ZO7VOcFOlwPJDNz5Jdc4wOR6KxEnY8Pve1S89clntrDgZyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725382041; c=relaxed/simple;
	bh=5IBLt3q/BfuZsMvLmbLqTsdzGnY8HAd/pkHhflhyo9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAphFS5q6r7rMedAxKkDKqAeLFnzCPJQId2EkoXpvPTdwhepqqRq66PYdnrooBOFzc7HURv0tr16gudZ5hd8CW7dM7+WoygL0Ol2ZrBLt6BNDHwETnpZHUueBc2DtesLU1Bx6ryvf6eg2NI8GcbuVixj76bMmj4tuWDi8fcjj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLY1YqOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C5AC4CEC4;
	Tue,  3 Sep 2024 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725382040;
	bh=5IBLt3q/BfuZsMvLmbLqTsdzGnY8HAd/pkHhflhyo9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLY1YqOn8wZTCeG/iOr1exXWmCjUhmI/EZYB5SeESLR6Ef62Kb2YHJweKIZwpLkKb
	 z7DImi45xWjWmBSi5T7OK4n+B8HdTX1ch5M8+NKqv4dqdsrUAefoH2IVnwBrAXhYKn
	 SkPkRhlyxcxwFV48sB60DN0uMBfYiyFtO+kRawL5sLV94+lQcIybBzdcdyp0m2dOap
	 2MAEbDo5v+wetkXjqiN7F2pXw3+sIxENEdASv3YGEI0eG/6Fc3oSmeVFbl/ulUpyA5
	 bjE0lgynAFAuBhkxELFRmzYLrhzauSdHb/IK3MW/Yh8O5hZ+jQpYGHr0YCnkx9CzHW
	 RZOZZPp2ow2iQ==
Date: Tue, 3 Sep 2024 18:47:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, Andy Yan <andyshrk@163.com>, 
	Muhammed Efe Cetin <efectn@protonmail.com>, Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>, 
	Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>, 
	Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
	Alexey Charkov <alchark@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
	Yifeng Zhao <yifeng.zhao@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Liang Chen <cl@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Message-ID: <ycbhqmkwz2hirnvp6j47kz3cxnli3db3i5ah76gngrezs5ww2r@57x2gxnr5hyk>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-4-detlev.casanova@collabora.com>
 <bnpwnuhikwkqyf3jos67qwywhfge3vm6tfmlfitypd5k62jzdn@fri4swkl2zbq>
 <12506188.O9o76ZdvQC@bootstrap>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12506188.O9o76ZdvQC@bootstrap>

Hi,

On Tue, Sep 03, 2024 at 11:59:34AM GMT, Detlev Casanova wrote:
> On Tuesday, 3 September 2024 11:46:00 EDT Andi Shyti wrote:
> > Hi,
> > 
> > On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> > > Just like RK356x and RK3588, RK3576 is compatible to the existing
> > > rk3399 binding.
> > > 
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > 
> > I will apply this after 1 and 2 have been merged.
> 
> Sure, although it is not really dependent on 1 and 2.

yes, but I want to be sure that everything is coming in.

> > BTW, who is maintaining rockchip.yaml?
> 
> Heiko Stuebner is the maintainer of Rockchip SoC support.

I would guess so, but I think we should also add the entry to
the maintainer's file :-)

Thanks,
Andi

> > Thanks,
> > Andi
> > 
> > > ---
> > > 
> > >  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> > > b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml index
> > > 82b9d6682297..a9dae5b52f28 100644
> > > --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> > > +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> > > 
> > > @@ -38,6 +38,7 @@ properties:
> > >                - rockchip,rk3308-i2c
> > >                - rockchip,rk3328-i2c
> > >                - rockchip,rk3568-i2c
> > > 
> > > +              - rockchip,rk3576-i2c
> > > 
> > >                - rockchip,rk3588-i2c
> > >                - rockchip,rv1126-i2c
> > >            
> > >            - const: rockchip,rk3399-i2c
> 
> 
> 
> 

