Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4F32D78BD
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 16:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391048AbgLKPEl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 10:04:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:33858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437634AbgLKPE1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Dec 2020 10:04:27 -0500
Date:   Fri, 11 Dec 2020 15:44:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607697888;
        bh=vwrDMTV6ono8gbpx2Il2cAAR2idDXYM1O4xSUpotKQo=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=ijeBV0eUraQg2sgAFpKvESHIS9d62RFjcZbvXaID6KqoBP5P7oJELG/jz0IBUFgaE
         XQebAKXRTwep1umX0hv/iqyigFXhPT38zQaGAhg0pK53PnlYDNzFcN1CAQ7MDB4coU
         hhjlHAlGcR+2iF5s53pji9UqkUrYs9xJ3lVY5gXaiZoza1qeGpahkR/Hi6zso8vx+y
         gD8Pq6RnWrrAzvUknlFUHv/jsdKFiMFsn8MU4Zj0j473fmM763Sgt0tTxtMi5wlUvT
         UsoR98CSVHY563Qgk+xPsyYf3PHAh6gHh1LW+fXorvcYfrHqTcY4URUamULP/kejMe
         t9UycjL/Z33HQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] i2c: remove check that can never be true
Message-ID: <20201211144442.GB1990@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
References: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
 <20201126072331.1737632-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <20201126072331.1737632-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 08:23:31AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> A driver remove callback is only called if the device was bound before.
> So it's sure that both dev and dev->driver are valid and dev is an i2c
> device. If the check fails something louder than "return 0" might be
> appropriate because the problem is grave (something like memory
> corruption), otherwise the check is useless.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/ThdoACgkQFA3kzBSg
KbYicg//c76GkhL3LvKKOTAtejCg8epPB40qxOeXP8H/qlxSu3y2hsfr2ASsb+Z6
RkhnqCTCoYQJQLxHIAY9+mb406L4MBij13kv6OuTsmboPMhgNHaTpflodZIh8REi
YkOslaRzK1PE+rZoBuvbB0EzjT0FQgTR4gOBnALMHhtkfBjZQBcyWGMfR5WUpIyI
bql/PPwnKAPwNHzAbYV10AaScdBuJHNQWyC/K1Ol43nXCykZMguzugG9uD/KPgcE
prdF9ltKUH1GKdgdIYjOTJaZqpwDH4dTum+Y5jeVQl0wCqwVhY2ZLLPHIc/E0q1H
gbZtF0qSd2k9C9GlIPfzRLb2Kq7fdjmD94iblWOfq9h/pdo1ZE9uSz8FOKNb8Wyn
0oPFlLmFjWY9mSNw2JrXY8+y+vVw5uUtJeYm3a5qsOKIQuD6GxFU4IORve7drTWo
UyPQUn2AmTLWMKxfi5SVNpKE8ioXXgrFlnubsjhQvWuWnqU0VBYvr56IwSVdhLki
44NSqh/wyMvyt1+TaPSOi9G1pz1uDzIrREXPGGDvCx0XD81SsC+t0sJpsVQRRp3F
eb3ifw4UGvllkuZX5VmOsjd75yV20Up2Sqg5E3SGkDK0RGRDOTEi2LA9o2Df8iFI
z0hH/WU5YsrwdJu+gOPhBjwTWHYBfGqJO9VZxHQKYIWCG+0a6ok=
=azQN
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
