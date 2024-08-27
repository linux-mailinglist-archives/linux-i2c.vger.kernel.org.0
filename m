Return-Path: <linux-i2c+bounces-5826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AA9602E6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 09:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778D81F23335
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 07:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA4A155393;
	Tue, 27 Aug 2024 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Pe2KCEui"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7C4C133;
	Tue, 27 Aug 2024 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724743211; cv=none; b=NrVwi+c3OggbasqBbSCeSIpi03savLKgmWM65SCMQAgAo1gVDFgErL4MQqFmPEIxbjWZvTIKPD96H7YEcXDCRbexIivtwJ+uCWTc0xAeEkW00Yx7bwlSHp6Bxap/+A9Ur6eJqwwTGRQoFZTITVUdTpH16HTJ7Of+G5OWsiPsR+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724743211; c=relaxed/simple;
	bh=UxbCS3FMoRTnuzOgeRB2zFoKc565Z0XgcZjXDsYoiTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gbwh2eubgz+WZ5spdrelDxjMT1txL0BNbvGwe7Yl9EAV4ppW/NQiEWECANzqw2pag8nEAVFfuoWJoQGyWz5xKjR+MaSrgMfZXqsQIcpTbl2h76cxfLOx5vy7j3QYcuSZnDcwzChz7dGxQA5mtDVQmu68EQlf7yxq3l1uq01CuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Pe2KCEui; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YQZzVyWVHE64bLZ1bNm/sY3lX5QgmzBQtyCayOMnPw0=; b=Pe2KCEuid72Nb2ilWVbtO+eL40
	+LKqbEnDDknPL5kNc1fhWZbDWHOXOzepeQPSTzDoeh63sa6m0nhjABdhLG0jSV3l5f9mD1cG6tEjX
	n/3nirx4yDnEUY/3GIAEGUucD84WaKDEyl1zqe5TapXTOiM3JZQVJBahKKRvtvE2lTbAilqsKdH+S
	85UBNG2N1BWEYrmpN+XLY0nXUyiY19q+DzrTky3jCvikxf7nKxax4l4mVH+DuvHjdVaLCUYiRcLJM
	9T2hO/2m2iSDS2pyz4aQI/l8E1xjHfdtb8i/5XoztZ7MqJw/jEbRLaW1Bp9V3yoc2wNJC4ao+uA/O
	KWaD/wKw==;
Received: from i53875b81.versanet.de ([83.135.91.129] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1siqTy-00042K-2t; Tue, 27 Aug 2024 09:19:14 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Lunn <tim@feathertop.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Elon Zhang <zhangzj@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@collabora.com
Subject:
 Re: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Date: Tue, 27 Aug 2024 09:20:15 +0200
Message-ID: <3262963.l52yBJDM9G@diego>
In-Reply-To: <612a447c-8a74-48c1-8470-280dddca8d19@roeck-us.net>
References:
 <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-10-detlev.casanova@collabora.com>
 <612a447c-8a74-48c1-8470-280dddca8d19@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Guenter,

Am Samstag, 24. August 2024, 18:44:29 CEST schrieb Guenter Roeck:
> On Fri, Aug 23, 2024 at 10:52:36AM -0400, Detlev Casanova wrote:
> > It is compatible with the other rockchip SoCs.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

For my understanding, does this Ack mean you expect the patch to go in
with the other patches?

Because in theory this patch could also be picked and go through the
watchdog tree, similar to how the saradc binding went into the
iio tree already.

Thanks
Heiko



