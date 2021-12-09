Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3910A46EA4D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 15:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbhLIOwf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 09:52:35 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47122 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238887AbhLIOwe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 09:52:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39D67B824B5;
        Thu,  9 Dec 2021 14:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C01BC341C7;
        Thu,  9 Dec 2021 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639061339;
        bh=3AROl7X9Vv9Qbid0OkUVo5FHFoXTjHs4kQFn1KMmBRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Btg4UEOr0rLkJ8TUTxdt4nM7W3QIBkB3nXUjUxzYa5J7SsoJpy9YAO5LPZSABqz73
         OkwNCGxnv8ArdDTXT8Gc5j4vUPfkI0LbNWMfIJ0pIcgfFD5TNKgtlcOsfFLGEek1uM
         TGcq1AyFd03eHWsOPuLYmEhEHKO+XYax0GUWGEncOSLHOjseQznW5e2bbaDxTsYw/e
         5Lb2JDU0LxpA/nLWk7ykek7vmTV00y0EljUT35bcx6kNgv/GrvCqookHU9RmKN+7bs
         AfqMYGxs1pDwoJH/E0AfMjnY9OA+PD2KhCaHi9mT3mzgAY7+08TIAmNAQFR3G6svnH
         KGSXVtaQT7MWw==
Date:   Thu, 9 Dec 2021 15:48:55 +0100
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
Subject: Re: [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to
 i2c for Exynos5260
Message-ID: <YbIXVw+as1Sj6yDW@ninjato>
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
 <20211204215820.17378-8-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lUU571btWketcgAb"
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-8-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lUU571btWketcgAb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 11:58:19PM +0200, Sam Protsenko wrote:
> In Device Tree specification it's recommended to use "i2c" name for I2C
> nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
> warnings like this when validating HS-I2C nodes:
>=20
>     hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
>                                   '^i2c(@.*)?'
>     From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>=20
> Rename hsi2c@* to i2c@* to fix those warnings.
>=20
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Applied to for-next, thanks!


--lUU571btWketcgAb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyF1cACgkQFA3kzBSg
Kbbv4A//XwoeLJzxrVQDigKwrW4Yd6SEuqCUNxmW6A/y1UG4Gn9bMK1MqWvHCjwA
jsLOKJbIXMW0uwSPFQbK29lT0ENr9tIBjjB78AIbWAqWFb75S/sQXLYcvwGy/ReZ
DRZtRaBSUsl6DO34MN0bglkNqpsxZJOZUNXL68d2xiD2u7yO7oJfcbRK0E29QDrc
VLqLixhcs6xqHPD2JoHlS2WfmwjLPwzpYYfmDobMNCLMhwVrg9zprHO7ebfPUti2
ELQLqnIPNaC/f06YfdjuI6iqC2bngCac84orqXagZgZBccj5WTddlR+gWmImIktn
+30HnTK6P3OjQiz09R0KW+SAY51x2RKXwPNdDdi47nUYngdxnNTHflvDR7gMFMzM
nY3CTFVGcEuzUmTe81ayzfPyGfm8MB+OILdchs8ii03AdYuwr9VFDtSW8t4zH74G
jJCSaOhjJTnXbF4tLvIAVitm2mL+wAalTYANy3c0i7zd1dVHwO+xpf2WXZask7ST
ZauFfypAisIFjMNRAimaIpgnVJkN5vOiS/dGYVFoFse7Vr4XguifsquGtFwahJqQ
cShVmqPrGX400rDfKxJXB+Y/n7vrO0iQOIwk3GbClF6/Xi4qo83RUHDeXtEgPwaQ
b5mfE2+ehG+iFoAM2GBDxtulsh2WXOiCk7fkXELRRSPXoQls4cg=
=9e0q
-----END PGP SIGNATURE-----

--lUU571btWketcgAb--
