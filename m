Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5FD7DC0C
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 15:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbfHANBo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 09:01:44 -0400
Received: from sauhun.de ([88.99.104.3]:52822 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbfHANBo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 09:01:44 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id 633B42C2817;
        Thu,  1 Aug 2019 15:01:42 +0200 (CEST)
Date:   Thu, 1 Aug 2019 15:01:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] i2c: s3c2410: Mark expected switch fall-through
Message-ID: <20190801130141.GO1659@ninjato>
References: <20190728235138.GA23429@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sGwo475CiIwWEjLI"
Content-Disposition: inline
In-Reply-To: <20190728235138.GA23429@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sGwo475CiIwWEjLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2019 at 06:51:38PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
>=20
> This patch fixes the following warning:
>=20
> drivers/i2c/busses/i2c-s3c2410.c: In function 'i2c_s3c_irq_nextbyte':
> drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
>    if (i2c->state =3D=3D STATE_READ)
>       ^
> drivers/i2c/busses/i2c-s3c2410.c:439:2: note: here
>   case STATE_WRITE:
>   ^~~~
>=20
> Notice that, in this particular case, the code comment is
> modified in accordance with what GCC is expecting to find.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied to for-current, thanks!


--sGwo475CiIwWEjLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C4rUACgkQFA3kzBSg
Kba28RAApiI7u/wDnAuTCpteayRX5I68w5cXuFTG+gDegwQ3YOswZdkoM9v4W9pd
rfQ84jLH0clY/G4g7qapeZltQIF9QUrknnCPjHQ0x7sp3pwg1QHVnaq58x6BasaP
cQC/UAWpxY9Q0FqWE8g0Q4rCwsCtxRqLR1k+3gqzHpt6elXnApvsm0gfX6wHVZps
7hWXbs49+RR8FEmGJr6CMR8tbkObH9RjS5HnIFlgG+jsxhuIABRRK3b70elZFBXx
rGC+J5uUN9OgJn8qxSJ+6JlxVPRm4oimxJtiH6IkYCMYgINOXQUClLvkXFv4/Dzs
ErS/Kk1EQoZ5jS9T44iZBh1LfY/NrR8gclTIrpmqjiPnrmx7RziaKplg/26VjuDN
rkrCF8HOqC+aD1e3dGhBzxSLxs2PNQQcojjthdmXTFipHhteg3d2iMEjBXHG45yw
I6dyfQpT+n0tjyWoh+DWOIxqD3NlXyyunym/gSEjir0bgnC7TaUQiKQ+xg3pspGd
EnCcXA0TRuNncT7HElrt6wXMi7bnHOh1Fwlkb8cOhR2fxfL6EuSfsNhud3eDgLzU
ow2sNRMl0wpJTYk50ypFHo2l8Bei1/4hRJUH6NYmmJAKaZ1Bakp/cMsY3v2XAj91
3VNl2U3/o5snGmU3Rzjh5x1DMdzL5G+7Xl5dDGfe4aPfvZW+Rhg=
=WUQP
-----END PGP SIGNATURE-----

--sGwo475CiIwWEjLI--
