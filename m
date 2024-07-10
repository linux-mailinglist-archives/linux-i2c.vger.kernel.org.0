Return-Path: <linux-i2c+bounces-4813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E592CB38
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A53CFB214A8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 06:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEF764CEC;
	Wed, 10 Jul 2024 06:36:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC36E4BAA6
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720593396; cv=none; b=BhYyg6kbR4MF4LWZHXWVhYagRrYRoAJgqL2jNAj4njl3kc3zGBV4sjTqXSpnpWvDzVxvxl66D51o+t712wvTFLMAvtQwXi6bdHrFOAWQ4dXNXSz/V53yFsDyXrho5c2g/qSH/sqImrqc4HrMYXuJ+3EiebG5BNKX0s0IKMk442o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720593396; c=relaxed/simple;
	bh=nOMCeXyy7ZORE/0sNiiMDzfwCUg/EFzxXrBQsYQsLA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMq9atJ8RIYH4tJ+qofEI/kaIHcR51E5Y0jkNZE2Tcam9S8WzFTvDKOa8J5Cf51nHK4JL4XXjLtOl5z24Nh9UJPJb1O6d6R/nHiDzeg+BFmGUOaVl7xB0Va91LuDfCWbMVgoZRrTYSlhQyD8hD3/A+IoVP/Bohi2q7f78MbSATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (26-123-142-46.pool.kielnet.net [46.142.123.26])
	by pokefinder.org (Postfix) with ESMTPSA id DFFD4A4A637;
	Wed, 10 Jul 2024 08:27:37 +0200 (CEST)
Date: Wed, 10 Jul 2024 08:27:37 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24: updates for v6.11-rc1
Message-ID: <Zo4p2dJYJkJ_hX6A@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240704143148.28950-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FWqaZIouFtfrI0+R"
Content-Disposition: inline
In-Reply-To: <20240704143148.28950-1-brgl@bgdev.pl>


--FWqaZIouFtfrI0+R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 04:31:48PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Wolfram,
>=20
> Please pull the following set of updates for the upcoming merge window for
> the at24 EEPROM driver. Changes are quite simple: we support two new EEPR=
OM
> models in the driver and document another model with a compatible fallbac=
k.
> While at it: unify fallbacks for two existing compatibles.
>=20
> Best Regards,
> Bartosz Golaszewski
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v6.11-rc1
>=20
> for you to fetch changes up to 3a9ba4e32230df6c48cda1fd5cbca6facacc74c2:
>=20
>   dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B (2024-07-0=
3 11:57:52 +0200)
>=20
> ----------------------------------------------------------------
> at24 updates for v6.11-rc1
>=20
> - add support for two new Microchip models
> - document even more new models in DT bindings (those use fallback
>   compatibles so no code changes)

Pulled, thanks!


--FWqaZIouFtfrI0+R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaOKdgACgkQFA3kzBSg
KbYzMg/9Flizb99SlcylJ7F1KwGE90z+Y4wG84ac9AG9kL1Gc2ittDLPKD/Vp9Qf
3hwHiFzyakuRpCpH3iMrp9Of5ElqAlCpz1UCBU0DppNdtGW/SVrO+zf+Emb2PmGQ
C+n2tpItM9BsDML24clyc+MB0Q+O8P9GuDBaXQjxnTiKdzzOlLe2bnOgl8w0m1DB
nKsy6C8JJYwTuRMnraatSJR3+5eiFrEVZWTXp3GHN8HwqcKm9nLxa/uEVN0gwmAG
IioEc4kIdk2Iq9tW/AH2jZwVAlHDnVVg8/SXKt6YVIOK5WG5obYsg0IF15VnmQVi
V3Q36pfcyUpQLvuduk5Z0oc3+iuASMvNk7MWGnfPZphRASnQeTdk58Mkvi5emgyJ
cEIufAJMhKpiizYUUfceZSdqHjyIv0mMnHj1A1aaLEyemjBq/Fd0JSTgBtYs2e5m
Yqx1vuwMOnyF1c/WPgA5qAoEp+6qiVSbknGpBg+iOhSOTA9RJdnc0SflIBkeMubV
wLXlnt+eLqRcVijVqdu8UaBzafmrmMX8Q6KJuWq36fI7MP62oTukiT0KxfJbpMq6
iZH73pjY4q+S0JWBUJqAjfov6BVzyNLVboS9TuL/uY6mvU1DTUMdHXxug/UR3Lx+
Vh4CQ7ElftbtthwWJp0+iM2gpBAeG4iR229sxHAg+TczboxoSos=
=+AHe
-----END PGP SIGNATURE-----

--FWqaZIouFtfrI0+R--

