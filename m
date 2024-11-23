Return-Path: <linux-i2c+bounces-8164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7F59D6B54
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 20:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EDAEB21818
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 19:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2A4199FD3;
	Sat, 23 Nov 2024 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilKS++w+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1517C2;
	Sat, 23 Nov 2024 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732391905; cv=none; b=E6gRAykauqj+73gX16jKqkO6DQuu9a26UPF3g4KMgaY/fd+NM/jKZUBz5zVDjonbYHc4xYt0iQWIjzA/dPDK2tSlbfEx4gZaZBQPMPHDvmItKJcbxd8wnKc/AdCGjRAx2wPV95IDcGPDQRPzi/1bx6rUhoGM91EYLk7VR7d3occ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732391905; c=relaxed/simple;
	bh=vMkebytx12SjP1pPFTV6oHvufPe3F5TUwettNiWQo5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgHevi9QDdo28H/BS5SDalxTYAOKJIN5pBjYHuEsBBxyIb229MB7/XjNJZX1Qzy15/ndP8qQ1ODQjPchpJh73euiRbvKgimB8qQa9R8yWmJ0Cwmk0boakCndiXX6eZD2KHWDZ+vWHn7u/kq45c0vQ1Yx/mJAgXHhwsm8sxGb0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilKS++w+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06349C4CECD;
	Sat, 23 Nov 2024 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732391905;
	bh=vMkebytx12SjP1pPFTV6oHvufPe3F5TUwettNiWQo5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilKS++w+2gW7/KKDRKUHuo260pW68nX7FEgX17GXeVmzYUxlYckfmJZwWq1TFA8xQ
	 ez7wHAgVzNSYHu+WX6kzCkntEA8SlRpW5YDP/xILV6BPM2sGRm/rj9ZqWjrah+HEFs
	 EKG4Z2hTeZuxrs+zEei1cC688F8/IGGnqMsCVdFlcGOULsmVzD1eoQy4N/mFRRZo6D
	 fPfcn7l5tkiMg2dfHBigcjcYpGQCEd4lOy2ZuLfL7zwwHgI38lQP7NTzEShHtFvpbm
	 xxFGushiLdwB3bKfalkNmX0Ok1Zyqd459q3afOND3zHuaBRImrWUO3QYM4fe3WFbDK
	 cNNQbhgt70naw==
Date: Sat, 23 Nov 2024 19:58:19 +0000
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
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings
 for adp1051, adp1055 and ltp8800
Message-ID: <20241123-submersed-overdue-ce999ccccc72@spud>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
 <e2e10b1e-cce3-409c-9327-178cbf4b0d64@roeck-us.net>
 <20241123-paced-osmosis-007bf72c4b02@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cmb0uSDOa4m77wH7"
Content-Disposition: inline
In-Reply-To: <20241123-paced-osmosis-007bf72c4b02@spud>


--cmb0uSDOa4m77wH7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 07:56:21PM +0000, Conor Dooley wrote:
> On Wed, Nov 20, 2024 at 10:00:19AM -0800, Guenter Roeck wrote:
> > On 11/20/24 09:11, Conor Dooley wrote:
> > > On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
> > > > add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
> > > >      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
> > > >      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
> > > >      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC =B5Module Regulator
> > > >=20
> > > > Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog=
=2Ecom>
> > > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.c=
om>
> > > > Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog=
=2Ecom>
> > >=20
> > > Why did you drop my ack?
> > > https://lore.kernel.org/all/20241106-linoleum-kebab-decf14f54f76@spud/
> > >=20
> >=20
> > There:
> >=20
> > > +    enum:
> > > +      - adi,adp1050
> > > +      - adi,adp1051
> > > +      - adi,adp1055
> > >
> >=20
> > Here:
> >=20
> > >> +    enum:
> > >> +      - adi,adp1050
> > >> +      - adi,adp1051
> > >> +      - adi,adp1055
> > >> +      - adi,ltp8800   <--
> >=20
> > This is a combination of two patch series. I'd personally hesitant to c=
arry
> > Acks along in such situations.
>=20
> Ah, I didn't notice that. Thanks for pointing it out. Cedric, in the
> future please mention things like this if you drop an ack.

Whoops, forgot to mention that Cedric can grab the ack from the link
above when they resubmit.

--cmb0uSDOa4m77wH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0Iz2wAKCRB4tDGHoIJi
0vbOAP93cCE5U0MRE2ukE14+j7Znfk0OZQvRHV4Byw4hU1soHAD+KZ6h07oI9RE1
Ob3snH/SPF4PWllPOLKR/AivtgxHbAY=
=V+Ev
-----END PGP SIGNATURE-----

--cmb0uSDOa4m77wH7--

