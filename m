Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144C142180E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 21:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhJDUA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 16:00:56 -0400
Received: from sauhun.de ([88.99.104.3]:40120 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235313AbhJDUA4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Oct 2021 16:00:56 -0400
Received: from localhost (p5486ca22.dip0.t-ipconnect.de [84.134.202.34])
        by pokefinder.org (Postfix) with ESMTPSA id D85292C0182;
        Mon,  4 Oct 2021 21:59:05 +0200 (CEST)
Date:   Mon, 4 Oct 2021 21:59:05 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 3/4] i2c: mlxcpld: Reduce polling time for
 performance improvement
Message-ID: <YVtdCceWuSVHAoLb@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org
References: <20210823144504.1249203-1-vadimp@nvidia.com>
 <20210823144504.1249203-4-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ALKSXwipH9h5Z8hw"
Content-Disposition: inline
In-Reply-To: <20210823144504.1249203-4-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ALKSXwipH9h5Z8hw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 05:45:03PM +0300, Vadim Pasternak wrote:
> Decrease polling time 'MLXCPLD_I2C_POLL_TIME' from 400 usec to 200
> usec. It improves performance of I2C transactions.
>=20
> Reliability of setting polling time to 200 usec has been validated
> across all the supported systems.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-next, thanks!


--ALKSXwipH9h5Z8hw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFbXQkACgkQFA3kzBSg
KbYDLQ//c+hmEX4SYl+YzqWvoyjHGXaIwbG5JjYOUE6TFt4tYHl6r4UqAbUMKG80
mj1Mn6OgTBNFjnFyOcNzyj8vgr8Jf15mjbrKSyncyG0plzDRc/jTpjVsf0Z4g4Nu
rqol7u07nc9MJWZ4y3cahmyEQhKYsjaODT5Sqof7Zuygc4D6ZPX/bUhYMvnccLsk
Yrwqh4jmvJwSUb/zHpMTMtOHgF+2Fu3NpdVrY/A653dP9d5ZcOrJICEQHkZJbrys
TSXRBupvLL5G3UKc+lQd/I14xg9qpGeDWZGRofQo+4eYW1vARyYEJzqC+3cf3ooV
956oq8zsJSN5OMCZkqYMKifGPXHOt0PP+3Oha1XYum8Ew5gIKiYInn8aJmjYonin
ppPCSBdglZuZy/Sle+TEUkLuaaTyDkhIcpRWLyi/FtBTBd6ZsqvZt9N553XEk5Z3
+slWNkldAJIvKgkBBDseZXS7EHDJ/BwgCLt5QFMbGZ2Kc4+/S8EroyfG/S5IX8QE
zT3OnXLD817aw0x1JR+t6z98uR4TdpAOHYpMkjsfxm/ieY20EzyBHYIyN+pAKkAN
x210SgpFJjr1cZTHIMeFGDGeU5vYo1dDvmG+bU7knwW796FkUVrLhN71z+G2udHM
BaL5JTNr+9U+QO6HALyGHCjhoT1m/87tLtOsOFfbS3luRWcQq7U=
=l+Yu
-----END PGP SIGNATURE-----

--ALKSXwipH9h5Z8hw--
