Return-Path: <linux-i2c+bounces-13566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC57BE1EE5
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 09:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA41B34E7BD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 07:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3201729BDB1;
	Thu, 16 Oct 2025 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IHjGYpVV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE773254B0
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599951; cv=none; b=QESSvhXtoUm3CiuESMSEk5TfHvcVP85ACkddiZK2oZuSUFVqpT8LspZng7P/9aCsJuFhiUHUNWqOiAisUWj3sliwFxB78pyZTIy2hcb+dUgteRBeFqMBMR5PjD/2zh5uf7OZMohQYosFYEBr1qIRsmbuGF34eBMoWi21T4m88hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599951; c=relaxed/simple;
	bh=+xd28qTXSCcc8ok1niwAqU0DCbcQjRi1sND69W3gViw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skFdqQUe/xmSQV9nnAOg8Dw/vVjKNAZ93oCU25u01NgF9LKqMWOkCi0rQg8s1fRo4atHO6m/2XEZzOalF6cQ1zAhhbRclYRkEpFdUJPP7iJ3VzCDRjTXpVzrxaMgLj5yZWUAqU+Kw+P5c5JimU4tOGwKjEwhYX06ZPSdOxa/VrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IHjGYpVV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yXa+
	322mydREfaXen6L4SlMOyElKyFYLFnucwI7kpWM=; b=IHjGYpVVDdyxxjlVxBEd
	hrMdOkp/v8xr6wQg8OoS+V1ott8EFJG3bid7Clv7UejYjJ/lrLjoRtGq4UpOSfoB
	Bvm+pF8IyzeONLiWl/F2ztR68c6udtsiD4uKXrx9vU/ikZ0mpBVmB7pFC/6O5Whx
	+YCmAEVNK+Hkbx9lBYPqjTEolZHg8E4TAx7YK4nmacj41F9q2/6DJ290mOvU3l8w
	kiaFGZtSmpVlbO0Shhr6HT4t9XlD1VamRs6SyarE71c+CnBDgaACLQkWT6P4Q/lb
	PAuy6o4ucjhghZRoWR5rywlGI5LmCdoK2wOdVYpbYOyES2NxVGZci24bUihI0YSp
	tQ==
Received: (qmail 3708801 invoked from network); 16 Oct 2025 09:32:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2025 09:32:25 +0200
X-UD-Smtp-Session: l3s3148p1@VIpNnkFBltQgAwDPXwQHAL/S9V79e5yL
Date: Thu, 16 Oct 2025 09:32:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <aPCfiJxyKOXsgNJe@shikoro>
References: <20251013060018.43851-1-clamor95@gmail.com>
 <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uEiwKgHyXhHzOFYb"
Content-Disposition: inline
In-Reply-To: <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>


--uEiwKgHyXhHzOFYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Svyatoslav,

> Herve and Luca did not come up with anything meaningful, they provided
> just a few rough ideas. It will take an inconsiderate amount of time

Well, IIRC they said that your use case can be mapped onto their
approach. Which is meaningful in my book.

> before there will be any consensus between them and schema
> maintainers, and even more time would be requited to settle this into
> schemas and implement into drivers. Why should I suffer from this? Why
> should changes I need be halted due to some incomplete 'ideas'? This
> driver uses existing i2c mux framework and fits into it just fine.

I am sorry to bring you bad news, but you need to suffer because this is
how development goes. If I get presented a generic solution (see Herve's
mail) and a specific solution (your driver), for this case I as a
maintainer will prefer the generic solution. Generic solutions need more
time because there are more things to handle, of course. This is typical
for development, I would say, it is not Linux or Free Software specific.

I appreciate that you tackled your issue and were open to share it with
the community. I see the work being done there. However, there are so
many things going on independently that I can't really prevent double
development from happening despite it having a high priority for me. As
soon as I get aware of people working on similar issues, I connect them.
That's what I did here as well.

So, if you want upstream supported I2C hot-plugging, you need to wait
for Luca's and Herve's work being accepted. Or provide a superior
solution. Or, if you want, join the ride. You already have experience in
this field (and hardware plus use case), you would be a very welcome
contributor, I would say.

All the best,

   Wolfram


--uEiwKgHyXhHzOFYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjwn4gACgkQFA3kzBSg
KbbYDBAAmGNkfML0PzlhNVB+YEhIWwu71dtzkZRexdYYq6v84h5Q5GvzUJhbhlF9
XI5lxCEkPoMxPd5+5WzQr559IBOydhwig0OBgx21yS3H+fU6X5eMihCImyHbv3ud
AMT6GOCTZzWu4Ds8j/cxUVSRiYb7feGxUuQgZgi4qjiOQqYchAfXQJxuC8XE7+Ne
2RUQT8xj9Y+tadbC7jGRXcEqXLyRxAjhX/xM4ZNXBEF8ANGj5WO7uLIlmY9i6bkW
mGEfMF+W3d1FPyn76iCY8FnKgs2cEChZZChnw/EWNt53Lu2KwDIz8+0zUzWZ+otO
3EU6TIpgS66TaSIPc+OlIznDNjS1QCfVy2vULwjSHnPD7uRE2LtwKXATeEGhBMYi
Xq14MSY3etMbhb1X17Y1n/ghRbtaTLKAmu4CRrn69/7MAkq3bWUXdzlHQkRWZe9P
s+gVYK4uUOcDtpFSL3KVloqZjMlzyOWRrugtuFTo8klctZjABezBd9pbpXnnEKci
nlDAR/aNLwVHC4U53c5j9Rgbj38ka+kmqYLorz+snzTmxjH5OvpqwvpIubirn8Jh
15gt4Sxsd+hIwN0fzc93pSTNilS6+dA+I9h4hl140iq0YKhPvU4aUCsDfWu9XHBD
djidWfetN9v/TEIgnaCeSBauwZNHjonpkBhS6AHq9a0mY9Q8jWY=
=+hG4
-----END PGP SIGNATURE-----

--uEiwKgHyXhHzOFYb--

