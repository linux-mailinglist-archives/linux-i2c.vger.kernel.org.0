Return-Path: <linux-i2c+bounces-5772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BC695DCB4
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 09:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE8D2845E0
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 07:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257AB154BFE;
	Sat, 24 Aug 2024 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWz6a6Ub"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0B257D;
	Sat, 24 Aug 2024 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724485942; cv=none; b=fps7eE2tuddIpvZXTc2sksC9lqL18YzyGSgrm0emOCeImav1zA8c9A3VAYQi8KihkpxCOrEpq01/hhgTsIZ8clWNfz1t2B+PUj1IIL/iZH+EPKa8JxRAvebLRnWRvcs3vE8/KUmIXlbRZu8UolLN2A1OzMGcL3RDB6D4gIUz6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724485942; c=relaxed/simple;
	bh=J7CJ4ewK1ei4WvrIKvVeq7IO2mBtlvBtEoZL+GqcpiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUNHqYMtCRNOXg8uQqry0wdXzYH/24T6pSa9kJmXRWL9YtB8cvnxMCjSoz423RBh6KisVRJiydHumFA0pooK2w5It5Bx/xyR+0Lx79FTsqIPGezBWyyoxX1e3/gI3JXO7sB3wOqbh1v6Qx6RJ151nUbkCfB1u6QdDsPUui1A7ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWz6a6Ub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36470C32781;
	Sat, 24 Aug 2024 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724485942;
	bh=J7CJ4ewK1ei4WvrIKvVeq7IO2mBtlvBtEoZL+GqcpiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWz6a6UbzKGFpHdRPvkQh/kdN8iH1iiTbEgLvKfofw+awByVtTXMksxpWwxGubX+G
	 AdAVZ7D2VLX3Yyw4cpTWJVxAMJvK19RXjeGUDt5/jBKq4secGcNpsJVYv0FzNdVsCI
	 1X5RBcTsZ/qbDeL32MaAZ5i7U/8g+opq9kHqKe7K15YjlDvq9xjxcxWFKivUKAPaFm
	 LAa30ZwXk7acwFePszse9qsy0gAtQdOnbD9es8bZU7egTxhHZ1foYLvkxazSn12C4W
	 /Cs71gjB6O8boa6Rf1T8EqJ+8x8mXysDYjkK9+sm7LpwQaECHwD1GBlSGvA9+h4auM
	 1ROhyqMBMd8kw==
Date: Sat, 24 Aug 2024 09:52:01 +0200
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
Subject: Re: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Message-ID: <qqc6rj4a5hrme3b5adw4l65zeb2c7zjgtyror6hwtkhm5g3mkw@bc2xijdjddmv>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-10-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823150057.56141-10-detlev.casanova@collabora.com>

On Fri, Aug 23, 2024 at 10:52:36AM -0400, Detlev Casanova wrote:
> It is compatible with the other rockchip SoCs.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


