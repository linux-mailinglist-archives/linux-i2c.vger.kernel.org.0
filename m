Return-Path: <linux-i2c+bounces-4939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EA92EAF5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 16:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7ECA1F23181
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 14:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D1A168C20;
	Thu, 11 Jul 2024 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P43Nh8o2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35423167271
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709050; cv=none; b=gkc8Omz19EDvngSR8+rLVxzpB4rvnCd1n2Y0zBkcdOaZJ/BeEJ3V3F3M8DPtjMtNfXZPI6gLSDUlAuieDZIVW2kscSjEBJKTZfsJ4HVhDXjr7HBf5mIhJdBGJ9AwVNF3UXNM+QHEpEAjduP2TjVSsyyB5oBrCihwsd0/BBQEgfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709050; c=relaxed/simple;
	bh=d3YObu13iB6Kcvu2O65ozWAbx9bOeZu+8fpEHh1grJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASBsFz/odyS342IqCvn/Cm2MFM+u+QH25mhORnLTH3WUsFNAex758WUVjnX+saIMyCw1kS3TGJfG4Mv8nrBjAQJqN7Sx4Go0TA8yOM3F78TEdXP52w+uwybs4vc3lSsAGmQ68/pQ4QHJ57WTkzCS9MZqGle0gqX3g0+8aZ9S+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P43Nh8o2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Dfkb
	sELzbnikRJdgk5Ohme85MtHt0bXQNuVw3p8IKig=; b=P43Nh8o2kh6BSzcgIvdn
	e56/yVyMMcwOo9SAM66wLaKp1xrUry+22WwgC0ONysrZYpYd+WPZmrzxxfhM1MW9
	BTqRmDk7cx7FKS2/inNR1HDDfQXcbDCW3oZIyZ4+pQhMrwefiqzEva+KxeEPuvdz
	51Fjloi0GB2Ch1+MPZ6nytbz0rX/3BEqrdQz8NeR0m6BgGGgXgKC2C4eexweNCv7
	dOXF2zew2eLIyq4b8rbwS6iE3w2gBa6PQRrnKOpMwZxyHs2FiiYZORb1oPWnMy7h
	TV5JzWstsyuYcmoaNwEbBSRDgIsAgPtyyw1bxEF3O0iFKSmruzfHVlrqj1rkIr5a
	Dw==
Received: (qmail 876813 invoked from network); 11 Jul 2024 16:44:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 16:44:02 +0200
X-UD-Smtp-Session: l3s3148p1@Nsw3y/kcDphehhtW
Date: Thu, 11 Jul 2024 16:44:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Hans Hu <hanshu@zhaoxin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 56/60] i2c: viai2c: reword according to newest
 specification
Message-ID: <Zo_vsdNOmJFomwzP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Hans Hu <hanshu@zhaoxin.com>, linux-kernel@vger.kernel.org
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-57-wsa+renesas@sang-engineering.com>
 <6arkyo4dg3k2ya6oitgv4ajcd55ncf2xfgm4o76jfbkvn4wca6@7qf3kjaq5sci>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JopVeG4lPsQY2Oe/"
Content-Disposition: inline
In-Reply-To: <6arkyo4dg3k2ya6oitgv4ajcd55ncf2xfgm4o76jfbkvn4wca6@7qf3kjaq5sci>


--JopVeG4lPsQY2Oe/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -#define ZXI2C_HS_MASTER_CODE	(0x08 << 8)
> > +#define ZXI2C_HS_CTRL_CODE	(0x08 << 8)
>=20
> They also look like driver specific rather than hardware.
>=20
> Hans, can you please confirm?

The I2C specification explicitly changed "mastercode" to "controller
code" for high speed init.


--JopVeG4lPsQY2Oe/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaP760ACgkQFA3kzBSg
Kbaxxw//R1A+rgrWQfrcx2syRRgBijgOuZ75OowpVV532IvwgyxyP96mca5BaLzy
nMj3Miqm24zrlkn75wJunG2Ngj7wDR7EAOnAjyEvxJdafjq1RiE/j8M/F2GzAAcq
BY2GpNCD6Vk44qGP/OaUJIMIy784Ihg+fpRLCk9sGtxKNzjGBd1/TST8UJXc45AZ
vZgw7OORKz83czY8A9+eITc7RSxaglYz4gmsSm/r34MMTzAk10E4h1UaR0/AtRcu
0XIuV8k2OC7DTjq8KrDiGDJ+ywBUxXMpfK3DwMJGtS1g6sd/tFDzQ1i3ZOUUD8YU
E1GMv7Rv9M2rO0nK3sdKIWse7RHfrHki/40aqKDuYrbchVd4TKW1M1rwBS9T5061
nr2KY/r8gmbXNZzmJYzGJovJwJclsvirFKWyE3lK3AQatOL9+8ahMswnk6bye4yD
30aLWLhzUWJXf6pSBaHG88hzPkYhWkwK7rR9CzqzJXMK3jizkGnGJd8LfKGyJG5u
PDKGhTJs95WZM++nGe2UgfeEpAT/EjS6oDf5NFN0lVZZMgyvjVYpgnSlthhbNAwr
jCvqXV9fCw64Ro5a0FyT1kMnHXutAY8VhEYe1RwZHdtKR/1he8FAgzJ7/jRpNJ9x
jMjEmFw7VmZeYMGcabWgDPe6FHESI7gQEQ5d3TXzZHFaxMNL3sU=
=tZ3P
-----END PGP SIGNATURE-----

--JopVeG4lPsQY2Oe/--

