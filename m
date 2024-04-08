Return-Path: <linux-i2c+bounces-2821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB689BA6B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 10:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B1361C218ED
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 08:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D363B38F98;
	Mon,  8 Apr 2024 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="glnUb59w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF138F82
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712565357; cv=none; b=EuOODznBBq/aT3nwu3/1YTl3gMRVoZJBN8cnA7L7vnQUKOOX9mt3OTIOh2fmH9JMOfSuqZPa2PhT2cdGgEI41KfswP2VcQtCN1s9OFwnXcW4blXZhR0xHPxiy94x13xHKmRpRjDF4ZVpAkJgtpv39cemm6OptxPn+yX90oHUbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712565357; c=relaxed/simple;
	bh=jDLuzGAfbfPC3ySujswGqWcVkwuc+ewcacXDcMbNo10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMoZ6boCX/8uwQAPOA3OuMjs5YysxlYxjhpMabfHpnMcHfYPca+8NJoiowlpq4ln621mkrOFefsT44RinAyKTqZT+2YLokZoews46DLJfSFYWYrByO1YdR3sYZyH9+UnoI0rs1o2uOi30Ilb03KtS7ES9i1QWTluESXTljsZ7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=glnUb59w; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kaac
	/HoSNF6kBNyIZvAXuiqRv4XHgDdylJjIFzS6jJw=; b=glnUb59wzYNl2lqMUYNX
	ZjUTjMWP3AF1osTTIZsoviN3OVy5BVJPkeMTiTK24l1kSjh67hVzj2X7pl933Z+T
	yFI4MjENYVeM0iZuomTYQMIpOfRHkW5XXs1Ke56fnzEtFh4XZ04yv5kXwAyknkFH
	RSv3fOKzz0XxOSYFNznus+MuvaBkHRwXMPA7wOEDzK/ktzSAQ/LnQRNh94tyfyt9
	SQU0i1k9pTWQN7r904M+8imA3//k81pjO1fr6cvj9vkSo8QcaBuPlInI2Cfg66WF
	vX1o+E++730gPmmHdiIZgXCxt+TA+529ZltqwmOtliGNB6G/Z7YJ3Yj5JyNEoBMn
	fQ==
Received: (qmail 704034 invoked from network); 8 Apr 2024 10:35:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 10:35:53 +0200
X-UD-Smtp-Session: l3s3148p1@ivmCsZEVfqEgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 10:35:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/64] i2c: aspeed: reword according to newest
 specification
Message-ID: <wcnu6qxxztplzpqtqc4t3bf53v6buto6ch6b5l5xoytrxxdgjz@gwzlifzzfrvx>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
 <vb4hempklviz6w4gd3eimprplybm4ckefwz2gyy7cp2uww2anv@b4egbq4u4rrg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fm2sehicf2gvt3hb"
Content-Disposition: inline
In-Reply-To: <vb4hempklviz6w4gd3eimprplybm4ckefwz2gyy7cp2uww2anv@b4egbq4u4rrg>


--fm2sehicf2gvt3hb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> > +static int aspeed_i2c_xfer(struct i2c_adapter *adap,
> >  				  struct i2c_msg *msgs, int num)
>=20
> here the alignment goes a bi off.

Thanks, I missed this.

> >  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> >  /* precondition: bus.lock has been acquired. */
> > -static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 sla=
ve_addr)
> > +static void __aspeed_i2c_reg_target(struct aspeed_i2c_bus *bus, u16 sl=
ave_addr)
>=20
> We  have the word master/slave forgotten here and there, but as
> we are here, /slave_addr/target_addr/

I can do this now. My plan was to convert it when I convert the whole
CONFIG_I2C_SLAVE interface. But "since we are here" can be argued.

> >  static const struct i2c_algorithm aspeed_i2c_algo =3D {
> > -	.master_xfer	=3D aspeed_i2c_master_xfer,
> > +	.xfer	=3D aspeed_i2c_xfer,
>=20
> here the alignment goes a bit off.

I also wanted to fix this afterwards together with all the tab-indented
struct declarations in busses/. But maybe I better do the tab-removal
series beforehand? Would you accept such a thing?


--fm2sehicf2gvt3hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTrGgACgkQFA3kzBSg
KbaYiw/+IdfDf8ES2q59HpvmAbphgCrIhyycf7z24hxpdlMNa8KCH+NGusDVZ8x6
DpMDISrjfNpwL+rpE0shnhzmKDo04CYGRceF5E71B2Gk/1s1ujxNOGP+VP0nW/19
jb8zMDFeuEnkKqF2T2e3lCpTLsP41V4Fl+wWNPL+AkS7hCBCjYyvDemtknRJjqzZ
OkawH3O73gJ1m07M10Q0IOLfDBMh6qFw2URTIMEgvfErroscCYruNq7BXisWfCHo
85iiYyiWeWgTpdp6SPFL+apD519ZnS4i6F4XrsVV/Kk02U7izS7QxYi74y7NDA97
JAQVUSy0JkVmAvwcncQhc5xYc+XJcO3lXd4Gw3UJieVVfwUWm/oKJ+qXeoFUPVUT
2zOltFsyZX1y0tVS6+A81It3lVzAsihUy4Z0vmPa5IyB1yFxHZ6ljsOV+slH0otE
+RfzSHL+tA/GdojNayLC70qTKri+goIxImhP4XZn3dc/5RaX9rSfooeNGkK89SJx
s7aK447F0zoeH5GiK3V3aXGY7XLFHE6WSBGy/MQorHu01PF16jlh7Hagyk1BsIM8
c13TUVcc9pgSHW5gPBqay2f+SfTJCtapK2KO497kfPmP4S5o2JXRYRwFezZa8ODE
YI8mFy0scsJxEv5P0WlByOFGFRbFkcaD+gMejTz5bBCUUAUVa+s=
=iumt
-----END PGP SIGNATURE-----

--fm2sehicf2gvt3hb--

