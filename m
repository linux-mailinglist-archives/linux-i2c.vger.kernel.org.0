Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB4BA2694
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 21:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfH2TAR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 15:00:17 -0400
Received: from sauhun.de ([88.99.104.3]:42290 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbfH2TAR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 15:00:17 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 37F742C001C;
        Thu, 29 Aug 2019 21:00:15 +0200 (CEST)
Date:   Thu, 29 Aug 2019 21:00:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
Message-ID: <20190829190014.GG3740@ninjato>
References: <3F017C0B-44D6-4E63-A908-DDAA5586D67C@enpas.org>
 <20190820092739.7213-1-max@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Content-Disposition: inline
In-Reply-To: <20190820092739.7213-1-max@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2019 at 11:27:39AM +0200, Max Staudt wrote:
> This is the i2c-icy driver for the ICY board for Amiga computers.
> It connects a PCF8584 I2C controller to the Zorro bus, providing I2C
> connectivity. The original documentation can be found on Aminet:
>=20
> https://aminet.net/package/docs/hard/icy
>=20
> IRQ support is currently not implemented, as i2c-algo-pcf is built for
> the ISA bus and a straight implementation of the same stack locks up a
> Zorro machine.
>=20
> v5: usleep_range() instead of udelay()
>     Style
>=20
> v3: Fixed %pa format string
>     Dropped adapter class.
>     Clarified licence.
>     Removed clock parameter.
>=20
> v2: Matched function names to callbacks from i2c-algo-pcf
>     Used z_readb()/z_writeb()
>     Removed BROKEN_ON_SMP in Kconfig
>     Moved LTC2990 to a separate commit

Thanks for the changelog; it should go below the '---' line, however.

>=20
> Signed-off-by: Max Staudt <max@enpas.org>

Fixed a freshly introduced checkpatch warning for you.

But most importantly, applied to for-next, thanks!


--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oIL4ACgkQFA3kzBSg
KbaIlQ/+KKet9VcY+M8pjIHgWGbP2wcEex6N0ARbClkez48OAeie4CbCpz0PGQHj
0GaJZXsnat80+rQzajZqGCue5iktKEJL6YuN9j7PdSfGZk2zgIGLm742yMDzBWXT
iKgggKkn+jh1QZoHbXZzBY8gs0EEphunYPsFjDgxXn9Oj5rkt8lAy7U26pwOiCCW
9RQ3byci5bFpp0dE45BgsDAvH74lDzztYJ1c/xjL48M/cdGCUASFlDDxoT+8A9/R
YtzRaYl1+LtsKK7APGXigvAnUNXR3iMZeHHhcecBzraWyU9ZLHIMLqEOlOGXcqG0
SNzB+DQVsS6bqtgf2rbaVDU+N1sT+xADNsyyrr1AzmYHFy4YjLQJTkfw6yqMKa1y
vyvZBAG7DpmyZYn5Guug068u+7VkX3Vdq7wZ5W5IlbML7mQNqN/cTg9UrFuTH2gj
Up5tagvkjn01tSUidd1+EAkmQzJRTzT3hUabe7d5kG0fbJrws0BRcK6K3d/nIyJs
kUAx+Pq5SKCGaCCP4XGVeJddMmFoqrfZbN/5vgab+225yNq832vpGu+RanGn5L6h
d+l778bj57TO4DvAQ3XgfVnPbaYtlO0B6XPLlh0bR6AK+TLGlvNpLFZPDjGmWBSB
796nA/Wy5PwTWkTxSmLZ8u5H+WT3OuFQG4yM4Na7Trpv8iiU2lM=
=WJlR
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
