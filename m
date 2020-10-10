Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536CC28A320
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 01:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390487AbgJJW5Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 18:57:25 -0400
Received: from www.zeus03.de ([194.117.254.33]:55730 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387539AbgJJUTt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Oct 2020 16:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rl/Orf6woo+IrVZiQ1yWI4hhM3LF
        YMVEjdM+w6uFuI0=; b=Nfh6TEXGaIMk6ZFPmGSyK24bBTJEIkpztQUTvHknpw2H
        tTKmhjaz4QmNhTe+IDKwNtgNhStwHo+7HoE+8dkw6pqAUuYiGET1esm64SaX3y94
        RIE3/7tDeA5RbxYgGfiRjgz/delVSCyyEQJBe+fP+sU2eSvPcyJQcBnwVx7T1lA=
Received: (qmail 3961098 invoked from network); 10 Oct 2020 13:19:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2020 13:19:43 +0200
X-UD-Smtp-Session: l3s3148p1@dTXtPU+xkLQgAwDPXyGpAKJteNp0JwbZ
Date:   Sat, 10 Oct 2020 13:19:42 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mlxbf: I2C_MLXBF should depend on MELLANOX_PLATFORM
Message-ID: <20201010111942.GF4669@ninjato>
References: <20201005124949.26810-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8JPrznbw0YAQ/KXy"
Content-Disposition: inline
In-Reply-To: <20201005124949.26810-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8JPrznbw0YAQ/KXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 02:49:49PM +0200, Geert Uytterhoeven wrote:
> The Mellanox BlueField I2C controller is only present on Mellanox
> BlueField SoCs.  Hence add a dependency on MELLANOX_PLATFORM, to prevent
> asking the user about this driver when configuring a kernel without
> Mellanox platform support.
>=20
> Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueF=
ield SoC")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Usually, I wait for maintainer acks before I apply driver patches. I
make an exception here to have it sorted out before the merge window.

Applied to for-next, thanks!


--8JPrznbw0YAQ/KXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+BmM4ACgkQFA3kzBSg
KbbkcRAAqH0geSsBQ+tIA+JZN6yAuFcVfj/XU57Yb5K50jdQK0RPQXtcCAeWeHHk
22j4iTefaeeIhWWEtK167bn4mJzU+NgUjGypgFB5H3qIVISHD1347Ot57bUpZzAX
FDjLPF5qjEjE2C3RZHnsIxXrlWJa0y+cGZ3UqYfYLulsU2rhL5NubPLJzt9GlIfR
WfjpqiKxrtmokFeL42wRzrlMpa0D/oKIS+okje+fzJ8iKaQuXajjtdiQXlC6bB5H
oKSJ4z02SDr21q2oUWhkZdRliftQMkyYn5GVnQL7wtL//ToaZRusv3b5hJY6kkU/
81X1OvyJUvMejB8h+bepKueKF5zF8tcVTx1PDD+kaBSniVGi3ND0rPc2r7T4Pbs7
86jbE5Re8RIAxgfSWYxlS5DNsfZbe6LP8UCmMeNUWUUe/7EAksCTzm6lFupETzPL
oCKaTMl9i57pPdIX0reBN+MOoF+AXwG6/hai6tOSaIxC6CpwbGaGVBlxilNl0Huv
plAye9ancBlXDBoY+NvlQ7Kis0hvbmhLYQLw7aG8i+E24ztd8ya9yvVervSz1Jpt
P98LKqBsuOG4HBfqKomCF3ISxQ0AbWkQidCqG7cDg3UWE42qi8kXEONzhqhTyz2J
t3uQ/LIxYUtAYRmqMv31KhBPlY9fBKgA/ekStXrGCddv+NewVhE=
=jn4R
-----END PGP SIGNATURE-----

--8JPrznbw0YAQ/KXy--
