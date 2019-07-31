Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB8F47CD21
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2019 21:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfGaTv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Jul 2019 15:51:29 -0400
Received: from sauhun.de ([88.99.104.3]:44636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbfGaTv3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Jul 2019 15:51:29 -0400
Received: from localhost (p54B33080.dip0.t-ipconnect.de [84.179.48.128])
        by pokefinder.org (Postfix) with ESMTPSA id 6CB462C270A;
        Wed, 31 Jul 2019 21:51:26 +0200 (CEST)
Date:   Wed, 31 Jul 2019 21:51:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Eduardo Valentin <edubezval@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] media: radio: si4713: Convert to new i2c device
 probe()
Message-ID: <20190731195125.GC4084@kunai>
References: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
 <20190710215149.9208-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline
In-Reply-To: <20190710215149.9208-2-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 10:51:44PM +0100, Kieran Bingham wrote:
> The I2C core framework provides a simplified probe framework from commit
> b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").
>=20
> This driver does not utilise the i2c_device_id table in the probe, so we =
can
> easily convert it to utilise the simplfied i2c driver registration.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1B8T0ACgkQFA3kzBSg
Kbb4ow//ZyIbTtU3Gr7nelWX2UfX2+F1vwzZbtgIYAS2iyewaz4oPj8VXZcbblWy
zRtRkoQDziaj2SmU/3t+lxEc3Hr+j4359IrunnTW31Tcgd6vxM26AHya+UTSbIFy
sEG64k0/FuMxkGqkR8NoL2oS+o++SzLeV371TJh1M9e36vsHU/HdwFPqiolbtNX2
lkpUt/o4CWtie0kKlCpzmNzO0HpQo8GA1DCJChtmaofs2bDiPVDzNNYzHkkwIgoj
Zhg49yc4625/EBSmESYatT/liiWaIJqAzsNnrQH1opjjT8Gh7O7QUfbZmjjlf9ju
phCvn3vJ1wSKJgOjG7gmJXfDFZ/hwsUWP7fLjuPpHVOVjBdRaghdvc1XPYtJZBst
Mg80LJNgrskkwVOOO4GefcikHcfodZyFkvxvYxC0tMUIXY8yy/FLacL+2oYMjudU
o6lyb8x+jlJ1/fjuCBtWXNuC9Yi47/4kSzCL6glfHmrr59rVv0NeXALQI0Z61C0S
IdUXAbiwNq7OlfPw/utZyPDeqxpTVutjL612vvvo6fQVIzLvjZ93TyGa0sjuVaM1
INmhbTwatAvb5If3oavyKkOeffxOt0Fwc35H06nnDp9k1fEbqHmOp2J2NhEjZykf
skIIX4vClxrNKFLKe+aRZHu0jpj3fkR1lNv3BNlagmcjLnePhE0=
=sfK1
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
