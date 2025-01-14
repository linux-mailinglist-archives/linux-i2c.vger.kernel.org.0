Return-Path: <linux-i2c+bounces-9077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3443A103F2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 11:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7237167ACC
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 10:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9AA2343BE;
	Tue, 14 Jan 2025 10:23:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15571284A75
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850182; cv=none; b=heuqHhZO3VVEwq1mrMP0zE2TIG64G1waIhlRL1uA65WO3xWDO0WNcA6tD6TglUglKfxGbX47ffoKDd4Y6CHkgKdirvrWkXaolSX4yScdThhyhC1gw6oppDX6LybQ+vziLcjNixBTx/uAbIg1aUc0aGIdqXY55UXIgraD1pelbkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850182; c=relaxed/simple;
	bh=U4pHEEchK0FWRlFiPZXECB9+JnAfjF9vYSWDlHHlw54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0RcWjYpYb46/nFU0KU7o7x0ZTlZTCjQU2AcyPxRaqF3aaRNJTpmbA3VSec8y0GlsM+qjq6Q0nol7sHIDpGrao46y0zM0h1N4Md3jjFFTvxiwO+PyU92eIejU0ztav4y9kdEPtrTExOVpFgveklOiX72LueogAvrqBgycUotywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (ip-109-40-242-210.web.vodafone.de [109.40.242.210])
	by pokefinder.org (Postfix) with ESMTPSA id 220D2A42F9E;
	Tue, 14 Jan 2025 11:14:51 +0100 (CET)
Date: Tue, 14 Jan 2025 11:14:50 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24 updates for v6.14-rc1
Message-ID: <Z4Y5GrcNwfUY0SSv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250113081326.10694-1-bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cFJZuRHm5FCyaOfS"
Content-Disposition: inline
In-Reply-To: <20250113081326.10694-1-bartosz.golaszewski@linaro.org>


--cFJZuRHm5FCyaOfS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 09:13:26AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org
>=20
> Wolfram,
>=20
> Please pull the following set up DT bindings updates for the at24 driver
> for the upcoming merge window. Details are in the signed tag.
>=20
> Thanks,
> Bartosz
>=20
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v6.14-rc1
>=20
> for you to fetch changes up to 36036a164fac96727ed724a388dae38d2f5f21c1:
>=20
>   dt-bindings: eeprom: at24: Add compatible for Puya P24C256C (2025-01-06=
 21:20:31 +0100)

Thanks, pulled!


--cFJZuRHm5FCyaOfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGORoACgkQFA3kzBSg
KbapKA//SXys5enTUwEsxeFK1IzpjrIxRjjVxScMlLXlEeaG158XyXA0DOnIpQHf
8eQQG682fPVkQ3T1j0JSOIUiVG6WUC3fhNGVFZYsJSdIrBhzdR/xdSwr41e5cvHq
VJGPcDlhKc26iefphEKoP0THhFVYKKrULhcQWx9iyVgGkKg0arzy08dogHLle5mY
iwHHmdPkl9lZibTpofDUs8keL7o0xk0GxFKjE4B1jbdSa/eSQ3aPn9/X7WUb+pG1
2KjntFc0JSQ2Ok+kZ7L1rKz3qpgkJ/m/LEMATuWg3C8OkuGcj9A5XXtLIR9tTSGu
R9/CP7CCl29ZofWyThirowmQMwzMGhK2pHdd1MoS1gWYqBa0ZX2ebIbmiyvbpu7u
1T4N4M80BBRSzbbqPo0yVBscPdQljKhnVb0SYhaUv5moVcX7iWqS2JIZoTFDgp/Z
l7d13/rcsq4f/3ij6L44rYh7b3mM49lx8pkA5IYHw6UW3oPhqF2PItbnvVHtBh+z
v5k2hvVldE8UqU77/A6ixrQp39kfvdw3bT+RB1NqxGUcC3ygcKDLrAY/A53tm44o
Z+waM+OHRdrUR47H/LJeyV0BnCPELEMZFuojs9WiRfGxEpp8rj2rlJMXWxZ7+MHf
4GVPXXpTlfzUtK3D+ku6SVZJ/FpYAVME+LS5f5zaih17qm+RQys=
=Ywb4
-----END PGP SIGNATURE-----

--cFJZuRHm5FCyaOfS--

