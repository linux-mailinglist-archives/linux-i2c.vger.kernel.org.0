Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FFB6ECA54
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbjDXKcY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjDXKcC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:32:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E527F197;
        Mon, 24 Apr 2023 03:31:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F7EC62039;
        Mon, 24 Apr 2023 10:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D255C433EF;
        Mon, 24 Apr 2023 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682332290;
        bh=x7upwBQlHFbyVO10snwIsBPKLyhD5ZgCsg/hqg0Fzws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YXrXHm4H7y2rbNZv61Li6W13Os9LmazFAJPMufxRuLGrjs1es5kJFqjFOxI3KvnUZ
         6JCCwP+xT72qWf0xVb9eQNHEb8PE0b1nRF0d5aGlHG/eHeOoJHPagu7IbNsGBB60oq
         A33Eq31rT3tRkK4SMtjQWBTs4teNK10oZaOGLccYwb74oOSDqPdJJVc3/KFpiMtPup
         jgd7LRSfZCE93qL4+iAIvUtSGgO/SKIdemo6gZD+W+zwkAvsi7fIFO9sPYTKv8rtTr
         muODtrdRGAieA9W3kMe6sFHo9WLvQ0pi4tJOGMtePUSYyn44Igy9qgfgvBvfsAVQyH
         rKhlKVojNBDVw==
Date:   Mon, 24 Apr 2023 12:31:26 +0200
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
        Luca Ceresoli <luca@lucaceresoli.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v11 1/7] i2c: add I2C Address Translator (ATR) support
Message-ID: <ZEZafj6j+EurGWJ7@sai>
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
        Luca Ceresoli <luca@lucaceresoli.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230421101833.345984-1-tomi.valkeinen@ideasonboard.com>
 <20230421101833.345984-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gg+RkDq5qENt1R+b"
Content-Disposition: inline
In-Reply-To: <20230421101833.345984-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gg+RkDq5qENt1R+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 01:18:27PM +0300, Tomi Valkeinen wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
>=20
> An ATR is a device that looks similar to an i2c-mux: it has an I2C
> slave "upstream" port and N master "downstream" ports, and forwards
> transactions from upstream to the appropriate downstream port. But it
> is different in that the forwarded transaction has a different slave
> address. The address used on the upstream bus is called the "alias"
> and is (potentially) different from the physical slave address of the
> downstream chip.
>=20
> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> implementing ATR features in a device driver. The helper takes care or
> adapter creation/destruction and translates addresses at each transaction.
>=20
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This looks good to me. Dunno if the DT folks want the binding as a
seperate patch, but this is good to go as far as I am concerned.
Everything else can be fixed incrementally, I think. Also, this can go
in via the media-tree, there shouldn't be any conflicts.

Acked-by: Wolfram Sang <wsa@kernel.org>

Thanks for keeping at it!


--gg+RkDq5qENt1R+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRGWnoACgkQFA3kzBSg
Kbadfw//Y5SeRe83SMCFfpkidD2u1G3YuWrzp5+GfMLCDyKxRKiziZtnzyRmC9xQ
rknOTHe9KssAk6mJkoYnm8PHC+7CPjpL6hzu8Z4R3dPnTF9dmvGH2JpDxXCB4KMX
ksU+S5GlitAoUIprvpeMfSMTUSxaayuJwUtpjMxJ1XjV89WiBFh871ElOZPqLgYs
/vTVRF1FWle5DZK2TGtlHTM2HKXFxBkFDpyQ2cJOBU5symGs5ZqjgUHNrCc01ydy
DzWqtoSAVXfGQU0JOglKJB3Ws6bcR29svYZNYVAQJ6jpvPRNiDXP3wdL1/aSIaUo
AU++kmwLFXYImSAVQcb3rnYI+Ld7ivzNYu9FLHmeN9kmw6upmQqms0wZ6z78y8Xl
e4E+E1zOli61eEQzm3mzq54SDDo6CmNqetH7D77srWlGl+gMNysB5DKrU1vjnry6
CXNldRTM6axfuAC9mUVfWQLHny6dQtbnLkOyWWTcJZthW3HhsyVJ3RhfGgGQ+Kth
Kuw28Uczq7B45lCVoOML4B0lozIj+kHjh7n9f6gFukiBzwlsJhxlhsyp1fG17Bx4
qd9dHAe1louLLL0NmgTnsp9M1KUf/sYMUrssBTrBOkDT94BLv4GHcd7WvW2SPTvX
GhLsjgE5ubGMnXv++80IfjNu9EW3egEorgHjAgXJtMBOGRi+3zs=
=VN/1
-----END PGP SIGNATURE-----

--gg+RkDq5qENt1R+b--
