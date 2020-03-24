Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED621908D2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 10:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgCXJPT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 05:15:19 -0400
Received: from sauhun.de ([88.99.104.3]:47990 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgCXJPT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 05:15:19 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 7494A2C08EF;
        Tue, 24 Mar 2020 10:15:17 +0100 (CET)
Date:   Tue, 24 Mar 2020 10:15:17 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] i2c: rcar: Consolidate timings calls in
 rcar_i2c_clock_calculate()
Message-ID: <20200324091516.GB1134@ninjato>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-3-andriy.shevchenko@linux.intel.com>
 <20200323215420.GA10635@ninjato>
 <20200323220353.GZ1922688@smile.fi.intel.com>
 <20200324081328.GA1134@ninjato>
 <20200324090200.GC1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <20200324090200.GC1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 11:02:00AM +0200, Andy Shevchenko wrote:
> On Tue, Mar 24, 2020 at 09:13:28AM +0100, Wolfram Sang wrote:
> > Hi Andy,
> >=20
> > > > Here, the initialization to 0 is missing, so some values are broken.
> > >=20
> > > Yes, and this is fine. They are not being used. So, the idea is, when=
ever we
> > > pass "false" as a parameter to the function we must take care of all =
fields we
> > > are using.
> >=20
> > Can be argued. Still, uninitialized values look a little sloppy IMO. I
> > had a patch on top of this series to print the generated values as debug
> > output, and '0' looks much more intentional there.
> >=20
> > > > Why don't we just drop the pointer and init the array directly?
> > > >=20
> > > > 	struct i2c_timings t =3D {
> > > > 		.bus_freq_hz =3D ...
> > > > 		...
> > > > 	}
> > >=20
> > > I can do it if you think it's better. I have no strong opinion here.
> > > From code prospective I guess it will be something similar anyway.
> >=20
> > I like it better. Easier to read in the code, no need for a seperate
> > pointer. I can fix it locally here, though.
>=20
> I already sent v4 the other day, but can update since I have got new tags=
 to
> pick up.

Okay, v5 is fine with me as well.


--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl55z6EACgkQFA3kzBSg
Kbb/OBAArvcyYXRR2Y3PVpZsh5th0+BXEg9ueuvIyIrU6aJ3oAwajsK36F85LK11
YHQI1fBzhD8YDnMeqK4ekzyD3Ao3CLqv55TMhyjK6PEIDZodVVLJBxGuw4LMj/8x
AyxXXAEVbexO1mEE6NwQI7IkJT5QnQdQP64yCWDh7vuO4ef8yv/NwNG61rohOvxd
AAG2tRMCYiytD6lyYZ1oZCvgO8EBy2jST93b/jN/9noj2lkXJ1uq678k993aDAHR
IchX/fbgqPwdAoRTwwNV4Oro8icjkLWPD/7HtuB8bzJTL5xw0xflgbwYYyGVjINZ
ksuApy+ODPe5mvqwkeDe7Ph13Qu1UFcRx1IMMdAxQqFMKNaS4emaAP0S4vNOlfOF
ChxYlqkxb3Z+okjBM5ATzl1ALGk8wwA79emW5ilz8NmANOka0JqydOF6lSKoKrr+
zlHu5msPrPIsAjlvDK1Znf9iDIKViLrzk67WujsmgvucYMEufGMGNC3SNd8DqjNc
6YDxeoEeg87jkzMN+y7jEsN7nSlDT9UkhB8dZjtquP5YZB2o0LhYvmro8jUlDBBP
bUbR6UHlRO5hY8Ft0TTrjF3z3KBv9ANgtQgZARpLGfKEYlZOY/K2Y4BW6E8DR5yf
Egamg5vPUUc7X6isDRVwPoweeWAZmCKmYg5cr7CkUoSYJLmfWB8=
=bUaJ
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
