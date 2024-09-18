Return-Path: <linux-i2c+bounces-6857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57997C0A8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 22:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89C6C1C20F65
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 20:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BA21C9EDD;
	Wed, 18 Sep 2024 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ab4D6i2t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C01A273DC;
	Wed, 18 Sep 2024 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726690210; cv=none; b=fmLG2RIIYkBmBo70UmHh+LLv5aQ7RN6zYsYjjbfG5x3dZ0ioqYGcYE3cRV9S/HGXyVi4RRwVW9+d2NYq4C4O+FPXbbJSlDxt+KfLL83p196oskb8/9r2219Gpn3wMV6XQ3KwYrIn9VM3OkleneU5dZQtXJz6JIvTBNZFVOVF1IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726690210; c=relaxed/simple;
	bh=HP/zRaWLm37a0O/YnwD/z87FqywELzKP69C1iP96//k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPkJA57Lc3Q58QtC9v+ahIzeIfc9n4xR5cX6LQdrgFbETHYWxof2bxYjBpfh8zqlYU+TJ3rJGBG4Z5rY9JCDPM1IhIfZkVpzi23axPON2tD5QEvMTIjWOJ8zoYZI02CmlYD0+UcTNtPhbnVqFTU+1K5M/WJteOa82DvnK4qx9HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ab4D6i2t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73A7C4CEC2;
	Wed, 18 Sep 2024 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726690210;
	bh=HP/zRaWLm37a0O/YnwD/z87FqywELzKP69C1iP96//k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ab4D6i2t1X8aYzasuMglH+8lIcj884En9JvHGqiJKCssXAyYDvgusG7KW/oQdp3bo
	 2rvibPnGOg/5tO6Yh+uoiJQSy+vWkregpERB2YcXHJux/E4hwcjhvZbUxVbI7O3rJ0
	 jojYEpuNO4DC7gb2zSdlCBH5Ffmx3RPGX0FnOIJBSi2dm9Cs8QVcZSySqewnPZ5S5l
	 m5pVhJRlYTf0VeSdqjP0za6numHxK/9wyjS9y3vYp9a3T3FbW9KcwG97f+gOT9Pc6Z
	 1+KprkgDs0slZmTyvMm9eC/AA1brksiHPZ5vzUWj6d4CnlTYyFPYLttA42Ht+u2RRw
	 MCgNSIH5L3mLQ==
Date: Wed, 18 Sep 2024 15:10:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>, kernel@collabora.com,
	Jamie Iles <jamie@jamieiles.com>,
	linux-arm-kernel@lists.infradead.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-watchdog@vger.kernel.org,
	linux-serial@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Maxime Ripard <mripard@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Morgan <macromorgan@hotmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, Andy Yan <andyshrk@163.com>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Tim Lunn <tim@feathertop.org>, David Airlie <airlied@gmail.com>,
	Ondrej Jirman <megi@xff.cz>, Liang Chen <cl@rock-chips.com>,
	linux-spi@vger.kernel.org, Jimmy Hon <honyuenkwun@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 6/9] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Message-ID: <172669020548.2047533.8189624285795132059.robh@kernel.org>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-7-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903152308.13565-7-detlev.casanova@collabora.com>


On Tue, 03 Sep 2024 11:22:36 -0400, Detlev Casanova wrote:
> It is compatible with the other rockchip SoCs.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


