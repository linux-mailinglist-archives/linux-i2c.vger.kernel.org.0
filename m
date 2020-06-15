Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BF31F9802
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 15:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730111AbgFONM7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 09:12:59 -0400
Received: from sauhun.de ([88.99.104.3]:37956 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729875AbgFONM7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 09:12:59 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id D76A72C1F6B;
        Mon, 15 Jun 2020 15:12:56 +0200 (CEST)
Date:   Mon, 15 Jun 2020 15:12:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200615131256.GE4423@kunai>
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
 <20200614093131.GD2878@kunai>
 <CAMuHMdWA82HpLAjYBK0fHm=wTM3LGjKn_c9KRH1EZTi8UznrBw@mail.gmail.com>
 <20200615124834.GB4423@kunai>
 <CAMuHMdWbZ8Bs84naNtoPk6N3itXABwwE2KGVG3k4dbw_5+Qm7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWbZ8Bs84naNtoPk6N3itXABwwE2KGVG3k4dbw_5+Qm7A@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 02:58:59PM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Mon, Jun 15, 2020 at 2:48 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > Uli: can you check if atomic transfers work with the touchscreen or
> > > codec on Armadillo-800-EVA?
> >
> > Atmoic transfers are used for very late communication (e.g. PMIC).
> > Touchscreens and codecs should be already down, then.
>=20
> So how to test atomic transfers are working if the I2C controller is part=
 of
> a real power domain? Add a fake PMIC?

Hack something like this into a driver which is executed late:

	struct i2c_msg simple_msg =3D { ... }

	adap =3D i2c_get_adapter(0); // or whatever number
	i2c_transfer(adap, simple_msg, 1);

You don't need client struct, you can hardcode some address into
simple_msg directly.


--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7nc9gACgkQFA3kzBSg
KbZMPw/6A3YFZEys42GsFNdtLVSoGijQYOBYVzq/1c+Ufpmir3cKl7Dnu5LDG08v
R6paLfgHjkmDTp09MRsvkzrlUgucLh4/TnOPoJZqU5c956uQraiflxtAD0EO+/wE
i6uBsTzpYDQnE6n1P3LRtx1feWJ3LuqwYkBaOi4y+C+aV51WD+DcpCfVLIuXUUsx
8ADob6qH3rVivS+o5iCpdBtEaZrBDovBj8fNgIZP2Scm6b+Z+nsDyPB1GMV1AgsK
yS5O9Iq3o5ILRYF1j3tCwJHQbKvhMEuYcEl29cyDX0rTHvrceWGVNk6eL2HNPjN2
eJ2Y6scB5Me4fzEcEkR25X2WXXjCYnbw5tGnUCv7Nt37a9TtOzt6EAJzbY7cnzFK
Qx6zgveU5gjrvLlkHch7rIhVHjGHeCkl2NbUKtCI+55McXUfJs+XWj++wJMRx8bd
EGQ5te7L2ON7r4EHR1abjhBa82KaJrIubjuo9lN6Bx/jXPe8eNT2Xrjq8y2daycW
HRV+yn9G3XC9SGbreujdfPdXLZorZvL5ttUGmI7HefcLQCORamas3djVc+gm5ueS
WkRWoJmqK2VvTVRcN3OQ7PPKgjdNnU10v3NuDphxhmP2bNFhRfX09BMEq+rrf4Gx
c4sydb3Wet7kIagWZXNRBAWJ5iF8DYC73QuIcJ/ouMR/Lwj5Or4=
=BmCE
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
