Return-Path: <linux-i2c+bounces-13762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D8C02686
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 18:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D8D15020FB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 16:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D458529A309;
	Thu, 23 Oct 2025 16:19:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A163299943
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761236359; cv=none; b=Gy0vue4Pd9PPuNMix69YsJ9vO/dMdqWYHdCGDRexNYYtmFxv55ksZuvSXG1xj8cObBvgtNRkTmGLMpj6+gdKK8Eu0eneu9tzsCJXV3uxQG2cqJCnW1Ds6W/jL6Cn9TBiNsFrTddVD0al76fHmt0Ka13XBf04wmeFDUbq/9Gctdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761236359; c=relaxed/simple;
	bh=J9fgQRAtf/jgUHeHMg6pXGR492Zh7Odx8vgo1NDj8Sw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SLFlPQqXoWaLyNilqooWOSGwDZcj2WYsI9aKfkGUp2wKhwPVW32GiMifhwYQW/fxpVwu5mGYOckp0J0KgO0bpWzoYy6Cs2kXkb4+hCTl+2zvjFZe8Z2jjxpDmarlm3P4lfqSL1JaKU0UELrngr6BJUm3YPV98uFw2iam30KHj6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBy0f-0003DE-8X; Thu, 23 Oct 2025 18:17:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBy0Z-0055JC-1Z;
	Thu, 23 Oct 2025 18:17:47 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBy0Z-00000000E1b-1FyP;
	Thu, 23 Oct 2025 18:17:47 +0200
Message-ID: <660b87b77ac97a186796ce4783acd510741f7c54.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd	
 <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,  Vinod Koul
 <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>, Xu Yilun
 <yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck
 <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>,  Jonathan Cameron
	 <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Georgi
 Djakov	 <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joerg
 Roedel	 <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>, Mauro
 Carvalho Chehab	 <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Miquel
 Raynal	 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>,  Johannes Berg <johannes@sipsolutions.net>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,  Manivannan
 Sadhasivam	 <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Kishon
 Vijay Abraham I	 <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <ukleinek@kernel.org>, Mark Brown
 <broonie@kernel.org>, Mathieu Poirier	 <mathieu.poirier@linaro.org>, Olivia
 Mackall <olivia@selenic.com>, Herbert Xu	 <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, 	iommu@lists.linux.dev,
 linux-media@vger.kernel.org, 	linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, 	linux-wireless@vger.kernel.org,
 linux-pci@vger.kernel.org, 	linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, 	linux-remoteproc@vger.kernel.org,
 linux-crypto@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org
Date: Thu, 23 Oct 2025 18:17:47 +0200
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
References: <20251023143957.2899600-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Do, 2025-10-23 at 09:37 -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
[...]
>  Documentation/devicetree/bindings/reset/ti,sci-reset.yaml    | 1 -

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

