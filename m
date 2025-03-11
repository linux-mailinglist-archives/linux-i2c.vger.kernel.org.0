Return-Path: <linux-i2c+bounces-9779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CFBA5C2F9
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 14:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1260916AC33
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 13:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D451C5D7E;
	Tue, 11 Mar 2025 13:49:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938271487E9
	for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741700943; cv=none; b=LtvXFHH6VdUTQcjCYz/CzaMAXSppT/glrcYlKqu7PX+s7qLVH6u5JyFx6ybBiOYHlioLYwkRDwHA0kA1K/9uTi6PVsAJIAzFCgb5GxObIJYj9x7yNexXzFlkac8HQd89uU6KNmBor0pS9yGBJRv32V9uQRJa55g7R9t38OA29C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741700943; c=relaxed/simple;
	bh=DNUukjspIE79aXePimIWQwww4ZJg7Gn6ctA8O/xpu+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edgPh8Pv5jk0NkV7M9ROvLp2R3Qi+NQ8if6Kg41stzxAaLWdUH2IMu4L8M2YtfFSpZL29C/bgWm08Hl9+W/N58jqdozpWQXynUE/d8Jzepd4h1oFrJ3RzKWR//Twhzhv+QZo/QDdj0wPraclLsLu82z8ZuV+ES5xcaqGqIDZc3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (unknown [62.93.210.123])
	by pokefinder.org (Postfix) with UTF8SMTPSA id 69862A418C9;
	Tue, 11 Mar 2025 14:40:27 +0100 (CET)
Date: Tue, 11 Mar 2025 14:40:20 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24 updates for v6.15-rc1
Message-ID: <Z9A9RBmEk4MvXWn6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250311115237.39627-1-bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozUNlJN5jl3veBGw"
Content-Disposition: inline
In-Reply-To: <20250311115237.39627-1-bartosz.golaszewski@linaro.org>


--ozUNlJN5jl3veBGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 12:52:37PM +0100, Bartosz Golaszewski wrote:
> Wolfram,
>=20
> Please pull the following set of updates for the AT24 driver for the
> upcoming merge window.
>=20
> Thanks,
> Bartosz
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v6.15-rc1
>=20
> for you to fetch changes up to f25f405d250fdc7e2e67be8d1732cbbc7cd782d0:
>=20
>   eeprom: at24: Drop of_match_ptr() and ACPI_PTR() protections (2025-03-0=
3 12:08:24 +0100)

Thanks, pulled!


--ozUNlJN5jl3veBGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfQPUAACgkQFA3kzBSg
KbZaHg//UbMmXVwVLu7OhBp9kAtNjisBpzQf9ZJxmGqfdJwp7tp6Y8nso4/VDjy1
bmKDHH8uwN2txQSYxYm+MekyNzfdRxD87hqK2klx6lzDl1K9vqpQkPKJ/IzMrczb
yKxD6GwUMTP71suRWCOrbIgSybuVO+WI/kJgawhbz8G8II5bA8fJhSyCQ6A2nCIG
/QfvotNWOjn3/8YUjwvtgFZgdl8jLBXnnPlDUfpI+NDf1kNG8bPXKtGcXMCXTgo2
mndXjKmdbXm/zkFqmuGRMoE3ITlLqk5U8parxgak/x00ieMb10cSQ4AVrnKHs2SW
wn4963w1KW5xo7SmP6B04nN/jLAWd693A5oVLafxGbo+Ki+nkxIsGjad20+lZwZA
1NG/etW3MbBbQ+2o7Opom6NGWKPJxivKXBJDj6NfGoAlJGUGxwkxt7GBI6CbBPrt
YfMoC5gD+lVf16CB4RA1TqAqwx0PN/KIAiP1Uf+fYOGuDZ4dr6QdjikDAkm28/3p
lvHijJc35gNytGxJEsWQ8bDSufUym27FoqSrD5lfkzjVMt3qLbitwna2nljwc8zK
3TV8t4bAjsg2Ql8MV+u0nZa78+PCosiFRHvC64DDXkU5N5/4uyuPP762C1XjWzr4
CPbmq5Ljt4RhNy031Fg7gjCuFWKZB6PaWr3o2it4/qoy8w/Da4U=
=jL7v
-----END PGP SIGNATURE-----

--ozUNlJN5jl3veBGw--

