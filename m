Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833CA1F8EFF
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 09:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgFOHGV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 03:06:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:51052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728180AbgFOHGV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 03:06:21 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0060C206D7;
        Mon, 15 Jun 2020 07:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592204780;
        bh=fUQNCAAb6DjGomvNl4eNFS4GZ/iZOIWKfiriaaglQf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NGt9H7nPgvZ32vSDoQGNlVzCidRta/sIu4S/AmYHx+omviqGOlI7rqBOrBomhSabw
         odKfQDbf/MwUe5m2rlbgggpyE7/rDmDwe2IGiw+N6nfMmlxjKDzT8UnkOvCjmA9xi4
         3HP1Lh/ZIcwsuvpACy6Cczd7m27IFY44y/ETSLR8=
Date:   Mon, 15 Jun 2020 09:06:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "kjlu@umn.edu" <kjlu@umn.edu>,
        Markus Elfring <Markus.Elfring@web.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Andy Duan <fugang.duan@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on error
Message-ID: <20200615070613.GA1497@kunai>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
 <20200614091203.GC2878@kunai>
 <AM6PR04MB4966A1FD80A29BA1E63247C0809C0@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <AM6PR04MB4966A1FD80A29BA1E63247C0809C0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 06:33:40AM +0000, Aisheng Dong wrote:
> > From: Wolfram Sang <wsa@kernel.org>
> > Sent: Sunday, June 14, 2020 5:12 PM
> >=20
> > On Mon, Jun 01, 2020 at 02:16:40PM +0800, Dinghao Liu wrote:
> > > pm_runtime_get_sync() increments the runtime PM usage counter even the
> > > call returns an error code. Thus a corresponding decrement is needed
> > > on the error handling path to keep the counter balanced.
> >=20
> > Can you point me to a discussion where it was decided that this is a pr=
oper fix?
> > I'd think we rather should fix pm_runtime_get_sync() but maybe there are
> > technical reasons against it.
>=20
> I had the same feeling.
> Copy pm guys to comments.

I started a seperate thread:

https://lkml.org/lkml/2020/6/14/76

Still, on-going discussion if the proper fix is to remove the error
check.


--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7nHeEACgkQFA3kzBSg
KbbAbA/9FTQMd1gpGi6tiS2NPZ+sd1kxs7t0vnUK9MLKKpgEC0Do/6JBFttvRoN6
So/PITa5zgqjUYeNzRtrbMjXmQVSbCanAhMOBGX2/8w6aMUJnGPbm6sDT26oQkSP
T0jzir2gR3Mw9bh07kXbszx4vJGOFJDOlH31BjxvN/9lZZRCILiEpfoTxGNAOXyV
73BiU6Ez6AMB01363BL8vMC/l4W82YeitG6xrxvz+Fzw5/OQ7qFlOrDfEFbP10tU
wlbk5gUjyWEzhzh0qqGPuRVDeuBxGDgrDQDpFGScJBfZ1oH7lqSyg7fjdOIG3fNH
RPSgvvoPkJkY1WL9wbt3lOpt+F/rBJYy7iDMwY9CgYnaF4bP+peLtUzazK83Wzhb
F4N5A7AP550rmEYEZV1sJqNHacQFqcXXdremSzKjMEp1XVp4CqncjIGrC9qy+BAQ
VZi3L8ExCY36TWYPi5lBqJ76vv3nB2q+GhYkU9CaBok/rQ12LmgGS4Z27X9YjdS4
3CwpsXCrl+/4tsbxFxbWqRvvCMYQwtbIJ3EWGG6ga277+OtYDSSnn3QLFt4GUQ3F
xnWTt0+xvPRHfI/b2ffkQBYINd9kqEy5c7H6OSN67NtdREktPmtbS8OHhEoTx1gy
2Ly8984MP9JzxermLmvQ0mvvtJFrr1TA80UCmQev6XsMoQ/xCUg=
=g8OW
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
