Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBC4477EAB
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhLPVWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhLPVWh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:22:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3322C061574;
        Thu, 16 Dec 2021 13:22:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 808D4B82322;
        Thu, 16 Dec 2021 21:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF66C36AE2;
        Thu, 16 Dec 2021 21:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639689754;
        bh=0kQfGM1RjxfYWvw20Tn73hc189zljonNHseVbqgTbXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NawKA1i+IWMOt72tRl6CiCFVJ9g7ci2uwJmnnnhRwxp9oi1PWf3D+XOqSd5W2ju4s
         lTVpnA+IrGBZtGDzns4vqH86j2VY+P6hzxDpDvSynkJw12plUoDVKk1mQKbqfBG/a7
         Jj9KhpAr5SCjkdhYwO5nDaYdXZ9Y5iXAbTVfqlLQ0pYnmPpagXECe9jPWcZkDbx1b3
         V4zFlp/3irinh9roalIKeKZd1dlViQBV+VPwjYrvminP1D15Qy9Bh7+3sVybC3FryZ
         qvDRW3hOKeDhwSgEjmVtyzLviM2yDic+z2rTsZEWmMcW6UF0V1+guztEN9HAF2AMtQ
         ctbx7QWfkWnFw==
Date:   Thu, 16 Dec 2021 22:22:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: exynos5: Fix getting the optional clock
Message-ID: <YbuuFztynhVUcyTM@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211212181057.20210-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LGkMuXw0gDA0VW0U"
Content-Disposition: inline
In-Reply-To: <20211212181057.20210-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LGkMuXw0gDA0VW0U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 12, 2021 at 08:10:57PM +0200, Sam Protsenko wrote:
> "hsi2c_pclk" clock is optional and may not be present for some SoCs
> supported by this driver. Nevertheless, in case the clock is provided
> but some error happens during its getting, that error should be handled
> properly. Use devm_clk_get_optional() API for that. Also report possible
> errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> clock provider is not ready by the time I2C probe function is executed).
>=20
> Fixes: c93ac09df2a8 ("i2c: exynos5: Add bus clock support")
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Applied to for-next, thanks! But I needed to fix the Fixes tag?


--LGkMuXw0gDA0VW0U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rhcACgkQFA3kzBSg
KbYuLg//V9a0VnkNuZFXzKPpM+/5MOfxH5zynk2LD1STaEvo0YaCaTI1W6JJ0pEI
uUikJ9YyxnXgz7KuOVEl0yWavW3xm9v25OAHOCzuK9v4iVTLJZkY0/Ya21Hik4x5
twOe282/lGfIGsmmZ5X8a+3Ul/1ZiIDi7c96MEwOwQpTQWK2UgTcswmKKsmUG2ps
KUAmqnUf75IkjKtu2wNBCDl6CSkRpudKSSNslKv5Berg4O7R/NWVQl8FlDdwR5qP
2zX1NUvZF9IREz6mKclsrXFeyi/Jfp0F/AfI4+ArSSIGMF5uFaxQGpYEpyokGpDd
OLwK4YJ7ughim9FjdcMAIllFAEFtgSIdW+5zkV1U5m/KnM8zYA43hXYHB7191ekI
2m1fg9aTV+EITF9Y9ErezNjHyr5LKC3jC805/AnvyDF+38mhHSRIJlUIg26hQ2tq
2vSotv3yh9tqfvgR8kd1RM2LpoPu354TYFjOXGMyI0BNQkNKKTkzWl/8MGhEiCFc
QqlySBDQ1Y57xjdTmHM1Uw+BYmLS6/Pqzh7tOPX29ocE1BZmiuzkwwCGuwCefgv5
mxyTyyH9iR25lWm6KzYIFgx/fbBjLyv9n3z/GUCVQtvGVNIz1piTy0n168T/r3qM
Q+MCKF7E7oLy9L+o/GIij734gan/g1pBatK7x+hNh8XClF/V16Q=
=5alG
-----END PGP SIGNATURE-----

--LGkMuXw0gDA0VW0U--
