Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF2C1DE89A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 16:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730010AbgEVOSd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 10:18:33 -0400
Received: from sauhun.de ([88.99.104.3]:60938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729399AbgEVOSd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 10:18:33 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 6AB452C203F;
        Fri, 22 May 2020 16:18:31 +0200 (CEST)
Date:   Fri, 22 May 2020 16:18:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: designware: Get rid of PCI driver specifics
 in common code
Message-ID: <20200522141825.GA5670@ninjato>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
 <46e45caf-7ce4-d3b2-cea6-747424b44a4a@linux.intel.com>
 <20200522105814.GT1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20200522105814.GT1634618@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>=20
> Thank you, Jarkko!
>=20
> Wolfram, do we have a chance to get this into v5.8-rc1?

I think so.


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H3y0ACgkQFA3kzBSg
KbYYVg/+IrThr73Yaqvm3TN74R5kxw/RAlsmCjl6S3vrpPAdZseijYdYYggXV6b3
/8mvt/tvmwFhXZ+3w4VHrYOuWzZuj7MMm3vs3PV4LrJm0FXg2HE6yY+PnTVO8jMW
u9ckPSRwXP6C8TaauRpR98w8eToTzZmu2XXiKvV1Ob50IwJma1C9VYFLjOWQJU/u
P68S6Rmf4f9SkZlQl/OVK2t/7BzoMHhOuXv5PKINkOMlEt8uZ5N6Te1X5pSQl6bh
t3O3uYaZul+x3El4v2PONjRMsqOZD51luQV6+oSlNlxuwAnbvRHPYeFIEaCyd4JK
auOZYXgCKFrQ5F5ywGtKZ5jT8Uh0k/6CuJHB5ZIaK1MuFpQwuZf1U52Bbz7tRSFC
ylRqC16M0D/G6JOPIPd9Yj+xR5EjQPyK3Y0wZr8bdmkpynRm08rgRONxRm2dMpfr
ie9AdwhH0MNwXNfFAyjojZiSV+z7wi/ITV/vzBStSm9wDigEKk75cewsPGkutLtl
NMeYkqrEEf4oIdfORq3ro7qsKKrTGWIVFfo3WDJXrPomGnW2x+Db8ksxBO/mkBnH
l8WyB6TH3mUiwIlMYN8zwlgI5LLP4rMdv4DLU4/oWKIsf+BSyMw/4i4KTrQWJqLJ
NlCn6dkn6tZ1SeLNg6d85YL29QsjcUKaPdc+vkjftrvPvV22ZPA=
=pvZK
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
