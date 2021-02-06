Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17260311A0B
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Feb 2021 04:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhBFD3E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 22:29:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:43872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232518AbhBFDV4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 22:21:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B28764F9D;
        Sat,  6 Feb 2021 01:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612574755;
        bh=/OO95ptKWwAfPKnln79sj7p50JlIFunorcpU1Za6txs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pGgQmtxfWDXFXdKv2lSHbQ8Hffg6ZF3khCddSyZagHNacjnJaiAhbckTqDOXSlJJw
         smcT7P+JGZSL/MjDF4Cr8Rs6HfFWATUw/sTBGhUPRRRpjDs3haoC8wG9ic1njvO/iK
         rA1Cyzbi+mBzO9SFOe5WFmN5JDg7RgiYb53u4NFEFWBc78kD1AKiH1wec60VpnljyX
         5yAvAzFuWeaQAaZ5McL28B12bYT5mLA0y/C30Ug7IchPcpGuxmaACHs+AUk24p6dwI
         S3tKhxddOqP8c9w+NOQxMKcPulyOZs43cf5XSh7rqi9xUyn0TiyVcGfr8ZD7n7HFTi
         xaZJjX6p2Okig==
Date:   Sat, 6 Feb 2021 02:25:51 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in
 examples
Message-ID: <20210206012551.GB3847@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
References: <20210202205544.24812-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 02:55:42PM -0600, Rob Herring wrote:
> Running 'dt-validate -m' will flag any compatible strings missing a schem=
a.
> Fix all the errors found in DT binding examples. Most of these are just
> typos.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Daniel Palmer <daniel@thingy.jp>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Vincent Cheng <vincent.cheng.xh@renesas.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAd8B4ACgkQFA3kzBSg
KbbdSRAAtkrymAGNS5LGn321fm8TqaN3fodZIhNLfeeWULr/eImrk2RJCYzunjC6
Nb8wJvEywJuB1E4YzkiFTgWxKVeLmFnUFodUSlufnefhzGl4Q+2udtIlUr3CqBaM
K7b7RS452nISpyzJHTBfdWr4VwEUOHqmrYXG3jLExytI6Enrun7qqY6hu7WwXUIT
tZ7CUUP30kMy3K1ahkItDx0SGBRf5hWrG+KAzSj9cyZKHFBaIv3WKV/bUMC6OC+Y
h83LhJP40pBTFZWlk+jwchtr4ZWNF6GG9vuIcXWI35Y9tYUDsX0fWnRj3LSMdp8u
QMK0sZFo4oIejPXH61NxPWZ6IHVcy21veXay4ZXApxNjsuwyitBb7/aRrJDEoJsr
MlS6IMR7MXnujHlxwoJ+3sSIvPhRyeWgTC1pmp4qL2LwImDHrooS3pJANxAl7Ws6
+RKt3Mkf0w5k5r2HiukAHI7Lywkwb74sit3LU3D6awsZicpRT9c/tNlGnTNsl6Hu
+Mu9JP+//QSe+eRhOsXCnwMl8eEutYWvPadijYg87IbPxat3uDuiQz5E7S5dMTSR
UerC7itsB9z9Hpb8zDdQAboNPdw04c+kfWn53Mu7cxhvxhzYyf+jZsu8tMIG60Bb
LheRj95DOtU9bnIaQ8NdiBy3k9LESOW9ULADetyHoQZLM5Qb7Zk=
=d/1y
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
