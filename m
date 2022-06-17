Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0C954F0D4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jun 2022 07:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbiFQF5m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jun 2022 01:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380199AbiFQF5l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jun 2022 01:57:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588E5626C
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jun 2022 22:57:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o24yq-0001Mj-TF; Fri, 17 Jun 2022 07:57:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o24yn-00109t-8f; Fri, 17 Jun 2022 07:57:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o24yo-00GttI-0N; Fri, 17 Jun 2022 07:57:14 +0200
Date:   Fri, 17 Jun 2022 07:57:10 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-doc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: efm32: remove bindings for deleted platform
Message-ID: <20220617055710.d4wnya5aclskpqjg@pengutronix.de>
References: <20220615210720.6363-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="olp76qajcz2msgae"
Content-Disposition: inline
In-Reply-To: <20220615210720.6363-1-wsa@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--olp76qajcz2msgae
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 11:07:19PM +0200, Wolfram Sang wrote:
> Commit cc6111375cec ("ARM: drop efm32 platform") removed the platform,
> so no need to still carry the bindings.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  .../devicetree/bindings/clock/efm32-clock.txt | 11 -----
>  .../devicetree/bindings/i2c/i2c-efm32.txt     | 33 --------------
>  .../devicetree/bindings/serial/efm32-uart.txt | 20 ---------
>  .../devicetree/bindings/spi/efm32-spi.txt     | 39 -----------------
>  include/dt-bindings/clock/efm32-cmu.h         | 43 -------------------
>  5 files changed, 146 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/efm32-clock.t=
xt
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-efm32.txt
>  delete mode 100644 Documentation/devicetree/bindings/serial/efm32-uart.t=
xt
>  delete mode 100644 Documentation/devicetree/bindings/spi/efm32-spi.txt
>  delete mode 100644 include/dt-bindings/clock/efm32-cmu.h

I didn't do that back then wondering if the bindings are sensible to
keep even for removed arch (or more general drivers). In this case the
chip isn't old and unavailable, but just too small for sensible Linux
usage.

OTOH I'm not aware of any dtb usage on efm32.

No hard feelings here, if you consider it not useful to keep the binding
around, go on and remove them.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--olp76qajcz2msgae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKsF7IACgkQwfwUeK3K
7AmlkAgAkeP7ubk1SId4jZw5jRCgEtryr8uSSJbLjLngkCCk9Tk4niLiq7RE9svU
ogytTFnt0i4WSXrORBidg644EcgoWZrpUDA1ULORe/EbRS3k6bupHQneGP7BkXgo
GiNgDvJ+ufdcLrI0Nj+jH/C5PxNqOa1sH7GnRE5viYXpbpB6kwyqR18v6G2CAUin
E3b2QRB32jCAXTYlitLmbjLweY/Qz0pW8yTY4pwhLoG3w+wDshQVwRqSt778yqZN
dLwli2Zv0+zs2EBKBZgST0hruHpcZ3HJXQy/6UhnXTCdHbxm2pI0AdQo5nIxrYe6
/oWYm+u40EbHnR0PPhQFCKeOW1OExg==
=4gVo
-----END PGP SIGNATURE-----

--olp76qajcz2msgae--
