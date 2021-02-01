Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C3730B268
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 22:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhBAV5W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 16:57:22 -0500
Received: from sauhun.de ([88.99.104.3]:57720 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229739AbhBAV5P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 16:57:15 -0500
Received: from localhost (p5486cf8f.dip0.t-ipconnect.de [84.134.207.143])
        by pokefinder.org (Postfix) with ESMTPSA id 62A962C0AC8;
        Mon,  1 Feb 2021 22:56:34 +0100 (CET)
Date:   Mon, 1 Feb 2021 22:56:34 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 3/7] i2c: mux: mlxcpld: Move header file out
 of x86 realm
Message-ID: <20210201215634.GC24315@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org
References: <20210122192502.17645-1-vadimp@nvidia.com>
 <20210122192502.17645-4-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline
In-Reply-To: <20210122192502.17645-4-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 09:24:58PM +0200, Vadim Pasternak wrote:
> Move out header file from include/linux/platform_data/x86/ to
> include/linux/platform_data/, since it does not depend on x86
> architecture.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Applied to for-next, thanks!


--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAYeRIACgkQFA3kzBSg
KbZtMA/9HTch4ENItt+ZfHN2HOJpTvUNxWSYlW1/f39oImuPZexh4XhVhrmTQUgW
nufFrbu6Nh8b46n31woSDFRVynwmJzwvcdRsJWbn3AQTh3jaLqoX3lPdQod1huE7
XZxJXX4zsPEk2Z13h5+pC+E4QruIR7QSgtn4BKIiLOS9dN4OsXCn99msNFdcp/LQ
//j17a7bMaPYqLKiY273Mtt4cCT8ZRNlW1U3MXbAgCrDITvNRAyTueOfjsJyvx8a
jGqjULx7FTHxzzq53SOEGGHSmekY+nIvzw6nEClU57UKyxW/9wjovbGTN1ztltnI
LLtF7zgi8zciyKbUY0aNGfNbuTdY3f4FEPxnJ2wzjPTn4DrK2Dih0t7fVvqnoXhr
kzIP4vQtli5eHP5nDph7jYo3vv2N6jK6BCOwgnpbf1zCmDS7njMdhgVdJbxYRQFh
Bu/KzEK96W79890Lil0Q8AaKRP8/Qa7VUigVK+sfENvlWB3d0u/Uxun0Fd+v8y03
LdSUoGgzloh+ayRydvl1AdRvdWmc5nl3V6y1e3WhjYRZgPnKT5Bpqn8TYw8hGbMO
UiA6sJ7DlbrwOQRK475KRKHrWTD1ZDYnV3OfhrW6XG4nYYOZA1HNn2CftzJICmu5
+DJcnRRqbgBw9aqhNiPc1uh/JmUrSf0zzHII5gTepuVThza5w+0=
=N4F7
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
