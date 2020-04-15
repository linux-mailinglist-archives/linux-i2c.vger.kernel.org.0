Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF85B1A9CD9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897232AbgDOLht (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:37:49 -0400
Received: from sauhun.de ([88.99.104.3]:53190 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408902AbgDOLh2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:37:28 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 359CC2C1FF1;
        Wed, 15 Apr 2020 13:37:26 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:37:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v1 1/2] i2c: designware: Make master module optional
Message-ID: <20200415113720.GA910@ninjato>
References: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
 <c3d2d5ff-605a-bdb7-275b-872fdfd10ccd@linux.intel.com>
 <20200325114529.GU1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20200325114529.GU1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Size of i2c-designware-core.ko is around 12 kB with all master, slave a=
nd
> > Baytrail semaphore code built in so I don't think it justifies the added
> > config complexity. I think distributions will have anyway all of those
> > options set.
>=20
> I would rather go with conditional based on I=C2=B2C generic options, lik=
e I2C_SLAVE.
> Do we have something similar for master?

No, we don't have that.

>=20
> > Having those code in separate modules and load only when needed might m=
ake
> > sense as that would save a few kB of RAM.
>=20
> ...which makes sense for embedded systems where exactly the device repres=
ents
> I=C2=B2C slave.

Frankly: an I2C-slave-only embedded system which runs a modern Linux and
cannot afford those few KB on a core feature it needs? If so, maybe it
should have an out-of-tree patch to achieve this. I don't think it is
worth the added complexity for the upstream version.

Sidenote: There is a lot more overhead in the i2c-core. I think the
complexity to move out stuff there is even more messy.

Disclaimer: you may prove me wrong, of course :)


--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W8esACgkQFA3kzBSg
KbaOUw//cjIqDtuGiRPzYHe34bdn9BV1oBc03dQLLodHqCyj3OqfawGRBcq42rii
vpKdxCxzXcDNkcyBpr6yTj8UfSZRSEUQTDOmyw2DIqVGggHfq+C1UWQX5wp/vUW/
rbMPYp0xRghEzOm323at2tzxpAx9KR1VgSNmw6eu62lYhwvfmutdjjI2eKsbBmaO
lOgwZEXMz4izACEEvGyXf0MNNm0UwnYQ8Pr6SxLiau/T7rdPZvPfhOepPiZg/fHX
Rrfed5wJien7Etvf9kx8zWclp15BEAX/CdkG2rK70Cq1TBiSiwcFFC5Wb7E35bbb
JqZm4Pq5r50Zk+Ovh27ptDpt6K5F4b3hldt2lBhYgfsg6d85z5YX5L/O6shWPdD6
Ngk3az9n0mAy7y9zLMqYaECBHAmwcS/gLrmAJTrF3YP21auqgu56Z7OoUGANqvTT
/O7klRz0Q8/BN7kvQNdDcPBaYRw1K1UEIcenT2Ic2QJAiCyrzYifdwwztrogksym
g2KV9I3C+fSQjqwhMWlzmQWhJ6lAsIvnOIJbbpEGXeUV9mJ+vZOilIVFuP0dKHX3
jslalQciBE/cjyYQe2U3BKMbD25wKf5/I89ETOayXRz+r7vW9L+ieVJc9TEuh8tz
N/+LCD2lHC48X4V32zsX5RBqNdaPOVS2CCpYbK0GSEADe6dfrz0=
=X3FL
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
