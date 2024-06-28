Return-Path: <linux-i2c+bounces-4487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5237E91C5E9
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06E741F228DD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1381CD5B1;
	Fri, 28 Jun 2024 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="emSrVEK9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1247779
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599969; cv=none; b=dj+yF19BzJPuT5zNK/H2Uu7HkRMY3UdH/WW9iCCwqI9nnu9JdHKWpWGSPw+VYVgTLnBC0l6Lj1CZPjzs1c3iV7PS6R4y9dtHuVBP/xs227AdaruajPwVMCvXHY1PQkLq6R2PW3dCwZ9pdwOetYL8fKKJpTzAKLGWeIs9wW0NKcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599969; c=relaxed/simple;
	bh=SX/+b7YgcsEO5XeFuYdJ1v5hGsB6krkNYB2TZewMbz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOCdClqt6VcJfIS+ktZepAlgPmTWeXSWfRrdCPM9JZIi5xtvIugEVGvmngNFAyyvFKVsvKg5kZ56kJo3WHiic7O5AfAXhki93q5llxp4r9fMbodIYG5tax1ssGnVpWOyoBtZbuJIw/xWPwB3WY6uusEsAjSrDJ7nAkJ3d7m/De0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=emSrVEK9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=m/Dg
	1r18WaypntHngZkQccF93S8V/HKSlKlbtqiO0CI=; b=emSrVEK9KNei6vjQzB1H
	xl/9IHCNDLzuCiMtAWC7M6RxPOdZ1FUUtnq761vCMTvQSreXzTxyzJfhlLSBVIU/
	VOlTB/iJdd1+XrjpfFReLnTdgtZbB/YPiKHxRbtJwwbeYimx0QjySko9230gcWAo
	UBUSf6Z6hH9O9BurO+RhvKJ2+vf9pxzTx4BZEKnwf+2ojL2eCH+g+nRs1a7j53Hg
	qIQCiLpPg4j9Re+Wowl6dz3msb38ro1avkXwTqK2fpE+GpMDAg/2PKfrLeV8PaM9
	ojt3ncX04PZv91qfQhF3H1eHA+g3XFnVH3NdZNOo62DpFFHUHzSv3IjPtjfh6nh/
	Pw==
Received: (qmail 1339430 invoked from network); 28 Jun 2024 20:39:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2024 20:39:16 +0200
X-UD-Smtp-Session: l3s3148p1@Bs2LkPcbPLJehhrE
Date: Fri, 28 Jun 2024 20:39:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: i2c-host-fixes for v6.10-rc6
Message-ID: <Zn8DU54kExuwKi7e@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
References: <a6byafqkslh6wjsgfotnv3ibkax7gpuvlalf5bgtzc46imy6uu@6b2fsl4d4hh2>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QKN4YVgobVdvcxMb"
Content-Disposition: inline
In-Reply-To: <a6byafqkslh6wjsgfotnv3ibkax7gpuvlalf5bgtzc46imy6uu@6b2fsl4d4hh2>


--QKN4YVgobVdvcxMb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 11:59:11AM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> thanks for pinging me on Arnd's patch. You'll find it in this
> pull request.
>=20
> Thanks,
> Andi
>=20
> The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b84=
54:
>=20
>   Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.10-rc6
>=20
> for you to fetch changes up to 103458874baca0bbc8ae0b66d50201d5faa8c17b:
>=20
>   i2c: viai2c: turn common code into a proper module (2024-06-26 16:07:21=
 +0200)

Pulled, thanks!


--QKN4YVgobVdvcxMb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ/A1AACgkQFA3kzBSg
KbZW1RAAiJsGopyUzTFJsx3bqSDyo0FNgcscbiJmfp9nfh6E7PPu8Qka2Vml37m+
d6nvmTrpkyFsX5gD5tkKtfX55PMNBQ+llQoropazkqo+d2zy1Xq6smi/Sc2Ev0hk
xVA8roq25skDRaq7HDIaEqnor6Rommj/dnIEwEpozg5fmDwlSZrfipIKrPT0t/HB
UIkteT3h5Qw/c/lKTHpgEfPUkIzDiuB8nfUEKot1igP4R9e130Hazo4vDplqO1eg
OlW7FuWB5QwbMtb+tl7QE7tGS0TMMdlDtsTeritnUHo/hNYBqomo804dPttjVe/K
0q+1hwstljLCkscEi1zRGyiOi/RS6qrjOHIHY7q453Hy4PU+MJsaaiDxeBXkoRzj
J99lQx/QuVoJHi1mVb2NEJb5Egn9VNYMK3DcQxg1SrvlYOvpBm0ix+zdnx5VeOWn
OHnGQrxs7p8SZmMYkx6tX9NpN3N62bjiAxtwsBT6PQ45gsfTYpUL+rqKNplqTryc
Ofg6PNPemT1HY0chSKIwdej8tjkc6dOceVuvy0D5BpYh3uGdB1oqizVWEPcVDlN3
FPnvK5kzFAZh2N5TTCQHA5icljkiq5idrVJW8GPlO07paO8RYqoztiuxePH0i2Z3
bILBSo4rfauiydqGKR+q4s+qgdcCBGoytkE+jRZ4bcb1E42Fw4M=
=EqMw
-----END PGP SIGNATURE-----

--QKN4YVgobVdvcxMb--

