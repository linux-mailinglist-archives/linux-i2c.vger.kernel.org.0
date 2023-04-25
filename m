Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC7C6EE829
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 21:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbjDYTYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 15:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbjDYTYZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 15:24:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F7818EB6;
        Tue, 25 Apr 2023 12:24:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C65E76313E;
        Tue, 25 Apr 2023 19:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE25C4339B;
        Tue, 25 Apr 2023 19:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682450655;
        bh=WqHhwYZkfR8EDEKqGRF5aPIvBjQ7WTC1wmxO9XyL0/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NiWg8PviVhTTSVXubSeYdzZPc99PeYtbJmMhd6bDcJWaRIgsrSnlYdKM72vPY5WBy
         Ayla3GJ+jFu0sFz1SMPV0zsjZG1yJ0cqkBqGPRdz3BmkB6KCFQLmXnd4te/xd56zQ0
         bsJCttYYbBjK463RqxMdFd4DDieOftDM8LfS8OiOwrHmSFthKE383mvnosXCRhFoS7
         4N8cxpF2ypBdau5K5NjFG6Wj43zQyuCVsj9MdUwlFCnPwly9j9HlZrZNEC/gc/WFpl
         r0+tsXZiwSAKa5GlkWofX/vwDhajhhUOrwcXhZUaCl7VLSe4cuGzhcZJylprc8B5/X
         0LM3tm5//3RQQ==
Date:   Tue, 25 Apr 2023 21:24:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
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
Message-ID: <ZEgo2+0cA+tD2k7u@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
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
 <20230425171347.GB1957523-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXyp5TPXXYIx2AXH"
Content-Disposition: inline
In-Reply-To: <20230425171347.GB1957523-robh@kernel.org>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BXyp5TPXXYIx2AXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> We do support some flags in the upper 16-bits of I2C addresses. Any of=20
> those possibly needed here?

I2C_OWN_SLAVE_ADDRESS definately not. ATR is only for addresses on the
remote bus while our own address is on the local bus.

I2C_TEN_BIT_ADDRESS, only in theory. I have never seen a 10-bit address
in the wild, so extremely unlikely that ATR hardware does support it.

But then again, there is a slight chance that we add more flags in the
future which might be relevant for ATR? So, u32 is probably a good
thing to use nonetheless.


--BXyp5TPXXYIx2AXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRIKNcACgkQFA3kzBSg
Kba9kBAAoXLpnt2btqw4dEDjJLtIAQyuM4KlutOsE46L+ZiOwPM9DOBHhbLVyilG
qFQqvT+96nHTFpUnQ/MC/mpFFZ9TPG86QGirha1pplDS0hocYsvbFN7OxxLAnoDy
xDxRFoHA0fFLV4tzL97s/Jl6Ka6L1ubDHcg3drun38HzFkNJEd8hqG3tJNeSfo0u
3F3LLPowCScp+oYlBw/SRXh9L8wmUkqegiDYVXf6TUfwevbBMCdhxVNEF06FA/MY
f4wcZaGAgTuSJjSbUaCKuKT/mLIoI93z5YczpFHrcj4Pr8LZKggb0V5hqMAEhk4W
WQUd9UxED5WMTcTK+/Jf7xSBM2qzTrpgwsOhv7bRlbSARimHjECU9uQUmYlFSFas
QEs4MITjUxOmcS10hB/OJN5HBWfAC+fmCkXUMDDLMZT/DN+nosTUGwWYqMv7aouB
HmfOagM83z5RkWnE7meR4qTx1UygnCNHJemm6MdaurVlsOeuk9LpFOP3EtEmUqWH
KTTDJvaRFiMZxKZz3Y7/Dz/cGM5deKnMiY5goTyyK8eTqNhfqBGxlygmX6YV80yL
LA/7tt4eZAW/qtO6SAssIuT13nuWNR5aRS9q3G0ZzaC42eHy1KoPr+EsStpR17Fm
KELYexy53yT45oza3vXSj4M6oRbF+FRxl2Jwtj+rZhtEgKxjlj4=
=Ao+h
-----END PGP SIGNATURE-----

--BXyp5TPXXYIx2AXH--
