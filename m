Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC4014D248
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 22:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgA2VHA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 16:07:00 -0500
Received: from sauhun.de ([88.99.104.3]:41722 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbgA2VHA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jan 2020 16:07:00 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id 05C3D2C06AB;
        Wed, 29 Jan 2020 22:06:57 +0100 (CET)
Date:   Wed, 29 Jan 2020 22:06:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Comet Lake PCH-V
Message-ID: <20200129210657.GE7586@ninjato>
References: <20200116074651.529380-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline
In-Reply-To: <20200116074651.529380-1-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2020 at 09:46:51AM +0200, Jarkko Nikula wrote:
> Add support for Intel Comet Lake PCH-V which is based on Intel Kaby
> Lake. Difference between it and other Comet Lake variants is that former
> uses previous iTCO version 4 and latter use version 6 like Intel Cannon
> Lake PCH.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4x8/EACgkQFA3kzBSg
KbaHjw//b8SWSITKJbW8JV+Hox9Ww6vtUK8SqJ4LvU9vdN1814K7H3k6s6Gh/TlA
lwqUs0HP0++rNbVjepnXwRJzKQxFfahE8FaPJ3RA0bw9rG8CmVtLxfOm/WlSocAx
NXEQYxrN4YsyXJtZgyVre4eE6kDlpSjPiVCHrgmv8NmsFsxdPb4j4XhiyfrSo1lk
9yI2eM3cZclDP0pg/aInV5FhwWPw8222wArel9bMUwVcXAfz1M5o2mwYVliX9LkT
r9Gwrn4rEwRwY2izMHd2sRPC2uVg8r62vNvFuoxa0/Mvcslfw7cT/h8oeC2CMikN
Y0HImDEqh+dBhmKVIyQGV88FRvETQmyGCe3wmxtp9FqrT5PkNp5Q3mVLDduITOep
DSDuZgdYteAgWadWmmOcQThKgIv3jU8XqukM079gSlQPADafleYoOJRseP606JBF
l8YK6Gy8wXI993QiMqGFbgzxDPUxhigHK4xBhK8/zwTrdYP6ZV9OewVWHDFd5Kft
RU4iz2pSmSbLYYLAH0UB2T5kp8cEGNoB03OZx2hl5GUZusrZIXPK2r/cGjdTmHUl
GZdHYSm6pntRB+EhxL4WdW7nCcH3D6NnpROdTN+GLF7oB5Jy0xFayft+mdsflPwp
YLs7bSTyPRZlmS/kCTB/SeFnF2vLrtlKJROo7P2AiqUSHbJtmiQ=
=va5c
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--
