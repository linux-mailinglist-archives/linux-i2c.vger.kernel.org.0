Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAD501368B0
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2020 09:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgAJIB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jan 2020 03:01:58 -0500
Received: from sauhun.de ([88.99.104.3]:56170 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbgAJIB6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 Jan 2020 03:01:58 -0500
Received: from localhost (p54B33279.dip0.t-ipconnect.de [84.179.50.121])
        by pokefinder.org (Postfix) with ESMTPSA id BF2762C06B3;
        Fri, 10 Jan 2020 09:01:56 +0100 (CET)
Date:   Fri, 10 Jan 2020 09:01:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: fix bus recovery stop mode timing
Message-ID: <20200110080153.GA1057@ninjato>
References: <E1igWvB-0001ib-PV@rmk-PC.armlinux.org.uk>
 <20200109212410.GA3046@ninjato>
 <20200109214103.GU25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20200109214103.GU25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Applied to for-current with the comment kept, thanks!
>=20
> Thanks.  Sorry, I haven't had _any_ time what so ever to do anything
> further on any of the I2C patches I submitted in December - this is
> the first day since the weekend that I've actually had much time at
> the computer, and I've had other stuff to attend to.

No worries, I know that too well. Most important, thanks for the fix,
great to have it.


--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4YL20ACgkQFA3kzBSg
KbZUTRAAiB6Pyry71LQZaNpqN7jV6Jfg9xWxBqLXGkRmbD3l/abeisN1zYCLrzbi
6DTISun7GAH/qpcA6C4UeobPpj1sl3WKY94T2MgID/biAA6C/Gs/y61mjmHrwFxP
1zdRj2MjrJxCw9SnIKoOMGYEYZHFH8esxK6m9bITZgmhOtsaH4shaR5Bea6MK21a
OQ+eXaCx8V9bElVgut/kcy0psS3JrK2q16V5lVjfY2QSPkHzqQ37sX3kuWo5bpnY
yHUcc+KNczl6EL02Nu8TlwcuXIXzFdIUrjQagCg4NQdshOAJMlR9YginsK89sKkF
sPADuafYwZL+b2bx80Vkyiaowt9sbEdEpaXpQ+Pedl0ZtqgSBwwcX1yX4jaOq5Yk
kLXJcnjekSYonSteCDOrTJ1KJzaK7ibBovZZ+cj2j5pB5Qz2Az1pbfhnxJEwoo0s
39/luJRrjpXjMw1x8k9FvbTV9YBQChIdsAyN1aM9EKDZVSU5SB/+ZGUGq4Wx86xy
fCFneC25U6ngWmib3pevxiGismaNY4s8/yP79CVZWdz99myeTRqh0LsvvyFk+0B8
gDEIx1eyF8RfNXvA/S5Hi7TVgGV7fwhEq/PI9+Gzcpsyo8G8FPoX4tZbtXJVaoWm
ycDdePkSgfPhaRxLFhuCm0RwqnAh8htnfDaG5JOvAJtCd/gc36w=
=ZaWo
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
