Return-Path: <linux-i2c+bounces-7849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246BF9BF2E4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549D31C26888
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656A020514B;
	Wed,  6 Nov 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AD0vN2Ax"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100541DCB06;
	Wed,  6 Nov 2024 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909479; cv=none; b=Bx4j/r4t225bSN4ZUZDyXLOAETihZcR5XQlnlho6Vvo4zq6w/Dfim+/NBrQSHIV3c4wmEsGCNfA3A9y5dzkGgWutVC3RIdnpq39eiao9CncKC0UKrpvaNPGENJLADX0HMlE+3F01YPea0Llc0CqbvcvCD2Un6WVdiwXHaADbpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909479; c=relaxed/simple;
	bh=lrW6G399lKEE6qkPjnizcH8n56jco4h5CV98L1cNNJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAAdDMBVjWpQ/bzCXVQwdyo1zPHtUZdVzwaddmzoK+G9Mb8kh6Qfxfii9t325DqHGj1VmlH707ZKd04ZKmky0w77VKFnm0XeutkVXMvIG/hlK5TXIaxJhP/hUn4zq9bZH7BgtfuCxr9/6qozQjS+FAGoPnGzOh/G2zeAjacJWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AD0vN2Ax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F88FC4CED3;
	Wed,  6 Nov 2024 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730909478;
	bh=lrW6G399lKEE6qkPjnizcH8n56jco4h5CV98L1cNNJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AD0vN2AxsSiuXxl1rQqV7mtU7AQvhx87xmF9YTQom6n8+XGUo6+Ougk2y3YyMe4YE
	 6ZrVhwneDhasgqnF9GWk8TtPMdgJs80Swfric0Zo5H2VhuZ3CTwXz3zUQ2OQ1eULxj
	 HJ+PxQ902+ZHnnoxZntuze31pVWu+hXvqcg3FfAShihFnHZb9FviAW9ko55bUTRddB
	 ZGAszqjDaxzX7ubw9GvqWDpqo4cbJVP71A3wgCaJuS9UDlWATRrse1NRwappIXbV4P
	 3VRto62VCBANQugVJBvG8jlJbMpPdhCEWwSutqo95ielZaxM3XbQpvWaU8rIshGJCe
	 3SMWT4qOXm/HA==
Date: Wed, 6 Nov 2024 16:11:13 +0000
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
Message-ID: <20241106-overcast-yummy-9c6462ff2640@spud>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vxOwxuXWfb7J41+N"
Content-Disposition: inline
In-Reply-To: <20241106-gatherer-glancing-495dbf9d86c7@spud>


--vxOwxuXWfb7J41+N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 04:06:02PM +0000, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
> > On 11/5/24 19:09, Cedric Encarnacion wrote:
> > > Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC =CE=BC=
Module
> > > regulator.
>=20
> A single compatible for 3 devices is highly suspect. What is
> different between these devices?

Additionally, looking at one of the datasheets, this has several inputs
that could be controlled by a GPIO, a clock input and several supply
inputs. It also has a regulator output. I don't think it is suitable for
trivial-devices.yaml.

>=20
> > >=20
> > > Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.c=
om>
> > > ---
> > >   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > >   MAINTAINERS                                            | 5 +++++
> > >   2 files changed, 7 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b=
/Documentation/devicetree/bindings/trivial-devices.yaml
> > > index 90a7c0a3dc48..72877d00b8dd 100644
> > > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > @@ -43,6 +43,8 @@ properties:
> > >             - adi,adp5589
> > >               # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase=
 Step-Down Silent Switcher
> > >             - adi,lt7182s
> > > +            # Analog Devices LTP8800-1A/-2/-4A 150A/135A/200A, 54V D=
C/DC =CE=BCModule regulator
> > > +          - adi,ltp8800
> > >               # AMS iAQ-Core VOC Sensor
> > >             - ams,iaq-core
> > >               # Temperature monitoring of Astera Labs PT5161L PCIe re=
timer
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 7c357800519a..6ca691500fb7 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -13555,6 +13555,11 @@ S:	Maintained
> > >   F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
> > >   F:	drivers/iio/light/ltr390.c
> > > +LTP8800 HARDWARE MONITOR DRIVER
> > > +M:	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> > > +L:	linux-hwmon@vger.kernel.org
> > > +S:	Supported
> > > +
> >=20
> > This entry doesn't make sense in this patch.
> >=20
> > Guenter
> >=20
> > >   LYNX 28G SERDES PHY DRIVER
> > >   M:	Ioana Ciornei <ioana.ciornei@nxp.com>
> > >   L:	netdev@vger.kernel.org
> >=20



--vxOwxuXWfb7J41+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyuVIQAKCRB4tDGHoIJi
0rt2AQClNxQCxjo7eYAHVcO3tbMUnpyV+yrTO8deS82L21I/6QD/QH1QvKOFhnnf
8kFhpQaZ0TbytBCjKLR9UY9GpUEw0A4=
=ceo7
-----END PGP SIGNATURE-----

--vxOwxuXWfb7J41+N--

