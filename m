Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED8CA56A17
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfFZNNK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:13:10 -0400
Received: from sauhun.de ([88.99.104.3]:55906 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbfFZNNK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:13:10 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id EBB9F2C0114;
        Wed, 26 Jun 2019 15:13:08 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:13:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Kieran Bingham <kieran@bingham.xyz>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] i2c: add newly exported functions to the header, too
Message-ID: <20190626131308.GC801@ninjato>
References: <20190624170402.6944-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
In-Reply-To: <20190624170402.6944-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2019 at 07:04:02PM +0200, Wolfram Sang wrote:
> Nobody (including me) noticed that these functions were exported but not
> added to the header :/
>=20
> Fixes: 7159dbdae3c5 ("i2c: core: improve return value handling of i2c_new=
_device and i2c_new_dummy")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Tb2QACgkQFA3kzBSg
KbbSrw//ak4i3/KMe9jY7IkJhw1n6U4SMzW/FO96xDhO0Yoy9nbXb/bhm6pFTjZw
fO78sZ76EkPq9hPQFIMVLdjguhi78VT0VzEX0PVLAjvgT5FuJeV9RuC6OYubFjLA
Qb4dK1EvsK0ByJghgqJcMriB5OePewwTJxo5Ck5i/zM7cKSuSaU9tf9r+fORaLqt
XJjFbt/eb+y1cZtXgGjkeBhqhZvbAiQ/l00Id+7UNIenx8/7FpBpAoluaFJanu7J
ih8g7i7vP/hM24aqh7QdFxO5OlRp18D5MeUWGPs63928hL2q/FpKWZo7LZERskwO
iNbve/2yUjr1wucsCSnaqVECuMOZYwgBlxF4s8bXeO4SMAadlfq+Y7DIw0EYRRb7
nj16lJu1HXZizkru0an+7YKWcOtgSblhOqUWNJxCqLYDKdsKFLXBg+DKlMPqBRPr
HbV/gR/9HCDSbDSX4ebZK/0ZwJw3Y3Eyneum7K/TYk5WTdFOcnTetNT9dwmfPrAr
PePgYwoJMPHLRwsbLXTlBqjDOzt+iNBwzeZ85CUuguqYxw/M7AvImrby9O4M/jLw
cAh6CqvxVqTwydXfMkeK1T5exZHpR5kWdvsoNdakwMNstKRfZLhQoQQImKtIV2hk
5DZnUkEOIpP3fM8cAM//iTR/lLW5hp4Zi2TVl0IHuKHpO7p4XjU=
=+MNs
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
