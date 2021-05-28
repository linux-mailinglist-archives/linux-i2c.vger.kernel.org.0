Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D364394764
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 21:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhE1TI5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 15:08:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhE1TI4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 15:08:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 144E8613E3;
        Fri, 28 May 2021 19:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228841;
        bh=A8ZvWfbCTzIORXrbB5IHvBtsCyJ0YrEOLYb4qLBlngM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=brxuD+QNP1OKThSSy25F23fA5EQgJa71uob1bicHv0xk5GewGMHb/UtTYXFGnrGMX
         bwN1jd6pifowvR41JNBQcGhYt/ebJV5WGjcYuXjn/pRF5kjdu2gyQgZt+APHNHj4R2
         LzvzhV0PGSTEuZLQUUQEMB+8hYtFG86oLlAotcjRTbwH9uqlA8up7dYDn4wAj8/mpR
         IUvE1rT6V9vTeh/7k6fQ20QjNS7IQ4Fs0QXZzrULJSvBGDXRkePVLE01j54X48b7MK
         YBaCNEJFYvwEAVtSQGxca36apv9geY7vR5JpRR2ZG4g5rD7U58z4dOxNWr/PKBF8pj
         tUHJV+06nj+iQ==
Date:   Fri, 28 May 2021 21:07:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v21 RESEND 2/4] dt-binding: i2c: mt65xx: add vbus-supply
 property
Message-ID: <YLE/Zs+354OXEbFY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ch9zul9aqPzgWby0"
Content-Disposition: inline
In-Reply-To: <20210527075556.1709140-3-hsinyi@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ch9zul9aqPzgWby0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:54PM +0800, Hsin-Yi Wang wrote:
> Add vbus-supply property for mt65xx. The regulator can be passed into
> core and turned off during suspend/sleep to reduce power consumption.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--Ch9zul9aqPzgWby0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxP2YACgkQFA3kzBSg
KbbPeQ/+MQBPF+RvaYWRFnX0MHmoLvK2hn8z1p7wc6lqdjQQOKSNdZDArysYbmK7
iiCg4ngf8oygzl9P47hWXxjkiKX7pcWborDcFMYdWfGN/V8w4XwW+1GIxYGcaOTE
l8cov0wPkHzSPdr31nqX6bBPr41dWuZWHmvLVsvX2R80UZlpgIfCG8Tx4q5ZVRQi
hc66BlNqFYkVxDjo4u37zF6+zrfFeYliBZln3bvjT7YQELXbGc9h7xVJDUUCdL2y
C7gC8cK7lqitkAzdwtO7OeesiOUTmoexd9WA1KDTMQuteoSg5x1mQlb1XfHpRblt
FN6DXXTFzieEy+7B2hKqUF7RBfOftbqeuE5VVPweD7k7bVK4Kx8cncucq1ksIyfu
Xi3inUN/AgD3ILXTZ2/S5/WuGydg1gKBbOhoAhPnLuuP9UnasLW26a07Z+12aZ3r
Uva0kOYIIvbn7R0xT9jr1CCwmBWToz5dA2B6rk8SEUj3zzgZzlze//pM6yE29pn8
0vn8q9QRkxRfj4raNetpB1/qSXVON7NvR3TLkQhDm6GNwLKv1yBOwSbbxYpaue0x
KKGrY32rFbyVzEeI4IxMF61pGGIqHf4dAWSNp8cbxYyFkEw2sYfYVxxiRuHI3Ako
m8dORn2gNOabqC1jXLt1RrVcLe/JAQzAWNemPA91jQj/Z5WgOMA=
=CLCP
-----END PGP SIGNATURE-----

--Ch9zul9aqPzgWby0--
