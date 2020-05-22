Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1BE41DEB7C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 17:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbgEVPJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 11:09:15 -0400
Received: from sauhun.de ([88.99.104.3]:33418 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729931AbgEVPJO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 11:09:14 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 356FF2C2072;
        Fri, 22 May 2020 17:09:13 +0200 (CEST)
Date:   Fri, 22 May 2020 17:09:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     o.rempel@pengutronix.de, u.kleine-koenig@pengutronix.de,
        ardb@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] i2c: drivers: Omit superfluous error message in
 efm32_i2c_probe()
Message-ID: <20200522150912.GI5670@ninjato>
References: <20200415135734.14660-1-tangbin@cmss.chinamobile.com>
 <20200522150418.GG5670@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="U3s59FfKcByyGl+j"
Content-Disposition: inline
In-Reply-To: <20200522150418.GG5670@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--U3s59FfKcByyGl+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2020 at 05:04:18PM +0200, Wolfram Sang wrote:
> On Wed, Apr 15, 2020 at 09:57:34PM +0800, Tang Bin wrote:
> > In the function efm32_i2c_probe(),when get irq failed,the function
> > platform_get_irq() logs an error message,so remove redundant message
> > here.
> >=20
> > Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> > Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
>=20
> Applied to for-next, thanks! Please fix the issues Uwe mentioned next
> time.

And try to match the subject line for the subsystem, i.e. for I2C:

"i2c: <drivername>: <topic>"



--U3s59FfKcByyGl+j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H6xgACgkQFA3kzBSg
KbbqGQ/+KB+H2gA8bZHYDnkY6baFlP30t3IjDi5MZ1h92dmiMkEP85LNhMtjkln1
CIoRFWQZhpBh3cri2EVA++O7efFqakLSPhfQdlKuWkwE9aLEkAR1d6sbxGOeR875
GjgFVDR4oqKNkDYRSCSl6ZQM+V7XJ5nerFxuWgdHqr6R4jmQaOH/xQhSiKvtunQz
wm5dJcm5BbK4IQJKpApHEDBvCeVUJ0BMqYJbiVIdioEHXObjMyh8vZTAEbH+lo+b
qXzirZiB/fAqHgzkFXxVp01JGfF+v/zGFgmja35pPtc3XTcf3NCzREE1cn2s1lOm
ww5yU8TJcGnXuVsGDG4DgHOPrkNY30WYiMriYCRGKUqjTpH2SmlKJ0+rZ9tjdJeb
QQ4BX1wEu8kjHXpeqGzZS09nNWqyeEvhExUeOoguqUvfj8mT5SdAdO/eGQOHmHGR
D7hg5whcmmibAZH6aAc3SE8s/1NCjW63bj4aLB9uCI3yvS7dJAhtAE2zw5ZLfGK6
WHG9kNeFHWmhezSfnIkKiUEF+twl4waatI0MhLa+HSTHsXjf85rDLY0VUqPGk94Y
U8LgIbMEeEhFsPWuaazPXXfNSz4fSLZ9TZ96djloAdRDqn/phKXqFYBxxUpX66Lz
xL/JxiU/HUp9EkCTXh1ytpvi32pTsSKvOLiEbzhzWr6Nbx9ta1o=
=ivLg
-----END PGP SIGNATURE-----

--U3s59FfKcByyGl+j--
