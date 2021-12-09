Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB8C46E53E
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 10:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhLIJOx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233731AbhLIJOw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:14:52 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39321C061746;
        Thu,  9 Dec 2021 01:11:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 82461CE245E;
        Thu,  9 Dec 2021 09:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E23CC341C8;
        Thu,  9 Dec 2021 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639041074;
        bh=h+7c/uyp8vddv0VclOzH9tcN1VZ8JM0GOW8o2xNzBnU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H3TQPzPOtuQ1PmKsHbd7qEEPmu7SHLfhquLCvrLMgWwkgO6AQa0OKUcnVZTcqHCUR
         QMGATjX64OveJkhw4dY0KqwhArMSG2gpVAVc4lk+XLeml7KrSrPdMtFfBr+TVDYgcA
         KZfvkLQb6qyj7P5k0MmR5FS2fj45QGGNaIa5x9RWysLUxusx3yi7BODzSHV7oNBBUv
         nR/g/iAKHLPR+Wa8qXE+a+sXpQj4Q4AMSX0W8KVGMfgphrRiPs3KL17lxUgSqmHBX4
         D8KTkvQ49Z9ErB5Q3JW8txD97HdskYatKth03sH2iQwJp4bi3DHuWPZWyvWdP7Zl32
         YfXMw1zqjfHHQ==
Date:   Thu, 9 Dec 2021 10:11:11 +0100
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
Subject: Re: [PATCH v2 RESEND 2/8] dt-bindings: i2c: exynos5: Add
 exynosautov9-hsi2c compatible
Message-ID: <YbHILxraMndv0nPM@ninjato>
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
 <20211204215820.17378-3-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vsRIwHDck7lgJe0B"
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-3-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vsRIwHDck7lgJe0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 11:58:14PM +0200, Sam Protsenko wrote:
> From: Jaewon Kim <jaewon02.kim@samsung.com>
>=20
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
>=20
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-next, thanks!


--vsRIwHDck7lgJe0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxyC8ACgkQFA3kzBSg
KbYLshAAsonjsE2Okb71SFeZxpzVHmdn3oSN5ZbQxi0uF/hKb9DWnKRicOYtHkn0
dyNC6S1K+MZSmzxxxWQqwDE2Rd8DldMQ8hpcaEp07eQRnoMKbwrxG5E6FdNz0Kiz
VtYwrUxw5UTjeIW+MLXtf3XKLf7sZcqgSN1hy3bcKTaNbFM0Q5IyEdYW2vl6WvnY
QcC/3VZA/7BJKFjt4GzDXUNIenARqViFjscMbY1yPpRgeShA7CFIXJS3z7JdEDZN
jDlnwsCrtj9jaASG01Vkt4qFhn1zCm313DYDHb8HkdCfLaRJO6hdwJsGam2Llp4u
whHUaVMi/OhrFl1EMXGrhoy/2RNxLGhP/2Ahu7HMJ9TOlhtQxUiTPlQ2A8u3Mg6t
W5o7nuWFF7ge0cXpIpWb7IRa1R+JxQxgRosltSRPU+d6egriKflxOa2duIPBZSRI
VZQIcO+huJNLP513UgmJY50VZoFMadkdt2yOJzBWWi/3SGBP9gVueKJ8x9BCY47t
ISorE8E3KPoDVDbdhsd5ybFXOf8Ss/YS3qmkW5hyyxO4pDCv8pTaaovQe0jcExCT
77MJQNC2zLArcHhGGyjwOzrM9jdebcSFxxDZ/NoF7tVkYcNzKl+TbTEvEWg7bxLj
AGh8zJ2cZ0/SeQziHyu53+lJI6TgAryiNjOepm7+1ItG9nFRJMk=
=qCJW
-----END PGP SIGNATURE-----

--vsRIwHDck7lgJe0B--
