Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31924611C8
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 17:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfGFPE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Jul 2019 11:04:57 -0400
Received: from sauhun.de ([88.99.104.3]:44276 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbfGFPE5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 6 Jul 2019 11:04:57 -0400
Received: from localhost (p5486CF0A.dip0.t-ipconnect.de [84.134.207.10])
        by pokefinder.org (Postfix) with ESMTPSA id ADFC22C376D;
        Sat,  6 Jul 2019 17:04:55 +0200 (CEST)
Date:   Sat, 6 Jul 2019 17:04:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Stefan Roese <sr@denx.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] i2c: mt7621: Fix platform_no_drv_owner.cocci
 warnings
Message-ID: <20190706150455.GB7429@kunai>
References: <20190629024421.177153-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <20190629024421.177153-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2019 at 02:44:21AM +0000, YueHaibing wrote:
> Remove .owner field if calls are used which set it automatically
> Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to for-next, thanks!


--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0guJcACgkQFA3kzBSg
KbZvhRAAo4+3YhI39rG4rBWsbdNyRoz5yDVMxqJcCWGiGnwMuR6RATNCRLJGpdP6
MJUjKMsYiRGVgFM/DeUxxM0/EwxYu5bYVdcD8pVz/rb5Cz89bjlGQgKeQ1qE/f1x
p8tneSHQmebUv9RVyC3ip+/cyI2JdmRdZF/q2BhRTgXJKgKbzUcBgO5o8j+fdGIz
GTG9t6WNui6q4cYgnhkD5C9Rsp+e13I1EP14h5AhPVMlvM06xy5fjyzw2OMd+khR
bK8mOlMqXc391eD7Sslakz4w3mu8zjLT9jedSWyp/621EV5RSyrstFZZaG9StWxD
mNY0amrWqg3jZxZElj8+CqkQnJt+n8P9jbtI8tKe2m5AmwoKjRB/QUrj8QDK2DsW
QmGcHumPvGJVBFSP03MB4M9VJ9pp3rwuf5Mm7pQdK4jgdLgNs71G1FYlBzoW7JAP
Qptvwkt9A4BE2gpWokgtu7O3nb12LfZbe3ot86yRmKQlWlxZGoG/BVuyMUyD/HsE
42KxXykKAokiovUt049RIQyMLB4IZBLGBuuuwEcaTiUfkDVb1/h8fCiVQX+S6C5v
BnePbGuf9M0zNPGeBS1NYn0+CkOO4mkR0aiS+2q0KQjuypmdeHbnWXrjl4MfVk7k
WpMHEHUFGvHQ2LNQsqxUAq4VUtGapi0d0RsNPX4cL+4HhWDqyAo=
=5oAP
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
