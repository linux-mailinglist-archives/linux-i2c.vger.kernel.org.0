Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD947E7228
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 20:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjKITVq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 14:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjKITVp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 14:21:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D1730F9;
        Thu,  9 Nov 2023 11:21:43 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F375C433C7;
        Thu,  9 Nov 2023 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699557702;
        bh=NOFaAzXRPsXFUEQMmRunb/BDs129I651BfmvhqzQIb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KGem5uOheUBZxbJhdOLi8pJgDK9De/+b9Xu5kgo68hNOjo60ejNOIXxPIJZqp2oqW
         aMGxNX6ZzXXjN3tQF5U7IJHz/+PmVttZ7Ubal53P5Sac0fO0s0aEQy5om4IyQKZXGX
         SWdNT3d2yTpQk1T5matiNSWHAYDPEvrFNXbw9/xfFjL0qXi1b7VWWyHR9Q7ayGmSEQ
         kKz2KNrGCnu5o58/r1T0aywjEmFlEESNnRKX3pZ8Rrx6yi5ZG/V6C/OcCpSoLghvBQ
         jOCQa3tsfFMJT3JD9cCWTcfOtchmQW2vPKHAsVFJ+Pgkbok8VAdWdBqnC0MJhAbl6/
         EAlwNq3ZcLIGw==
Date:   Thu, 9 Nov 2023 20:21:39 +0100
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
Subject: Re: [PATCH 02/17] dt-bindings: i2c: exynos5: add specific
 compatibles for existing SoC
Message-ID: <ZU0xQ8cLfsO6fTHZ@shikoro>
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
 <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RqL1AD8IYbm5aRkz"
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RqL1AD8IYbm5aRkz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 11:43:28AM +0100, Krzysztof Kozlowski wrote:
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


--RqL1AD8IYbm5aRkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVNMT8ACgkQFA3kzBSg
KbYy6w/+INLgZGYWBZpdxg6YnMaThvTKb1XWojfSRwQeP0OmuZox9H933vZm0ir2
gfFKEobts0mXTAtmroUFRX7WFHzixph6b7kDwTjgJUXJvF+c///CRcVNhuFJtMrK
OBhRHWpby2CGzt5cL/5Y9vjGcn/+EvPcSg58j1QcrjMuGjK3zK1SH2N+6SUTlUrg
5ZwnB0XwwNd+tVkYKf7L8W+u/SMi9x9GCpR6aYv859VJOM/GeuklI6dlst7M4Osq
pGt1Y9EfVxcNkgYoruNnqprFjAaM2kygx+fWElsbKwysw+Av8A430EHkT1Y11ybl
VPpAwFbxBQiXgjvqmxdh0+vf0WlC/M/P2M3bBv2PcgvMFJkV78bQNcl37X7W7zOQ
pJFIyGu6FvusCFsWUYQ22Kay3pH7CfLOZyFYCXgSH9byrjr+jDF5vbqYuxzoYouc
JoUCeXD5FW+GvoIMUvolBiAkqrAdv20bG1vQobpesi6nMA+L3J11GVLruCif9PGB
SlcTuar5+BOryhodPEal4SiQiXq1okwzwtoKySYHU8TKtKwjjfghXoRkirvqawWE
uDhKHh8nZInAWrfyb7QlkW7zghJooADD3B9dp3EOcYpDB0rCRLQ7UboYKa7oBSYw
m0nL87qA4TudPxD2cOkTyJnphBmvvFYQJmEE94fC5FdmayTDuqE=
=0VXh
-----END PGP SIGNATURE-----

--RqL1AD8IYbm5aRkz--
