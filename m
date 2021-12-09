Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781F146E54A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 10:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbhLIJPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:15:31 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44344 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhLIJPb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:15:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6E07B8235A;
        Thu,  9 Dec 2021 09:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046E8C004DD;
        Thu,  9 Dec 2021 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639041115;
        bh=4HYZmqSualm6r0O+iSth2hV1upnEAYO2YGj0dwO4aio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=htWdFp5+38ANXG5FL6pqVERh7jreG+jaOQmd6F4xLKfzHrNOwt6l7wfCtBQ62PiX5
         s19yH3sQAdYcRqbFf0izs8LOSqAVIKtpoqypuGm1KqaHQq2wKZfcflggL+vQ/rpb0x
         oM+cRfLfz8DmD9OGiTA9DjbiQghQvTXqK9TUJbLF3ILn//6B9xweyAFxXXpMRiL8m7
         w+VJBebSbdttACiLJR2o+qH/M+i+UZZjs7iT0JOQMZO6R6aBgrT+xj2USQH2EEBfEf
         XcP7jEBqazy5GttKk72O8rzAskTAQkkjT6rjdvDPmPB/VZ5rPvSOL7i31Q1h1T2Ieh
         4Rm50OjZrsKOw==
Date:   Thu, 9 Dec 2021 10:11:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 5/8] i2c: exynos5: Add bus clock support
Message-ID: <YbHIWBa4VFEK1wKR@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-6-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oh3cTo1WoclFiwg3"
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-6-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oh3cTo1WoclFiwg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 11:58:17PM +0200, Sam Protsenko wrote:
> In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
> part of USIv2 block, there are two clocks provided to HSI2C controller:
>   - PCLK: bus clock (APB), provides access to register interface
>   - IPCLK: operating IP-core clock; SCL is derived from this one
>=20
> Both clocks have to be asserted for HSI2C to be functional in that case.
>=20
> Add code to obtain and enable/disable PCLK in addition to already
> handled operating clock. Make it optional though, as older Exynos SoC
> variants only have one HSI2C clock.
>=20
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>

This one doesn't apply here? What tree is this based on?


--oh3cTo1WoclFiwg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxyFgACgkQFA3kzBSg
KbaP0A/+NPOn/NtI0IdhiYFVt0Utf0/aPYwHAd6cku/QMII7ILbSpDGr+vCWlD9u
RHflrQ7IrkqwF1Tk026PT1zjx12vhFFDAxfBInaRhggDLCAW4fEwPtLzaGWANZMk
yz3wW63pBTqeKFRcOf3OKoNGOJ8rlYNSKP07GfoBcG9MdUViwTuxIrvw0kDyceq5
a8UJWaM+OHge+bA8eCGoXzSbG8qcre5fz8RYKK4mTLOOzRyGEaX+XvNxIlJh/V7g
2z0qB/N90WeKdRXZUpPLwNuHrQlVpck3J459uAz/nbC2kEeBIck83mt15XSC1GPM
E0ACdNgaPwW+rF0hy/T0QJi+xv9nRNrcIP5++rwPDxTXMSshFf80yHd1l1giQHZb
bYSDRwww74tK9O2L2d/zqR036P/mehoErrDmlbKjJVFamk9uAP4x5qVmViQ/si/f
cEb2EPnlqVItVBye/+z6tC6NUprPojU/w/KrYkdx9mw/iSqqZUsw3w4dGf7pHQ1B
0Lxa4FPnlNQ3PJoGtRNh9R6f8GqTHTxlyJohZ681RU96A3kfylykxUEibMzbxnxn
ar7mfMkom1MTMeQgdAZNBEXwTg49s2Q7R5b1m8HAU1VJRdR+lFQR0EUc2UfrylC/
uSyGZb6fjd4aWdDWF8yHO7bbJSzo5sHb+IWydqpqigXyxpRPb/E=
=f68N
-----END PGP SIGNATURE-----

--oh3cTo1WoclFiwg3--
