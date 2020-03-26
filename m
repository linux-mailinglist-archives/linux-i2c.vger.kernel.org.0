Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E32193D51
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 11:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgCZKwo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 06:52:44 -0400
Received: from sauhun.de ([88.99.104.3]:48862 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZKwo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 06:52:44 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 9144A2C08C2;
        Thu, 26 Mar 2020 11:52:41 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:52:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
Message-ID: <20200326105241.GA1538@ninjato>
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXVy1acwXxD9C==gGve-Xb-oPbF7BOpu1BaT=1gvUTdQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXVy1acwXxD9C==gGve-Xb-oPbF7BOpu1BaT=1gvUTdQQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +{
> > +       int ret;
> > +
> > +       ret =3D device_property_read_u32(dev, prop_name, cur_val_p);
> > +       if (ret && use_def)
> > +               *cur_val_p =3D def_val;
>=20
> Alternatively, you could just preinitialize the value with the default va=
lue
> before calling this function, and ignoring ret.
> That would remove the need for both the def_val and use_def parameters.

I can't do that because if !use_def and ret, then the value must not be
changed.

> > +       if (t->bus_freq_hz <=3D I2C_MAX_STANDARD_MODE_FREQ)
> > +               d =3D 1000;
> > +       else if (t->bus_freq_hz <=3D I2C_MAX_FAST_MODE_FREQ)
> > +               d =3D 300;
> > +       else
> > +               d =3D 120;
> > +       i2c_parse_timing(dev, "i2c-scl-rising-time-ns", &t->scl_rise_ns=
, d, u);
> >
> > -       ret =3D device_property_read_u32(dev, "i2c-analog-filter-cutoff=
-frequency", &t->analog_filter_cutoff_freq_hz);
> > -       if (ret && use_defaults)
> > -               t->analog_filter_cutoff_freq_hz =3D 0;
> > +       if (t->bus_freq_hz <=3D I2C_MAX_FAST_MODE_FREQ)
> > +               d =3D 300;
> > +       else
> > +               d =3D 120;
>=20
> Is the difference with above intentional, or an oversight?

If this is an oversight, then it is also in the I2C specs ;)

> if the former, I like the dreaded ternary operator (only) for cases like =
this:
>=20
>     d =3D t->bus_freq_hz <=3D I2C_MAX_FAST_MODE_FREQ ? 300 : 120

Yup, that would be an improvement!

Thanks,

   Wolfram


--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl58iXUACgkQFA3kzBSg
KbbIzBAAhhw+Kfs/Md54VSm2PEe4Z/RzaoAUY0Wyq+zy6iW5LVQQQqdkko72vvr7
3hFmjk02TmDRdMPWmMaAv4mlTRv3TnNgs4zHxyAnEYODMHh0eswEji6BK4QTQq7k
qQ9cz3rAhgKSfHhSzLzahFED+3K3fPLGwKuRcNksXaZpZcKWoMa2Bv7NbYOINAnt
GFRqBaMSMz9VxOb9jjN/pqPMD8/lt2i30+zKiFbCgt2MaNe9UHWiEPp6eXpvJ215
DBjOL9vT3VLc1c0x8K8cJI1RfeJ+U61aGJVeifsaZRTnqAo17xF1ceqItcL5x9FN
ta4jAmfE9TCx2Beq5IE254Oet7eJP7mqpD+XMctFgRoHbUvh+X5scfC755O2Yvx8
acCtsZo+P3/d26QPJ+V8z5gyiDtlzjUnxiYfc/maIp2aenIOUOw3vKEQoYGnaosJ
uU/2FDolkkwU3N/MEDijgNv39yvF6nilcbHi8O5PwwjvRMOt75zj+L+7G036eM8T
0odXxgyYl8hmmC30MUUmVaZm4koi51J3tGkNOpaZpIdrZWj48gGCzKI3NXncfFZq
tZFIRJP6+EBnTuI5Y+JZiylvtHWb7x9fH9+EGv+Jqy+g+hcSektbD+VAc6l9xfXy
tLGkxKI4qkxXvlyEBe+9fG2MWs5MbHBkSf5wrL7+yOrEhe6mP+Y=
=9+b4
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
