Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41A8A2663
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 20:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfH2SsK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 14:48:10 -0400
Received: from sauhun.de ([88.99.104.3]:42064 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbfH2SsJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 14:48:09 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 49AC22C001C;
        Thu, 29 Aug 2019 20:48:08 +0200 (CEST)
Date:   Thu, 29 Aug 2019 20:48:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] i2c: designware: Synchronize IRQs when unregistering
 slave client
Message-ID: <20190829184807.GC3740@ninjato>
References: <20190815135211.25452-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline
In-Reply-To: <20190815135211.25452-1-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 04:52:11PM +0300, Jarkko Nikula wrote:
> Make sure interrupt handler i2c_dw_irq_handler_slave() has finished
> before clearing the the dev->slave pointer in i2c_dw_unreg_slave().
>=20
> There is possibility for a race if i2c_dw_irq_handler_slave() is running
> on another CPU while clearing the dev->slave pointer.
>=20
> Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Reported-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-current, thanks!


--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oHecACgkQFA3kzBSg
KbbmNA/6AmucTKaLh9sVnKJt1Bc95RyIGZevE1KFE6V5VjpHq5eutNi6w/zvXPSw
y0nj71xBysVJADJSSDX0YqOFVMLuMCvvN8JmT4G4zxdY0tZTl2blo/LYB0/Ll9hL
FgjhXl3xNPcpI2ajLAn7/dPaP6VCQuPRjBaxj4vw/4XdMg7X/56p1vgrQeIuLjRt
cv8qaV8Mgp/HGOBYSzaFZ1PM1b+2zpy65Hr9g7a0GsyCmOLJ5y+sf09PWdaqZWdD
YKG+9vs8UKEY4aUEVY7jn1UbWdbqtSRXsmKwDqscHp6uvLGjG/tuVfsNCKBpMorO
fiM5aAIDh6JplABwe1hJmLHJC66B0cx61OtlNizvA7jQ9e1Ji37f5WXZb9RG6/A7
prCXyXENYk5lhW1e384FYopDh3Y7HhHSiC2dHmShFdwflwBXUMNsdCqrZy8QyxNv
L7rGMPtXQxSnIsLUxQxBYbnFekLNf9kxKQNJkS7gsy8l83bzE8aEm7pIJUxNO8jU
DBzvQuexpm/UmYU2kR5NWRUI0s8Vli1ljj2oqNj0Aej+r5p2c+Wpqj+lz5ztofpO
GMv0TtiNiUUu2Dr1f63ZbBBUbm5gywm+7epSZs5SNyjnAwJONo+iBMoOPVqMAkX8
VcUEi1t05zHY5RFHLMaoJhKTf6RhZI/URR/Y25JlElofukzVl0o=
=vAqE
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
