Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E230B2871CF
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 11:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgJHJsK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 05:48:10 -0400
Received: from sauhun.de ([88.99.104.3]:53958 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgJHJsK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 05:48:10 -0400
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
        by pokefinder.org (Postfix) with ESMTPSA id BE66A2C0209;
        Thu,  8 Oct 2020 11:48:07 +0200 (CEST)
Date:   Thu, 8 Oct 2020 11:48:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4] i2c: sh_mobile: implement atomic transfers
Message-ID: <20201008094807.GA76290@ninjato>
References: <20200928155950.1185-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20200928155950.1185-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 05:59:50PM +0200, Ulrich Hecht wrote:
> Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> similar boards.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Fixed the blank line issues and applied to for-next, thanks!


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+4FMACgkQFA3kzBSg
KbaSig//dupLaT7zyzIUsvMl9GDMMH+vfpy7QiLeZuzuK5uknESn3w6YR6P/yOpw
8a8fmAk1GAOHchY9oboHXdXaHO17c6LOmtSabrX3mfOg31xO23HJJ6aXJnDoEsyA
Ahl43RQBaKb+lUFq9tncIYfVLG0nvNNNEMyHRonxE8bOjIdcFgOlj3oFYp0uET+W
NQ1Ft+7u8idKAlP5jyq2Wo+OUUuAcAvZtqc4SnU12dDKaUKlATA1a3dONrOlHP2s
1MkzoNfRn3GoJJaLAjUofspSTBbrtn3znCdVzk4fzoxQfrs/MxEchIVT3vsQ0ssL
5jXwQQk+WX8CvZ7vHgpi0KZAfesFr5ORQmRFKX9CL+Ouhi1WNzMZdfRaZ12nzH6U
TPt7wDGawHUy2X4thIa82CHz7cECM7sOl5OXr8oleG3mQzJ430Mtm5cVe86IKKU9
1INo+TBdsLaGhn9nMLfGnQyYtYxtHf4Elfm6dHc011yTN/Uex10VR9dnZJ3cAkqA
0hwTGiaFdYHQTRru6LGt8Kpz9TIo//2htIR8wW1KJ+rTIXvNRkgWBdUeSEGIbGSV
GDcagnX8fOy/xPi1F1b3Hn9hXqUAumgi4DUU9r/t9zzvYwhIpltcphp71x4pHmQx
7P5HFKYYd03alm2S+Rb0BKa7O6HQkYUZI0LhmDa0n2vyJP8BqIo=
=MfcH
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
