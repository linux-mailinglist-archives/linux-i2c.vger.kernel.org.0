Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757B12A97FA
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgKFO6L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:58:11 -0500
Received: from www.zeus03.de ([194.117.254.33]:59332 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgKFO6K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rIlFBi6yQnQ5x71L0A6kGZu9SsMg
        rqDGIbSBph6wKUw=; b=1/UZQldLV75Jshdkut7sXXN9mZ+V4KKiMdzB9NckK+ZO
        972JCes6FlyVoQZy0u9vBh4b1inTdXvhXhBFIEM+5yF/7vuihk9RD6AXurRohSTR
        xGhtFQdQ7Ft8mL5giVE3ry9Ks00zg7RcMZoMLeQZHvnADNM5PEWen7jgvy/BP4U=
Received: (qmail 983837 invoked from network); 6 Nov 2020 15:58:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 15:58:09 +0100
X-UD-Smtp-Session: l3s3148p1@r7DVcHGz9KIgAwDPXxn+AAvEwmht7CYV
Date:   Fri, 6 Nov 2020 15:58:09 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mlxbf: I2C_MLXBF should depend on MELLANOX_PLATFORM
Message-ID: <20201106145809.GH1059@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201005124949.26810-1-geert+renesas@glider.be>
 <20201010111942.GF4669@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X+8siUETKMkW99st"
Content-Disposition: inline
In-Reply-To: <20201010111942.GF4669@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--X+8siUETKMkW99st
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2020 at 01:19:42PM +0200, Wolfram Sang wrote:
> On Mon, Oct 05, 2020 at 02:49:49PM +0200, Geert Uytterhoeven wrote:
> > The Mellanox BlueField I2C controller is only present on Mellanox
> > BlueField SoCs.  Hence add a dependency on MELLANOX_PLATFORM, to prevent
> > asking the user about this driver when configuring a kernel without
> > Mellanox platform support.
> >=20
> > Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox Blu=
eField SoC")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Usually, I wait for maintainer acks before I apply driver patches. I
> make an exception here to have it sorted out before the merge window.
>=20
> Applied to for-next, thanks!

Strange, this one got missing, too. Applied again to for-current!



--X+8siUETKMkW99st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lZH0ACgkQFA3kzBSg
KbZQFQ//U78D/a8V5TSU+xw9L+JFl4WSOoenVEIHpfBLwxq9SRcHujqfkGDrZWxO
KLLfqRmKkRyHuln/yA5tUgjS3+3E75YiLqVwBhA4Y7HAeH7ttWX5jONIXHeMG1oY
GGUkpkBmu6nKf33/155u42rGfgmJMgMxR7yvGlZc2doi6JrWFA94OYyhn6OIzKuA
bEy68eNVdDt9BphXxiFkx9SNt9fEyjmdGb8CkQJgu75vArwZMqp3pXBGyUcrUI+8
Uv7ZODzXt3VE1PBYHGRMBsDOJEznR8FoX3UZGsFji86rvNatM9ogX+WwbP7A4Tvm
AEnOx05lxWXvBXx1ISbWJ1Ot4KWakD1CHAY7E7m3DmU1MNK/MhyzbgMDJPP+GuTe
Q8KNmQPkFQ+X7NclyRDa4KU/5i3joJrPnBvK5bWvCaS7iSalyCT75zDEs9Ndi9pl
nt+whFh/ERyff7vWZuPJknRv4IW0Ptze1nG1kI4787FdwR8hdZ27hrd5XIrlv0YJ
WqkqNLTAK+JFODn14B1XBzOy1AUWs4/cZDyGgKSbsJUSRBEN02nNmxp9qmAhebp8
d3CMea3GlOdaRYzvx9j6vGTNKFvTW4tk9XQGPGiqTltcD1OD4mggNU60au1IdUdm
363XH+3SZSIJ11/RopvrwN06Pk6jsTDcwyihpAkdFvDDNYBYs2M=
=vPV9
-----END PGP SIGNATURE-----

--X+8siUETKMkW99st--
