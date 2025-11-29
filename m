Return-Path: <linux-i2c+bounces-14338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F258BC93D67
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 13:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 093CE4E1F86
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 12:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614A1261B6E;
	Sat, 29 Nov 2025 12:15:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DA138DF9
	for <linux-i2c@vger.kernel.org>; Sat, 29 Nov 2025 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764418539; cv=none; b=lVSPRJGQBvvDbQT0GgZAh0+soTwo8lB/yLZsGPCZAiBY9Mo0zpAiLedNMpdqJQkFGomAxIP1rhbbY9EzGiknzOypYQ6X+YUydtD/MhDVtwWcqOGfQeP8Q0pdlq5seOk7BOdAlbassj41Prnygufu9UUXKBpkJ+LPYJPMHu/gfRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764418539; c=relaxed/simple;
	bh=5LJabd6Xln8NBD/VstwFc7RK/xmS/iTzPdMHjXcwy54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYyUbrbcroSd4rw18locMMZ198vP0WAlH1LavkA5ZtTAJ7ZdarZ4keYibzHpYj3jE4fISqREaRn4Lts+t2KRifF/ZOzS+EvLotL/F4oxZUqHUKbDhnBO16cDjthtYuizmz1FGJcj1qYDqfn27DFLA9zSjp2ODl4XBDgHf2M65+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (221x250x229x50.ap221.ftth.ucom.ne.jp [221.250.229.50])
	by pokefinder.org (Postfix) with UTF8SMTPSA id 6E531A44838;
	Sat, 29 Nov 2025 13:09:34 +0100 (CET)
Date: Sat, 29 Nov 2025 21:09:28 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24 updates for v6.19-rc1
Message-ID: <aSrieNBinyWw4KoD@shikoro>
References: <20251120135430.33476-1-bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TKwts4e3bd/vcqRi"
Content-Disposition: inline
In-Reply-To: <20251120135430.33476-1-bartosz.golaszewski@linaro.org>


--TKwts4e3bd/vcqRi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 02:54:30PM +0100, Bartosz Golaszewski wrote:
> Wolfram,
>=20
> Please pull the following AT24 change for the upcoming merge window.
> It's only a single update to DT bindings.

Thanks, pulled!


--TKwts4e3bd/vcqRi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkq4nUACgkQFA3kzBSg
KbZrihAAqv2Rf+eqsz6BXqVVLmubgcKdvZ0t1/52v6vYRTuvrDaX+7aZfH+8XX8d
eLeTG1nXTH4YkSiqYDBA7SaeVpY+OA9shaq8sNqY4v3LOF6Q62frD2JpzF0DCzMM
L6PfbvMUXL5jN6XM1yTCnfZtPJ2lm4T3fSc6HPh63Xm+NlcdZta6UQYG+YTmBPsj
ugSqztjNQpnMpMpGMxcPHDlwRLtAVht4R35+C586I+XbBTBlOl1pjO+aqvDaTHzf
3ud/yW0aG1sqfurqi2waPQ1QBvpJ0+ArNSSukizmuXUPSsIQUFYNfVJnlGTzmC+x
bZEePxiZp4fP8t8FRkQ7Y18WCDefbYix0595SyzKhRIjcvFgFCqE/lPNsQVYLWR9
GV4CcB6yOgIenJkZpcpjkbnzQ1zJxxehOoBEaERcSBOlPChNmhJ6XEfzPJK5Z3oS
WAITzZUC/VMVOCqqJ1rmt3x/NXCwv7CTCF5lr5VK10Pz/C09m/Al/iIlV6JZ+IZN
3JfpAQDpS11wQvLpxK2wnT1ZUnRcOF4GIyX4zY0bAmpWtieAaxCxEerL7YH2s5kW
6v7L0j6oy9iUeM7JXw+EADXaLWViwXLAQQCz1Yn1gTlCbaoss1UVO6BEOGVogAGK
QsaX/Q27QKOskI1Ljfn2x0mwadfowq2qtql2e2/gQq7uOrNg5HE=
=Puwf
-----END PGP SIGNATURE-----

--TKwts4e3bd/vcqRi--

