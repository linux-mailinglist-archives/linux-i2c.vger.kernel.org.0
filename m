Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E69A191BC1
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 22:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgCXVJp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 17:09:45 -0400
Received: from sauhun.de ([88.99.104.3]:55154 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbgCXVJp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 17:09:45 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 6AE5F2C08EF;
        Tue, 24 Mar 2020 22:09:43 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:09:43 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 5/6] i2c: algo: Use generic definitions for bus
 frequencies
Message-ID: <20200324210942.GF7641@ninjato>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
 <20200324123216.78113-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dWYAkE0V1FpFQHQ3"
Content-Disposition: inline
In-Reply-To: <20200324123216.78113-5-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dWYAkE0V1FpFQHQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 02:32:15PM +0200, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--dWYAkE0V1FpFQHQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56dxYACgkQFA3kzBSg
KbYOghAAgHNa5ig/hKGXYSURwtozQYMAMDOrMLUaXy/dAQsjRyrkTgOMNwr3g6Ge
rU+t9QNWQ//qNdibyP88NwJ/tGGDQmWBBWvqQjEO/hcsU7ys66ubwxzbfZqEAiFr
OO1Ze20VyU4/uAXBrZM+fqzWQMy16yp9Y7AawG322nHNPe7i0FhW+52kJ1BnGJbV
+Lb8HsFw90l6OMoX2Qp7A2YS0oy8EWavAbQCWMI20XLJYkx8D1z+yq2YYRmfwzNW
EGzS/sC+yRlx29+f5rZzSXg4+kX0YEapLxjCtsVF62B3ZfV1d62rv5xtJ6azZhT9
yK0m9UmxOrHhA6EVqY4XIZgHijbtBb6I3KxGA/cfTJxoRI0RU3O46yMbpk9DQ21C
oBCtuAKEOxr+l7Uh3S8+6huMWYIJo1D+6+U5vi0DKRr3Ye0PrE6ZStO3r82ni2sN
qzL9A9gLqD6C4OfixFSitlDEQOmg8crJWWWR8UX1eu+1MbCE1QVlNxOE1c8MVvdI
vtpKNVebSVTKY/mh4wb7ETGo3XChwWD7JFuoghaWDybT3kJiqSTefUWQjhJe2l8N
5AQZbCrQC4oUvAnbAH4VMSMBJD5mX9+zT8tP0V5Pz/kRAkOZRxURgxb/JPwSzLGv
WftaknBaE/BQE534G8e/k3RTui6QGWWAgrSWZeZYudbzFwoJZ+M=
=h0g0
-----END PGP SIGNATURE-----

--dWYAkE0V1FpFQHQ3--
