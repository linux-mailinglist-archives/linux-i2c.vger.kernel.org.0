Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8E146E545
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 10:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbhLIJPH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhLIJPG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:15:06 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C072C061746;
        Thu,  9 Dec 2021 01:11:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A7536CE245E;
        Thu,  9 Dec 2021 09:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AEDC004DD;
        Thu,  9 Dec 2021 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639041089;
        bh=0EoTjgNiX2o3KU4a9JpKxNlbkUJ+V81jV9if/QeXqO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jIgtIO5OoPRk6R079tMBYVmDkrU1BBjpbqhINIVbShy0ZAPjl8fKUYhFZfK0flNvq
         Y/XKyDszKaZmZvJLHevkuzYKHfG8ce3mU1xNtY4dEo/U2RhGA051/PeLRF1Cda1LQ7
         JudUk4zq0ash5bfWyE5ODArulrFIFi6tIJpTjuYJ6AxlhNFquWD6ajcVU+ynT4wcvR
         8ISXFLtAeiYIAxelWpQGPhx1xHPjC8401v2Id1sD9pEb1YoUOXoe1fov5xG3LtOymf
         l7qJNGnvx7BgA2Uqrs8ZS5lWsnuZsO/jCWpuzE7AWaePGkz9LYxppKuvegciYadfjc
         GKSY2YAcayDRA==
Date:   Thu, 9 Dec 2021 10:11:26 +0100
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
Subject: Re: [PATCH v2 RESEND 4/8] i2c: exynos5: Add support for ExynosAutoV9
 SoC
Message-ID: <YbHIPuGX5x/0Uov2@ninjato>
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
 <20211204215820.17378-5-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pn6fry62jX8QkL3j"
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-5-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pn6fry62jX8QkL3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 11:58:16PM +0200, Sam Protsenko wrote:
> From: Jaewon Kim <jaewon02.kim@samsung.com>
>=20
> ExynosAutoV9 functioning logic mostly follows I2C_TYPE_EXYNOS7, but
> timing calculation and configuration procedure is changed: e.g. only
> timing_s3 has to be set now.
>=20
> Another change of HSI2C controller in ExynosAutoV9 SoC is that it's now
> a part of USIv2 IP-core. No changes is needed for I2C driver though, as
> all USI related configuration is done in USI driver.
>=20
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-next, thanks!


--Pn6fry62jX8QkL3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxyD4ACgkQFA3kzBSg
Kbbn4g/+MkmxH+gnfnF/txaEM3pOUoxn4ZzIyVJ65bg+YX2+gOWydC0623oNPty0
lOIfoGTim93Ar4V6HwezHDfQ8PZYNvXwXPIfrjvX64+Tr4tpuZg1nFdGqExe9NLs
PuTncbc90B856eLi+SILYDMdDMPhT9fuCAGy8llU4EnBNjRSSZiPeF32kOHneuNl
RPORkRLOVgV9nsoVaVSePka2SrAjXKGaILOotYBsB7ISIiTmDJsbAd48PCyiekF2
/QRvuShhApkXABPGakH0NJvRL3n/40mgEx15OBqd/JQGL7h8BS2P1oIOS2sR8a4A
u3XNRk2ZEA3pHLter5bqN26s7EJzlZP8FzHTchNAsRLYFPQxQcIKYXyU5cAHG8KG
6+EjlCBtMOhIXdPIYbqvnk/q7HPHSW3P+YMUreVeHvjqPXzKjgSfxafKI4+Nxh8J
MQnwuEm27B4gzOJv2FyVdDK8F9ZgU/E6fjghOFbZ2ffSyxVfS24TbLFPQ0SN2l0e
GQHSP9LoD6lHaU7DdA6WbNjSLqgF8bzmW3BOJRRmPRDv8UOYiqh70B+wPK25Xb55
b3PK3geQ4gfwGnhrKWnp06ifsejMdJkLEFCNNtmGMghhzW/RTv7Kmo/nxldHwgrM
IRlohZ9vGhX6p3BS+kHhUFWpXGYnXctNsVCzj9hIGPpNyfOgCRA=
=Tgx5
-----END PGP SIGNATURE-----

--Pn6fry62jX8QkL3j--
