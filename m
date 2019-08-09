Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D5587DC1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 17:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407113AbfHIPKh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 11:10:37 -0400
Received: from sauhun.de ([88.99.104.3]:38954 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406652AbfHIPKh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 11:10:37 -0400
Received: from localhost (p54B333D4.dip0.t-ipconnect.de [84.179.51.212])
        by pokefinder.org (Postfix) with ESMTPSA id D591A2C3014;
        Fri,  9 Aug 2019 17:10:35 +0200 (CEST)
Date:   Fri, 9 Aug 2019 17:10:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     Joshua Frkuska <joshua_frkuska@mentor.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [EXT] Re: i2c: imx: support slave mode for imx I2C driver
Message-ID: <20190809151035.GB5099@ninjato>
References: <20190808035343.34120-1-biwen.li@nxp.com>
 <20190808200202.GA6609@ninjato>
 <VI1PR04MB4495EA1A44120654B494EB3D8FD60@VI1PR04MB4495.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
In-Reply-To: <VI1PR04MB4495EA1A44120654B494EB3D8FD60@VI1PR04MB4495.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 03:18:01AM +0000, Biwen Li wrote:
> > > The patch supports slave mode for imx I2C driver
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> >=20
> > Wow, this is much simpler than the other approach flying around:
> >=20
> > http://patchwork.ozlabs.org/patch/1124048/
> >=20
> > Can this one be master and slave on the same bus, too?
> At the same time, the same bus is in master mode or slave mode.

So, can someone kindly point out the key differences to me?


--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1NjOsACgkQFA3kzBSg
KbZraA//TnL/M3ynAzbcUfci4GFDrF4jMYa2o2/omG9PudfPvQe+FAlnzotOev5w
H3qcvZunKEJ/kozkTIN+EyiJQl66Qe83oq/96C5swg1lTaac2unx0++uMV3pYEsG
hPCfhy37l+Ng+qoJH9Z2/cNOwq3YnM8kuRXjuKJ67+88MaNLVKEzlJXUYxx0PnLX
qChztUKmPaUPBA88Sx9ixUb9H32kOno7JU+gD8T1dSz3liQ9yJ7qwzAet5Cb6uZT
8fNUhXhzuJSOoEcuuwLtQwDz0CyVfOLQ3AZVOr5jzF7b9qgvS7uBej7LvacjOuXj
PkeiOE6LsAFGvb8nqzGJP+wv+4fEefdKFezI4ixa39OAHv1cDql9xDKILo8AL+h9
YCTFEOWOPsIHNF8G1SCZcfF3IsFF9GIYs54lCoyc1aR/VlYhgcKsVdXu4byA5epX
xjPC0TTcNwAGEq9Dbb7PbYZqwQ0LgeottUb5mIA6eIpVURUlensrNO0Dk2hUPDEQ
OV6JM122ugLcmkECg6AL2+Cx9o7fuUiEmlpYAT04eOIn1ubkZ7eMjpJvwrxiUpfj
sHWUygP8ZLgTyh2o8mpLcT5y5pYhtoSNGkqBsCkIW/LP1niQGY1a0TAP1v1lDn5y
lhgiJvZFV/99g9aHywHxvDcZqqhyQGjBfAF30sl9gMzhNaVmCA4=
=vUVo
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
