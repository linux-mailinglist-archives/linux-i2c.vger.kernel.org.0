Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFB824042F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgHJJky (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:40:54 -0400
Received: from sauhun.de ([88.99.104.3]:57146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbgHJJkx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 05:40:53 -0400
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
        by pokefinder.org (Postfix) with ESMTPSA id 74B342C0505;
        Mon, 10 Aug 2020 11:40:51 +0200 (CEST)
Date:   Mon, 10 Aug 2020 11:40:47 +0200
From:   wsa@the-dreams.de
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     qii.wang@mediatek.com, yingjoe.chen@mediatek.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH] i2c: mediatek: Fix i2c_spec_values description
Message-ID: <20200810094047.GE1290@kunai>
Mail-Followup-To: wsa@the-dreams.de,
        Matthias Brugger <matthias.bgg@gmail.com>, qii.wang@mediatek.com,
        yingjoe.chen@mediatek.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>
References: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Content-Disposition: inline
In-Reply-To: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 11:48:37AM +0200, Matthias Brugger wrote:
> The struct i2c_spec_values have it's members documented but is missing the
> starting '@', which leads to warings like:
>=20
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member
> 'min_low_ns' not described in 'i2c_spec_values'
>=20
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied to for-next, thanks!


--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xFh8ACgkQFA3kzBSg
KbYgHhAAq9H+auUH5FyFYrBR04XS/pPIsK7MAVECu+xkSqyKjOh9KUMWty4Olepo
2vkYDm24/Q9qGMshcaEnNKT67saeD/dprFWcz/pI1zlXXUHWT9s55UZFMFlJ73ui
By+eoOcqW/rVD/tO/aR0KRXevq4C9ddQXellwczhPpQCm/oZ8q+YoBhCgRPV6rn5
nZc8nfqyl+CCIpqpdBQD96kLokwILVElm0o2+oJB+9nohmH3BPPjh+TlDNV8HwpU
CIJmvUHy8rHBBvOhG7ETrFSopu56nNJQO9IiuFdVe9oWpCHhLhL9tMiMRbRiY1lI
q0ehOQL2JCGynZNFz0SrCg5lTEIFZTIZ4LcwBhKsbkut3Pqgab4ja/CUEJwjWeak
972aXFX+YpYpoKhcJ9YA3j0ClM2uiDZWnPqHC57PS37O1HV9ZEkyQITZXBzWSAvf
1oLUy0+jHD8OCFy+SnHVd0PSOEcSQS1UFRdbXEu/+VEnhfnB5axcDUMk3Q60/QXg
Tfz12jzXLpnYlQ8IPKXJki1nzKVkiCry7e9wcLZoJLZ81DZjndMi0LydYkZRcs6M
8NQjXuAzd/GaUj4CizQRGeTVKg36IPpWWQCu8oTSomzQv6VHXKxfLemz1FvAJiuI
pJLkFFyWKf6dY7dsqEyeEw0iVZn0vsyl8HCBJoavP8HkQnizwa0=
=eJXK
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--
