Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46EFE87DB8
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 17:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfHIPHa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 11:07:30 -0400
Received: from sauhun.de ([88.99.104.3]:38874 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbfHIPHa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 11:07:30 -0400
Received: from localhost (p54B333D4.dip0.t-ipconnect.de [84.179.51.212])
        by pokefinder.org (Postfix) with ESMTPSA id 909B82C3014;
        Fri,  9 Aug 2019 17:07:28 +0200 (CEST)
Date:   Fri, 9 Aug 2019 17:07:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
Message-ID: <20190809150728.GA5099@ninjato>
References: <20190807203153.11778-1-festevam@gmail.com>
 <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <20190807211317.GA5193@shell.armlinux.org.uk>
 <AM0PR04MB421142CCB25E76ED53148E7480D70@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20190808111054.GE5193@shell.armlinux.org.uk>
 <20190808200728.GB6609@ninjato>
 <20190809083909.s7i6fvkxky5mv5cz@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <20190809083909.s7i6fvkxky5mv5cz@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > And since some interested parties have gathered now, I start yet another
> > call for a maintainer for this driver. It is really needed, I'd say.
> >=20
>=20
> If no one against it, I will take this task.

Awesome, thanks! Given I am looking for a maintainer for a while now,
I'd be much surprised if there is someone against it. I suggest you
send a patch adding you to MAINTAINERS and let people comment there.


--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1NjCsACgkQFA3kzBSg
KbaHYxAAte7a2dkSB+/YNt+CZm4OVgf3F64Fopo+/CZtBLsCL0WDOkzr/M1Yn/YB
oinKmWDYqaxGrrjORBoOi7B0tPSHPhVoAogiZXSNKmo1H2R7i9gjB53irZVKG5PV
Y1NqkLzu23mmqaQRhTF05ka8B8mTPHVnE0Et7XUOY7evIrbZFwpn7N69n9pULlPv
PnMpr9roQN2YPzqZVXlQi0eOIKAvfOoAYlAEBiUs5SrXbRoXSmN7ZjSlk/N1p11E
ylELId+HlDDoIk4rP/7M1BZcoszil5lDFoFbfw6TTUTmzvyau5M81J0FB27FAW+L
c/hIlblMh/S0dCVQsTq8YRCTowqVDsamomv2x6SG7l7HCTahPSDXaVePIiFOMFSY
RLSEWweK0NIEEymHJ7ze1GpJE7KHWL6sollz6WxUNw42tdIYA4J/h/tPcwqUMzaf
xtXw2ZqMUwCsxJr4pAkikkEKWAHqut3R4gcBCJZQUaoodqqCcpOQ6qY93XC7XtUO
naYMVbBRzgHc1mT1LfTjKSfMWHOoGSrv2Flf/zOTiKPuxuB5ous5dNdOSS1UUvZ3
Q0vM8QlvrELqlQnERu/ni/mfiDkZLt1sy2EKCvLZajLYvP/GIrPo3Uc3cZrpwuTa
dbfKrOACPrV+6VFg91VO1saWi1VMqz2htfuObzOnoHfEvsoZcrI=
=kJ3n
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
