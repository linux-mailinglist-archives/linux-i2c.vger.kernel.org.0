Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 257A0AAD04
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 22:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388073AbfIEUcN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 16:32:13 -0400
Received: from sauhun.de ([88.99.104.3]:60756 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387491AbfIEUcN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 16:32:13 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 6C0CA2C00C0;
        Thu,  5 Sep 2019 22:32:11 +0200 (CEST)
Date:   Thu, 5 Sep 2019 22:32:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c-eeprom_slave: Add read only mode
Message-ID: <20190905203211.GC8989@ninjato>
References: <1567695164-20464-1-git-send-email-bjorn.ardo@axis.com>
 <20190905161521.GA3695@kunai>
 <1D4EAF68-973E-4E25-AFD8-48815E0BFBC6@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline
In-Reply-To: <1D4EAF68-973E-4E25-AFD8-48815E0BFBC6@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > What about:
> >=20
> >    if (!eeprom->read_only) {
> >        spin_lock(&eeprom->buffer_lock);
> >        eeprom->buffer[eeprom->buffer_idx++ & eeprom->address_mask] =3D =
*val;
> >        spin_unlock(&eeprom->buffer_lock);
> >    }
> >=20
> > We can still keep only one exit point from the function this way.
>=20
>=20
> Yes, that is better, I will fix tomorrow.

Thanks!

> > "ro" missing. You haven't tested this entry ;)
> >=20
>=20
> Guilty! I discovered when I was about to send the patch that I=E2=80=99ve
> missed that eeprom, so I added it there. But I discovered my error
> when I backported it to our system:-)

:) I found v2 afterwards where you fixed this already.

When sending v3, please use this prefix in $subject:
"i2c: slave-eeprom:"

'git log <file>' helps to see what are the subsystems preferences for
prefixes.


--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xcMoACgkQFA3kzBSg
KbbQGQ//eq0EMNKlnPSnJmINTTqH7I5udFsiaNhzOiwMOXMS1lBXPDDLPMYhrN2W
rXf640+hI6d6m9M7NrnhaK9WBmb/jZ98zoCedXz8kIu6cQgjrqNGr+PoEgKZQlBm
5AMlBa8dN2BRowEewmEO2heH+VV2S0ZqXBAlXzD85VMoJtwmT9y6TzTwps4aLROM
G0X6TX+coqqgu76O/D9l5MDzYwgpzuaNmrPKHCpBIJOi8bGicdCwZkAYsJpNL69o
sRJOjZY0fuZV8WG69ER3ZhlTDAsC0OjmoAHVQAJnBXA+HY/0l7ZVQDJ3Y4X7rJx2
4iMAqLyrb40v9xr9pBEmuoZC3dTRogblBKUejIxeq5s0IeLh/TckpPpqYp32eVsO
sk3rWLpjoP5G1Upi/mSfcqcs9edp/N3w8KBGwh4fwY2cyvbXkmPYKKbsF2DKOFK7
qepmxncXot8QT/gPBsGPK3zqgEIP5KFdlLKvTbOMcDpVh4P3DFa/qp8GrJt0XTR8
bJMFrCuClrSS8g9sbKj1Q4ieIUXyTIZ31B612mvGYofntt4B3beg3X7h/sWUNTjH
MAGjLggx447l/hbexiewvPYoVFFSOxFfEtOkDN+K/7QMvwVy90Ohwh97J0rLsSAg
sX4ESt7WDXsbIdrWXrEmNr9ssfJWjwmGB1AJlTuD4vV+HcLyY9c=
=2gt/
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
