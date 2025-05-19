Return-Path: <linux-i2c+bounces-11041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BCABC4CC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFEAA1B63A6E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD502874EF;
	Mon, 19 May 2025 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mwb4TPgw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE28284B42
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672847; cv=none; b=jNu2B/1QkQJhEgPa5N7kb/U7TwwNuPDphRfcTV22XQBOfb/OU/SsXCH6jh2jtXPJL7PmVfttmFQy731TRjofUxfuY5pmBmtq6cbUpywI+kMQY1l/XgG0WMRUNN0gxQ2RG2CzKiZnT7bL1rczhjuPXfJv3tNQkqIzE1BTsFPtDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672847; c=relaxed/simple;
	bh=+LbGvO0IL9htaGDo2jxSFU5mMPt08NBRUB/FEzz/8sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3w2Z0qNHl9BGQ5Q5FNga6Mp48HYIAod9c+u5JzWIbjuWiD5XUdHDcK40dgQ056aid+o5O0CeUp93Xm1DEgfVUK4u9MJOgPimy6kuoYkAKZB4HeiqyDQpfUk0ukIDp+0kHSvYHWZ9zeMKQPwo/WmBGH9/geJI8NvKLrR0HWR9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mwb4TPgw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+LbG
	vO0IL9htaGDo2jxSFU5mMPt08NBRUB/FEzz/8sg=; b=Mwb4TPgwmkVvYu59dJJG
	iK6hZJhSxK/4JCs2ya6AfeZIgWRT4hc63ipdMhQSQcXip7pj/cwdbOqdSn0B5/8e
	3IyW/YAK+xHpV4UEMDVtASnuCCuZ9q21NXRd6wD1nzWGNODSthcgv3hBT0+GzRjq
	87osj9k4OSDrBx/0cRJw+S0ZvRFOs9+IYVUyUDNrHTEWOZI4efIsboAUjsR1Fkcf
	L98tjNdzUGasutVe+6qpDa/PX+zhUw5ehktEtMH5S+xlfc6kNQi0Canke4TTa0rT
	/ga67CpuQPEA2aS3+blhOMMuISdvu3Uztiw0ozBXzAG7UCjYtEKGrWZVtjN4A7UY
	HA==
Received: (qmail 2565292 invoked from network); 19 May 2025 18:40:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 18:40:42 +0200
X-UD-Smtp-Session: l3s3148p1@8a/PyX816rRZz6uL
Date: Mon, 19 May 2025 18:40:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Harshal <embedkari167@gmail.com>
Cc: jdelvare@suse.com, skhan@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs: i2c: fix spelling mistake
Message-ID: <aCte7oUUMIYSow-z@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Harshal <embedkari167@gmail.com>, jdelvare@suse.com,
	skhan@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250516100445.8484-1-embedkari167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmgRhpjTpldy9DG0"
Content-Disposition: inline
In-Reply-To: <20250516100445.8484-1-embedkari167@gmail.com>


--cmgRhpjTpldy9DG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 03:34:38PM +0530, Harshal wrote:
> fix resistors spelling in i2c-parport.rst
>=20
> Signed-off-by: Harshal <embedkari167@gmail.com>

I ended up applying a similar patch with more precise descriptions and a
full contributor name. But still, thanks and happy hacking!


--cmgRhpjTpldy9DG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrXu4ACgkQFA3kzBSg
KbboKw/7BhagxXCJXRmB6ajcF+qFlo257T6uCMVkdh0jpg8u0SctHvoN8AunxspO
2Q4BXzeAnxZp5yxuhH5AndXeDsO5i1DbO10P7poIXvly0l3rNoMOoyg60iFhv9MI
vnkLx7YA5CZoISu+kedx8csVHr5J9n/uZbiyHslOGo53VdoxQ/WS87wB8d1qFFEu
x2+6RnRKy1HRWrnAtA4KmltzE+3TnyOHSpbggvhA+S7u+56halkO68VMhU62pS7D
erQTfiIlnawqtJ5oBmI86Iu42QQoRyUa+UZ1gq2+8yaZYuwwS89wDcUVw6BuCqJX
jVjjanQKvm3ZJv1poEXVFPPN4evOifiVuuPDNDoDXT9e6CiELMqU1oq9EQZrAqt/
bvDLTzpr48WiqurnrY+LjKKmpu5bG+E3zFQyw3m8qPdQOqfyqAFDtS+ukipgFaun
f47ajxMeoK4UcSriQiTEkN9ktuJ47ZbYwr6k7kHwOA13RvSPvJhzFXRLJ+mP6Q9q
oBm8wtBZ81NcvP2Tok6BPxVlmwHBmx3eP74h1zo+S+PjvYx971btvg2NuY6yWLXl
x23XD0sYe/t879WIwgoDEzxEvWwOvAeF7A3c/Fswbdgw8sgYmE925GRrUoxjNua2
ER3Q6XY0UbgMvITFh2FQOmEevxDLmqGmWUW8t8FywW5l6Z9+4Z4=
=/P+d
-----END PGP SIGNATURE-----

--cmgRhpjTpldy9DG0--

