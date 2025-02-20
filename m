Return-Path: <linux-i2c+bounces-9512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C53A3DA73
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 13:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B986B188C80B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 12:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC4B1F584D;
	Thu, 20 Feb 2025 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jranXwu6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C86134B0;
	Thu, 20 Feb 2025 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740055891; cv=none; b=uNO9HbWwzuKgdSLuN9R15SkVHrQRRWs0e+UqyKP0LYfKrO8D+9tptR7y8TIkjifaTdgeamBOxmqd1L5hxK3RMmwxPQJOIUgA+wnTpbkoYT58VmUOexHyeKUqGtIksICRIIlA4b1shlZOXialHJRonggzn1g5yDjh5906lBKytjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740055891; c=relaxed/simple;
	bh=5ypdshPfI3nsJ88dlIy/T3H0ZdxophNkWHmQ430+TI8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWOsvp8C2kkBTjJYdFj1elT3LxJ96fdAWZkySBRUINidxHIlDzm38345qsexA2UAbHCSj754om13+umELcFOhfv4aZxls740jkptgkSISOS6vhpFQOUqfBNanexmF1FOIiRFb6GrNOSuvzmIRSeGIj6PjopgRya2GlfZic6ohMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jranXwu6; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE3BA431ED;
	Thu, 20 Feb 2025 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740055881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V12Yk4AP6w0Kz77u/6UMamy0PAJDxKPB8Crw7PN4YQw=;
	b=jranXwu6S39ULr7tv8yQXi5n3abengdJa871FcQj+dJgjWtC3dajQGOATSbkHF2zEk+/vS
	eZIFEIjX6HCRn9yISFCqVSadBjnXoNr9/uRMgrx9gKjOwZoXCpN3R73hyPWs2pSxQzEBMi
	ZS0W4JNbwMT37dnOwmc7nG012BIJhdo07Cx2gl04xto8dIgKg4edkf6FghBbmqXKUOaNg6
	4iR4s5h+7QlIP4SJDZ8LIa7pl6vP+S95Z8fDuabYpfzzksIoYGGQGwuCXNDQhMAoruckrH
	ANDErgtjbtm/IlAVu7+FSa5I+dEIzg+UKBhTkgDrlBbg1hgJEfl6rFpKasQBVQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 9/9] misc: add FPC202 dual port controller driver
Date: Thu, 20 Feb 2025 13:51:13 +0100
Message-ID: <6232449.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <Z7cbX5jX3NL4C2GR@shikoro>
References:
 <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
 <2025022038-hangnail-rehab-c145@gregkh> <Z7cbX5jX3NL4C2GR@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5091325.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehleefieekgeetkeetieetveeitefhgfejhefggfdtfffgteefieeufeeuteegjeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhomhhirdhvr
 ghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart5091325.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 20 Feb 2025 13:51:13 +0100
Message-ID: <6232449.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <Z7cbX5jX3NL4C2GR@shikoro>
MIME-Version: 1.0

Hello Wolfram,

On jeudi 20 f=C3=A9vrier 2025 13:09:03 heure normale d=E2=80=99Europe centr=
ale Wolfram Sang=20
wrote:
> > as this is a i2c_driver, why isn't it in drivers/i2c/ somewhere?  Why
> > misc?
>=20
> Because drivers/i2c is only for I2C controllers and this is not a
> controller. Other address translators also reside in their respective
> subsystem, e.g. media for GMSL (de-)serializers. I don't know this chip,
> maybe it has no "respective" subsystem and, thus, misc?

That is correct, this chip acts both as an I2C address translator and as a=
=20
GPIO controller with LED control and prefetch capabilities. It's meant to=20
aggregate control signals from multiple SFP cages (or other similar port=20
types), which have both I2C and low-speed signals.

Moreover, the chip can be configured to use an SPI master interface instead=
 of=20
an I2C one, although this isn't supported in this driver.

Considering all of this, I didn't think that either the I2C subsystem or th=
e=20
GPIO subsystem were a good fit for this component, which is why I chose the=
=20
misc subsystem.

Best Regards,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5091325.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAme3JUEACgkQ3R9U/FLj
285XmQ/+JH6sTra2DHeFaZhXztjqmfO3by20dIZfJUrns3TrzJOsd8LMRdvKo7xu
TqTrQ5E10KMNtVvu98HkF2Yhig2enCQxdlwpVEnbDA8lH+PjvV9sOA3Rz8n2fokC
uPzgzVLAA7IOe5UyMdYPU2YmDgVn+kNUJCxJVHGM/qb/H7MUI2HH8QZxj6XNa3KS
3ZWRMcc0XImISTzDpFC02Vwcfy+Q3wr+BtvWU8aT7OM5J96JBiyzvGWPYTNarSjg
CTHXmGmRpLmvqfS2576qBV6XUfmUNqDAZhOoDm6zftIOOimUAentfKzFjdJ9Nlam
ccf9WrWVbjgPsv78dX60N+9DpCsNLNeD7Vg2zHvgFRDs7l9NDztEX60vyAX1YLA7
E2dMJ2NXgIx0+Co1IHFCBa3rYZLEflLHNem1TVloSZ9JvYNV2P/nlkM+JB3zc3mX
h/jt/XYaXQvRmURW+kc+7NKYl9yVbBZQ7xt5b5ORxMITnrJjpfay3HEAxSh5oGDv
7bjs2t9ti/7/JpA6FTbmjHfHiCfhF3FRajqq4JrP1f5i2CVFl9d/fEPFe45hBB4u
vV1FUr1xOiGAFNO9IdcZKyiYtdcNAkCuzCJv19+bHth9eJL3oAA9caz67gEDtvrX
YA9mCyW7ldjs3vScFnkZHzlWenElfk+WEPa1wvwOzIA0niWYMPc=
=J7Vz
-----END PGP SIGNATURE-----

--nextPart5091325.31r3eYUQgx--




