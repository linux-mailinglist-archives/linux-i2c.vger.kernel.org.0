Return-Path: <linux-i2c+bounces-7848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284369BF2BF
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D2B283B01
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4757F2064EB;
	Wed,  6 Nov 2024 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMSU+/Qb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7442204F7F;
	Wed,  6 Nov 2024 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909169; cv=none; b=kmfDvNZl//oSECZXdIHa2QryWq02nJranMc0kPflKD82dLvz34/W1+VfmoIVYp6IuumHZXak4zRuVfnnjiTZbQBiExwFm7eJAkLt88F4tGKuHnzQz+m57Lk1hhEWzAvFcS67Y5pXAuvqdV45OSfPPIt1HT11UFfFW8/xSkYzs4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909169; c=relaxed/simple;
	bh=owI1dOfUO3f36nslRIYvy0cGotXXjlEaH4q214cOC1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itgE/Dmi+TdxJOOH+/rPmwNymQGF9I8SaCls3ODL+MX7je7O1cwH/ol1cqEmTXqezyHH7LOILUMAw7WY/nUnK+ExFEeV5Erayx3fR09BoSZTvohja8i0zpsUXnqNyo/PC9iyaGUqi3FtPpD9hS9h9sy+7b6NtmOmEMKHcN2Dbpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMSU+/Qb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D04BC4CEC6;
	Wed,  6 Nov 2024 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730909168;
	bh=owI1dOfUO3f36nslRIYvy0cGotXXjlEaH4q214cOC1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMSU+/QbU/pj0W2yPaEzZ3tlG2Nxxjl29ftjebUJg//CpoYZie8Olae8TK9Qszn8Z
	 cBFQdSSVI2F9HBW69bVCf3gulyFw1/JnI4PGJiFAraRg/NwE3UuPqbVyTZFqnsHTV7
	 hUhA5U8s3eAmPNvXiqbQc0GsYH4drW2XdH3efH83RccdkJ86g56FKloRxm/2tVKZZK
	 sILpHcZZDuu+gi+ySE2Zg2e0kFdapC3Uw+CJLNAx23AtbAcUsyy+sgttGhWZqLgQZn
	 rNuERN65MXOGQsNcadg2XoBvnd9wHHDRmPrNWNvQ2+Yv0rdTOyoOJj3rXy2Y8ho4iv
	 UdR7+rlq0tk5Q==
Date: Wed, 6 Nov 2024 16:06:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
Message-ID: <20241106-gatherer-glancing-495dbf9d86c7@spud>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g7f03nsiTMvmTYyW"
Content-Disposition: inline
In-Reply-To: <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>


--g7f03nsiTMvmTYyW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
> On 11/5/24 19:09, Cedric Encarnacion wrote:
> > Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC =CE=BCMo=
dule
> > regulator.

A single compatible for 3 devices is highly suspect. What is
different between these devices?

> >=20
> > Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> > ---
> >   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >   MAINTAINERS                                            | 5 +++++
> >   2 files changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/D=
ocumentation/devicetree/bindings/trivial-devices.yaml
> > index 90a7c0a3dc48..72877d00b8dd 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -43,6 +43,8 @@ properties:
> >             - adi,adp5589
> >               # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase S=
tep-Down Silent Switcher
> >             - adi,lt7182s
> > +            # Analog Devices LTP8800-1A/-2/-4A 150A/135A/200A, 54V DC/=
DC =CE=BCModule regulator
> > +          - adi,ltp8800
> >               # AMS iAQ-Core VOC Sensor
> >             - ams,iaq-core
> >               # Temperature monitoring of Astera Labs PT5161L PCIe reti=
mer
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7c357800519a..6ca691500fb7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13555,6 +13555,11 @@ S:	Maintained
> >   F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
> >   F:	drivers/iio/light/ltr390.c
> > +LTP8800 HARDWARE MONITOR DRIVER
> > +M:	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> > +L:	linux-hwmon@vger.kernel.org
> > +S:	Supported
> > +
>=20
> This entry doesn't make sense in this patch.
>=20
> Guenter
>=20
> >   LYNX 28G SERDES PHY DRIVER
> >   M:	Ioana Ciornei <ioana.ciornei@nxp.com>
> >   L:	netdev@vger.kernel.org
>=20

--g7f03nsiTMvmTYyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyuT6gAKCRB4tDGHoIJi
0rjyAPwNU65BJtJsjvnjwbUO2RxFVge6HDRF720CkCn1W8byoAD/eVZZvsDtPJ5J
eTiT6GnZMxq9T+7hd7gwM/r8/aBDfQM=
=xBOT
-----END PGP SIGNATURE-----

--g7f03nsiTMvmTYyW--

