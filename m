Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616C17E7235
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 20:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjKITWg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 14:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbjKITWf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 14:22:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1781FCB;
        Thu,  9 Nov 2023 11:22:33 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F579C433C7;
        Thu,  9 Nov 2023 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699557753;
        bh=omrfxaa+J/5nWgwxOCEybAtDNlYVqN5puZowfEYsMSk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YUeOjbHTod/exJRIzEO3Bc/EhP4cF4eBTgn1g7kTB0rpx5kqwcGVWt0RytI4KLnXh
         1APpsJe+a4/cr3mx7h7Uz1sxSfi3zFttR3D3cEAVA9q9NABSLncSenV2qHokN/JHUw
         gSDuYGjsG20CsTuJHqTtJrjS8lAkFUYCOUPtMH74/cndN/Cb2eOWLWNH3WMJ/zkDst
         Ayxcaa1lS5giHEtUhvmFVbQH4ZvllDtHkIcDRGrH0IrY+vl1v+qchyi4vOJamPRCCL
         5nqo52Z79ZMrWF/cdVmgNFZAf2rnclaOYArtQYoa3ajhP1rHjT5sn19VZkI8hrAyl3
         ox1+KO4roURAQ==
Date:   Thu, 9 Nov 2023 20:22:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add
 specific compatibles for existing SoC
Message-ID: <ZU0xdeMX7g856J81@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W725bfiX4yCK58gL"
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W725bfiX4yCK58gL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 11:43:29AM +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>=20
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.

I am fine that you take it once all review comments are addressed. Given
that:

Acked-by: Wolfram Sang <wsa@kernel.org>


--W725bfiX4yCK58gL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVNMXUACgkQFA3kzBSg
Kbay9g//eXyEFLH18ObMaht1tYo+nQsZvUuCog4jMbrdmYAYGKemdGIdx9SYI5tz
O8iW5KlaMLIKzUgzCpBLz6RDj18NG3D+MRTVThCprfw7snkHBj/34WRhtzC2LodT
vZ4vxmCILUOJBZv8p1qdNkeTEHg9O1KiqBlldgEbns/vx5fYloMFBVwmFQygzpqa
HoZz31DZ0p3V09kpaHoN4Wccv9VxT9vqFxsxsfzsXOoxlQuFTIr/szokmb2Or2N/
IyjXeWc5XgS9Y+39ti58bW5dCMNaCy4B6VZTQi8eymjIZDAxb+P1Ljp7r8tFuc8p
sVFUwmY5m0iELY9GSvqzCQeX16pzj/Jmg7hXNY8+JqGjVWBrPCXjgpr80e17tdeN
4ESfEK5Rc/8EYZ7djg8DTaTM/gVS8A5tAbsQL4v4NUkIodzyJoZBYfAJ5DNKmUTG
+LuOhGjv8Ut1sdc/v2Mm2Nwz3L+J3Gixde0B9UmPIJ4gTQ56f/Q45wBaBuGAkD5n
jIGqmIxgC1dg0M5hWoj/AC5WjYBtOMaKhK+FStBH9YuyvekZYq9v/0xFTnvl2emq
iQ+bcHzNwIVk0NDGhVU3xUARyiRFZRJTYEjNe2gcTtBczA423vOOkPvyNou9hgXw
uRQYM46Y2STJ5a4NuIcaLNyvbQNWa+LlKaohyW/FxFXW1tF9Z40=
=0tv7
-----END PGP SIGNATURE-----

--W725bfiX4yCK58gL--
