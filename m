Return-Path: <linux-i2c+bounces-8211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D49139D8C70
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 19:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2897B2B6C0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 18:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29D11B9831;
	Mon, 25 Nov 2024 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjye1Ri1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9E1B85CA;
	Mon, 25 Nov 2024 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560516; cv=none; b=FJgl8YTUPiXzeQ4h+DiEIt1FteN0HqtVAwxTU8XvdM1Vrl4bZX3PteueLdad/CkCNIMsb9xr4ZlWiSFKk2SsVL5gIiIX6X2GRRlHTQNZw9E2vkvbmUWvBt1hyR7Wq2fUE6B+DlDbJpsLCiauj8DwrNWJLzgT8/6NKPBk5kirUV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560516; c=relaxed/simple;
	bh=iIoOus4blNmLJvI367kCSBxRvmQLM+vJ+uL517h3aaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bascef8rtvh3JSnvUkMdpTy5FmvW1lVF+BV5hrqKShT5cP/QqjjrppVF1FrahDlvq3ZdorbyLgqgpuXS/IsUfA+cWiCPRfsc+voXvlzK62B88VTTC3A6AAvpfrioDZH+TbSBHi6VKEqc+31+DbwHDaTzz6aP2UG46wUqK/3acCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjye1Ri1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18686C4CECE;
	Mon, 25 Nov 2024 18:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732560516;
	bh=iIoOus4blNmLJvI367kCSBxRvmQLM+vJ+uL517h3aaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjye1Ri15GPM/2NjsSO7bpfi3t1tkh6/0ikAD89I8KHnorIec93jo3Ul//+0Dn6xG
	 Dz2/a4+IaJGu0TUP1GHj4YfWxjd+uhqyUmo5rZGa53My4VtPyIdLoePH2grM/Gxx2h
	 QPIH77cJ6ShYAXPaSzgmghCnCQ/vBT0t64wadjbbhXWar4NZVyVhisfCsDnYPw4rNT
	 J21D28kIztoBwmsvlNkA6UkamD7ZIzyPDrtu+lAr1vXKfr+HJQY0PlJscYZxTpGIYE
	 4AGJOZFQyjw1rtjvxNoiojHFy8ZOu5JRt2AJy1I5NHBAjMhZlpy6rkI6Dl5zSOkKl6
	 JaVHtFb8nwXWA==
Date: Mon, 25 Nov 2024 18:48:30 +0000
From: Conor Dooley <conor@kernel.org>
To: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings
 for adp1051, adp1055 and ltp8800
Message-ID: <20241125-clever-unpeeled-61362034cf24@spud>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
 <e2e10b1e-cce3-409c-9327-178cbf4b0d64@roeck-us.net>
 <20241123-paced-osmosis-007bf72c4b02@spud>
 <20241123-submersed-overdue-ce999ccccc72@spud>
 <PH0PR03MB69389916EC3C46C3A1F228AE8E2E2@PH0PR03MB6938.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a4xeAmARkWBmeFmd"
Content-Disposition: inline
In-Reply-To: <PH0PR03MB69389916EC3C46C3A1F228AE8E2E2@PH0PR03MB6938.namprd03.prod.outlook.com>


--a4xeAmARkWBmeFmd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 02:44:32AM +0000, Encarnacion, Cedric justine wrote:
> > On Sat, Nov 23, 2024 at 07:56:21PM +0000, Conor Dooley wrote:
> > > On Wed, Nov 20, 2024 at 10:00:19AM -0800, Guenter Roeck wrote:
> > > > On 11/20/24 09:11, Conor Dooley wrote:
> > > > > On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrot=
e:
> > > > > > add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
> > > > > >      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
> > > > > >      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temper=
ature
> > > > > >      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC =B5Module Regulator
> > > > > >
> > > > > > Co-developed-by: Alexis Czezar Torreno
> > <alexisczezar.torreno@analog.com>
> > > > > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@anal=
og.com>
> > > > > > Signed-off-by: Cedric Encarnacion
> > <cedricjustine.encarnacion@analog.com>
> > > > >
> > > > > Why did you drop my ack?
> > > > > https://lore.kernel.org/all/20241106-linoleum-kebab-
> > decf14f54f76@spud/
> > > > >
> > > >
> > > > There:
> > > >
> > > > > +    enum:
> > > > > +      - adi,adp1050
> > > > > +      - adi,adp1051
> > > > > +      - adi,adp1055
> > > > >
> > > >
> > > > Here:
> > > >
> > > > >> +    enum:
> > > > >> +      - adi,adp1050
> > > > >> +      - adi,adp1051
> > > > >> +      - adi,adp1055
> > > > >> +      - adi,ltp8800   <--
> > > >
> > > > This is a combination of two patch series. I'd personally hesitant =
to carry
> > > > Acks along in such situations.
> > >
> > > Ah, I didn't notice that. Thanks for pointing it out. Cedric, in the
> > > future please mention things like this if you drop an ack.
> >=20
> > Whoops, forgot to mention that Cedric can grab the ack from the link
> > above when they resubmit.
>=20
> Okay. I will be carrying on acks in the future for cases like this.

I mean, I don't disagree with Guenter that in this case he would
hesitate to carry the ack as I probably would drop it too.
The difference compared to what happened here is that I would mention
/why/ I dropped it.
If you're going to carry it while merging two series and resetting the
patch number, it's good to reference where you got the ack from to
avoid confusing people, particularly given the patch was modified
compared to what got acked.

--a4xeAmARkWBmeFmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0TGfgAKCRB4tDGHoIJi
0jzGAQCnTzuHvmQrqBEoH6S7P+Si69DXAWR9mQvLGRyvDxIObQD/ad/f6nCtiHM4
9BCEFdcooDYlT2W/I8QN8v4X8BS+JQ4=
=41g9
-----END PGP SIGNATURE-----

--a4xeAmARkWBmeFmd--

