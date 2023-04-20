Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413316E9BE0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Apr 2023 20:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjDTSr1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 14:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbjDTSrY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 14:47:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E55C30C5;
        Thu, 20 Apr 2023 11:47:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 251D664B47;
        Thu, 20 Apr 2023 18:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA34C433D2;
        Thu, 20 Apr 2023 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682016442;
        bh=gIDrAb2DLZxHW/UfFYvFg8ZkNoELTe4cNyI1YhHhsUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qc+6ooEQtzPf4HhwXsVsY5wZMyL8TlT4I4maWGru69JSD+ChHQZATlXR2f+XdVQan
         eobkKFtfxAgi/DnoXUt3pRJerjXWRpc3k2jC2jhV6Kn9Ka757+APzQAuikfZC13LYM
         zmPdSARFhZC4GX8iKVUTb6ILSy1f/psLW3JeOElO0+c6aBQH1xHYfXIkriUegRURXd
         6gGkNZfw9f2k0oIQauZteFrauOYWiS1oVzkpQXjKi7jsU0mv9qNce1GdPdBaVXeZc+
         FCvPX5O/9imZKrZInVHCejqUYHTUdKtIYYRKQy4yrptyeYSpou9z8R1f8/nbSo8hWV
         njLrbmk4WGM7Q==
Date:   Thu, 20 Apr 2023 20:47:16 +0200
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
Message-ID: <ZEGItAqsvNGQm1l+@shikoro>
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
 <ZD6VwpRya6SGBAt5@shikoro>
 <b85a2198-dffd-6c1e-53ea-61bc4d14ce2a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DLSvPqhBVl0l+K0b"
Content-Disposition: inline
In-Reply-To: <b85a2198-dffd-6c1e-53ea-61bc4d14ce2a@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DLSvPqhBVl0l+K0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

> How does this sound:
>=20
> - If "i2c-alias-pool" is present in the DT data of the device passed to
> i2c_atr_new(), i2c_atr_new() will parse the property. i2c-atr.c will expo=
rt
> functions to get a new alias and to release a previously reserved alias. =
The
> driver can use those functions in attach/detach_client() callbacks. In ot=
her
> words, the alias pool management wouldn't be fully automatic inside the
> i2c-atr, but it would provide helpers for the driver to do the common wor=
k.
>=20
> - If "i2c-alias-pool" is not present, i2c-atr.c will behave as it does no=
w,
> and expects the driver to manage the aliases.

So, how does a driver manage the aliases without a pool of available
addresses? I can't imagine another way right now.

In general, your above proposal sounds good to me. With my lack of
imagination regarding a different alias handling, I could also see that
i2c-atr already provides the alias to the attach callback. But if you
teach me another way of alias handling, then I could agree that your
proposal makes sense as is.

And yes, the "i2c-alias-pool" is definately optional.

Happy hacking,

   Wolfram


--DLSvPqhBVl0l+K0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRBiLAACgkQFA3kzBSg
KbYJ1A/7BDFTBE8y9ItDYSASswnWFWHIO5wp/eXJwlpgBYacveFxf/APz0H9A34I
BKLFU2j5vsI4sPZgaJRo9rsju5/wEQlokVgMcOaFXEeiNf6LJ2CtVUrVa7TaBTkX
zb8eMQ5EmPQwX9d4/XJ/Jc8bPGiLMhQ0SrNW21g3ZVA++ZFzrRqAZQDicPAuT3c8
li159KDrPg4X5bhIAfOf2zgqr+1eBFQdlY11zDZ5bMBSbJHUb4vjX2Zogtzl7Xx/
8CziRiUJmSiNtSUTpBACic4X8rbU/rCn5lgr+811389JvnOPZtcmfg1fLqL4Wj9i
29Wxyc0+mGs8Hg74aDuAn6kpeT7VLzLUuH2EhcrpqY4B8lP2pCKQmMnVt0ZXrdBc
J24ia/JEQ7+Ua3lqFn4pni7Pk34/juwq0LS2hqF9vKM2r5Z4/KZ5izZxxyU9c3Xe
FWSRP8xWwA+H7ewtmFPrcGVRV9EVrZj/twpJn8KxvvFdFqJjHYdCUIkkcpuFN3MF
yo0qVBp4aOvyQkzn+eyRNvFXkL0xGYJxeU1OouuUDMM3k75hUflAN9JUZfrTaMNP
RPFhsTBcEgELPM7LLJqV9UqSsG/oAbC1eFV9fMoGRzcWNrd21XDb/TfPz11uGM6v
R0a8dVjmmZU9OJMOcYYp9HebKFHBJrTQZoNE1syC7Kxj6+lg1xc=
=qWqp
-----END PGP SIGNATURE-----

--DLSvPqhBVl0l+K0b--
