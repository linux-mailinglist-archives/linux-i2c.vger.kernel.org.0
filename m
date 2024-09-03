Return-Path: <linux-i2c+bounces-6056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB996A63D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 20:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22E191C21528
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 18:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8944A190462;
	Tue,  3 Sep 2024 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1dC6l8a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F92F9DF;
	Tue,  3 Sep 2024 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387119; cv=none; b=Znf2BpRcDLMd2j5Rp+oax28ll0R1YuzJGDe11hZnrSzTT0AhGMRDqTSisdOJ7uRLfQ3dgXrVZrEM5uD9fEBbWhWivkYWeDwtWhsc4JR6VAq2XH4LwPaRvw3mTw8SqM6UyFlTpCnRiybmzR+7wqubZ9L8r2hetUuyrjz8VmP6210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387119; c=relaxed/simple;
	bh=if11Vy5KkDrmjGEflqzJtRJ7Egv1VFzayV75E2P4Iv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmaVPWJYc6iIy6wX4y5NEf3g+nIpu0UTuRC3qUY/86G4356oSdHZIPeW0trRo/8Hej/mRP1w3jtKwjBHza8KVDOQmwvdHuxyEy4FBgDHYq7bsab9oYI2IHY6QEV0jahDk52y26Dj4LL4tpKq9x17gm1EzSJP3v5Ev3Tu4wS+goE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1dC6l8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C0EC4CEC4;
	Tue,  3 Sep 2024 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725387118;
	bh=if11Vy5KkDrmjGEflqzJtRJ7Egv1VFzayV75E2P4Iv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a1dC6l8aPQD5OCJJwQjbcZ8mqfhJ+Nq/wS+UFqq1cNHh9/hwCCT9ttOLwe9zO9V4B
	 obKom5l+3kjqfPr2YfeW4QdYRTLlayD94yQL8rrE2JxNeg58T7XHE0sJqvD6FRdX5s
	 +IImDuKXxXvt7kSZWxqGjaqoJAYTy+u1N/8vOWRK3zPh8Xz9rNaW7LYtiZ6MmJuOzU
	 HbLfsYGMrIg7QXE9BHc8jf0AJnnasvuFPg8Wdj1N2mJh6UTBsrIMx57auQwiTTSTIn
	 ZjNu9BK41/4HnLjGm5tRimIht2HF5vA01g+C0NyGDRzZf7xbaRX3h+HOMoL7/LqQLn
	 5aOpFuXQJ4Xkw==
Date: Tue, 3 Sep 2024 20:11:55 +0200
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
Message-ID: <4hfdvgvkzt6cvyqbhfy3ttlwip4p4yfnhzbbciq5l3tso25zw2@qty5bsbbtbp4>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-4-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903152308.13565-4-detlev.casanova@collabora.com>

BTW, just as a self reminder,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> Just like RK356x and RK3588, RK3576 is compatible to the existing
> rk3399 binding.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> index 82b9d6682297..a9dae5b52f28 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> @@ -38,6 +38,7 @@ properties:
>                - rockchip,rk3308-i2c
>                - rockchip,rk3328-i2c
>                - rockchip,rk3568-i2c
> +              - rockchip,rk3576-i2c
>                - rockchip,rk3588-i2c
>                - rockchip,rv1126-i2c
>            - const: rockchip,rk3399-i2c
> -- 
> 2.46.0
> 

