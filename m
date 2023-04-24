Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5842D6ECB7E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 13:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjDXLoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 07:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjDXLn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 07:43:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BF63A90;
        Mon, 24 Apr 2023 04:43:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E3C8F620F6;
        Mon, 24 Apr 2023 11:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE90C433D2;
        Mon, 24 Apr 2023 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682336636;
        bh=yStDLrt72ECtekgE2X7sEf6AvfFiI9sUMAbxuLZVAGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TYe+lcqxw0apDGvI1/VWP8XWOpgUxdc17S/d3z4iAntBarN4XSx7sxySnRhvuX4EZ
         cKhA6BOFh2nujYWaOLEeTmwVhk4OQLuwsgnvcyQh0TzX3a4sByaZlP+NGWpyFMUSc+
         ZWFdqyqHMFJH7QM8pmLVnizVqfRm+bTmhdPcjl1zw8PbU2PyPl16iqNUj+D4ApabNW
         j5JK53Q+qTwcZCcRuqgnYXhM2djmOtsifkTJ7ureQsXz+H3e/QPyq0cypF7JtQysQk
         3f8IQgMB0f51rSEJYPmNKfsHvGm3Eqzhwu8wBiuQfk0WBI7Dh8yS/zNB31ZSLUobq/
         +QpdaiERcsnWw==
Date:   Mon, 24 Apr 2023 13:43:53 +0200
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
Message-ID: <ZEZreZf3ZumDOR50@sai>
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
 <ZEZo1WxjkcMiWKPg@sai>
 <56d49d1d-c85e-4db8-7fb3-a43551dfe213@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="khdf6G001LUEqK9S"
Content-Disposition: inline
In-Reply-To: <56d49d1d-c85e-4db8-7fb3-a43551dfe213@ideasonboard.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--khdf6G001LUEqK9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Well, you requested to remove them =)

Oh my...

> I originally didn't have them, but added them on Andy's request.

Oh my oh my, what a journey...

> I personally don't mind either way.

... just keep them and we are done with it :D


--khdf6G001LUEqK9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRGa3kACgkQFA3kzBSg
Kbb+LQ/+If+AxfM6LBpoT8gJhiSq5d9RCiTkXFjyzLPBpIP4WwLmSE6YV1Rs8yoE
sl4i76W3cBSMiEAFX8M2nxVKMzwD719nOQGe8QOrHOf/xU46LUFGpbyUkdk/kcgM
apxZSj9phRad+rLbPuEf563ppbuv+0p86IlJ29IdgF4TqP0s6M5jPe+ndS9b7q5y
5mujbbEFjNT5ENfxMSGbEoeYdbhhQ60KZf4RorRCXGVyraPypTAQZXYyQsWuhFdZ
ztXfitZbf/r/f3iacKY9ShHt10V+xCxlKivPAe+KTRFGpxtzjtfjn8h3NITqVS6e
9DVmfPtMwUrr7eUOyMLLEkiafzJW/ZhSs1KR791b1oiHQ33UPrvhxLcOB6LCs1rF
gjsm3E9f6sr/XAYcMP89dO67tScqamLWWf2RozGhmiSOLjAHAGwZfXQhePqc+gC8
9zGNUcuavj0iA4I6iq27cMZ3Thp51gRzKoRvJ0ce93ZW4ZpXn3fO4uHLzVvGwZej
+PI8CwuQg6Gv0yln3NN6E4l/vscodLRwd6Z7vP178MVbceltDUm4dWqq+vuF/vk7
JJS98U/ZxCS40YgwE41F1w8yCnPydKWA7oo7WY9fboBj16XnsFwVkNUNT9xRqcwS
gI1ePKrNKiJVZOAZ3+/LpdRrLBEWj9BZqspwegvOlXEs+2tIleI=
=KErb
-----END PGP SIGNATURE-----

--khdf6G001LUEqK9S--
