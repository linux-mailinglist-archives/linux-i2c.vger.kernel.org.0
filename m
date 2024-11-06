Return-Path: <linux-i2c+bounces-7857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26E9BF570
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 19:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21EE1C20D5F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 18:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C0420822A;
	Wed,  6 Nov 2024 18:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnS+8Frn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296036D;
	Wed,  6 Nov 2024 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918312; cv=none; b=c0BP2I/fOK6lgFzrlwrh4MdapIlFglz41+pAU9e3NJQ/MHpWYIFgX/AwLPrN4j3u/5qxpb4EwIp56qdCZvIu9vYTje/Cy/8tEvAxwvsn2KEWk9Li1HNaF1Co8LEYyAPT38D/7+YaeZDz6ErLvO8ClYQtzC3Yr3tusc9leDMcNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918312; c=relaxed/simple;
	bh=iNjqtw0pAHcA/82Lxnh30HXCvnZDgw7kxbizRZooTmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRiniclJTZwikmjCRPZ+7WJ4rPz4sPsVsL8Yjkc7YViI9aMwsYxXd3iP93CD1vhQtoGD7PnQBKsG4rMGg8CoTFotCBwbWSSkS0j/lbhO+p7sZoKkw0ftfHaW+XnE1/3vSDewi7jHuVmrkhEX8I6o4jaG9rAiCbdkio4fT1rErUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnS+8Frn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C74AC4CEC6;
	Wed,  6 Nov 2024 18:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730918311;
	bh=iNjqtw0pAHcA/82Lxnh30HXCvnZDgw7kxbizRZooTmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnS+8FrnLWJJ2opUVyPBBsjgQtapmYvo9CXHJrwQ6ClBmATA8NBU1+1meIPVuGifP
	 o4MI6il9v70W8I3UZ7KUdt0PH2dsdxBP812ErrwkfJguLe/CqM4v14cJRjz23O7IbQ
	 70Ym6E4EEZgge+o6UojP119niZLSEUgWlV8pPNBntqUfPyIhWGLsHelfsNPEC29jUM
	 4z/susoC+LWH3mrY/pj7QnDwbMneRmn6xl8GeVyleFh3MkobWUm7BoN1pxWWZbCUDZ
	 rY1BOCoJfGP6s1XArQW5mOPhObua4Vo+9W9bNFkbd4Mf66gGAoos2naNDmeonuj2bC
	 fIrgfooryVZnw==
Date: Wed, 6 Nov 2024 18:38:26 +0000
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
Message-ID: <20241106-crate-antihero-bc7b66037640@spud>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
 <20241106-overcast-yummy-9c6462ff2640@spud>
 <2b731ba8-1b6b-41eb-bae9-3403555506ef@roeck-us.net>
 <20241106-splurge-slaw-b4f1d33e4b09@spud>
 <f6e9cc1a-bdd7-4231-844e-2d8c5c3be50f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DCvkbFZV2LWmvyWJ"
Content-Disposition: inline
In-Reply-To: <f6e9cc1a-bdd7-4231-844e-2d8c5c3be50f@roeck-us.net>


--DCvkbFZV2LWmvyWJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:19:19AM -0800, Guenter Roeck wrote:
> On 11/6/24 08:54, Conor Dooley wrote:
> > On Wed, Nov 06, 2024 at 08:43:54AM -0800, Guenter Roeck wrote:
> > > On 11/6/24 08:11, Conor Dooley wrote:
> > > > On Wed, Nov 06, 2024 at 04:06:02PM +0000, Conor Dooley wrote:
> > > > > On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
> > > > > > On 11/5/24 19:09, Cedric Encarnacion wrote:
> > > > > > > Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/D=
C =CE=BCModule
> > > > > > > regulator.
> > > > >=20
> > > > > A single compatible for 3 devices is highly suspect. What is
> > > > > different between these devices?
> > > >=20
> > > > Additionally, looking at one of the datasheets, this has several in=
puts
> > > > that could be controlled by a GPIO, a clock input and several supply
> > > > inputs. It also has a regulator output. I don't think it is suitabl=
e for
> > > > trivial-devices.yaml.
> > > >=20
> > >=20
> > > All PMBus devices are by definition regulators with input and output =
voltages.
> > > After all, PMBus stands for "Power Management Bus". Some of them are =
listed
> > > in trivial devices, some are not. Is that a general guidance, or in o=
ther
> > > words should I (we) automatically reject patches adding PMBus devices
> > > to the trivial devices file ?
> >=20
> > Personally I like what Jonathan does for iio devices, where he requires
> > input supplies to be documented, which in turns means they can't go into
> > trivial-devices.yaml. I wanted to add an input supply option to
> > trivial-devices.yaml but ?Rob? was not a fan.
>=20
> I may be missing something, but doesn't every chip have an input supply ?
> granted, PMBus chips often have more than one, but still ...

Yeah, that's why I wanted to permit a supply in trivial-devices, because
I bet 99% of devices in there have a supply. IIRC the problem was that
there wasn't a good "generic" name for one. I don't think it was a "you
cannot do this" but a "you need to come up with a name for that supply
that works generically" and I couldn't.

> > In this case it would need a dedicated binding to document the regulator
> > child node and permit things like regulator-always-on or for any
> > consumers of the regulator to exist. I suppose that probably applies to
> > all pmbus bindings?
>=20
> Yes. There may be a few exceptions, for example if a fan controller is
> modeled as PMBus device, but that is rare. From a driver perspective,
> exposing regulator nodes is optional, though.
>=20
> > In this case, there seems to be an input "sync" clock that may need to
> > be enabled, which is another nail in the coffin for
> > trivial-devices.yaml.
>=20
> I really don't know if it is a good idea to expose such data. That clock =
can
> be connected to ground. It is only necessary in power-sharing configurati=
ons,
> and requires all chips to use the same clock. I'd assume it to be a fixed=
 clock
> in pretty much all circumstances. The frequency needs to be configured in=
to
> the chip, but that needs to be done during board manufacturing because it
> determines the switching frequency. Writing wrong data into the chip may
> render the board unusable or even destroy it (I destroyed several PMBus c=
hips
> myself while playing with such parameters on evaluation boards). Maybe th=
ere
> is some use case where changing the configuration is necessary, but I am =
not
> in favor of exposing it due to the risk involved.

I figured it'd be fixed, but that doesn't mean it can't have an enable
(or a supply of its own).

--DCvkbFZV2LWmvyWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyu3ogAKCRB4tDGHoIJi
0j9JAPwMo0NQpNZfb0w4MKjX7rzR+jv1SbpMrhZEp2DPOHDTLgD+IfE6snEzPq1g
zaCZZawKX21yxcT1emw1Rqy1Ab+oQg0=
=qdES
-----END PGP SIGNATURE-----

--DCvkbFZV2LWmvyWJ--

