Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12CAA46EA52
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 15:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233262AbhLIOwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 09:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhLIOwp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 09:52:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F61C061746;
        Thu,  9 Dec 2021 06:49:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D4BFDB8232B;
        Thu,  9 Dec 2021 14:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6B0C341C3;
        Thu,  9 Dec 2021 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639061349;
        bh=fncNNwEZZ13cx/cFlMkuO4R/u4X00Tt6BQorHaAhDvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p4igpzns9W6eNGFejOTyyo77pIkgrOPO8MOq/j0CVeBg8KVjkCXDR17gIeBoeVlCt
         hjM3J1oGxumw2RgcQC/+NHgYBzetBeW6pwveH1rwJhTSy61G3u0u9wUAmr7VqlxUDa
         CXdXaJAbrs5+mLA6GJTf6ktA/Qdt5LHTZzbyeYRxZ+Kfxy6uveLSiuUDxuqIOX5IOh
         0f8j+NXNH0936YRVqGZwU0isBOF62/B1okv0X/4QXmFk7rgD0xoksK8Rsql3SwNC15
         cJOt15rSLJZJWl3N4wI6Tgvi447mXGZBaucC9fHckXQrINzldjKK85BVASoIC6Pgoq
         jSwlGBJngP5rw==
Date:   Thu, 9 Dec 2021 15:49:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3] i2c: exynos5: Add bus clock support
Message-ID: <YbIXYinx3J9cfYrr@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20211209140313.14926-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DEQvb2BR+ftSzNBZ"
Content-Disposition: inline
In-Reply-To: <20211209140313.14926-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DEQvb2BR+ftSzNBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 04:03:13PM +0200, Sam Protsenko wrote:
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

Applied to for-next, thanks!


--DEQvb2BR+ftSzNBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyF2IACgkQFA3kzBSg
KbadixAAth7qW3Rnrv1+LKeOBXDyB7R6MKGLgThiQop8aOkeCFKx6EEDoCvwR63l
MC6zQlref+iiRUFzRX0AERM0vZN+q4qGXw6RQ+6V05mRmZ7hM3JHvMNtPwHHH7ET
8qbZDc1OBr/1CEZAwN0S49WRo4VlntZnv9fkZjGF2Ow2wyjMF+0MHsroHg+pqVTU
yLYApaLmUf+yGD+0BYLsdKCgD995pv0SAy3aEpwGRXwncbYYGGwaGrIf2GRawiyo
iykjcH+6pjAJPVN1c4T1O+81htqfBYlytstXPNoYw+rrCeTIg5Rv2E51PLsHm+T5
71DQt4B1/W/ZTXgjW6UySt6N1YkISIvC32RrZM+bX2Nk/m9mdX8CooZRH+GklSHo
znfqQ5j2rLJfyTXYBGnJo8mA79eBbi0Xr8ln4+pYxYW9Gkl0DkZsX9JObvNaKhoM
JiWWhh6UXFKQTz00CoHawzQTE7Selopy9B469R03z+nATAqAr3KTnQSwy5+dUPVA
ScZT+uva4D7lWKT8CzFZDQFOakinkmGG5BnaEf5IEy4NLavkL5SR+sE3lj4iHEUJ
68Tlk0SRJGpQ47tRGHXaau/gNw5Y9n9klnEy3eyOPfnx/oWy7pNgm7ZofBBwtF0D
D1JjAWttjsNpJlbd5ja3sCuvVDCfnVwnB8vtIJ3IG77VBYI05YE=
=6qqn
-----END PGP SIGNATURE-----

--DEQvb2BR+ftSzNBZ--
