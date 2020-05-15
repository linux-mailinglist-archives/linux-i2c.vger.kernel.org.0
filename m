Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C759D1D4978
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 11:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgEOJ0f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 05:26:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgEOJ0f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 05:26:35 -0400
Received: from localhost (p5486CC07.dip0.t-ipconnect.de [84.134.204.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53824206F1;
        Fri, 15 May 2020 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589534795;
        bh=JONR1pyDiZUuVzDV4dMV5uAVGjvbIMtv5fbdNtZJQJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KXai6YkiZMm63/30RRwO6O6lX2sos3XjZi1OeX33TJi8uY9uz5zoDHc9rxPrUpVh1
         UUd5IXcrHntKLeLmcELp+ER0FaptSqknwrifF6K/jdQHdh0/lVozMcaY5MVRF7XfVd
         pNcJBZzF1n1Qtu2AdbgBEnPjlP345J+ZOoopxIG8=
Date:   Fri, 15 May 2020 11:26:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        linus.walleij@linaro.org
Subject: Re: [PATCH] i2c: at91: Restore pinctrl state if can't get scl/sda
 gpios
Message-ID: <20200515092631.GB2077@ninjato>
References: <20200513111322.111114-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <20200513111322.111114-1-codrin.ciubotariu@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 02:13:22PM +0300, Codrin Ciubotariu wrote:
> If there is a strict pinmux or if simply the scl/sda gpios are missing,
> the pins will remain in gpio mode, compromizing the I2C bus.
> Change to the default state of the pins before returning the error.
>=20
> Fixes: a53acc7ebf27 ("i2c: at91: Fix pinmux after devm_gpiod_get() for bu=
s recovery")
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

I squashed it into the other patch and applied it to for-current,
thanks!


--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+YEcACgkQFA3kzBSg
KbZIIw//RKnTmZzSi3ZieTQnZ64Pv7lEIn6QAM9FBzNk0Pzk8s5maVdQCzWq4/Ho
CPO1Dk/R1qWQxikxvyKx9sfqVOIXVVLiNs9lYFmMkdQPoALrVvbQicwimZFyUjNO
8zE1/LXvhLLU4UeP0oM+3OsD4v+5AvQ6igq84Etx2hfHO65w463NpP+tv6ut6q8R
Zc8UVpJTRf9NGYtk8h3AvThMT+R0KNaEOe445HNLVi8bUg+3cPpDExOrdMJcwqRl
QykdNi18hi05ATx+PqWDzSQIbUnLGVeEYQ/U3X14AJkfI+mJ0lFtWzK2RkOgUSbg
+m6JCs1/knFQOXE5hIc/S8RDX8Ags8uw1ztmcEvSQ4x8gSDtznWFHWkGo2g/2XeM
ZkttSMuwfHGebvQwSSmHEJdfi4h5IHax0qgf6IjLYaygA0n9Am7FBij6SKVTecxB
tgYroBOIX0FoJRvMxpF7TtIQQaK/IEPhotPt21ayT/worPk7Fj4pbBFBSBX9sPIg
Ydf/8JvTivFgPv6vcT+KV6DxJ5KmWdyuGd3mzh8JnlvEvl5sL6powbU2z8/yPpaK
2vBF2d1bdFy7kStu5McgvKROKCN+FVZBXOnNXOiHTYURQgpck1VqXuscl5xUkbci
nzyNwMVQ48o5ptBOMmHMUSC1MTg5Mxyq+7B3x0ZipY2SmPXdk68=
=Doda
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
