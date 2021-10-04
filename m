Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7B242180C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 21:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhJDUAq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 16:00:46 -0400
Received: from sauhun.de ([88.99.104.3]:40094 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233408AbhJDUAq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Oct 2021 16:00:46 -0400
Received: from localhost (p5486ca22.dip0.t-ipconnect.de [84.134.202.34])
        by pokefinder.org (Postfix) with ESMTPSA id 29A4D2C0182;
        Mon,  4 Oct 2021 21:58:54 +0200 (CEST)
Date:   Mon, 4 Oct 2021 21:58:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 1/4] i2c: mlxcpld: Fix criteria for frequency
 setting
Message-ID: <YVtc/aojahtm87EX@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org
References: <20210823144504.1249203-1-vadimp@nvidia.com>
 <20210823144504.1249203-2-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t6UrdIt0DR9+//Ep"
Content-Disposition: inline
In-Reply-To: <20210823144504.1249203-2-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t6UrdIt0DR9+//Ep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 05:45:01PM +0300, Vadim Pasternak wrote:
> Value for getting frequency capability wrongly has been taken from
> register offset instead of register value.
>=20
> Fixes: 66b0c2846ba8 ("i2c: mlxcpld: Add support for I2C bus frequency set=
ting")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-current, thanks!


--t6UrdIt0DR9+//Ep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFbXPkACgkQFA3kzBSg
KbZf6A/+IcoBHrzJoSfzkmW28vRLBxg564eoNdau6PymTS92C3H1tad3c42GSolj
UmRaSwhi/L/LNvYanGQvW9bN2uv3xZEwXz+18qPEyYpcdK/90KVm1gE3sUWsup1L
dhrM+EF/s2pXs/+DxE1QgbtglcYdkDTuqddMEjHjV9aCuuZA94hf/KIrc8XOCrOb
3F/P+QoxjyNSXZi353gYE8Vhxz1R2YsOp+63NbvqZCh1ahEKg1D+sg3OPFQ3e9Xh
gM6wqd5SUI5aIj6vLxZty8CSWWFpI1ulbar4J0H3JZYaxyZPcxobi0op+i4kIMSo
xzJ5esjf+QqMSeA2/rsBJmNmWi2R/bZEpv5P/rWScXZNfIIaAdlCZLPbmrVgZGEV
W4PEJ6qwmuo0pe/8GWbYvYY3kjRVe5U4gzlv68V1yEcXOeaGROwJ39adTZ5EW2H4
QnEZzfE8yaHzIhlYBsJulkBAG4WPVzpNl4i6zEeIYrxpjH5ztq+j2FPlFoeFI5WT
d4wntBoMSk+B7g7fNemO3grk+qBC5bdldCDyrjpezEwgiBsLrPhahzYrfJ5xsM+n
Wcxch8qy22SSDQSchgYl/ru+oX2zFuvPldA1WNFMV/HqX/6w8FHX7R6sfhkJd2MA
ZvallVxRLE6XqGMV37vn6Kkqe0ELpF37baJoUSYfnEhdEKQu9B4=
=Q0gL
-----END PGP SIGNATURE-----

--t6UrdIt0DR9+//Ep--
