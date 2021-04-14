Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D939B35EF5A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350002AbhDNIQJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:16:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349970AbhDNIQJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 04:16:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A540B61222;
        Wed, 14 Apr 2021 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618388148;
        bh=PdUJpTD8ilcyCJQ6/S6HTkjevJMYma5jYsiT50huv+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V0LPdC6pF9qbKbE2RHxjnf6rF6mz0kumqmp+AtLBqOAQcMRgpsp8dhWi5uJeAVCUo
         vhx5V7V+O7uBawLea5a8TzeWej8E2l9YugFzaulGrG8Kqj8RtwCBW6ODFMw0YZUOmA
         QDIExFI6gl0uxBSLk767ycW2wcbPDKzIphKIJC2mhsjG6EiBCOpk7RzhxXEgL9jskD
         wPHk17CL/t61aC0HArIlXwItfxnv58U0BSfxhajvwjvb0/NFFS/OTydatUD32DAD+f
         q2J0/aXt8JlOtdixftqN5HlxK9KPXsOGV3QBjsG5gyvJjaN/C5vxIc3zjyrMvgQOa7
         x1pEk0FQZMrlA==
Date:   Wed, 14 Apr 2021 10:15:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Get rid of legacy platform data
Message-ID: <20210414081545.GJ2180@ninjato>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
 <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
 <20210406104927.GA3532@ninjato>
 <20210414081403.GD4869@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rfwNdt5cNUUjB/69"
Content-Disposition: inline
In-Reply-To: <20210414081403.GD4869@dell>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rfwNdt5cNUUjB/69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Platform data is a legacy interface to supply device properties
> > > to the driver. In this case we don't have anymore in-kernel users
> > > for it. Just remove it for good.
> > >=20
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > Acked-by: Wolfram Sang <wsa@kernel.org>
>=20
> Do you require an immutable branch?

Nope, but thanks for asking.


--rfwNdt5cNUUjB/69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2pLEACgkQFA3kzBSg
KbYH4g//SeQ3sNVjDQ6d/7gzamniyxyOOHfgRNTZ/zFz1t0Q+VAl4QyW+pO79pKO
XdT8zZXP2d8W5WKQLB/g4bJ4FDb8x+c24ZK5KAXCgCul5auk09SaktpqElaeTr9e
L5zbV7PWZg3JFKbDoWIU2uhEBhiDIcBCD69CPZ0g4jWLaV7QFT6MKFufRBsmoJ+l
Gt0nMt333LedjnAefhDNfZMpazH4SmM5BULtmAJeBV9odzQWx/Ze5Nilu+a8Pm+H
i0d0Fz5LNeUTBvJnLuVM9Ra3d9z+7+iYU5A2NGZ41ITWpAqC/If5FqDZLIFjOBwh
VdXrIsfwhvaSZ9Kl/2NDHkCI6+rRjZzjbM8UCFG+aWXT9vwPiUorzqBUWL8CVzPY
5BKt4VIk3es8eHSB4zrfmHUUjq/SJVLVUhcpljD8mrKmV+Dv/XSOlEtsu+7bgEkK
taIu9J8Ac1+H2z+grY0oCbDQZb9JO2W3D/FvyYL6BaMLL2W4X76J9RD4ALgtkxVS
TyUeguZVMiOuGd0+bK+XYu7x4lkd02Y6KB+nfJUX5zxU9uKljuds+Ca1UNxFrzy8
V/RC5UNLqJJZ1+TLEXilKFp3m3On6GGHf1saB7ibTG3dERo5Uu1W7aJ/y8oGNVAJ
wTNjtf+3CYacYgM2NrE01MLwMjSJnitGKSYw/ax7JOdEOdMCPQc=
=sywS
-----END PGP SIGNATURE-----

--rfwNdt5cNUUjB/69--
