Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB1C6E6557
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 15:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjDRNG3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 09:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbjDRNGX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 09:06:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5556516B12;
        Tue, 18 Apr 2023 06:06:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2BFE634A4;
        Tue, 18 Apr 2023 13:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760E3C433D2;
        Tue, 18 Apr 2023 13:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681823178;
        bh=irU7S47lLrx04AoHdnKG5DIJZ0xn/QZ8aCMYccc98MM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AOv1SRUHrnAZXksfOm/j0cs0clkFI1rKrYy6UymCUz9X7HKIdf+DTHJVWLLP29pBE
         +IX11MJuabp4XTbz87tu1KLgAbN7ASPxAAzv1UbWmqpjz/zMY7hSIgnKFL2hcwYeSk
         KYQEor5BaydxZft/wXBosPeOWA9DLGyQRBFDGGP+1MaLS9zy+dUd3NHZ7FZF1YTPBe
         VkiZsPZYMi9etlMIyxhc2tZiIOdo92OXgB5Tc1cR8jm3+voIoT1Wi/kwDZ5XZJSx0n
         ipuytYpebDnd5lg4JBHNhN3saBieIlu4ryX/ULNXp2lf6nZXKjQmUQSuBEqz24yHwt
         d2GsMz7SLp0EA==
Date:   Tue, 18 Apr 2023 15:06:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v10 5/8] dt-bindings: media: add TI DS90UB960 FPD-Link
 III Deserializer
Message-ID: <ZD6VwpRya6SGBAt5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mi+Z0PG+MUqRZwKk"
Content-Disposition: inline
In-Reply-To: <20230222132907.594690-6-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mi+Z0PG+MUqRZwKk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +  i2c-alias-pool:
> +    $ref: /schemas/types.yaml#/definitions/uint16-array
> +    description:
> +      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
> +      used to access the remote peripherals on the serializer's I2C bus. The
> +      addresses must be available, not used by any other peripheral. Each
> +      remote peripheral is assigned an alias from the pool, and transactions to
> +      that address will be forwarded to the remote peripheral, with the address
> +      translated to the remote peripheral's real address. This property is not
> +      needed if there are no I2C addressable remote peripherals.

After some initial discussion with Tomi on IRC, this question is
probably more for Luca:

Why is "i2c-alias-pool" in the drivers binding and not a regular i2c
binding? Same question for the implementation of the alias-pool
handling. Shouldn't this be in the i2c-atr library? I'd think managing
the list of aliases would look all the same in the drivers otherwise?


--mi+Z0PG+MUqRZwKk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ+lb4ACgkQFA3kzBSg
KbYYSA/9EHTjpfBICYkwQW1dIEF2SbICH4VCTgofpP1fIAbbZ0s6cCNmk/k2TYph
+ZTjCmBLERErgJVS3LRX7oFokQHC98uDYswJ6U2SVv1Q/qT56/qNLVvsD2d4q4gl
9V7gmoSWIKLzeEthKQYKj7MYdbfwulJfauhm9svSRN6S+6rS/H7jEtaZpYDd5I44
y3zhfNQDul4ktn+n2isKVXqP5IRMgI5WsB5IgGVhH50jy78LqmKn3b1mn/ao1P00
9uCup1vdzsJB0VC4NExNkzRRfYcKHhwMdbU+wAQ+1sUdiO695qKY21iAUuWZGak3
m9bjWdYsOsmLmHtruRniY8srFgQSBH+3Z/o241+pHuFOO42vh/oWpFieRfPJG5vN
n5pVhMU538L0yVBrovAgxVMklqfAlGGXB+Q0suhXd8yzOYcYu9zJjve1f/FxOlEI
nP4vsM3pwQ+G6Is1sEKPe/WxD1W46La/9TVO9nKF61gdeVVNs+UczR60jEJUVgsz
riKuF/rEDz/RqWEmQxO4phmki79l/nYLtNCUtRWvYhWOwl/HERr8ctdyPQyRmHqp
7h5nR0/ragtc7rn4A8pmK0UuQM5gOuANwsz6J5BDSBU73BYhCh4nrAkfNMbIcEQ0
FeoSXAepQjG5Iv3acvPaMdwqamyT83qP2dznc7fom2naH+wkud0=
=Fqdo
-----END PGP SIGNATURE-----

--mi+Z0PG+MUqRZwKk--
