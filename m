Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0DA1313B8
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 15:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgAFOf0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 09:35:26 -0500
Received: from sauhun.de ([88.99.104.3]:39312 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbgAFOfZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 09:35:25 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id 8748D2C3939;
        Mon,  6 Jan 2020 15:35:23 +0100 (CET)
Date:   Mon, 6 Jan 2020 15:35:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     robh@kernel.org, Ludovic.Desroches@microchip.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v3 3/4] i2c: at91: remote default value initialization
Message-ID: <20200106143522.GE1290@ninjato>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
 <1575886763-19089-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Content-Disposition: inline
In-Reply-To: <1575886763-19089-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 10:20:05AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> Platform data structs are initialized by default with zero values.
> Thus it becomes redundant to initialize them manually to zero (false).
> Remove extra false initialization for field members in structs.
>=20
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> Reviewed-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Applied to for-next, thanks!


--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TRaoACgkQFA3kzBSg
Kbagqg/6As3fDG4Iew73Uzbcyv+kp15feuCUauZDWD+l4BIlWjKtEJe1IYMwsdm2
DNXgWDRrosK+AZWMfxDKxa3DCQ3GfYmo0OeVDM/ATCiZUmH4p56MNNW0JoGTb5MX
85d8qCAZQVD9n22KZw14MImJYlyE+eDlKeyCWA1L97K7PcQKmRmHgU6+UHepjZH/
dY9fgr9P8FL1HJEsVAJwCqAla43F0jV0zXxVwA2avGR45ZaiHwrl/vHC26FyNZ0Z
VPuWQ4Ya8gqfmZhJejxOt2zkhrJWLX5h4dseDuVQopAbhEXnjZV39cEiQCmHxnXF
cB4EZrmCuIGe/cw7Sn5z2hruIQKyF75kJdyOTmqOqTvKN/USyHxU7DTJntIh0yv9
D0ujd9s2O10vJXqCYH+mP3RLCkPzfpaCPekNkVsDoW+EXbCuOr0v/NcoKTqRcH5K
qEOUWTwn63Bobpf2GWtbl1VBwnu2aSyd/w2TViL+SDL4AF09ERPoEFoRwXctA5+7
kNMTPbdwQeBR4iq2k/Tx6w3I1IFMEkihNXMV7nacJdSk4zhy7/F0rDC/MwEOsMBe
3QNchHy6xPiCF07ZgMZhQqKD7JNQwj/E7a6HvtpJ9LwUX2iWN4roa1w+jFhLRg6/
8iVzH/RnK5VOKESh7HdR0VyVTWVHcAwQqAW+y5uzy8EijfC4BaI=
=AjHb
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--
