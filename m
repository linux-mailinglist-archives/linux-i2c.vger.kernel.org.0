Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA5C1DEB57
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 17:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbgEVPAj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 11:00:39 -0400
Received: from sauhun.de ([88.99.104.3]:33274 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730261AbgEVPAj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 11:00:39 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id DA0942C203F;
        Fri, 22 May 2020 17:00:37 +0200 (CEST)
Date:   Fri, 22 May 2020 17:00:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in
 adapter
Message-ID: <20200522150037.GF5670@ninjato>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com>
 <20200519084833.GH1094@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline
In-Reply-To: <20200519084833.GH1094@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 10:48:33AM +0200, Wolfram Sang wrote:
> On Tue, May 19, 2020 at 03:27:29PM +0800, Bibby Hsieh wrote:
> > Although in the most platforms, the bus power of i2c
> > are alway on, some platforms disable the i2c bus power
> > in order to meet low power request.
> >=20
> > We get and enable bulk regulator in i2c adapter device.
> >=20
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
>=20
> Applied to for-next, thanks! I added Tomasz Rev-by: for you.

Reverted because of regression reports in linux-next. I am all open for
the change in general, but it looks to me that we should wait another
cycle.


--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H6RUACgkQFA3kzBSg
KbYgEBAAm2Ws0HR6Us1YXmvYKoHYeckt55mFxwzRd04YrAX6JvWtvEfbgBNwX5MQ
j0ZsXyDkakJUj93B0oYzVqBPH4vX1KG+inRUsp78j5d1cFl9YgTgrtw1rsAvjAh4
IrLjo0V2sEJCLNRyEDkSo73udbhItQFDC+xRA28WJ8ueF/aVmMtHM1poyWA/QwR6
NKLB8h5pUhRdX0ZlSOB9fTYnmVnJ15SNNLsOmF09XbMjTYkCGl0+sVsV8oOA3G5T
o4J7+bL//YtDxGBLSri9Ut4nANW+63SqbOsAnWFJCZNlaFGkM8o0KfDGkaqlY0BR
if8/4pd/XPH7CbPEAkdSR2QdPo0+XFkqMmRGld6ELKsjq+vaVU80F/fpUGyOH+Xo
qijlAS2z+CVZEgEKjVE8jKDJ8MVUlIFp8tnXdE9n++jwZwB7VJq57lMSqHGeootb
/AprIhiDCCjl9ETWCQgGK7n/zq0XuTmKACAK09vLqxflRYAuttKcLLo7jMG8LJbV
XqvZzvwz+qC5EWrka5G4MBj0blLzXa3dNKj5CV3tXeOpKu1OYOtg2FiJ0k7Pbcui
kFWmB1BTCVIkzkFsA4XaiTSLDc3lq7WjEOb4FUXumaUsb2mpeTKpP2QW9EVPtoJm
Kxo8R+0vD9Ix0xXcHTpIg9mE3QzKJ2Gk2ey6jlNjHbOU/oKhM2c=
=qEVd
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
