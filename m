Return-Path: <linux-i2c+bounces-13801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAEC084CF
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Oct 2025 01:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 89F074EBA29
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 23:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A0B30DEC4;
	Fri, 24 Oct 2025 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="jUTlBQ2h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3E92F5A22;
	Fri, 24 Oct 2025 23:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761348269; cv=pass; b=tESIZXI3rYe74n1MlkmYxetEG3LosKmeN3UR1hdQDjz99Tbz9srsmGVoDx8Wt4YvF1W87bGfcvNavQPxn7Nj7P9kXzzJ6n6TRvefIAhbizE8PqujlDCJzBPDyifyWVTwv1CLlkT+FvgpXTXTWHecJR+SB7Zsfo10l0t51+fECNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761348269; c=relaxed/simple;
	bh=NQ0CrT99S0HB3iA81tiE1fKOXNruYRsIn5L3vGBZdtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8JSdoh30zTpkv6DtPR9UqjoEILC8+z0s+1Ndj9y9flFG9S6SiV2d8jrt6hAqlx98mamkkU772V9SXHMqb6FLq9Q8oF2I6f1yTOpM0T8cJsnr2EL37uclg12YjC5zQnpg1dIRbZ+1QTDUVK5x58ziodwvrPG+7DKkUIVgQ0ROQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=jUTlBQ2h; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1761348264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E7jo3eFGtMbYc4umajgAJrDaAAeoH78FvXSvtwIPzMd+KALm6TW6J/PZo3Gl8IAj7J4S4JOqDkVaqCJ4DpyxUkL/D7r/nDZxCDXQIylw9m80ZHFV7ZnmYl6fN+yD1hWHfO07oqL+vl1wjfMlpqfazjWlj918MvnuxIHK7Hk60jc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761348264; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TolhaGIsyaj1gVoV8dHb9QimZIX1Tzw1zXYiEcETqjM=; 
	b=ERHFHpBMKqE6LtNxoI7EvA9o2mCsVLRI6J1+/qPThd+k1qt+nO9OwZhbx5E81USsXE7RyOCW1GyB5isp3iLRSkJC/p6ufY9tyScGPtH6liK71Qdq4msBQsSye0JsA4aNBjxrfKHSyGI+LcIwBsP7dWSDg8vI9r+LX3h+vlO9w2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761348264;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=TolhaGIsyaj1gVoV8dHb9QimZIX1Tzw1zXYiEcETqjM=;
	b=jUTlBQ2h6Tuak+aNMb2CNTnEQ4BDpyDVgaRRROiBpKRCvZOPLn1o5LGy8JyX0l9X
	sOXFCDgYktIsDNXusx7tmsAjPkY6Gy0P2EcQplSNWKOk61O5CR3GNBKVdk6o+/41U8c
	rO3cD7tc7lCrL45EbJ0fyWmdAPtKKmAhIvpw6Ir4=
Received: by mx.zohomail.com with SMTPS id 1761348261746725.1283250784594;
	Fri, 24 Oct 2025 16:24:21 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 476FE181935; Sat, 25 Oct 2025 01:24:06 +0200 (CEST)
Date: Sat, 25 Oct 2025 01:24:06 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Georgi Djakov <djakov@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
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
Message-ID: <god73pukywwznfyym7tym6m5k6fn3u7hwzj5gwhrxytt7oinfv@pokb4aos7pp6>
References: <20251023143957.2899600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uianbie6i5kbvu2"
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/261.330.82
X-ZohoMailClient: External


--4uianbie6i5kbvu2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
MIME-Version: 1.0

Hi,

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/power/supply/mt6360_charger.yaml     | 1 -
>  .../bindings/power/supply/stericsson,ab8500-charger.yaml     | 1 -

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--4uianbie6i5kbvu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmj8CpEACgkQ2O7X88g7
+pqEIQ//WxlORWTU9xe37JxSV9323KQXYJPU3wtmtK4U8OlNGoVKu9XeR3w5pitG
uy2cIzo80EdVMKsq5GKcONqwht31w9+RJaWZmytnll9Wbe3eiW3Lu6Ymx2zopgcW
OoRuaiPPQUqGdgt7+VKgNt+4kH1sX/ur8z/Zd1rUrK9Xkks09pdqcZ/wpjm6KlQw
e7x03OaDQ5h17Cg56SgH7NwoYjoUXDuSEKoZDx4wv5DQWh171Ez0/tWvYwYxM7+a
Pxqt+zTDC1hdh6j1CaiOuwNb7pbdfcOWS7WZC8BPHNYW3eqFk5OQg+tZwEgoK9zV
GLO0FrPPimJLgL2mfnq5FP0SzYU7FNgJD6gD/qKPzjsQlFLnwn69QCH/nTA9J/ZT
ajcxgv6FLs3R3CGRptDBEUPOXez3dJeMeaN7hNeoswZNAe9uw1irXmedEzxLDO7S
8WDVz6MvUAXOdXEcI+pUvuYfGWPwuJHspOgPuOwzO2sqg212V3sScOGcATq2BTDD
mpc8LtRdKoZ3vUS9cVLRxtqLo8YB5roCBg0HEOexrwJayA074TSteqXhF2LH7LOW
IcSZ37y+8QgWjTO2aXsiLJjoK2PsOLnvKzBRD5aeLhMd4H1Lw1xCxi75ut/fJPUY
MLaS7WMtq7TVMRxBrjz8kaiR4opj84mVIXbVgoiISYooEKbbdic=
=pPcb
-----END PGP SIGNATURE-----

--4uianbie6i5kbvu2--

