Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFBA513CAE9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 18:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgAOR0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 12:26:24 -0500
Received: from sauhun.de ([88.99.104.3]:38752 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726778AbgAOR0Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 12:26:24 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id E1EC22C0742;
        Wed, 15 Jan 2020 18:26:21 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:26:19 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: parport: move include file into main source
Message-ID: <20200115172618.GA1239@ninjato>
References: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
 <20200113210643.5033-4-wsa+renesas@sang-engineering.com>
 <20200115151743.63e6b02d@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200115151743.63e6b02d@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +module_param(type, int, 0);
> > +MODULE_PARM_DESC(type,
> > +	"Type of adapter:\n"
> > +	" 0 =3D Philips adapter\n"
> > +	" 1 =3D home brew teletext adapter\n"
> > +	" 2 =3D Velleman K8000 adapter\n"
> > +	" 3 =3D ELV adapter\n"
> > +	" 4 =3D ADM1032 evaluation board\n"
> > +	" 5 =3D ADM1025, ADM1030 and ADM1031 evaluation boards\n"
> > +	" 6 =3D Barco LPT->DVI (K5800236) adapter\n"
> > +	" 7 =3D One For All JP1 parallel port adapter\n"
> > +	" 8 =3D VCT-jig\n"
> > +);
>=20
> Isn't it considered a better practice to keep the module_param (and
> MODULE_PARM_DESC) close to the declaration of the variable itself so
> that correctness can be easily verified and changing the type later
> would be easier?

I tried it for both module parameters and it looks much better, in deed.
So, fixed it while applying, thanks for the suggestions!

Applied to for-next!


--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fSzIACgkQFA3kzBSg
KbbeUA/9EXPtJq97HunOJULb9s7k6hWbGwavD2JLEeljSvI/2/1NdsMqsN4rJ14y
2iRhCsOglTDv30KvJ96GHJdkibvLRhzB3ltTZfP53qhObrw9J0UWraJOoPZ0/Hx2
NDX5X5zEvPBWhyH7IOMqQJZePbIuMl8oVZ9BbzWC0mbG9RP2t0xEcBF7KCn0vgWf
qoYqoiWvybimT+7L61jv2r5/QyjKhsbZRVhFmBzP+54XksGkSlMerxvHWXS+pXfR
AuYho9cBxjRixIhkXrxh9BkQrhJ0bSq2z+Pf+EnbOaAf4uxsJ96iqozkHuDNSUKb
iIw71ZI8IGm2W3YUWB2BuVgKxLEwtLvFq9Y09PINmVXVYQr3BYLr5qsXADoXvPJ2
utn9GZwZmHOaiPOfK/gsvYn22Qq13VfW3KqUq0U5nwT8QyHo9XfKFsUenj18JUhV
BuZ26j4N6X1NXewB1z2qsNZ1WmTFLtri9O52UKPRjojqatDKs4C15Ztu63i8Npod
fYnY6+R4MU/ezXT2GtzKU7JLNAKRw43ybHw4GPqYVEzY9bv6pbP8MFPo2L/OKQ7h
n7gXYP8VZsKu3XUR3wS8Zq3VzDWLbID/NmTu8dmAeq4WOh8zsYTV7RuzNp2Mmbud
zVZyEOViGDAgWTkd/xTOpaoEFZ34F7Hru7b1pFrMRYSQN6dhgCI=
=MeCn
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
