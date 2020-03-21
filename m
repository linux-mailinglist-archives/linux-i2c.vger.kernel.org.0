Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9D218DF43
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Mar 2020 10:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbgCUJrZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 05:47:25 -0400
Received: from sauhun.de ([88.99.104.3]:33338 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgCUJrZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Mar 2020 05:47:25 -0400
Received: from localhost (p54B33C59.dip0.t-ipconnect.de [84.179.60.89])
        by pokefinder.org (Postfix) with ESMTPSA id 3398A2C1ECA;
        Sat, 21 Mar 2020 10:47:23 +0100 (CET)
Date:   Sat, 21 Mar 2020 10:47:20 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kevin Hao <haokexin@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: dev: Fix the race between the release of i2c_dev
 and cdev
Message-ID: <20200321094719.GA1856@ninjato>
References: <20191011150014.28177-1-haokexin@gmail.com>
 <20200320180150.GF1282@ninjato>
 <20200321040517.GA1315042@pek-khao-d2.corp.ad.wrs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <20200321040517.GA1315042@pek-khao-d2.corp.ad.wrs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I didn't get this trace on my ARM32 board (Renesas Lager). Anything more
> > I need to do besides activating those options and using i2c-dev?
>=20
> CONFIG_DEBUG_OBJECTS_FREE is also needed. I got this bug warning when run=
ning
> the OF unittest, so you may need to enable the following kernel options i=
f you
> also want to reproduce this by using that.
>     CONFIG_OF_UNITTEST
>     CONFIG_OF_OVERLAY

Great! With all these config switches I could reproduce the error and
see it is gone with your patch (still two backtraces left, but this is
something else). Thanks for the heads up!

> Yes, there is a conflict with the latest kernel. Do I need to resend a new
> version?

Nope, it was trivial and I fixed it anyhow for my testing.

Thanks for doing it and for your patience!


--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl514qMACgkQFA3kzBSg
KbZ3GQ/7BhE++efNnkcyXM1JF0FCAhBHhY+OOUxpGYWdqWnmHNCSK9YTVQqJXbD4
BFxARb27LyZw0pxF9n8XvcjaBHRqJ+3h3sV6HEsu5ueq8WVdCivnzCtNw9C/2DvP
GUPIntMjkYzY1Rt9e7ROKt2J5jZaS0zOTmGQoAsN7yb12bC4Ha9w1gdSKNdthUBP
S9ZFyy2hdQz3msJyxcKrkcd24I9qBnjh0St/lDws1Ig6mZ80Xg0lV0qpRj/ojPzS
duufEus8dsV0DbgpApZHwCRH8PCddqrM4UEFrvRSoo1nSuyQsNhB9NPS7u0COCN6
pcso2vz1NKdZXZzKD+9JrHw/ZIeNpxsypPmUSnvVw+iDCT53Fa1P4HINfiSE38YV
HhsqXNweMFtzlZyFyEoyCp2/AlohqBnvmWwMCRljnfOOXNRJRl5F4l2lPjZM66u2
nkoal5vrSXNQ3QWEL8cSx1txPWL3yBmeHgcKfKlEMC0BEAqxzC8I311M2815Hlcs
X54+jA+w51Qf23y1oCGK9l6g0kMiuZNgas68Des6GMC//O8RQtLALVhk9Kj2LT5O
yerjwPYUu9LwwQWeoF+ydhxBFH8hKbjKv0QzjMdiXj/Eg6eqSMi0w2z/kAPZGwmU
0DkfFed9wWgVjKqVlwwtzgF9MYlPrTWGm2mm6YgrqlU8N8y5gfA=
=xYYI
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
