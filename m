Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 492C518D212
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 15:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgCTO5v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 10:57:51 -0400
Received: from sauhun.de ([88.99.104.3]:49360 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727133AbgCTO5v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 10:57:51 -0400
Received: from localhost (p54B33339.dip0.t-ipconnect.de [84.179.51.57])
        by pokefinder.org (Postfix) with ESMTPSA id 9B16E2C2E8F;
        Fri, 20 Mar 2020 15:57:48 +0100 (CET)
Date:   Fri, 20 Mar 2020 15:57:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jean Delvare <jdelvare@suse.de>,
        Daniel Kurtz <djkurtz@chromium.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in i801_isr_byte_done()
Message-ID: <20200320145748.GD1282@ninjato>
References: <0000000000009586b2059c13c7e1@google.com>
 <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
 <20200222124523.GI1716@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Content-Disposition: inline
In-Reply-To: <20200222124523.GI1716@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2020 at 01:45:23PM +0100, Wolfram Sang wrote:
> On Tue, Jan 14, 2020 at 10:34:06AM +0300, Dan Carpenter wrote:
> > Assigning "priv->data[-1] =3D priv->len;" obviously doesn't make sense.
> > What it does is it ends up corrupting the last byte of priv->len so
> > priv->len becomes a very high number.
> >=20
> > Reported-by: syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com
> > Fixes: d3ff6ce40031 ("i2c-i801: Enable IRQ for byte_by_byte transaction=
s")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
>=20
> Daniel, Jean: what do you think?
> Also, adding Jarkko to CC who works a lot with this driver...

Ping. Adding more people...

>=20
> > Untested.
> >=20
> >  drivers/i2c/busses/i2c-i801.c | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i80=
1.c
> > index f5e69fe56532..420d8025901e 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -584,7 +584,6 @@ static void i801_isr_byte_done(struct i801_priv *pr=
iv)
> >  					"SMBus block read size is %d\n",
> >  					priv->len);
> >  			}
> > -			priv->data[-1] =3D priv->len;
> >  		}
> > =20
> >  		/* Read next byte */
> > --=20
> > 2.11.0
> >=20



--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl502ewACgkQFA3kzBSg
KbaoARAAtfTyKYW9Ul8/37lfwTcF8GkKRTKd3Iasdo5yXbIx2HvPVPkl/fhoNQzO
Vm6pbplxg27UWwBfqLgxRBS4AHx48ANi4X0BQIqeYKPl3hetOhHvwOzwWrfMwK0F
AsMBtJsmSqqt9uHkuteOLnYHXxfoF+8ye0Q6QO3vStWP5FBfHlw1VrwiU0uZ3w+E
90ui9TPeSLp5WTXi4idgEc51blujdoXVceMDUwaSvJ+ZSl3SJIDuiPXOt5I7H4e5
q0vDW8mCj8l761YTOWExa8wygw+D/qDEblQC9vnj8ooCgL0BWFC8wH62PLCxgHjb
4tKAy+bWtzr3VzgfEnj0EnlLMMFxZ2oOYm6243SUwSOa+vbZQ4uSt5BDaLJmuaOO
TZtWS+iNBytaHQNfFcBOfFlx3c9Z852iiSRrV4WLMknTszHOAuBvRJi4MRFoVi6F
oUeJWi46KeNrpC1D2QwP1TcxlDWJ29DMsOVV3ix/fILvsHwIkcGLP74xjw7ZELxR
tBbLBHWi3v71Ejs3VV75L5MlcsJgOUDJ/HLuz5E7lOZ69uBSKXCSJqs8e3xKF86S
qbRGnZ/Tkfu+6PRn1PtN6ULQXa4NBIXPF3bhvdeq2YtF9+xsocjSMWdono83Wp/e
WWZT2TZmAL+4Wvo5Nt9f2JKWRSmF2afUurkOjiRqmK3PrCKiFF4=
=sTjl
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
