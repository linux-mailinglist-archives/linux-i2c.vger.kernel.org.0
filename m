Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C4986B1B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 22:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390169AbfHHUHa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 16:07:30 -0400
Received: from sauhun.de ([88.99.104.3]:58460 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732704AbfHHUHa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 16:07:30 -0400
Received: from localhost (p5486CA1C.dip0.t-ipconnect.de [84.134.202.28])
        by pokefinder.org (Postfix) with ESMTPSA id DC7272C3112;
        Thu,  8 Aug 2019 22:07:28 +0200 (CEST)
Date:   Thu, 8 Aug 2019 22:07:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
Message-ID: <20190808200728.GB6609@ninjato>
References: <20190807203153.11778-1-festevam@gmail.com>
 <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <20190807211317.GA5193@shell.armlinux.org.uk>
 <AM0PR04MB421142CCB25E76ED53148E7480D70@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20190808111054.GE5193@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <20190808111054.GE5193@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This sounds like a more in-depth fix than what we should be doing for
> stable trees.  Can we revert the original patch and restore the old
> behaviour, then propose a proper feature enhancement that doesn't
> regress existing setups?

Yes, that.

And since some interested parties have gathered now, I start yet another
call for a maintainer for this driver. It is really needed, I'd say.


--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1MgQAACgkQFA3kzBSg
KbZN6Q/+KEK3NwPZETlIWntt3OQHIkT03DR5W8p0LM5aS36LDk8VI6Pur0suKXQs
xZE7xZ4tki2++6QiYlai0yUGKL8FjOmoUyF+oyIwgockh9MnefH+0CrhAFPoI5LS
m9kARXFSKzDZFPFxkBTQQMQo1JtoV3H5ntEMwgP4LXi+R5bfMYlde6VG8mFmFQHg
ImmUgYDpvhRVpbJ/Q+G3K+drbqB+YG8gPCvPokQHRkbIxDjKVj8WjIycDIjAM2hZ
zZurQHBT0ODdiMvcplAasKpNmadk38NpjblrX/dzwZ4gTOfS8pLzoVhRsnzYVCi1
AOs7mXn3m4A57YHZdeJdT0I1JzFgHC819EPGYN/wFsBDw96LvyKKWrwvLihckNDK
FYgPzfdoqLdDZHvxbhvQ5gTykx7fbK9PkOAcpK8oacOICgoMDB9Nat2QMh5r9WYw
W4Pgyb1Ot2xGVGVmHNypDpl5hT7++XJM1YsmFWTrGUCMLtg4wJSIg48sZQlXFwIY
08yc2/E+DIWTT4wwqu/jS97WWQEToMAEeMwfkzy/ohiVxdeh0dPketfFoIjYflMo
xAC2R/NSQx/emnkma9nzO/pzC0TigKgTDyutgBuh0TvlN1aMmGHQj1T3wEua9q/I
RhqM+iNKllJv61JmvY94t+2IpRsorftW+9d04249sxS+pAfk5I0=
=zseJ
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
