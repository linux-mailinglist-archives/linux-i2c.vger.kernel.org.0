Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232856ECB61
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 13:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjDXLcn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 07:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDXLcm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 07:32:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD37535B7;
        Mon, 24 Apr 2023 04:32:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67F2E61207;
        Mon, 24 Apr 2023 11:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264DCC433EF;
        Mon, 24 Apr 2023 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682335960;
        bh=On0z10g8v8bJG0L3dlEqAFCxUzQwXhp9tdwpKvMEO6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ptWm5oHqP2ADuCuFXvr338IBOVD4THsDiKwMq+/WrRCurE96CmKVNPLMhZTZLWGqY
         a11gHsCLb/jNhDqHFouS+G0GPNYukfd8MaonhBiPLUW0j0oxj6dGJTO0pZvV59wX7S
         cg5mJ0isMTenab0YfT6i+h1EnF2JyhXLPqUg9ykrGxEY+nBJOPJqljyF6qr4tH5G3+
         kbG5CflZ5SBvphaZsHir/NQvkhdgRwzUV5pQXRY7iErE4FUZohFY7AClz3gqF5x7sl
         vqzkwKD8Oi5DF24kM02a00M3J9TiTSHK+QDdTbGztXffJALLX53eB25Edgy7MIdj2B
         icapLjnRk9Ohg==
Date:   Mon, 24 Apr 2023 13:32:37 +0200
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
Message-ID: <ZEZo1WxjkcMiWKPg@sai>
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
 <ZEZafj6j+EurGWJ7@sai>
 <f9be2c5d-1303-1b91-c672-7e5a476277e7@ideasonboard.com>
 <30e4656f-63d9-a79c-c1d9-23d0a16cf184@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aEwdzLCz74v3KciV"
Content-Disposition: inline
In-Reply-To: <30e4656f-63d9-a79c-c1d9-23d0a16cf184@ideasonboard.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aEwdzLCz74v3KciV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Ah, right. I'll resend with the DT bindings separate.
>=20
> Also, looks like I forgot to remove the namespaces for export symbols.

And why not keeping them? I understand ATR would be the first user in
the Linux I2C world, but someone has to start it...


--aEwdzLCz74v3KciV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRGaNUACgkQFA3kzBSg
KbaI+hAAoe0xI+upFRvtf7uqijad6aE3HQfiZdBweG6IinlHT7lG8v0nS1Iqf+H8
D48gyYVs4LAt2GzX0q/3DkUDgAKKeBvqeD5a1QLtirvXXxFBYD9SYwz/NF2rXUdf
Al/ylKPj2BwLMMchgt/gTtroaP77Ig9vMGr8+O9OaMvZU8+D+OPQ05cS/8t2sTG8
4Jkg3Bsk6mclusvQdb2ZK7vngnxWq1BVBiaDnHiap0NnPU39fi8fR7gXPmBhsMQ2
8L3+O9vVBEB5tkOv01cM2E/ruWlt4+vzGqaeRaAUTJPBEbBNNnJpAmsRf3TV7b1e
VmTBj3H+K9CSsvJuWIwxBB9t2yKpGkT2mnL8Adm1UWX7hyrdqVZEL1MW79VwCYrf
RsLussri6TEJT5S67gVYfLan50o/EzLwY0pCnDN8lo6kCIMQK03gpYzfPneo2ljb
FGOcXv46WrzFFlzXLd0KYLPLMKpWfDXh4Q26yss3FToJgkLM3c8yWfJmBSNOBaID
/a3vP57ztZ02PoqOtMi6CtWw1JAB4EzXFJdfAd6Lob+bMmbbekqmsm0NeG68xgCY
poX2ttycNYZT3462ATrF8nrnY4a79pQwPap7KMA+3XPROcTItb6eizFt4D0ZnjWG
8k9vqmLIdi2ZoqqVNPuvnErMlOWmUvytnMCLS9CdviZCfxGpZn0=
=pBgj
-----END PGP SIGNATURE-----

--aEwdzLCz74v3KciV--
