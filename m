Return-Path: <linux-i2c+bounces-5770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C624B95DCA2
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 09:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28D05B2243D
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 07:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003BC154BE2;
	Sat, 24 Aug 2024 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NU6FsG/Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91630C148;
	Sat, 24 Aug 2024 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724485803; cv=none; b=jIUgWdm8samYA40R0tZj2mWyrKCbh/uaJneS5TXnWuQ0bxC+FFgZpiDWKiZIzgP5QCN4vz6a8jN+fAhHqCINKsKtSUUao/VLSgdR1y2YVj7iT/aU8ZaTpce90ql3TA8XXrI8DBgysuz1iVUA8ZbrvtSNupoI/9xOCNQe720wJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724485803; c=relaxed/simple;
	bh=Nv0/3MgPrEAyNKOaS42IrvhRzQWnn1NPBjKVsO0g2CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bt+W6wZ7eURpLoGaPHf7fwqBL5gOc0eR/Eq/FquYVDxL7PrblWuGujTKItN2gBbn+2LppytO8iSe+lni5hPMI6ELoJLWmCqMAJ9wtm/TevR8sWhfReR+WeHBkQuUrspbDfXrWfiwjXMmkBVZ9+KZwt7MSEfdj2g1vhq3EOWszr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NU6FsG/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4310FC32781;
	Sat, 24 Aug 2024 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724485803;
	bh=Nv0/3MgPrEAyNKOaS42IrvhRzQWnn1NPBjKVsO0g2CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NU6FsG/Z8+3HTOXQscGhuRxz3D8QondwUnlJ5cqQVlXk5s2iGrPesO5jfCDDCpd3y
	 Alr/J03o0SqGxtuQQ2MfVJtO8tmXJTeJdx+sssHs85tNfVE1YwOsBLHQOUNcbxaaI0
	 Iz6O6vIVi6KEDKIJ+LAL9WsZ8Td29Jz96ZO9s67Q8YJ4CiFLHx9PmlG9t8qnFKtNR1
	 18Xfl0CMSj62OhXv9mQnZPl7NFlc1yQ3fT8op+1Y3QG/4HyjF+ea42jWUaP6tK4IhQ
	 7UlEmWmox5b53R5n3gCMYHTZCMRRBo48mrod0jvLR64xUYd/JvIH9xXdE2K9F8PcOq
	 QgngRgRquBnOA==
Date: Sat, 24 Aug 2024 09:49:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>, 
	Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Alexey Charkov <alchark@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 07/12] dt-bindings: mmc: Add support for rk3576 eMMC
Message-ID: <m5ua5jnbv4u36glqt2qrps35asuqfycxedgjrfhodi5bvs2r2h@xvy4qxt4gx74>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-8-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823150057.56141-8-detlev.casanova@collabora.com>

On Fri, Aug 23, 2024 at 10:52:34AM -0400, Detlev Casanova wrote:
> The device is compatible with rk3588, so add an entry for the 2
> compatibles together.
> 
> The rk3576 device has a power-domain that needs to be on for the eMMC to
> be used. Add it as a requirement.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 32 +++++++++++++------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 4d3031d9965f3..7d5e388587027 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -12,16 +12,29 @@ maintainers:
>  
>  allOf:
>    - $ref: mmc-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-dwcmshc
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 1

Plaese move the allOf: after the required: block. It grows too much with
such if:then: and that's not the most important part of binding we need
to see first.

With above change:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


