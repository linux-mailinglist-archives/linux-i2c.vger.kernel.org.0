Return-Path: <linux-i2c+bounces-5771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A595DCAB
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 09:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7441B284485
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5736154BE5;
	Sat, 24 Aug 2024 07:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blS2xJTS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93F257D;
	Sat, 24 Aug 2024 07:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724485890; cv=none; b=NgetXm7qvGlCJvMkNios+vEgGFTerhcxb00Dozx40Lb8gnb5/msO4LkA8TY4r7BUpaSKwNAP900sN/6JOP6zI9EmZiYFk00c1bugn5BvBf/N1om4MbqU7D8rheU4rJ94Zh08UOjbNvjiMwFDop3i0Hb6RlmrwsQ8+oZRXapVnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724485890; c=relaxed/simple;
	bh=K+Iyolpoe01eXcw+Ed1bQ1LMT52uPuNW77oqpgcVIEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4Cm3h59a8FsuhF0VQ1G53Hu0xtaYnMTBWTFqG8CeHCXLqyF86E2eMrAukptKraHaoD+oE+a7iq3Yu1jB/D9upIk1ByiORcY5H85W7jtp53+oZuflKvsgD9WxWiTcZTZs3zzXtQZJBDWu/dRPRuJLCtysOFN4BlwdCqPHGuNJuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blS2xJTS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146CBC32781;
	Sat, 24 Aug 2024 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724485890;
	bh=K+Iyolpoe01eXcw+Ed1bQ1LMT52uPuNW77oqpgcVIEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blS2xJTSqpJ4riwJO+9+hBqZJaHOVdlFxCsVdPECFsXx814y0vmxZg+bQcCEcJJpH
	 9J5r6PucoIYiTVCJv6jHQcxt14cR47Wd3f7DluNSu5Pm5rxofW9FsVw5QdvTN/QaGs
	 /3gZ6KEJQ60N3THpT6LAJU0U55Yh32NPmG93VIT6IFKGY7FWsUeplgK8u/F3/y04AK
	 EVSWZAMHSxcCZxolzhbV6czZGJkVjPZCdsaYNstNtjS8yoa5FiHTOBER1a429qfRgP
	 OtfyFMBkq8Y9nXWXy2RAx2acUq3+VK6zOqyYoYJWHsoCHmZHJpENBlVHlIVtBGOb4h
	 4G4PNHdKBLz0w==
Date: Sat, 24 Aug 2024 09:51:08 +0200
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
Subject: Re: [PATCH v2 08/12] dt-bindings: gpu: Add rockchip,rk3576-mali
 compatible
Message-ID: <tnj5oxrnv2r2d6ztlqd3gdsxkjislqgwpj7f2x7b2uj4qp5kmg@cuc4tda7pzpr>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-9-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823150057.56141-9-detlev.casanova@collabora.com>

On Fri, Aug 23, 2024 at 10:52:35AM -0400, Detlev Casanova wrote:
> Add the rockchip,rk3576-mali in arm,mali-bifrost.yaml

This we see from the diff. And from commit subject. You have here plenty
of space to explain shortly the hardware, e.g. it's new and not
compatible with existing.

> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


