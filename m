Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F10E21866A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2019 09:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfEIHzg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 03:55:36 -0400
Received: from sauhun.de ([88.99.104.3]:59382 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbfEIHzf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 May 2019 03:55:35 -0400
Received: from localhost (p54B33113.dip0.t-ipconnect.de [84.179.49.19])
        by pokefinder.org (Postfix) with ESMTPSA id E8C702E3571;
        Thu,  9 May 2019 09:55:31 +0200 (CEST)
Date:   Thu, 9 May 2019 09:55:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Sumit Batra <sumit.batra@nxp.com>,
        Chuanhua Han <chuanhua.han@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "eha@deif.com" <eha@deif.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        "peda@axentia.se" <peda@axentia.se>
Subject: Re: [EXT] Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider
 I2C_IPGCLK_SEL RCW bit when using ls1046a SoC
Message-ID: <20190509075528.obzchc3midbjpvzs@katana>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190430125043.weqwzim4gpsvtkfe@pengutronix.de>
 <AM6PR04MB43571B8D52C1FE9ED20DBA1D97360@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <20190506073735.ctzybytamu44pbvv@pengutronix.de>
 <AM0PR04MB43534A9B1A146DEFA929844C97320@AM0PR04MB4353.eurprd04.prod.outlook.com>
 <AM6PR04MB4629DEDAAA6559EBBD20E974EF330@AM6PR04MB4629.eurprd04.prod.outlook.com>
 <20190509074851.czcjlpfm2iooqjv4@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gv6qjm3xh6s2jhl3"
Content-Disposition: inline
In-Reply-To: <20190509074851.czcjlpfm2iooqjv4@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gv6qjm3xh6s2jhl3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > There are 2 places where clock division takes place -
> >=20
> > 1) There is a clock divider outside of I2C block, which makes the clock=
 reaching
> >    I2C module as - Platform Clock/2
> > 2) There is another clock divider which specifically divides the clock =
to the I2C block,
> >    based on RCW bit 424 (if 424th bit is 0 then the baud clock source i=
s Platform Clock/4,
> >    if 424th bit is 1 then it remains Platform Clock/2)
>=20
> So there is a clock divider which based on RCW bit 424 divides the clock
> *to* the i2c module. This suggests the divider is outside of the i2c
> module itself and thus part of the clock module.
>=20
> We could argue that this divider sits between the clock module and the
> i2c module, but for sure it's not in the i2c module. I really suggest to
> put this SoC specific into the SoC specific clock driver rather than
> littering the i2c driver with it.

I am with Sascha here. The fact that you need to of_ioremap some
registers is a really strong indication that the code should go
somewhere else. I can't tell the best place (clock driver or seperate
GUTS driver or syscon driver), but the I2C bus driver seems not
suitable.


--gv6qjm3xh6s2jhl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzT3OsACgkQFA3kzBSg
KbbgNQ/8CGasqnfiTpZ11DFig8JEAVVpHiW7URbOcwfSNliiGRcajU0Z15c9dQrB
FXq50Xgz1DAf+yhNgfWk28gZ9DdbGEdEvRUyZsW1oq/Vf2vJEx5wBQUB04Rw12KS
6OjdgBK1mWDHsbRcI7/Ug9nL2gWPTz/u0bzL9btM/AT7CDnKi+CiLlcjqrLGWT0b
KasALzS/AfnrtXTqyNL2wdqkTZC6wrdjgiUswYQ1Yr065NZnHxrH/zR6RgOIA1ya
p5A//ME3DiCQRLToYXM8KU8Rb/PW29n1GtefaiFyrrhXAg7ZPfR4y8n+AQTkgPUq
2Mcpz2nRod1e79YpgYm5+XpcTD7bgV7XZD8RH9uPKfpAW0W33QP0OFKG92RigTTW
6mJRvtus8S3VfaHatBupH/kQsnoyZXktZXRAdgWEa713zybXoGUzwvQICnJAUp5T
sB2LxykMYyb8T862XbNzQtC+0cCDotY4ZZ2plIOlUrNomf37ZunQu5/uEecPf6s6
2MlVlzgTYTwG6lz5WxkZ6A2RTnx8rXvcr7jwo7wwVcjf9W2erTR18+tqU7bmtrol
qh1V0XeufPewhKfCmSR+9yyP029AP4cwdRHNQNsg9oDQGzqYZxhHSKH1IMBt2PI1
Ozxlx/gjom3K5yCe1tWBIG0yzxnFvXJBHgGKimBFmYt4I8Eh2Uo=
=q/1n
-----END PGP SIGNATURE-----

--gv6qjm3xh6s2jhl3--
