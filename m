Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42FC459F9E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 10:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234730AbhKWKAM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 05:00:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:35496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231221AbhKWKAL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 05:00:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D01B561028;
        Tue, 23 Nov 2021 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637661423;
        bh=xib1MyFysIEFpi5wKdkHIX0kAoP6COLUiFqb5gge5z8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eE++Cr9oeXHvdHjmAZBRMyck/Ekq8F3RYniKH6UgXekzIhjFreeBpZbxgHwDtPnt8
         lSEzaIltnZtFjH2XFzImToYNA7jPdjo5LCjo0tUFdNa1BHnDquMWmCTSgNww6P7hM0
         Tv+4Kwn9aEG584Rhg1zFJkphnaloM7o2dzDcOHztJq4B/5QO4YwPKCAbQIqmkyzQ11
         NO1ONSHe+b/UN4f7+nwVTQMMT3RaNlCL4kE528A6ijB8OHu57VrdvsldbTfXiIX/L+
         T5ds3lRn6Y4So8+DZJdOl/kp1L9fieRFAF6wWm+pi+RCKnTlIsck6Btvg//7eNYAsr
         xZUwzKUMht5Cw==
Date:   Tue, 23 Nov 2021 10:56:59 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm: samsung: Remove HAVE_S3C2410_I2C and use
 direct dependencies
Message-ID: <YZy669iBa5Wgxwj/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20211121150558.21801-1-semen.protsenko@linaro.org>
 <20211121150558.21801-2-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sNu4a5mlsQWhPPCD"
Content-Disposition: inline
In-Reply-To: <20211121150558.21801-2-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sNu4a5mlsQWhPPCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 21, 2021 at 05:05:58PM +0200, Sam Protsenko wrote:
> A separate Kconfig option HAVE_S3C2410_I2C for Samsung SoCs is not
> really needed and the i2c-s3c24xx driver can depend on Samsung ARM
> architectures instead. This also enables i2c-s3c2410 for arm64 Exynos
> SoCs, which is required for example by Exynos850.
>=20
> This is basically continuation of work made in following commits:
>   - commit d96890fca9fd ("rtc: s3c: remove HAVE_S3C_RTC in favor of
>     direct dependencies")
>   - commit 7dd3cae90d85 ("ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
>     use direct dependencies")
>=20
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--sNu4a5mlsQWhPPCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcuusACgkQFA3kzBSg
KbbdEg//XuarRI9p2hxj6PVmOAMirP+5fjySqNXaskUYP4Dli1OToOpHfCLiTGCU
AzEP45X8tObS0vU+KO0/Sj9tC+RHHNCNpD9QW5J7VE8Bbb9TuXQkb2vFxhSuaxrz
z9h3BQVBrbXitg52TbRecmXnaNUnKxaKV4v7JUtiEayWhxIHtuM5KnBLCB73yOBH
DFhQWsLX5nLZH2gOcZxtIALjU6OKa52vAPczhoA9oBkCmCVTtxBEh/KzQ+xniARy
RIACHSPNlCImq4ep4A0ZkEti+3ygCtt9qQilGvvmfFyUrcUsA6IgZbztvnM2vRPE
d6QMA/0wKYGnsoITE0sSQtlOnZLUdPvLe6emlSqMWxYYU+GmXfp235JofcOIVkpI
ARKgn/DYP7KFryWdjsfY+n/3P73iTJJneRTREw9pMbHyNVrznu/WC3nj0fXxDbQV
cda7klwPzG8zXHjH6yFLvsl+uT8/vvj/v5avTX1yfQ3e7W/0vjcDmONzGRPiNHXo
ILGoe9mHbCEyY1J1bbi7Xw9d2iNtuwIOGChMPusLmGyYxr5P14JQcYW2TuEU87dI
aaq4Z/CXYltsoF+/MpCS85yZa2Ewhyx6UdBjUwgh2FnzdJPRqgBiGDRntoAO141x
/2o6WkQjHZZYBiG3P0O7Zs+YZbI2bmmzfB/sU7wOYYuYbYc6Klg=
=FBiF
-----END PGP SIGNATURE-----

--sNu4a5mlsQWhPPCD--
