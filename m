Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C901F8F06
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 09:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgFOHGv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 03:06:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:51462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728180AbgFOHGu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 03:06:50 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 653CC20707;
        Mon, 15 Jun 2020 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592204809;
        bh=6psTtzAfbsjDtbI/z29o3KFAc048XX2lv+HUU1uNcQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s3l13uj1XZS1WBdldnJCn3f5+SFeLOaZ8S1ea0UTQV/itoVqOoLHakP1OBqipHKlT
         sPbxkdBLH7WrB7A3vmIjKHSsrQonpoiQAYD78eiT5aA4ueabO2TmSvlQdxSbLCqzFO
         JyL5apU3ar9zjYz97ZdT+L6tCtWhGBOqVbCMHk+8=
Date:   Mon, 15 Jun 2020 09:06:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Andy Duan <fugang.duan@nxp.com>,
        "wu000273@umn.edu" <wu000273@umn.edu>,
        "kjlu@umn.edu" <kjlu@umn.edu>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "khilman@kernel.org" <khilman@kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: busses: Fix a reference count leak.
Message-ID: <20200615070647.GB1497@kunai>
References: <AM6PR04MB496688E213BDF2B104E5FCE1809C0@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline
In-Reply-To: <AM6PR04MB496688E213BDF2B104E5FCE1809C0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 06:31:28AM +0000, Aisheng Dong wrote:
> > From: Andy Duan <fugang.duan@nxp.com>
> > Sent: Monday, June 15, 2020 10:49 AM
> >
> > From: wu000273@umn.edu <wu000273@umn.edu> Sent: Sunday, June 14,
> > 2020 6:12 AM
> > > From: Qiushi Wu <wu000273@umn.edu>
> > >
> > > pm_runtime_get_sync() increments the runtime PM usage counter even
> > > when it returns an error code. Thus call pm_runtime_put_noidle() if
> > > pm_runtime_get_sync() fails.
> > >
> > > Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
> > > Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> >=20
> > Again, which case can trigger the issue ?
>=20
> It's just error handling improvement because pm_runtime_get_sync() will i=
ncrease the
> reference count even it's failed.
>=20
> I wonder if such de-reference can be better handled by pm runtime core co=
de.
> Copy pm guys to comment.

I started a seperate thread:

https://lkml.org/lkml/2020/6/14/76

Still, on-going discussion if the proper fix is to remove the error
check.


--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7nHgcACgkQFA3kzBSg
KbZY1A//fhA+SLIYCIw1oxbGkvOuAJdvlyjRz1RH5ItN+G7xbJEp/zkTPn0fYa2u
/T4qRUqlIQlS2ybcthqwxLGhmD2rbEkGxTq1gOvYilWCfREU+E0I/GhmfoxAWO8s
mIb3advwOJybe6/UHP1kGAllVDd2f60UKDGDaqhMQX8ilCPAE0e+9i3dmm+rTF70
y7U99kq1jV4eGRggiZUvQUOyl2xjxwYi4sOz29/X/B0WILHmmOLAVsgAxY0l1+tF
+nXAFQySpYB1JV/sXSxbM+1IrA7uWvu83lbyn8lghooz7bDjbWXQ7FecF2oGKH3v
FW5iRAk3puNzGA6RMckqiMM3SGlV+Y3hOhhbFLihh+E+P814LgxN2y2qUjH7TWQP
40Cah28Zex8p1Dfip9p9bmoUlhtuEiCSCE18v7UKTUcBgLzXiEp/oI9qkP05zA+F
R3p37IWGv32TQUR5tOTykeO3tTNI0Bkn/nCaV9/7Rhfku7CN3CRrMtmGyVI/048C
wp1+MCaI9V2yGO33NQfT9CdYjDqBaZi+YdmvyzGC7CUm2Qe+Puqcmei9uk7VKz3U
OPQ+XeeQF2YTVGOB/8HBc7q0G7q/eapYueKqv/e2RTQOk0fRoNGS6WNiWdL8X4R3
Pre8u39yAQg3uu+0Ei/7QmRizjVxt5BrsU+jw441VNdV5E7wKpA=
=GS0g
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
