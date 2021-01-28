Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238D830728E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhA1JXx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:23:53 -0500
Received: from sauhun.de ([88.99.104.3]:40836 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232468AbhA1JVb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:21:31 -0500
Received: from localhost (p54b33782.dip0.t-ipconnect.de [84.179.55.130])
        by pokefinder.org (Postfix) with ESMTPSA id 354292C04D8;
        Thu, 28 Jan 2021 10:20:49 +0100 (CET)
Date:   Thu, 28 Jan 2021 10:20:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kevin Herbert <kph@platinasystems.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Biwen Li <biwen.li@oss.nxp.com>
Subject: Re: [PATCH] i2c-imx.c: Synthesize end of transaction events without
 idle interrupts
Message-ID: <20210128092048.GK963@ninjato>
References: <20201222194850.2274527-1-kph@platinasystems.com>
 <20210108080521.dzm2gczd3d2ygb5y@pengutronix.de>
 <CABP=6zY0xV3dLE5t7qad6TauQsaLmQtYi73BS9XBHwZ2FrgM8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xsn3knLL3qrmRbVI"
Content-Disposition: inline
In-Reply-To: <CABP=6zY0xV3dLE5t7qad6TauQsaLmQtYi73BS9XBHwZ2FrgM8g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xsn3knLL3qrmRbVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 05:27:11PM -0800, Kevin Herbert wrote:
> The loop sends either one or two events to the slave driver. If the
> state is I2C_SLAVE_READ_REQUESTED, we synthesize the
> I2C_SLAVE_READ_PROCESSED event, and then our state becomes
> I2C_SLAVE_READ_PROCESSED. In all other states, we transition to
> I2C_SLAVE_STOP and exit the loop.
>=20
> It is not a busy loop at all. It is calling the callback handler (that
> already expects to be in IRQ context) one or two times, and then it
> exits the loop.

Oleksij, does this answer your question?


--Xsn3knLL3qrmRbVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASgfAACgkQFA3kzBSg
KbapWw/9EQprHfUvjk3btzBRIJmgaHJjdoVMhcAEEF6kZpyXAwMEHZGeczR706yH
mTy4tF6KMirsZIfGk8GMI22xirN4ztEH+eHbr+AdbKhgj4Fu4GmJiYu2mm29Ds9b
5pYigwi/rFNl+BwNZgHp92/G0EC975imGZ2NHM6qyROi2al0AkD99K8GY//XycwB
1m8pvZPVF6sBend7u952/OOnHLkxMf9gu7T1SyTplTcDYT+YWcMrTy4dU2gDo50Q
o9IO2RRSf6rJdzjCdxFK0yR9coGg89SEvnmzb+y8ZrLCWRTj2Lyt99zZIzIFnE4E
Tb9on2LtVVXVVtGr3ZefTzow5g0RdkfKa/LN67Z3MiFJGdeEe9mx8lDpzPkqHRxD
n4N6cp+8GRJsLQ+GwkmCk6zSVBHksSF3Spke1x4qhlvvbbneePdjxD665ImeoZdA
hOdH2ePT7WU0QDcfmzGl5CX3GNHftoDi6ew0lbqeCE/6zXoLwa/bRnOBDnPgc2+k
fEbO1Dt4MJMClhaTd06tF9rBSbma/bfjt9MsuEuUeASXKpfVsMZzrhMaEHmpeE16
AZknjCujTeHC59tzDi6+nQJYzdCP63O7pOW3+8Zd4K+rPKIubdIO61AM31Anoyit
SeZUR4jtMlevXG1Ypo4/FB9Tx99RZ1qYea2ddadFeTuL7+XZXnc=
=eCtP
-----END PGP SIGNATURE-----

--Xsn3knLL3qrmRbVI--
