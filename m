Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D9D196377
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 05:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgC1EC4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Mar 2020 00:02:56 -0400
Received: from sauhun.de ([88.99.104.3]:46598 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgC1EC4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Mar 2020 00:02:56 -0400
Received: from localhost (p5486CEA0.dip0.t-ipconnect.de [84.134.206.160])
        by pokefinder.org (Postfix) with ESMTPSA id F17042C1F87;
        Sat, 28 Mar 2020 05:02:53 +0100 (CET)
Date:   Sat, 28 Mar 2020 05:02:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <avolmat@me.com>
Cc:     Patrice Chotard <patrice.chotard@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-st: fix missing struct parameter description
Message-ID: <20200328040253.GB1017@kunai>
References: <20200326212243.17363-1-avolmat@me.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <20200326212243.17363-1-avolmat@me.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 10:22:43PM +0100, Alain Volmat wrote:
> Fix a missing struct parameter description to allow
> warning free W=3D1 compilation.
>=20
> Signed-off-by: Alain Volmat <avolmat@me.com>

Applied to for-current, thanks! Please note that the 'i2c-' prefix of
the driver is dropped because it is redundant in $ubject.


--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5+zG0ACgkQFA3kzBSg
KbaZLQ//WVJmHFBdAbvHLNhIzPekQipZ/5fg8My9p15tb2DgQEeQj/6OIvj6aDSf
hq1fZ70fi9lzHAnvHZA60G32TXaq86qd3JPDaVtMCssDyfIzw33vbFe2SCJ9yR8i
cag28YevGk1SPShruPVjdMOW+MV9/a8wC4CD8qgadW5qJjd+O00pW9xSrygXk8JQ
s3WgQmJYNOuitS4vx282niWOOC948PUm3bqpby1taGq7knyhxW+M/Kp7Tln2LJ+r
x4wP0VRZcRCo/LgfXw7xv0F4OTk1Nn4rLv1SFHZ7yJZQn4XIbdmddtu8mpaMvHdq
LtG7snqpK1LlY/JLHzc2eBioK2dIYc88R7+GeUQAyxibdzuRMaZ0D20H9JGAG2Qr
NwQ56bhg50ugv4Hy4RO7JDMulcgBOmFTtOpW8/EgALOmaELXU+2qoaOhAUNiNOuC
Fk+cqV4slzUqg7vjs97krR43B43TnKW2kwqyxR0ffbFXQrlYyLFYuSBOj/Qk4qyy
9audI17Tbv5Ak8HuoQjyYzHAdg8GSA7qVPLIST9aRBgS+7lFBy7rBsEWpAmyrlGS
vtvXZ3cOO9GHSa1ZhetyzbSsokLnXSM7dv9P9WWie3Zs/5eO3wxr1yGrX32KCavR
/BC/BAonzKU9dGrf8WidPCyABqF897bN7FZikH0Dzl1E5RpYU1s=
=ocy+
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
