Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA067197A73
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 13:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbgC3LMh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 07:12:37 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35715 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729254AbgC3LMg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Mar 2020 07:12:36 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jIsLI-0003Xe-RM; Mon, 30 Mar 2020 13:12:32 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1jIsLH-0004lp-Ml; Mon, 30 Mar 2020 13:12:31 +0200
Date:   Mon, 30 Mar 2020 13:12:31 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Message-ID: <20200330111231.x2a57acoy57ycyo6@pengutronix.de>
References: <20200330105038.22546-1-biwen.li@oss.nxp.com>
 <DB6PR0401MB24389E2570C242FB9036EC968FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qca37hco2qeqligj"
Content-Disposition: inline
In-Reply-To: <DB6PR0401MB24389E2570C242FB9036EC968FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:08:30 up 136 days,  2:27, 170 users,  load average: 0.05, 0.11,
 0.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qca37hco2qeqligj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 30, 2020 at 10:56:28AM +0000, Biwen Li wrote:
> Hi All,
>=20
> The patch based on https://patchwork.ozlabs.org/patch/1203640/
> and it is not accepted, so it(https://patchwork.ozlabs.org/patch/1203640/=
) is needed before apply the new patch.=20

I'm not sure what should I do with this information. This links are to
the patch which needed to be update by you, before it can be reviewed
and then hopefully accepted. Why do you sending one more patch for
review for a patch which is not accepted?=20

> Best Regards,
> Biwen Li
> > Support I2C_SLAVE_STOP event for the read transactions(master read from
> > slave)
> >=20
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.=
c index
> > 62517a41b32d..1fd0d87885d5 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -1464,6 +1464,7 @@ static irqreturn_t i2c_imx_slave_isr(struct
> > imx_i2c_struct *i2c_imx)
> >  		ctl &=3D ~I2CR_MTX;
> >  		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> >  		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > +		i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
> >  	}
> >  	return IRQ_HANDLED;
> >  }
> > --
> > 2.17.1

Regards,
Oleksij
--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--qca37hco2qeqligj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEERBNZvwSgvmcMY/T74omh9DUaUbMFAl6B1BcACgkQ4omh9DUa
UbNAiQ/+JAo3IvICPhShidC6KUULItn26+mtm4NhpT38W7RxrJz9LPQtLwEncKJd
O9PjI755EydEc+6Y1WGOllWxss2co1GL7ruEpWhLRuzNIbJ3n9MBNSDUlW/jag9V
DRNfvE4XstyU72VLEk/vqFfNvPbDo9B1vGTB9AE3AsARfuOcwoMvW8d8BtHXpAHB
pC8KcEu7faW4OjkXDygwfKttP2ltoMxZsHambiCssA2mGor/4MSrSdnkm4iTq1+Z
F4jYdEQfd6bs8uMfUzbJ9iFlitglmKyqDQCDS9uILT3JnyrnL8uvjvu7alNpJS1T
g/Of2yYzkOTeWMDJXC2zfByzKBySR4Acby57wmpntCL8HHGQXR4RfiWhLsOI8Faj
I8nbApBTflth0EhAcO35+2C2dI54sk565d4kZU3TURC/CtBVSHbEB6DqEbMpEEE1
G7dFPPM3cb6TVqM2lrXNbHiPT95YdK+byCl59+w09RwJpfphuMRzK5TXp3GYfccH
CalMqmn6Q3pOnIMTGh4pxqK2Zrs8p61+hfbJL6t1oP5d8zc6lnv8AfO0kxZN6meP
d534NTWbx0NaENeIbGMk2czCyKj1c756oGKMEyw3KLOEAJqUNbo7i0yTObIKHJRB
J2USTt6LUKXe/QVXrForidjDWIykMMOhqLhDfHi+zAiRSzHgtYQ=
=83xi
-----END PGP SIGNATURE-----

--qca37hco2qeqligj--
