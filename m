Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C41F1B8DF4
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 10:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDZIei (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 04:34:38 -0400
Received: from sauhun.de ([88.99.104.3]:43694 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbgDZIei (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 04:34:38 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 13C172C01E8;
        Sun, 26 Apr 2020 10:34:37 +0200 (CEST)
Date:   Sun, 26 Apr 2020 10:34:36 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: iproc: generate stop event for slave writes
Message-ID: <20200426083436.GK1262@kunai>
References: <20200322182019.32493-1-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ah40dssYA/cDqAW1"
Content-Disposition: inline
In-Reply-To: <20200322182019.32493-1-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ah40dssYA/cDqAW1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2020 at 11:50:19PM +0530, Rayagonda Kokatanur wrote:
> When slave status is I2C_SLAVE_RX_END, generate I2C_SLAVE_STOP
> event to i2c_client.
>=20
> Fixes:=C2=A0c245d94ed106 ("i2c: iproc: Add multi byte read-write support =
for slave mode")
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Applied to for-current, thanks!


--Ah40dssYA/cDqAW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lR5wACgkQFA3kzBSg
KbYm7Q//YsRV9dQZeGL7ZIX+nZD3jYHK40hDerV4NX+m/X2LMSzHiVTgxHvi9fOg
ypRSssFcf77olTqRXKCCgiI9170TV2s2FsCXGcR18iOc3l72wpw9QGpwNt3d0zM9
YAGYHpJ/dE5OMwLld3EDWwhGXeiPiApkrgSAbMGeLEbnJET4pM7ukCerLjLoEPv0
m+8d0RHMEg0t6vMelWpzqEzOoJUrI0Po0BlFFQwW3aDTOGk+0iBMI8p30pE5Xp0Q
5zN0ZovhZr7SKO2aw7W6/6nm4mvN/B35iPT0Np9NUzEnBMqK/8DRVSAOIZPVh+cA
/bBEXHIYLGn7ZLg2uDMGwSnoFskIXCfLOIAojJc7rSPRbZB3xBe6ydchs0a4qIcq
VeyNP/AYiVgcn7rFReDlWiNaVfdo5dS+S9zWW4h6mUiLfd3mZ80wyzAurDtOHNbc
UrM8Fv80i3OkOQVleIMhcvl8hJnMaOOzGdZ3ce3N+nH+ITDZkZT+lxQoagNhlo27
6PweR8k7vLUM9QbH/fZl5O9DhrxtOIJyzUG17+cJRe0d0+4OqhWg/JVpPcMtPAJ1
gkzEFkask+4xyTLVVrMeAWise4V83xLwNNYQLbXaKHBh7vo5/k0OLqUPC76ynJdt
Ox4/ZS5BfrTZRDNFSWwwGLIj2464aSD2FMCh0+D0aBFQjGStBbA=
=NQLy
-----END PGP SIGNATURE-----

--Ah40dssYA/cDqAW1--
