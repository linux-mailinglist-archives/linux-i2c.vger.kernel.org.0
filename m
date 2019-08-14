Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32BBD8DE13
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 21:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbfHNTw6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 15:52:58 -0400
Received: from sauhun.de ([88.99.104.3]:52268 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfHNTw6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 15:52:58 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id CB6AE2C311C;
        Wed, 14 Aug 2019 21:52:55 +0200 (CEST)
Date:   Wed, 14 Aug 2019 21:52:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 2/4] i2c/busses/i2c-icy: Add LTC2990 present on 2019
 board revision
Message-ID: <20190814195255.GC9756@kunai>
References: <20190812235237.21797-1-max@enpas.org>
 <20190812235237.21797-2-max@enpas.org>
 <CAMuHMdX3NtKwxb6BJzJR1qLs5vC9zhU3d+cdrrHx4B9r1opkvQ@mail.gmail.com>
 <fa145f84-4249-44da-57dc-10cfe25dbde3@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <fa145f84-4249-44da-57dc-10cfe25dbde3@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> However, I'm not sure I'm supposed to do that. I went by Documentation/i2=
c/instantiating-devices, which in "Method 2" says:
>=20
>   The driver which instantiated the I2C device is responsible for destroy=
ing
>   it on cleanup. This is done by calling i2c_unregister_device() on the
>   pointer that was earlier returned by i2c_new_device() or
>   i2c_new_probed_device().
>=20
>=20
> So, what is preferred and why?

What the documentation says is preferred. For consistency and because of
the general "free what you allocated" rule. If we have arguments to
change that for i2c_unregister_device(), we would need to do this
tree-wide anyhow. Until then, the above is valid.


--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UZpcACgkQFA3kzBSg
KbYuLA//T5RLmOjnbgw4lXyUxahOGLly6DjT1JDvZCl0FtWCCiYDOVcRL5VOPKHY
XjonlM4g0uO7wJsQz+LAh5DizpTF98gn1uRUbGuzEUEiGIWHQTKMX4Vj4/tPvi8X
NDk86PKVlLVLQ1WpvB7oRDgcsRyUy3Px0qJ6cH8bRY1K8/IyszlWcYh0mfGEMre7
wZhZz5w6tdOqrQB/3b9v6JH3nNwhcmKW3EM60fU8mO4iJwnEeD4zFF7FK00YxlPx
Nap/D0IL6qqfhJuaE/TKC7a23TBSinmn/5NspHq7/vb2KpSqOBu61LtMNkmzzndO
xWsCVx0IrS3mLwUz4ftDWvX3+qpdLsmJniQg476oP7cmzZ54t2mEPUWmEUqZO8wd
5wIRTE+ZwBUhVByqmTc1AQzkVnRdRLGLO8WmQQNBJJc0tCmJP1XMdqEd3yb72SZV
XpC86hGSDSL9klEsdNiNekjtix03VS6+gV64QOhe3l4Yxtuk2tTA6qeGyigySaLo
H2We280Al6DybJsMbvOLdxL7/+f2io65HsN+nL2XGEXoL9P7DcJ14Tw5Qajw7GvJ
RV3DVi2HC/KvMaJR7fTdChpnfoO9lp/bsvItsBfBUAnw5tVQJNgejYI82sspkvfV
a6x14gbRb2+EdE2VQa5uauRd1rSiODq4MiDv7/glR5HKAM5uqdo=
=t/J5
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
