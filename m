Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF90FA27BC
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfH2UKX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:10:23 -0400
Received: from sauhun.de ([88.99.104.3]:43082 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbfH2UKW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:10:22 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 171362C001C;
        Thu, 29 Aug 2019 22:10:21 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:10:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v1] i2c: designware: assert reset when error happen at
 ->probe()
Message-ID: <20190829201020.GN3740@ninjato>
References: <20190819102423.73683-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="McpcKDxJRrEJVmOH"
Content-Disposition: inline
In-Reply-To: <20190819102423.73683-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--McpcKDxJRrEJVmOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 01:24:23PM +0300, Andy Shevchenko wrote:
> The commit c62ebb3d5f0d ("i2c: designware: Add support for an interface c=
lock")
> introduced an optional clock while missed correct error handling.
> assert reset line back if error happen at ->probe().
>=20
> Fixes: c62ebb3d5f0d ("i2c: designware: Add support for an interface clock=
")
> Cc: Phil Edworthy <phil.edworthy@renesas.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--McpcKDxJRrEJVmOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oMSwACgkQFA3kzBSg
KbYKShAAhu8AkO45+EtdYPPVcMIeItsCieGZc+j4zE7Jp59Rxv0gILTJ/RSWfUCu
SElx6K/TMSb1JudJ9LJ76ZK4LeAeFyl1mFUn7cCzv/8U6QucAcOA7DhkSnK/5jtN
4K5TRIfsNv8MarCvrQLHIcuZpvdXBsjZbg2paii/ZWiOp9LMO/xDJ9IJ3J6VmDPw
Koh2hWG+B03dDsxFlWofEQQPq9Jippdlcj+gNWcGvp3Mgn3a9MgnvVwdQlz49AeJ
00QcyQsEr4HtE02DfT7LQ51IGlwOqQr1O86bVSo6zSJSdYltt4YppbojjtgLjzd8
9diOAu1Hrz/77mtP0Fht9JcxarvI1P7MWLGBHAN3ILtJ8wfOzu76Xdu28iOwfv4y
FLiO2C1mJ+A/E5LFBDsObTjG/ChAyxnDdFeIf0KdX+4qdLDPj52Sq/ls53ux1WLT
lbCGonY09Dbjg2kXBWqrwwslzF3pv8EHEXB/KjIov/Dd4tuNmZIitOMx7ms1gM+k
o8bUUT4W/POhhyWz596jXX9whBTugME1dczwrchVEJzBR0MHWe2ABlbDRscf7bss
lI0/Bom1nACnOIcIgrgGuuvf0Qx6j5DRiSYZ9H+y10Z+9wwPISVoM48JW6U9gw9L
R6o1CYDLT/8/kizO5yDB2l1hBax6lGZmUSZi74r0uZkbQo7vlEc=
=FTI1
-----END PGP SIGNATURE-----

--McpcKDxJRrEJVmOH--
