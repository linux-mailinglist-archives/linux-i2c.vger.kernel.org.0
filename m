Return-Path: <linux-i2c+bounces-8740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F049FD207
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 09:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5A8A16239E
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 08:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CAE1547C5;
	Fri, 27 Dec 2024 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tetoHWau"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135522BAF7;
	Fri, 27 Dec 2024 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288341; cv=none; b=KBkafI4HrsUoZbH6VrXgPAMSpJfzhVZe6IKHQJWaTe4iXHB8kh1qnyWmq1UJrZV/yg3k2TiYCIfr3Nd9sBJXNlNudy7jaT/G3hXF56jP/B7Xp2dZ1wv8CJcT1a4S31oUm464t462BrpGx9I7LCzws7c8OwvvqkF9SbHL5cVidBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288341; c=relaxed/simple;
	bh=SomxrRy3DEcymeIZFaLbSytrxsSP9+O9g1S7IZ1EnHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxCg6KAyZUrRePerDz819Pq/hlas+EreOqD7Kmz3hfDhj4LiUmWKWhEOUyha6x1Gm9sYplndAllm2IZWVRp6aXNi2gDvkyKG36CUsm2P0lVvv3ZuxPtMvqOjemhnfV6XTZQrGahS6EIK9KMzJSrdrW/L2CbFgQ/yZbkRqa5hAyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tetoHWau; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54858C4CED0;
	Fri, 27 Dec 2024 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288340;
	bh=SomxrRy3DEcymeIZFaLbSytrxsSP9+O9g1S7IZ1EnHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tetoHWau0+A61rbzcsUZqGjxnX8y6868nvvOWrH6GOLTDVC7r8kdrT9uX+0+Lk6bK
	 yyDSjFt6ZTnySdTg+2o7RE9kSTvjOijq/3nj0ljJo6QdZXgJroOIEml83oDYZY297I
	 8MHUFkxNBnq+1Am6PZJhBzQC1AijfDXGQjvxLCRWU398ZrLbmUoItQ69YAm82y1wbD
	 9+gbJ+kVXA3chDVGmCK50zaxZ+Yh/tEet8AzsJISJpnoWyn2wul+FicsEs7lwO+6gZ
	 7JWNBSDyQhKkSdspOMQ7pMAMQ5GV57PkFN1ICY7l37/a85AlH1wDzcBy/l3UcT+7Y8
	 vytiYH3WBFfFw==
Date: Fri, 27 Dec 2024 09:32:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Simon Xue <xxm@rock-chips.com>, Guenter Roeck <linux@roeck-us.net>, 
	Mark Brown <broonie@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
	Johan Jonker <jbx6244@gmail.com>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, 
	Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>, 
	Conor Dooley <conor+dt@kernel.org>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Maxime Ripard <mripard@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andyshrk@163.com>, linux-serial@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, 
	Diederik de Haas <didi.debian@cknow.org>, linux-watchdog@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Lee Jones <lee@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Shresth Prasad <shresthprasad7@gmail.com>, 
	Tim Lunn <tim@feathertop.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-arm-kernel@lists.infradead.org, 
	Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Dragan Simic <dsimic@manjaro.org>, Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v2 00/17] rockchip: Add rk3562 support
Message-ID: <z52ppg6iolgd6qqxusqm2a2eor552bfpknyxjgf7ttyy4ifxbs@q4jf4wblnh3q>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>

On Tue, Dec 24, 2024 at 05:49:03PM +0800, Kever Yang wrote:
> 
> This patch set adds rk3562 SoC and its evb support.
> 
> Split out patches belong to different subsystem.
> 
> Test with GMAC, USB, PCIe, EMMC, SD Card.
> 
> This patch set is base on the patche set for rk3576 evb1 support.
>

I am going through patchwork and marking all your patches as changes
requested. All my comments apply to each of your patches and each of
your patchsets.

Best regards,
Krzysztof


