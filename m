Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A153F14D258
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 22:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgA2VKG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 16:10:06 -0500
Received: from sauhun.de ([88.99.104.3]:41756 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727133AbgA2VKG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jan 2020 16:10:06 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id A24962C06AB;
        Wed, 29 Jan 2020 22:10:03 +0100 (CET)
Date:   Wed, 29 Jan 2020 22:10:03 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/28] docs: i2c: rework I2C documentation, part I
Message-ID: <20200129211003.GF7586@ninjato>
References: <20200129151953.31582-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L2Brqb15TUChFOBK"
Content-Disposition: inline
In-Reply-To: <20200129151953.31582-1-luca@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L2Brqb15TUChFOBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 04:19:25PM +0100, Luca Ceresoli wrote:
>=20
> Hi,
>=20
> this series is a list of improvements to the I2C documentation.
>=20
> It started as a simple reordering of index.rst from alphabetical order to=
 a
> logical order. Then it grew to a mixture of various improvements to each
> section and some cross-section changes.
>=20
> I wanted to rework all the sections in a unique series, but after covering
> about one third of them the number of patches has already grown pretty lo=
ng
> so I'm sending it in its current state. I will continue to cover the rest
> of the sections later.
>=20
> Each patch is quite self-standing, and most are trivial, so have a good
> reading.
>=20
> v2 and v3 incorporate many improvements suggested by Jean Delvare and Pet=
er
> Rosin. A special thank you to Jean for his very patient and appreciated
> review work of _all_ of the 26 patches. Thanks to his work the patches are
> now 28. :) Patches 27 and 28 are the new ones.

I really want this in 5.6, so I applied them all to for-next. Other
fixes or improvements should be sent on top of this.

Thank you a *lot*, Luca! And Jean and Peter for the review.

Awesome work!


--L2Brqb15TUChFOBK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4x9KsACgkQFA3kzBSg
KbYbnBAAhprpV7wAA9NqSfMDHHmaqpyaZtwPybgDpYM0XTNRM8CgMudFEsAyC9lX
MshwajeHlFUWCMKyKnPQynC2AhHxqPWK0H1G6iHz/TZthHeF96lBRT5WPlxE9KHP
rb2H0/EmQUOOO9Ok00270FOrkz8QIDOvRVnYjKH28++gcX0DqKT2dzSoYHrMPRyY
H/57UIKpu/qjZqHzGC8H7vnU2R+1zXL+yQ+XT2fXbaSP1z0SByVRGEv2to/zaT4G
5G9sm/bPeznRGtKfAyreovusw0emENLBPuMQXkJPWyAaeyTGwUO1yydDyQLVpaH4
N8Y27ZuVof/AujEcrRnn/OW0B9vBJP4FPblxsWFR+iTbl/vMPOyyTUW4xlamZyaP
lqbRPyTAkdHtshKxcj+NUwe5yPWAh8QuPWJWuMyr/8L+vgclqU57I0LpRNhOKvqQ
L7xIL+/MKZkmwvINb/m/7nTlvAtrep9jG3gVk4cgtQoy9LHpvdEzubwI+jazioIX
z5M+vsGWk11UVbiuAp/3hnAzaV4Td7WXSQIquJRP+wdDP9mxM0kyi0i6l9ILjo8W
Fm+ihydY0Ad2w5+Tpv3rIeqHzUhf8kxTTQrIbMBj6St+70/606WnVYceO6LxUM/X
coyyaEX5t22GQ0cB2Jm+ALqyF4eWh2xqtUMqkT6/NjWXW+N3DoE=
=1moL
-----END PGP SIGNATURE-----

--L2Brqb15TUChFOBK--
