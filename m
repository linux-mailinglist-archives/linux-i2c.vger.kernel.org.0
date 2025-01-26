Return-Path: <linux-i2c+bounces-9202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A79A1C775
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 12:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E9A16626E
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 11:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401641531DB;
	Sun, 26 Jan 2025 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SamvvRxj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D75A86358
	for <linux-i2c@vger.kernel.org>; Sun, 26 Jan 2025 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737889355; cv=none; b=Pnq/uPPPCGeHrfUqrfNhJfRvn/cAFJqqQVU0BmlRKfti6zk9BDTfH2v2k9koWm9LhjlAY7LQ0y4f2oSiEjROcx7TVaXpDtkSJT9Qz7QqOiFnuWoVJCq7OF5uJX1H38alGtfyQWCdh77Wt7sqWjrO4wL6++EALn9z83JRaVLLU2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737889355; c=relaxed/simple;
	bh=8zAmz8OB41j96Q7KV4VIjD0iXA2RX+ZUzVnE3LIHoEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQoZQf7MCEDR81/sqOhc0MhJpyAlYwWvuX9KGGGFNJbIruP5IBzNP08nVLjZ8ViPNOx9mXVRkyLCk/R60mNXc1Np/3NlJdTUafqGkthieng9mEv9zVgby6wAZ9lonEyAGizZJXFcoO6bEASfJ4SnqNcT9mUCaId686APRP6P0+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SamvvRxj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ol4a
	suK6qOR57D2a52hdUZj/3fpyyDIV6ul9MEAJKDI=; b=SamvvRxjZUmko+TgcS6L
	94ojvUDt2Pjc1vp10PJ0NEPCs0lGwb06zUwAs3tdsXU0I2x+qi+QEVxpw8SIeAw/
	jR6yhHWfdfk0N6oL+9GXSapKGwgxpDY77Y+L60s6YYdpgKKlFYZuQUKYZqH5bwmR
	bitIA7WpRafy1f/fRP68UV3j00ONe+LiA2VZszKSkXvESTZHy/13/6djg7ihWPFX
	G6g1uA2CBAayKPFa1WRM7YICnAt0lUe0rnK6ECtdOkHK1L99obD4EL4i7dxvADT3
	VZogresAXjujmyf+zBWOgIidnrM00gCc0n4nqdNZzVj/JdpCr1f/MsFqFTCzMBwj
	iA==
Received: (qmail 4103285 invoked from network); 26 Jan 2025 12:02:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jan 2025 12:02:26 +0100
X-UD-Smtp-Session: l3s3148p1@Pqkj5ZksVusujnvm
Date: Sun, 26 Jan 2025 12:02:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Carlos Song <carlos.song@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: select CONFIG_I2C_SLAVE
Message-ID: <Z5YWQr5fMcSIUIs0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Carlos Song <carlos.song@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250122064906.1220557-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jZdKQjmPvjIeh+Vg"
Content-Disposition: inline
In-Reply-To: <20250122064906.1220557-1-arnd@kernel.org>


--jZdKQjmPvjIeh+Vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 07:48:36AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The addition of target mode causes a build failure when CONFIG_I2C_SLAVE
> is turned off:
>=20
> drivers/i2c/busses/i2c-imx-lpi2c.c:1273:10: error: 'const struct i2c_algo=
rithm' has no member named 'reg_target'
>  1273 |         .reg_target     =3D lpi2c_imx_register_target,
>       |          ^~~~~~~~~~
> drivers/i2c/busses/i2c-imx-lpi2c.c:1274:10: error: 'const struct i2c_algo=
rithm' has no member named 'unreg_target'
>  1274 |         .unreg_target   =3D lpi2c_imx_unregister_target,
>       |          ^~~~~~~~~~~~
>=20
> Select the Kconfig symbol like we do for other similar drivers.
>=20
> Fixes: 1ee867e465c1 ("i2c: imx-lpi2c: add target mode support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to for-current, thanks!


--jZdKQjmPvjIeh+Vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeWFjwACgkQFA3kzBSg
KbaMjA/+I9fNmnXGh+GHAyhdbvPwzumEWY1gezvK7LCQSoRbEqUgTGa8ecZLaV1i
37b6u3E22Op1GVE+LWC8mldkVB6f3pyCuYr07HAa01ahH/DA0OxEbMFCXdxnQR0X
WHPm1hvZ4i//vYpYPO/GCwQuGZGkR9ChZ67RyZ/Z8nazsrEqFR63PCXXlZ1jQrXn
72f7v/dLV66vaZxrFKACFylzMQb6CYEj7eJ833qayHoXFjIcEjqx74Ufla7fiLpP
nBzPkQnAaR2b5i4NoixmJuXeouqgXJZxFSeqwS3eKhLjeWn8byR59DVomosQn+e1
i1ECSZL+pkE3WGRyFrjsOdZGNkC+yB/KTgAc+6Jtl52zUDpjsiIJEn8/6XauOwq+
XmPH/KoDT5M3Qd/2mMfx1lskxftVXccsY+ZAWrASxOnsRNBLBnf12JLTEy98ntn+
53GYMrgwDusKET64FNeNfRg/c/vscluTg6d8EHkz9EXpe8JJHSHnKwj9pXZDrx2v
s6PVJAzU7UVODLZwKMvkGCcnZtjJG9s1jBA9TB3DwpsdwEOguPuMz2JTFlj/GKwN
/y0wRyUfeHhcPKVfBSTHYNka2yBiraTfRXHzxgrBILQ49qA43983JoBtBNz/NyS3
YKKdTMWD66eW09e1LoDyiNDvRi5TGByeByKvr1nWTi8WXZY6YN4=
=Y7F+
-----END PGP SIGNATURE-----

--jZdKQjmPvjIeh+Vg--

