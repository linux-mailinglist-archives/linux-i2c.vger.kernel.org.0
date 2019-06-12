Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5542C423E9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 13:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfFLLWM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 07:22:12 -0400
Received: from sauhun.de ([88.99.104.3]:58826 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbfFLLWM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 07:22:12 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id A273E2C54BC;
        Wed, 12 Jun 2019 13:22:10 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:22:10 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, arm@kernel.org,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] i2c: iop: Use GPIO descriptors
Message-ID: <20190612112210.7m4ljuehdr5g5bwq@ninjato>
References: <20190531223756.1861-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wyx2eqaxasf6eonl"
Content-Disposition: inline
In-Reply-To: <20190531223756.1861-1-linus.walleij@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wyx2eqaxasf6eonl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2019 at 12:37:56AM +0200, Linus Walleij wrote:
> The IOP3xx has some elaborate code to directly slam the
> GPIO lines multiplexed with I2C down low before enablement,
> apparently a workaround for a hardware bug found in the
> early chips.
>=20
> After consulting the developer documentation for IOP80321
> and IOP80331 I can clearly see that this may be useful for
> IOP80321 family (mach-iop32x) but it is highly dubious for
> any 80331 series or later chip: in these chips the lines
> are not multiplexed for UARTs.
>=20
> We convert the code to pass optional GPIO descriptors
> and register these only on the 80321-based boards where
> it makes sense, optionally obtain them in the driver and
> use the gpiod_set_raw_value() to ascertain the line gets
> driven low when needed.
>=20
> The GPIO driver does not give the GPIO chip a reasonable
> label so the patch also adds that so that these machine
> descriptor tables can be used.
>=20
> Cc: arm@kernel.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Added Dan's ack, too, and applied to for-next, thanks!


--wyx2eqaxasf6eonl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A4GIACgkQFA3kzBSg
KbY8rA//ZOZSv5AxhjolcHVNroyPWDjFceO3QiH7pVgYP9/d8bn8gIu5LtKfpShZ
akWBEvz6BAthsBNd4468c0OL/7N26P6jV7DUYSv6++K/loteDywdqeCLSl62GaJS
OThBERqvOdkMIJoBcugYMVlxiikwLX5n3G6bwg1j6NuvfOowiXk8D0vnc/MCUNyp
lnlVu0Rjw/J5SA7M/1Ls+bC1IJGmR0LRQaZxLkhhxHjhBbcLQ9Ho+Ck9EN4/MjF8
Gd623vNgvbQFjXt1IDtB5xnJj7G1EIcLEcRAQfscGRfqcF2zrHz2OlbbECcNCj1/
edgfNmjWXRw9QN2bDANRdNxrG+AW7GSmqoG+0OjCHsDKgXmdsCCXN+FzEyKfxvfu
y+s75uFD+iRbenutDj+jIkNZNYNnQpRcwWZX3GrDyXskYvCulxwCDY2Rc/QwMzJm
C8rmMMBgo5TxbXQ6et0UlU4/FKwMm3yEngR3xsiuEc2sQLC5xM106bxOvYRO/m0z
PCYkco8ASSllsMd/xuRcREGMvYwvyzta02zYD7JRmkAiWc0gMPT0veofdIV0Q3+Q
d9G0RLZkUoaOeULZqIASJ3DsTrPEj+WvCXJdzaL5pAnXEcFDOLehSDS2QBmEVUCZ
DoEwXFjbr9+GvhKfGDA2a+60knA4Th/FDl2oa8UjSp85TingInI=
=MI1D
-----END PGP SIGNATURE-----

--wyx2eqaxasf6eonl--
