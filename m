Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583CB4A0315
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351582AbiA1Vnb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:43:31 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:38224 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351585AbiA1Vna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 16:43:30 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0463F61EAF;
        Fri, 28 Jan 2022 21:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52D4C340E7;
        Fri, 28 Jan 2022 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643406209;
        bh=NsbOiPGUfmhHB0ZJ5H7auWzUVox6einPVS8ygPPXcH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gxJ1XRfCvKgYczlOtWaCaBl9Ty3jszmxz0xWE4CNzNFxOqFhyuWKQkUXxlGzMG2V1
         fK50t0QwryjDxf1HexL20NvHKa1a0oe3KxvKLMRZrj9jl/dH8YfZWA+XCFXuIxQXP9
         tWZxz82fv4WQYQ2SJB/p+eLFp3Enb9FS3qQwUiWFmEoR6wdLCbKCaPfkX/v8UiioC5
         iwLgcicwasltRlwAOG7EbInhuP6RT8qtIJVfPx8KIdSQEXDwSwgQYQ0FNo8w+osjka
         gvxFnMbd0uinZCllNoZM1Avfrm3s0WKVwJi0U1bn3Fa8IcoiBs2qHRYTs0ySHKx8vu
         Mcuk6sQ1Uc/Ig==
Date:   Fri, 28 Jan 2022 22:43:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     u.kleine-koenig@pengutronix.de, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, digetx@gmail.com,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v5 3/3] i2c: smbus: Use device_*() functions instead of
 of_*()
Message-ID: <YfRjfvwMoYcCOHA8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, u.kleine-koenig@pengutronix.de,
        andy.shevchenko@gmail.com, christian.koenig@amd.com,
        digetx@gmail.com, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
References: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
 <1643370267-31804-4-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qL1R9k/YUU5WV4Iv"
Content-Disposition: inline
In-Reply-To: <1643370267-31804-4-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qL1R9k/YUU5WV4Iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 05:14:27PM +0530, Akhil R wrote:
> Change of_*() functions to device_*() for firmware agnostic usage.
> This allows to have the smbus_alert interrupt without any changes
> in the controller drivers using the ACPI table.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Applied to for-next, thanks!


--qL1R9k/YUU5WV4Iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0Y30ACgkQFA3kzBSg
KbbTJw/+NVGeZckoRLVgX1UiF/eLLpRlbEVDRaLa2fu9ZEx5zxnYLIlJ+B1tXk1p
yq0nkWm+aEx7q/gONbe8fkq6vMr7PN++hd4foXY8iEa9BVWhJZsgG/dyPpSVeZQA
xerxXoqy47yqLT37KTFj43tBJseQ7Hqzebh/bJGGJDuZ36onFiGE0QA4R8wglRVe
HP107SmFTBz65gcoOMtLeVF0IMrJo8FCK6UooL8XDivNrYexbr44tzgNKbkgZ63+
PTmCTEriezU34dV8bXz83j+uaISGagLAH15FYIgwfT5Ykr66X9CTQTv+lLiHGnDN
NIrS1Hs/iW7w17QxMcon8CxvElJvkTiniQSlrywN3u9wsQmb+COsKC0lgI4cuPvO
W/PorJB3hkU4pPsJCu5fSQnb8C8Rr2swJ3eTcppOQ+IquqXqPRFgDz/7ikOANDnw
2YkxGSIK8LjlkCL5wC5R9q3ZsTwM0Bc44XWJJ5I1hNXh+MLwGQiuUUGks1EzFkrB
0c5yEji5TCsM3yBktIjbYnYPX0SASFF96nJJ15yZ1l2P86n2+kKhRkoYrjq058Cj
4w+VrmEuA0zMBy+ZnPTDYJUUgFzGf50LfEnVw2JUinqN6ZZb0p+kTpTuRfIIRHUG
UW2YJ1owF26BPYE57gzYtDgQ3dNwXFB8thVZyZzsSpTvFOXjoiM=
=QrQm
-----END PGP SIGNATURE-----

--qL1R9k/YUU5WV4Iv--
