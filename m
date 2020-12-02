Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAE82CC188
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 17:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgLBQBH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 11:01:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:39728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727106AbgLBQBH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 11:01:07 -0500
Date:   Wed, 2 Dec 2020 17:00:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606924827;
        bh=hXImQ6K02Yegy6Y94PccbAdhUH0xZSrzWBT+NlVFwSQ=;
        h=From:To:Subject:References:In-Reply-To:From;
        b=U8a2yB8ZkReIBlfAVsWxI/SzXRGadzkwHS9gKcUHXTBAPSVHlN5/sUSEDxibvY9Qd
         WcziuL5YxA6+cIBa6Hg6Rp2Y+m8lDo8/nlOWhWj0BZ4c2aIOH7io4/A0cCaxt+r90k
         7j0tPbTfXKaY7qcpICZLWPeY2ZR5CPeffGK8f/yg=
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
Subject: Re: [PATCH v1] i2c: ismt: Adding support for
 I2C_SMBUS_BLOCK_PROC_CALL
Message-ID: <20201202160023.GF13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
References: <20201116153245.24083-1-andriy.shevchenko@linux.intel.com>
 <20201202154501.GB13425@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline
In-Reply-To: <20201202154501.GB13425@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Mario Alejandro Posso Escobar <mario.posso.escobar@intel=
=2Ecom>
>=20
> Applied to for-next, thanks!

Oops, I thought Andy was the maintainer. Seth, Neil are you okay with
this patch?


--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HuhcACgkQFA3kzBSg
Kbb0NRAAkmua80u77tJDxjq5FVx7PrsCLODDbMUjPxWahGK62XwOLDcpYe8+9J+m
OAD4NeC5Oer9CED6qaouC1ZTSyVb1/ohTWopMBaZzB2CxFr9ZkC1J/DXAhidqWnv
RD/aOdhUK1zRa2fviSofwTPnv4avnTJZT/DtIt9aYuL0+SmnccHuVJcb9ZNZuqpj
nEbCQyjVCfG57ahUtx99yGtrPNdXe92L7cY7Lgy8SQuthufpXODrrGZ2ew1Y5ivI
GLQcknKW4XZpQbfG78YMptp/Y0ZMUaUI3oYM3cZWMkOQb3QvebsGb2a9ttNlgHLN
8OvSgXZHIyjTXboKruYENNYRr0YGZhyic82ahDz3+rYuKa/rk2uugZKzkUClizbr
t7weeUfd0N1S8W45HaimNXFv/SSRAgq8jnuql7CvrBSAtqKHSykpRBvrUjNjBt6v
1j58KtopY7xiaZ7LpacJ2CQBy2wTAlmS3CgXFYPp+o5Frpz6mXlcbiiRwjqcZr3a
K7glEFUCuWUcZnzCpKLwnO55i2PbFLgoB6f3jnVYvHyQwo3DsCOMvhv2XcA7jMTJ
lOlovCWCj7ichDJIdENYKTlXLPfCWxnD/M6X3Ckt8NCi3vTm/JfGJ8VRqCqu5kdM
WQ1NB+AexNcJPRvmTgns9Pbl54itYIql5Pe715nRWlAB2HoPifw=
=PwT2
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
