Return-Path: <linux-i2c+bounces-7853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A189BF38B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70690B21EFA
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CE22036EB;
	Wed,  6 Nov 2024 16:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExvJn/FR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E851115383D;
	Wed,  6 Nov 2024 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730911576; cv=none; b=PdQ78EzIi6Hoxa5uSYiG3VUJFc3O+Z3NuyT7rHYc5tGcmoOctQylM0Dr83K12pVoB1tWJhWqTtdkXTPqPT4TezaGZcHH3wh6vP+pxpTzZRj114vMru6RcLH7+PsBAZbwunr7Em/GViUdr17dilLgMjHc+DTtKe4tLqkuWFSccxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730911576; c=relaxed/simple;
	bh=G9AL7p4BSYUkCsmnj5n+S5wrrMS9UUh/oXlI6Z/z7ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq6CI6LX8cvb1Jn5td7NJh3KEHu5mC6pt30qZZPiD6e52OYorCcStzVhpwyjy3v9WUMmmnfRHAhB6MyOeVFtqcM1dxWooE0iV4zOApD656fc4oJaKBWm94J0qauAqdwR9mui2Lltll6/EsutG/VfDWTUJx4hWlnxE2sW0Df+Kf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExvJn/FR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4448DC4CECC;
	Wed,  6 Nov 2024 16:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730911575;
	bh=G9AL7p4BSYUkCsmnj5n+S5wrrMS9UUh/oXlI6Z/z7ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExvJn/FR1eK4WVdVa6E/Dzq454584zLnLnxRKkqAjf4ImzZ5w0HTcuFUY+tsRiygf
	 VzV1jj5Rn+GF0duuJl3yR2pvmcyzNb5ljw8f1k4Mt07r/mcqxs34w105t6ilHb23Pi
	 gwu+8HV55FmXFlNi8Y430NjD6Sf9P79EBBHBFQqeVGzcrCZqk0estEa9/KcrMv1iwH
	 TTBiKaNzdLj79ZOiARP2bW4LxHvApGEPQeeT/9S6Vo35bzFkA3VEcYqbXxR3FPaLMu
	 kMyHgriPEe7jO29uUy4ChBdynbhKaBUrSI9gvWeTRf2LiYz6KvNsemIH3mjhzXMnUT
	 rZrtodNhQz7aw==
Date: Wed, 6 Nov 2024 16:46:10 +0000
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
Message-ID: <20241106-rancidity-unexpired-bd3baf858fef@spud>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
 <2bdc5b60-2442-4291-a2f2-2e3802b7e982@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SDdygy8xL5Th8pSv"
Content-Disposition: inline
In-Reply-To: <2bdc5b60-2442-4291-a2f2-2e3802b7e982@roeck-us.net>


--SDdygy8xL5Th8pSv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 08:35:33AM -0800, Guenter Roeck wrote:
> On 11/6/24 08:06, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
> > > On 11/5/24 19:09, Cedric Encarnacion wrote:
> > > > Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC =CE=
=BCModule
> > > > regulator.
> >=20
> > A single compatible for 3 devices is highly suspect. What is
> > different between these devices?
> >=20
>=20
> The maximum supported current is different.
>=20
> -2:  135A
> -1A: 150A
> -4A: 200A
>=20
> Programming is exactly the same, which is why I had asked the submitter t=
o use
> a single compatible property. Sorry for that if it is inappropriate.
>=20
> Is there some guidance explaining when to use a single vs. multiple compa=
tible
> properties for different chip variants ?

TBH, I'm biased and a bit paranoid, so I'd probably give them all
compatibles and set one of them as a fallback. If the programming model
is actually identical, then it's probably fair to use a single
compatible (provided the commit message explains exactly why it's safe
to do) unless the different output conditions require using different
regulator output constraints that different compatibles would be
required to enforce.

> Note that there are also LTP8803-1A which supports 160A, and LTP8802A-1B
> which supports 140A. Maybe there are more, but those are the ones I can f=
ind in
> public. I don't know if there is a difference from programming perspectiv=
e compared
> to the LTP8800 chip variants; the datasheets are too vague to be sure. It=
 would be
> useful to know if those chips should get separate compatible entries if p=
rogramming
> is the same.

--SDdygy8xL5Th8pSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyudUgAKCRB4tDGHoIJi
0hpzAQCKZm4sPjl0CL9dK9niNy59ZH+wV+7FOHUqCuKgv63+ngD+KMBuUoP6vMZc
zMGwT3X92RXWaouw4DgcKP5tzL4f0wU=
=bFU0
-----END PGP SIGNATURE-----

--SDdygy8xL5Th8pSv--

