Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D8B2D4792
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 18:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732223AbgLIRLN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 12:11:13 -0500
Received: from sauhun.de ([88.99.104.3]:59362 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732644AbgLIRKt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 12:10:49 -0500
Received: from localhost (p54b3328b.dip0.t-ipconnect.de [84.179.50.139])
        by pokefinder.org (Postfix) with ESMTPSA id 763D22C056C;
        Wed,  9 Dec 2020 18:10:04 +0100 (CET)
Date:   Wed, 9 Dec 2020 18:09:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kevin Herbert <kph@platinasystems.com>
Cc:     Biwen Li <biwen.li@oss.nxp.com>, leoyang.li@nxp.com,
        linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        xiaoning.wang@nxp.com, o.rempel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com,
        linux-arm-kernel@lists.infradead.org, Biwen Li <biwen.li@nxp.com>
Subject: Re: [v10] i2c: imx: support slave mode for imx I2C driver
Message-ID: <20201209170948.GA2249@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kevin Herbert <kph@platinasystems.com>,
        Biwen Li <biwen.li@oss.nxp.com>, leoyang.li@nxp.com,
        linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        xiaoning.wang@nxp.com, o.rempel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com,
        linux-arm-kernel@lists.infradead.org, Biwen Li <biwen.li@nxp.com>
References: <20201111113255.28710-1-biwen.li@oss.nxp.com>
 <20201202151033.GC874@kunai>
 <CABP=6zZcmsFUVwUaAH7f2-RqFHz71GLDnSfLreUo5GA3Y58HYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <CABP=6zZcmsFUVwUaAH7f2-RqFHz71GLDnSfLreUo5GA3Y58HYA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 09:03:50AM -0800, Kevin Herbert wrote:
> What is the protocol for the I2C_SLAVE_STOP event? I am working on my own
> backend, and I've only tried it with this i.mx driver, and I do not recei=
ve
> I2C_SLAVE_STOP at the end of every I2C transaction. It was my expectation
> I'd receive this event at the end of every frame. In my testing, I've nev=
er
> received this event at all.
>=20
> Where are the I2C registers on the i.mx documented? My board is an i.mx6s=
x.

Hmm, from a glimpse, it looks the STOP event is only sent after a write
and not after a read? Does this match your findings?


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RBNcACgkQFA3kzBSg
KbaJ6RAAsPJyZ/MTajnOltJDXCtbBT6yb5qWPfZdpA5WpP2cwsZPxmcGPzizkSDb
nOKC61fPCtAxq2tG1wnpdKzzLqsVD/BA90Cq3UckfP5H7LAqfzUAGuemAr6nsWo5
8ZBUbvFYgig9gyl7FtAuR3fRXGv62zPfkJm9y9dCb8RxXpMNQB348OKzxar+hfoU
njjwZNHBx9hachkRLocKub/hzfwk0QupYlTxEvwfMlTKGt1jFCPZCc1xN1fQpJZw
z7hCP1QiNp0sItuO4EIfaakfAXI3sdWXP0/RqvLs1O9OZBuCRPDj1zoMClWmaVDE
qT/9Fsf5ZweBrHcvmbUH90OUvMwLnxr4Lfd21rYRnSm6WWK+tNVbOnB/lRdbR7p2
tMjsz2WzawunVhjRp8Oxi1AozedyVqt43JuTqsUz/GTFrh0ouzC+Bcg/a9hvsI3Q
/3Iw+brpYxQ2fWo4zmN7VAshXdY42sYV4A7V5si5KJlsurZdi4Iw6cy+Fjj+RF3R
VHLcgEEPMacqHDdjo3DDsBPb8U6dtMrrCjPVEmenN04HMnIC+MiHz8qXAY/bdIo/
It7NhRCpJd49j1Dui8tYANV4iEDCjL1nyGIXFfI2PfEHcu+k+S9OEnqMEgYPR7ue
5rtKl+6UfNumK+JMkgeQL6A9SQxS/3pxJteJD1fVbp7zNqzBFyw=
=PZhw
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
