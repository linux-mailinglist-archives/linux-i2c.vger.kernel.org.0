Return-Path: <linux-i2c+bounces-1362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE46830E55
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 22:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 298DB1C22102
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 21:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C9E2554E;
	Wed, 17 Jan 2024 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKkB9+ch"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0719B250EF;
	Wed, 17 Jan 2024 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705525243; cv=none; b=CjWsd5n4d33L6S0ZZAxLrZliE1jUUrEg5ci1gT2SWZBezI8GsStFMqhRBcrTdMt0gTQKmMyw9Pfv8pwi5B3n3zylR3Bq4HoSsa5aX+Snn9xN34ieGcXnrTqnShDUEMudeSC6IDafMFUhVRgidkUhViepjNvcYl3KhkEdekd1DcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705525243; c=relaxed/simple;
	bh=rfamI+slIqq/jBCF2lBWw+dABeo8kPM9mSZ/WIbDZeU=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WcXoCpuyVDxHoHllNzA2QEW5PzksKjMya5DT8+NeA3osZHkJsvoL58qfa9OZTPCD0PQCo0qAd9TuUzRQu7ZFe+Fk7FeZMtH7k+ck+eKN0tPIEae9lmtN1T2MGmS+dVJogTM3dLDiEq1br6uhsyEyJ9LoyumHmj1pzDTaC0+MDbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKkB9+ch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4ADC433C7;
	Wed, 17 Jan 2024 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705525242;
	bh=rfamI+slIqq/jBCF2lBWw+dABeo8kPM9mSZ/WIbDZeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKkB9+chw9Rns80vaFfpuBAwA/UZdazgGPw+IiA9MZPxYOEOLJiFq+deqNFakS0l1
	 YpvOOqzAHn338/FAI4uSo6hIWl5Mmz3f1hJElVnnxyTILG/fZOcF8EJmE7XwBw4X75
	 QF86ZMRcYFDubKlGwH5jOB/ETU8JPDHl4Uf7Q1cpkoz4pbkP3tf36JkIgou1BGMNfZ
	 OixXllKo9/QcQMWpsx5Ny+TTCZ3gLNNNzmDP6cIqIPNiUS1LsBjeOsWF13in4IV7il
	 IOV50YbReyRICJFdA2WUyA/QajfJHnFBA8oDShvkHdYJebttV3D0+cdSDKYSP6r8UE
	 UzQDfL3729oGA==
Date: Wed, 17 Jan 2024 22:00:38 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Kim Phillips <kim.phillips@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc1
Message-ID: <Zag_9kYtbL30QjrB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
References: <Zaa2l48Yx1AeCOLs@shikoro>
 <30730c8f-d8f9-4352-ac90-ccec153c32f8@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xRzF+/6OgExWCOND"
Content-Disposition: inline
In-Reply-To: <30730c8f-d8f9-4352-ac90-ccec153c32f8@amd.com>


--xRzF+/6OgExWCOND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 02:35:47PM -0600, Kim Phillips wrote:
> Hi,
>=20
> On 1/16/24 11:02 AM, Wolfram Sang wrote:
> > The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e914=
71ab:
> >=20
> >    Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >    git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c=
-for-6.8-rc1
> >=20
> > for you to fetch changes up to f4b49e824f0b38e6b5003be97f27c63b96454388:
> >=20
> >    Revert "i2c: designware: Fix reset call order in dw_i2c_plat_probe()=
" (2024-01-14 09:02:34 +0100)
> >=20
> > ----------------------------------------------------------------
> ...
> > quite some driver updates. Standing out are patches for the wmt-driver
> > which is refactored to support more variants. And a big series for the
> > designware-driver needed to be reverted because issues have been
> > reported late in the cycle and no incremental fix has been found yet.
>=20
> If you're talking about this original report:
>=20
> https://lore.kernel.org/lkml/20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.=
local/
>=20
> then my AMD system still fails to boot this pull request's 'i2c-for-6.8-r=
c1' tag,
> and in the same way of the above stack trace.
>=20
> It looks like a lot of designware commits did indeed get reverted, except=
 the
> very first one:
>=20
>    bd466a892612 ( "i2c: designware: Fix PM calls order in dw_i2c_plat_pro=
be()")
>=20
> If I revert it from 'i2c-for-6.8-rc1', the system boots fine again.

Damn, stupid off-by-one error :( I am sorry, thanks a ton for checking my t=
ag!

> Can that commit also be reverted in this pull request?

Sure, I will send an updated pull request.

Thanks again,

   Wolfram


--xRzF+/6OgExWCOND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWoP/IACgkQFA3kzBSg
KbaYJA/+JciOIxbMLhpNy/DSE0MBQ/2J8pFUJ/Wn1rrQNKveoaeSDwAhokgXZChL
DiSjQwrAlGWshUTxYvGqvyclHiZCw2wqhfgWPP0RgMP/az+3xUpE3wHhQy8ee9Dr
fq0p6fyQFb2gPY4d28M7nAKKbNYkFCW2sftKKPIqXK41Qj8B4RlzeQpZA7DGtBtO
BW71UmVqf22DjChJuxaq+FUnAoJKjwzusn9oVusHSyIUjnHSNahspZKR+rykUMh8
KVusQnbFiqw2Ak9TaTmexQjADHRlA7CjcpryjFnza5zpGoLHD5PU0DGm7bCIdqMP
vFaJZJ1LfoR3fQauvgJhhwO7m2rsdWhElFfKng6dYCBtbyaAdENKUFn+btyzul9u
CKckhgpvBVn9sO6NV5PSc9fcM7iimJ9OZRyr0IRPSuswp2k06mqBqvWT5TyyGDKK
+eAFasgtUb3p9eFqFT+X3D4uPpVb1LsvBY0+BnDEawphDb9AA2vhXH7428qzld7I
xd7FuG18XRCsX8VtvQPohM73Dg58hT/lcKy7QSI4GJije2fadbNUN9K8mJgcgqJ8
xe/Sjga4Acx/ot0+xIuwxExWtB0bCTx17mpohcWsFZf65Q2RjQEMeTkGhZ7L8Cr5
pshAyclL3EZ0tWkZ/qre1yXuYxAIvyG3p/+fLHH9yxxfu1NErwk=
=wJ/k
-----END PGP SIGNATURE-----

--xRzF+/6OgExWCOND--

