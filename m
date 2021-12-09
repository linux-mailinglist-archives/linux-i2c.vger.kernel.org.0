Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BC046E541
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 10:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233810AbhLIJO6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:14:58 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44044 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbhLIJO5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:14:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5EC00B823BD;
        Thu,  9 Dec 2021 09:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82231C004DD;
        Thu,  9 Dec 2021 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639041082;
        bh=pssFQWSpQe1WZ6oeNLkzA5FVp/QwqnekznEM7YIDM7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nwxIouRs23etY3wRZ0Zssu8QYIgC5zeEGoJEQmTFap3Lr6VJhnh1miU1wjnCiHhh3
         84vL80GeRBY4SpDvrG7fC3zzS3ycLue52MsTFGvm/N7gvmu/vAGU1r4lEReHtq60sl
         XHBYN/17n8Bv0kPps38J0320kp4gD65SjvMSzv8sVbUmiYFl6F1oHMhGRhLHiHcUTP
         4Y+GWFLsmw2ZjlsiJnnibmKIYs73XY1SqbiyXpmn3IWXMr5zdy1alqRZK0B3g6wXHF
         VRNN0496rFJr2NRIeFkVjf5BWbUbz95pT6x53XKhEw5k6ekSInYgKLkcBwc1+Elxyn
         98JI93K49S5wQ==
Date:   Thu, 9 Dec 2021 10:11:19 +0100
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
Subject: Re: [PATCH v2 RESEND 3/8] dt-bindings: i2c: exynos5: Add bus clock
Message-ID: <YbHIN4DubgcWT83F@ninjato>
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
 <20211204215820.17378-4-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MPiLj87lCwWa+XBD"
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-4-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MPiLj87lCwWa+XBD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 11:58:15PM +0200, Sam Protsenko wrote:
> In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
> part of USIv2 block, there are two clocks provided to HSI2C controller:
>   - PCLK: bus clock (APB), provides access to register interface
>   - IPCLK: operating IP-core clock; SCL is derived from this one
>=20
> Both clocks have to be asserted for HSI2C to be functional in that case.
>=20
> Modify bindings doc to allow specifying bus clock in addition to
> already described operating clock.
>=20
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Applied to for-next, thanks!


--MPiLj87lCwWa+XBD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxyDcACgkQFA3kzBSg
KbZe8RAAsaU4OayW9ehrHcYse79kyrLbwQvMKPH3JkKeY0TyReguQxaPyixRqhp6
vhodjPuBpEAkpRpTM+kC9yxQXMJ/iAKZCLGFwcoPrLvNvbUmwmz5XRMepqNqgrJW
96swkfdCm1Dw5huzPzyv2zm5Cgce+fRw9CSyRelu7e16uWfPieET1pqeRxoToCvr
98vE6pM3jkNkRBtVVqXt24ZLf2wENnV+lzKf0wyf3UMS08gK6cKhXEDzesN4f6xq
zCR52l72TfyZWeHjDYyFLK4EtVtOC8rPWCOuVJbF7796rLH6Ifpb/jOJIzuzr/XP
ah6jWp02Zz7uKXyRL2eMdljk+UTQACdTw1HjkIq85aSeFEjqqsDzoZCk6zCdNZWH
tdZxLftCsB4cBuzgtx2RyTwuzDBQcavCLY+xsY8hJTWD22cklb6Vk3hFnLGRvgKY
meERj6/L1YZUcKB3rQdRMLCEJ+L7zJZPKazgpGpf4a4rSR0vbTOJnp2eusUlSblp
j+0nGjhbShEJf658JUnDSAMJ41BkYd7rfzQbLmcVxV9RnGLyDqXOYT9YgmIRyWMX
WnD5/KR18ujtUsoL6M/tqEC3VE/XkoFqM7rJ845mRCEyawt4BqToJZWjFTt4FZFY
Izsl4aaLZdb9sCsTntRvp+uZCZGgAeBqOfzUBLmz0AI3A4YI/OE=
=1iLL
-----END PGP SIGNATURE-----

--MPiLj87lCwWa+XBD--
