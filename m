Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0AD419A4A5
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 07:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731879AbgDAFSK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Apr 2020 01:18:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33487 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731784AbgDAFSK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Apr 2020 01:18:10 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jJVlP-0005iw-UL; Wed, 01 Apr 2020 07:18:07 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1jJVlP-0002Pt-EL; Wed, 01 Apr 2020 07:18:07 +0200
Date:   Wed, 1 Apr 2020 07:18:07 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
Cc:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Jiafei Pan <jiafei.pan@nxp.com>, Leo Li <leoyang.li@nxp.com>
Subject: Re: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Message-ID: <20200401051807.edaxgrloyqkp3p4z@pengutronix.de>
References: <20200330105038.22546-1-biwen.li@oss.nxp.com>
 <DB6PR0401MB24389E2570C242FB9036EC968FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <20200330111231.x2a57acoy57ycyo6@pengutronix.de>
 <DB6PR0401MB2438EC4CDA8985BE84F825048FC80@DB6PR0401MB2438.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="itinec3fenz6jlaj"
Content-Disposition: inline
In-Reply-To: <DB6PR0401MB2438EC4CDA8985BE84F825048FC80@DB6PR0401MB2438.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:17:36 up 137 days, 20:36, 145 users,  load average: 0.01, 0.02,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--itinec3fenz6jlaj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2020 at 08:48:03AM +0000, Biwen Li (OSS) wrote:
> > Hi,
> >=20
> > On Mon, Mar 30, 2020 at 10:56:28AM +0000, Biwen Li wrote:
> > > Hi All,
> > >
> > > The patch based on https://patchwork.ozlabs.org/patch/1203640/
> > > and it is not accepted, so it(https://patchwork.ozlabs.org/patch/1203=
640/)
> > is needed before apply the new patch.
> >=20
> > I'm not sure what should I do with this information. This links are to =
the patch
> > which needed to be update by you, before it can be reviewed and then
> > hopefully accepted. Why do you sending one more patch for review for a =
patch
> > which is not accepted?
> Hi Oleksij,
> Okay, got it. I will resend the patch after the old patch is accepted by =
upstream. Thank you
> for your reply.

Do you mean the shutdown patch?

> >=20
> > > Best Regards,
> > > Biwen Li
> > > > Support I2C_SLAVE_STOP event for the read transactions(master read
> > > > from
> > > > slave)
> > > >
> > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-imx.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-imx.c
> > > > b/drivers/i2c/busses/i2c-imx.c index
> > > > 62517a41b32d..1fd0d87885d5 100644
> > > > --- a/drivers/i2c/busses/i2c-imx.c
> > > > +++ b/drivers/i2c/busses/i2c-imx.c
> > > > @@ -1464,6 +1464,7 @@ static irqreturn_t i2c_imx_slave_isr(struct
> > > > imx_i2c_struct *i2c_imx)
> > > >  		ctl &=3D ~I2CR_MTX;
> > > >  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> > > >  		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > > > +		i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
> > > >  	}
> > > >  	return IRQ_HANDLED;
> > > >  }
> > > > --
> > > > 2.17.1
> >=20
> > Regards,
> > Oleksij
> > --
> > Pengutronix e.K.                           |
> > |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/
> > |
> > 31137 Hildesheim, Germany                  | Phone:
> > +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:
> > +49-5121-206917-5555 |

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--itinec3fenz6jlaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEERBNZvwSgvmcMY/T74omh9DUaUbMFAl6EJA4ACgkQ4omh9DUa
UbM1kA/7BR8GQzLRTNdN2nnjbYMQBoIdeHQ+UEForrknYhV8pwvR4j5c7jd1v0n1
3jcWWnukPyvTqTgC95bE1OMj6wVfD1wL4oxjPEtdUVolWG/o38jb/MlWlPZPBQ4x
oXsNhBIWfKKptCvQ/NUMzsp6a0XKSRYiveTpuO43e7BsPcWuT9gjRJpb1e5LH7mE
n4yXaBTA4jj6+wBNf/7V+BR92r3x+5hPGSRxvCIYe0eSi9Y/sdzmpW67pSKdwjx2
3pRHaREUMxpEIQ/H/ZQ8fLr+JIaKN6miAmAi0mKgqJ76LSbA7EBPLhvyExrrhP9C
rn7nEDX8t+NSkMeHoWKhv7ICyp5fdA014yY/MpI8/yYC9b9lVHaKSrE8pSnOsyge
Jf59WnDw2Pm1596QLuriZGjbCGUBm2QzBbaqYREF6IeTxdETVxjyvFG9MObecO94
UJjnNYJpHyS7LXkQLcOID92TzRfjbndDQ4lQO8A6QigBbkX93OfN/2d4jXbDkYMQ
5XHoTNAiqOMI0TgUOsqd/Ah5yoRFX34uhF6r1Z8Xd1r2ZiLqce0e9tbRLpQnCNEJ
+fH3EDq24Z4aqoyQZXTt9DBqH/5AhBKOmEqCDXkj+D4NdIdZQBaYsQ6m1VehGnk6
DQ8noH+hGM1CUI3Gqws4IoRaub/DYu0LUDm+L8DL5djfVOTK2as=
=SL9Y
-----END PGP SIGNATURE-----

--itinec3fenz6jlaj--
