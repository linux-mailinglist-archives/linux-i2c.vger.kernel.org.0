Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8740646E53A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 10:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhLIJOn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:14:43 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:45748 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhLIJOn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:14:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6EE47CE24D8;
        Thu,  9 Dec 2021 09:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0A1C004DD;
        Thu,  9 Dec 2021 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639041066;
        bh=lIySVKXJuzGaf+4L/Kkc4vKVZBxYKOBXLWu6InjMYnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YzxCZutR528C/jiJpyR77xJewU1gXCej9Lap4rPnXSAUOGhHaG+rmcBEvUAdtG2Yz
         u3wIxbpcURLID0ZFTGDnhfyv9VEw7YUuiPMsmsU6GRFIkF5OVXhlJCvAUBhxkILxm4
         A8hll0Ih5VoFDRQbQpZbiQWDP3yZXqniavr2X4NoP0Lmf9lImGNuLXz6aNbLiqn8Pj
         M3KAovvuu/fU67RlykNI9c0BrBN+smwoseHJvvdAMl2lzEAMRIJrUB1DsjOiY54Lli
         u37m27sq/tar7nNCxdOj0zUrBgOlHbrk9T10AUIWlML+RhsGJZHvNrzuoUPJtZ89qh
         5Bh1fq9rEyrxQ==
Date:   Thu, 9 Dec 2021 10:11:03 +0100
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
Subject: Re: [PATCH v2 RESEND 1/8] dt-bindings: i2c: exynos5: Convert to
 dtschema
Message-ID: <YbHIJ7zFCHO6XkOO@ninjato>
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
 <20211204215820.17378-2-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="giaOf9sbUdGXrwm3"
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-2-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--giaOf9sbUdGXrwm3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 11:58:13PM +0200, Sam Protsenko wrote:
> Convert Samsung Exynos High Speed I2C bindings doc to DT schema format.
>=20
> Changes during bindings conversion:
> 1. Added missing required clock properties (driver fails when it's
>    unable to get the clock)
> 2. Removed properties and descriptions that can be found in
>    schemas/i2c/i2c-controller.yaml [1]
> 3. Fixed the example so it can be validated by dtschema
>=20
> [1] https://github.com/robherring/dt-schema/blob/master/schemas/i2c/i2c-c=
ontroller.yaml
>=20
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-next, thanks!


--giaOf9sbUdGXrwm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxyCcACgkQFA3kzBSg
Kbbgfg/+N6I9YiB/OeiO8TIJzRRs46AjSaMxoUTMGyNoeAdTKdGEge6M69k5vEhW
GIYg//REisF8PaUa5Ip9AyJ+MzFb8wXxN9yP/MNRgLbwiJqcPbfkFyRroCSGzKnw
B/VnjQoxfrtN2tZNKkww4WrFxszd6o6v/7HHjyacasSSQJuejq3eNdU37MeTKnN8
J4G0fsNLg3TSdRMu2VA18smaapalnswO57tQ0PjN5Y5c2b4LYvA22xTo8muW+AON
ywd0YD3M9FgBMUdU4udl3eNdZf6QklZAyCkdiascvvXJJpOLMCP7CKygG+wNMER8
fcTnlRdG3DNLMedBSNTK92sl1whq9D2HL13A8QZpv7yTpqViZ9XveTsTPjbNe5pF
+UiHJ3WcuiKjq13j3dzeOqV0qc0Q6Fx5cyDzjUHbYYk9EEMKFN3YY+4PFFiGkr5Q
sz3gxcU5QYfv3zQUTYEDi6F7RxxW41bL0vNsfGtmP6kdR+ap8RZQ247qtpM3xJ0b
UUivFs3JrNU2Az8wy0HyWvNgOURnDPWSD2pijBGds653k3R9wrCxIZUvYVmQ2wbE
E5Rvog3ONBZ7AX1GDIz0FCW2gw2BKdSoyh16GeVXPGMd6554Mm5l7RMNYX/PieiZ
Yh4xXqE6BawZXGtSXtGLj7oBmVKaebGwVDBpU3OmOuRYYfuwkHU=
=YpRu
-----END PGP SIGNATURE-----

--giaOf9sbUdGXrwm3--
