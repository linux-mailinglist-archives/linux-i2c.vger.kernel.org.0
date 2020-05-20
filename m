Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D02F1DB4DA
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 15:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgETNXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 09:23:22 -0400
Received: from sauhun.de ([88.99.104.3]:37680 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgETNXW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 09:23:22 -0400
Received: from localhost (p5486cd24.dip0.t-ipconnect.de [84.134.205.36])
        by pokefinder.org (Postfix) with ESMTPSA id 04D202C1FD1;
        Wed, 20 May 2020 15:23:19 +0200 (CEST)
Date:   Wed, 20 May 2020 15:23:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org, tomonori.sakita@sord.co.jp
Subject: Re: [PATCH 2/2] i2c: altera: cleanup spinlock
Message-ID: <20200520132319.GA5759@ninjato>
References: <20200508.221436.2027916415032712449.atsushi.nemoto@sord.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <20200508.221436.2027916415032712449.atsushi.nemoto@sord.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 10:14:36PM +0900, Atsushi Nemoto wrote:
> Protect altr_i2c_int_enable() by the mutex and remove unneeded spinlock.
>=20
> Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>

Applied to for-next, thanks!


--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7FL0MACgkQFA3kzBSg
KbZIoQ/+LRORdUJ0Xxf+Qz1f1b+31GQyQozL4eip493LCrMTIYyGP4zPmUYZXPD6
2gVxMlDdfOyZB4DXgMFb4uAoFY4ozNmuo03n8UHUFGslY/kx32u0Oy4DyK9zLzCt
9Klf2n/ylgbMkVcr7ZFMQFuYsOnuyzDNZnKu1gFCKXhVI/4Iu9sBIz+rpNoRGIsH
9YUVPPOkvy/pD2zbiGPnKPEojSRcDmMaQl2kyLWy0VCmbcVmwJ+8+nWbwl6v+FfS
8XFHi0kwv/X2CfM9FX5rZGkgdkp6W5WStpAfSxN7QKExu7tTLYR8O6jRLy3FWh9t
WNgqAcpUjJl18pCtdxOTgLPGnbsvT/e6SgA0qttLgKvEeyOh4wK6qanimxNkd6XZ
2bF8fuF64iFHXcTAyLLtzjNf0PGRUOZvX6IFsdkOoK2CqITuZdOwx8ZSMGUwGzxx
SOwqwKAUwLu6PYi1ssAM98kOvJcMQwuPVgrJMKwnEH/uJfNiNQBJCroUZu2bJ2nm
lsXpgBI6U8eqqNgre0JZ4963nOhsaCPUeODvZdpWFAK4dF8MRM09S1LxFzQOAw+/
+WqEmX8ZaLOwYTD+yV5NS2TSniZ7FIu8XhPfhAXQrcOFlXdQTuAy6wm+eZa3g79R
uqPqyRmSbXGT6dqed9eNINyQ8fOfaib8VxOx0B8u7AltlfcIEvw=
=3Lau
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
