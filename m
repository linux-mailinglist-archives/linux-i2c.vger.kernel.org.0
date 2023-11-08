Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB0FE7E57C3
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 14:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344541AbjKHNHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 08:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjKHNHU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 08:07:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B5D1AE;
        Wed,  8 Nov 2023 05:07:18 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAAEC433C8;
        Wed,  8 Nov 2023 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699448838;
        bh=oi5w46XUUj+5eCHt5HUP0e7A7OgjsfNv+uqws1harcw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=USgbXuQE+ahS0wMNzK3GZRWrt2o4EadreHpU54UrkxxsZTTz0+LAe6fX8RvlykKp3
         GnmJtzyZD1B5KT90EnuOrpS45Wn4Ug2QUbGzOlIaMw4h8TYxXniEVURlDAPEFofnAA
         iULsGnxGgZ2r3S/txUvuyAC4NfimqV7S5ugviXvv/bC9zlMCTAI9ifoFUl0qap50eK
         8xnqTE2LkaSAP45eLgiKG3jc+Tl0L9OlmfUcmBV78/c8SmRpnZH7a47rwrNZWy6prh
         1BOu/wADh/rVR70guv/oGFc/pjZ9rrdvWZkVYr2T0XYKkEeW2YWOsyGVWaKdWKHEcO
         jUDvq/YygN9Fw==
Date:   Wed, 8 Nov 2023 13:07:14 +0000
From:   Mark Brown <broonie@kernel.org>
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
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <ZUuIAihzcOqkVsWG@finisterre.sirena.org.uk>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X+QegD6ebh8cp8W3"
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
X-Cookie: Slow day.  Practice crawling.
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--X+QegD6ebh8cp8W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 08, 2023 at 11:43:37AM +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:

Acked-by: Mark Brown <broonie@kernel.org>

--X+QegD6ebh8cp8W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVLh/wACgkQJNaLcl1U
h9D+/Af+MyEPu0I4eqVGYfK3Bo/6Rvq3LXEhL2x1vksJCKJjNwBBvQHqRWRTBZXL
VEhtg6O887bE4a7Hy4RErRnb978JM4kG0mM4qBPhwgv9YoqD9Ymr7jFfp8dRru28
hGY35dYXNXlC3LMJ1CdSVnubfo0QPHIzRYwWO4xpz0/BqNtsJlELPaU2s1q0wDHO
v/nMVrIE3Xzjp4iQEXcyfZa4k73XOYHmSqxR0H9xiDayBgMuUkypOeDs/qGpO+mW
Bp4IbvvgVJr9ifLmpCMlZWSQryHbiOR3cpJHR6Tb3UhjJKUgccQLyGHgBfAgiSqJ
x6Tc2OIcYB5l2yn9+JONwgLPLMiALg==
=Ypqx
-----END PGP SIGNATURE-----

--X+QegD6ebh8cp8W3--
