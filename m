Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9209B42180D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 21:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbhJDUAx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 16:00:53 -0400
Received: from sauhun.de ([88.99.104.3]:40112 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233408AbhJDUAw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Oct 2021 16:00:52 -0400
Received: from localhost (p5486ca22.dip0.t-ipconnect.de [84.134.202.34])
        by pokefinder.org (Postfix) with ESMTPSA id 5E2932C0182;
        Mon,  4 Oct 2021 21:59:01 +0200 (CEST)
Date:   Mon, 4 Oct 2021 21:59:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 2/4] i2c: mlxcpld: Modify register setting for
 400KHz frequency
Message-ID: <YVtdBPdqAw6/1Faz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org
References: <20210823144504.1249203-1-vadimp@nvidia.com>
 <20210823144504.1249203-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TowxVWNt7F9NoKQd"
Content-Disposition: inline
In-Reply-To: <20210823144504.1249203-3-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TowxVWNt7F9NoKQd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 05:45:02PM +0300, Vadim Pasternak wrote:
> Change setting for 400KHz frequency support by more accurate value.
>=20
> Fixes: 66b0c2846ba8 ("i2c: mlxcpld: Add support for I2C bus frequency set=
ting")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-current, thanks!


--TowxVWNt7F9NoKQd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFbXQQACgkQFA3kzBSg
KbYnRA/+JoSxRuq6Ri1gUUQwmy2UWkkE8EdjB1A+ZJa8pOaapvPlqZPOuwbf2KyK
nVRW+um9mbnV9LUTOJeee/xQlAYm0Xd+FFe2fqJMJ/C86WWpsQQIjSZ9djWlTVSr
pYA/rN8ShqkjLXlMhPUkLKSD+flq2B1yzKqkjRVPoShF4hFNjE7DYGWLGcYpcXYJ
QVrU+1uHDOcW5A/G9pMqlokM953ANc5vt5GTe73LTlfO/DOcObTnd2d0mZo0zvpv
qLrshFQ/2ivhCo0GNdmA+GssPv3BD1tZLyuduCjxSCPnR7xKhTYVoYf66aZ6Rmmz
xGcES/PQVOSQDxF/oaIOVaTWR2p8ILtkOMcR4qljxFYM6Inz6OrCV148Qqapt1zM
T3tImuJkNUSTiAAU5etKb8BxpA1HsaOfFet1Ct/vl0iHYP2HZKOpLk4EyqvZd1Yz
opYzqMMKcOcEKwsjnGVa5QzAKVtP/o2Ys/Qgi97ru2psH25vYgMulUrHpAO9AScT
ldHKw0WHw/MqE/yHExSaIC5QuzhjKjxCp1YXe49xNVGZbjTGJUJFJW9OwDLPZn4G
mU5/G3hBn0sj9IFx8yc+m/2SNaDNu8gSQePMe4hxW0K3mFOS/12+KXL4QmCVIIlb
FRgWvx5EWBMnD86Ox0Q7HV/TmYl9VkYbwOc4bAacvZ+SFmBb9jQ=
=s0oc
-----END PGP SIGNATURE-----

--TowxVWNt7F9NoKQd--
