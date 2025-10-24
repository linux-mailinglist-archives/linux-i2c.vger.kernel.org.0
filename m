Return-Path: <linux-i2c+bounces-13780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D315C0595E
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 12:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A13E74FBBE7
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 10:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8323A3101B8;
	Fri, 24 Oct 2025 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/d2Y+U8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A72C08C5;
	Fri, 24 Oct 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761301843; cv=none; b=WqszXQ8Y1GDhUpTUg/4Blg8h60kIOww2lHd7bdc1E5ECjLi8LEM9hShjyATOBDbKwo7ObuBo6lNVlH1Pn3aHzwn3zx3999FjBRwTzxlOKoFCew6LNvvc7Y5CQrPHfPO6S83gYCcNTy9zDD3g3bN1XJDkiBR0yyOz3t4GtdNYIOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761301843; c=relaxed/simple;
	bh=xjBMkmI+qsDoGp9ZiRzBUp/jILZSgk47twlvE8podR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3tLwzIjbKeEYPSi2uB1jC8xElcJElsFUQBW+bL3lag82L5dWdGogO0j2ND7PJNmpxax1BRahWTKnVW+FwatlmBO0j0TZaCR8rUzoFUPWoMS+UDuM5Akun5De4LI/orJEy7f4PX/+EC41MlB1w3ZYxwADrK6fwIjDdmBSK+BABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/d2Y+U8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E75CC4CEF1;
	Fri, 24 Oct 2025 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761301842;
	bh=xjBMkmI+qsDoGp9ZiRzBUp/jILZSgk47twlvE8podR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/d2Y+U8bQs8VF+XsPwC/lo+bxBE0j4eWS6VDHNCD/dOyGEFM7pOVi7s1xB8wyT1F
	 jv0kcNfIyneAU7DFc2XMuu8oHJ2C93dqlydWRrXYT3RCBqDbolkiQ18EsFfqCwzdIT
	 F0FJ+u2jbBRNARJVywQ0ZMr1PM6LZQ50TTD9W4llmkHp0cxkQM8R7YTAZNZuhKj472
	 K02nhKLn9f/Q1d19EUPlbhQT59235yFCKn8XDWmWaJOjbnUv34C0E0GbdT7yY2B8c1
	 q4jVSAnw+7Qfl9JCs14YGXOOwUUitTY/lsolUgoznKOAtNMsr23PjYx6i1nIOnN4f/
	 YsZZGbsmS20jw==
Date: Fri, 24 Oct 2025 12:30:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <fncqrwr6pi3ttxkf44hncy35ogxqdvql52hdcycq4yakbkeose@gv6lxr6a4uri>
References: <20251023143957.2899600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>

Hi Rob,

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

