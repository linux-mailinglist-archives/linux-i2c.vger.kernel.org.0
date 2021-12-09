Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7652E46F36B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 19:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhLIS4O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 13:56:14 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:38624 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbhLIS4N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 13:56:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4A232CE27D8;
        Thu,  9 Dec 2021 18:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A3CC004DD;
        Thu,  9 Dec 2021 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639075956;
        bh=Vpvn9BpaztMxS3Coy+djzcUc9rDa62Nrs8W/yp3DK2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BX0Z8sGJhkNL8PgGS9z4GLxEdUgIO/Qnk9ywa1iyyXnCr3Ri2vik6024sjwJXtAf3
         41+3qRr1JA15DT8Zq5oYNc84qNrCI7wIf7xgq3XugUWct8y+HKH8lZdCN8yg27sZrB
         hD504qSFshPSRQuYaf5+jC762t5NKPN2wTjW6CQDqnySdvS+yEMnIGwiCM8Wmf2ree
         Zqmar/eL/LRdIRU1KABSunK7dbpVdxNysz/cSxPG4MsE7Fu+PJZaXG1P1Cg3TVjG0N
         95OaNlAmMLWmOsc498P230h4ODRTeRQb+9uaObFbfbw0J3apktwaKGb5U21DATMJ+r
         k6Ykm8ouIijGA==
Date:   Thu, 9 Dec 2021 19:52:33 +0100
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
Subject: Re: [PATCH v2 RESEND 6/8] i2c: exynos5: Mention Exynos850 and
 ExynosAutoV9 in Kconfig
Message-ID: <YbJQcZptx63GRV9s@ninjato>
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
 <20211204215820.17378-7-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="onpvWf7vS8z3wf5+"
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-7-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--onpvWf7vS8z3wf5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 11:58:18PM +0200, Sam Protsenko wrote:
> I2C controller chosen by I2C_EXYNOS5 config option is also suitable for
> Exynos850 and ExynosAutoV9 SoCs. State that specifically in I2C_EXYNOS5
> symbol help section.
>=20
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>

Applied to for-next (and not patch 7), thanks!


--onpvWf7vS8z3wf5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyUHAACgkQFA3kzBSg
KbbvYQ//QamLSIQn+VKzJSqlbh64hvRzvxCtMpNIws3ZNpYnImwZotSkRuXzVGK8
BCXuZcF+dbmA9O+CoeoNwpVIxh7iQAwH59j9VN8RxkuwUfCtkvBZa4nU5BC7Zwhc
6O/WWDOw9s+usmyKkmwRVa9Of7I5sCGPmVsPacyZ0SJlR28b58z+CQR4MVsFuFnO
piq1q8GxQln98LjHFgmHp+JLWMth59y4sTEB7ilgHc1XNv3+GFZBBVFnXyloLcOp
a12y9TDhmIIoE7YUUYV8kUG3Y3/nso7QqZ5JsuDjRGGH4fKUkpqY4j1O/g/LSj2R
vOj4xfYmIrNYHocj000CCI4wY7u4dUbcbnikPz1sBWAen1ATuN1ln8lPVtH/EKoJ
vpW9cahXyXurnxQtqBbVz31VIOPE10Pn2BcxRQF+Yq6ofshvFvtbull52LFOVhP9
ONVcuctXF8WYRJoV+pgkjsoSvllleoRvjWLRR+EzDTj7nR/bD1JsTXTJI3STrea1
3rqF06EdzPpn9doOZPtVGWkUHf9vncQD1359hSmpfMI8yapC7aRKqqTkC8vHZOi9
AqAjRS+r+s/XSChQANGDl66rQ4KzjLXWUzkU6nVPHV9/3LZbS5tqDn4F6us6LONe
WOwNli6ZnPgmG1Q09yl+mc09QKF5uWirWUnHR+oR9qZtaXTPvgU=
=YXRt
-----END PGP SIGNATURE-----

--onpvWf7vS8z3wf5+--
