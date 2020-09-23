Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198F5275CC7
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 18:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIWQGe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 12:06:34 -0400
Received: from sauhun.de ([88.99.104.3]:49986 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIWQGe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Sep 2020 12:06:34 -0400
Received: from localhost (p54b330c5.dip0.t-ipconnect.de [84.179.48.197])
        by pokefinder.org (Postfix) with ESMTPSA id D2AC02C0905;
        Wed, 23 Sep 2020 18:06:31 +0200 (CEST)
Date:   Wed, 23 Sep 2020 18:06:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200923160627.GA6697@ninjato>
References: <20200922154943.29574-1-uli+renesas@fpond.eu>
 <CAMuHMdXF7kX0u_awH3w8sCAvAQUN7dzZix6anSrrafwTjpLBUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXF7kX0u_awH3w8sCAvAQUN7dzZix6anSrrafwTjpLBUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> To make sure external conditions are satisfied, and we never deadlock:
>=20
>     if (pd->dev->power.is_suspended)
>             return -EPERM;  /* any other suitable error code? */
>=20
> Perhaps this can even be done in the i2c core instead?

Good question! My gut feeling says "i2c core", but that would need more
research. I'd say we tackle this in a seperate patch but also for the
next merge window. Sounds good?


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9rcn8ACgkQFA3kzBSg
KbbBZA//X0ghNsv3tq4yJ+fXFHxwlhX9mfiJlgqUYhO3+sq6FWdRhN7uKwkpW4ir
3G1KMP9AU6ZG3UTPuj68f1fyDqbSwux4YKzqiJTlKYXx0iW5qdQt7TVdng5Pj7KO
xa8Js8P1uzo1P5MUyaKccrI65QUcjZ0ZxzIf85VVX+PHieycz1xj0Abx7Z+SlwmA
WuJ2cxKmy5iL6x9vHFzLBxSOppQJo2eWsZ8bwH5e7XAoFRy/R5+6uMrfcfEgCyhv
wgWS577uuXWs2uQTS1zDtWAsQWnspYwl76pBGTwm/rW64wZtAwrm9Sr4cd8iiKk5
sivtHVMBOlHJv48Nozjqa5xEzkezrzsuz6LlfnLZ/oRmCvdgdkGIugOU0lIDtLp2
IXXj57qIZrGz7rX0B1CtX5Jvn+IIZUSAOcN8uMnjQ6aR7bA2CoznU3BpefI6Avze
GnHhZUXxwpr2lmf4A9KiyAYuZQE9b9IZL+O+82d45km0D8Sv5Di0jFGO9k2oZeXz
oan0ys1m7eipEE2/CqscufAUQXAVxxBwqv1LSQ/z28FlpB2h4CIzSdP6DxgxqnW0
CEm8fDq7X3KncdxdGG14wa2aDF/XdevJ/9UWOanAUDQ39cDaqouCwXlUD1oeFQmn
wU5wLBrU65QdN/Iu6uhDDgMcaVz0b9AcfJWrJNXsZIEhNDWjLkY=
=JDeM
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
