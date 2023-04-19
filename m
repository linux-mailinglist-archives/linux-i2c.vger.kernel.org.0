Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A3A6E80F5
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Apr 2023 20:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjDSSJT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Apr 2023 14:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbjDSSJS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Apr 2023 14:09:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68AF5FCF;
        Wed, 19 Apr 2023 11:09:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A71C63754;
        Wed, 19 Apr 2023 18:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D689FC433EF;
        Wed, 19 Apr 2023 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681927756;
        bh=TUCoGmaqQfZ4NLT3d2Ho195v5mLMI7sX5znBLXrOWYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YSId98oIHhtiqAjHaGZa5tH4QrllvBTtHbfK5SNLnS/GnJAdxk0NjTFGN/2BuoiOA
         MjZoy5mZBAFzlqKj8hKCMmkalrFBYb7VkKXm8m10E3MaA5GeB3fyOcUwVbJ5ENC7j7
         gptDeJYVVUA3olaQ60CPTt889ZlJUplEivUcBZH1PFD38m95sgozr5YA7XSa8brplc
         jHVZRJdpi6kSSUy5VhLghE94aKROIDeP1qKEBfqwETk0SDdAzM0pOOdipMrU0D5z4Y
         XoVxuVVZLa/7Sz/E1bNZHbfiatzxA6y1qnut7/BUQKZJQ71Xydb26o10ybMI0Z+lL8
         0XHqpTSQDsmzg==
Date:   Wed, 19 Apr 2023 20:09:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Message-ID: <ZEAuRNxRzjRuJRuW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 <20230419091336.4e10ba65@booty>
 <ZD+g4j7jEg2AETNe@ninjato>
 <20230419181337.2448179d@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JSr5SI6LktGGn5l9"
Content-Disposition: inline
In-Reply-To: <20230419181337.2448179d@booty>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JSr5SI6LktGGn5l9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> > Ah, you mean we agreed on that at the Plumbers BoF? I think we can
> > conclude this is obsolete meanwhile. GMSL encodes the target addresses
> > in DT. Rob is also fine with the binding here to encode the pool in DT.
> > Let's follow that road, I'd say.
>=20
> Sure, I'm not questioning that. Apologies if it did look like. I was
> just trying to explain (to myself as well) why this hadn't been done
> previously.

All fine. I didn't understand it this way and mainly wanted to summarize
what happened since the BoF. To myself as well ;) And also for Tomi so
he knows what happened.


--JSr5SI6LktGGn5l9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRALkAACgkQFA3kzBSg
KbbHPhAAsBiWcgVFjEBmCAlyakvYjpddOTuVEIw/A5MtqXGqnGvzU3FGkINLgQ6o
beN3h/bzL4+oaGvHxnG1WA+C3sRJ4Zc327cs26vMm6BXFl6LSe0rgxSEbUDdoKIs
oTvSEksTwQji5jMdtetKITvXqs0n9mp5/Iqs8RF7KNDIffMCBdidWpURl7umOmJW
xUlKsbFcSR0yZIIVv7GSr/2rceOTQUyZw1lPev0W9mbbt1eOtgYxdiPTfL6HO+fz
77B/Wyt57nZ0yv/rkRztEFA0r2+4O8MSQdGtkygD4pfn2EEVAgajSM9iuspa5Rn/
GLzEDLSdnufrk29pR3YehrY2idPlfj5T4tYyaQZS/RVHBxn1X+NSBiMlSmsT0+cr
MOGBOvgJ29TXQRPGBiP8246A4JpWjnQx2sYM1rMX6jiHUkXYR3JKszeMxLwbjKvV
bRItbHK/1YI0nKFSef3WykZ0kvwBma/IU60enJYMVITpPPoMXR60+4dpqQCOU398
I/eLodap5bd6OC67VEvgE/89W68WBnG7aDCDuf63+gdCXJw5omD+GFLX5IvugGPU
EsoSu12g6gwQcSDJm6MHdCaXbNxrzKVt8ssikScPc0cLpWUfOz12IOfY0WGbwm4u
aCGScieeLd64u3Gp4lOL4Nm1vWGlLUZzu/VldD4t5ZBsOMEWnJ0=
=LQvv
-----END PGP SIGNATURE-----

--JSr5SI6LktGGn5l9--
