Return-Path: <linux-i2c+bounces-3483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC8B8C42F0
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 16:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70F761C2123A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 14:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4627153832;
	Mon, 13 May 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XJO9XN5Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D6153580
	for <linux-i2c@vger.kernel.org>; Mon, 13 May 2024 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715609646; cv=none; b=IOFl6EN/ZuQ3uMlJ7It2DY2m7BHaMUlVaL1l9uqJPG3YmomcYrs9J6m/BGBpb+//WWYj8O35XkXjV4gsoELSv9CAXjzhFAhtK1hs35kmffQ0fYGcqK7yGx7YsNrR1YCpNyE60fW6V0yIviEEMnyM0UhYMCScx5dUefiEd5n9slU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715609646; c=relaxed/simple;
	bh=jlJal8SYd2i17p2UBb9eq6fm30hJKgO/pZI9iWerNak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvoyhs9a4wHMzcSZIOxX3Sswwu2iqlpZ4PPcPp7H/NAWTcjcGyKXrjc8BBNe/8W2A6zdnNv2uIokCkSJKrKUXMzY7MEypBydIvqjjRlosxtiWKD6xlTE3HCqbsaPo5yq+VctzCAT4/QS77SkSmlF1lzeN8YPuSQ3lYFRqtgpSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XJO9XN5Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jlJa
	l8SYd2i17p2UBb9eq6fm30hJKgO/pZI9iWerNak=; b=XJO9XN5Q7CPiPUGC4vat
	Lb8eZwOYw9kdc26MrFtTkkddag0HFeyIJ7qNTNsuz0+tt45Nd6puxrxtmLarm8xl
	wlen9O8o8gtZQdvfnptxz0ngAZrpR+w2RVk//4X4HORXsj/+81kap2ns++XrNg0D
	GyvZTHhI4kotws5rPjEXXn7qVSYh5loHD+pKWSifW2snnrD25lprGF6kF1Rz98ec
	2Izw5FblLRz4e3w2RTlJFHiTHrrMeWYcG1E2OMmjNw1yGN9H1cCbYGq2BJegSQim
	XmCFhMdKCVJEPNJ25Jaz0Kxs7rElzBYeNXysARUWQHT4LPGo2ucWb3+7XyjKoufW
	cQ==
Received: (qmail 2174713 invoked from network); 13 May 2024 16:14:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 May 2024 16:14:01 +0200
X-UD-Smtp-Session: l3s3148p1@ino7f1YYqLZehhtP
Date: Mon, 13 May 2024 16:14:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	"open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	linux-media@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: Remove class argument from
 i2c_mux_add_adapter()
Message-ID: <20240513141400.xgpy3euacuxj5i4b@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	"open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	linux-media@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6wk7u7gqu25scqer"
Content-Disposition: inline
In-Reply-To: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>


--6wk7u7gqu25scqer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 10:55:39PM +0200, Heiner Kallweit wrote:
> 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
> instantiation") removed the last call to i2c_mux_add_adapter() with a
> non-null class argument. Therefore the class argument can be removed.
>=20
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next (meaning for 6.10), thanks!


--6wk7u7gqu25scqer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZCICgACgkQFA3kzBSg
Kbbe8w//cwbm6f8+HGi4nQvOvL3JrgaLg4ZnhG9F8mVOVa0qOigbq9Xm63XB+Bwb
eWOWzDsFfN5Pew2UN93LWZJ3hkdZE8swa5XePLn8N70E0nXGM6LtDdeWLp0Bcov6
fhIHD7GumaCgsmE2Cb3Scl9W0RoGkd2SKhcglPZirYVHhzq+uxoESEf4+Xu4DuTS
yUJymE20haysSkWQ0IU52CCl6O/ydL4TO8lhVFH2PtpMtsLfM4ABUHbFuYV9eObI
I3kO4WDHRpw9YpBolhVL8gqolwYPvviv+ry9v7XuGmlZWCOty+gngCA42pvE5+Ns
aenK/c5Q/eQ99qjZgbZr0Zg+NbsCyHW4/Ye+3AlkcwoGYXweaxEwssvpeODwoGLC
Txjs1XzzE+c7OPPmjlLcLh0Hq9jKlqRzbFyF5834yLVb/Rqkx8eohrFDP5TSLlE2
Lw1NoLgqYyXjX+OpU2ZWIl/rxM4EB1RAOgW2yaV5x+B+dAQwuKY7ilapSNNQQOGl
bHKpuF462TB2eyrixx2Ns+IBT7CaCLYmxzV/QAW9VW9VPWSpjM5x8SiOSs/cE4zf
w7FskHexCXqEMau+UCXP0htz+haZ2cZSdIVOYphXgNNzhRb/i0EQu9HMiDBBRZns
gh4yy9eGV31++lc+iD8wFODnmjkbw+vDEvv980jTG7G2W7xqC+c=
=dQwU
-----END PGP SIGNATURE-----

--6wk7u7gqu25scqer--

