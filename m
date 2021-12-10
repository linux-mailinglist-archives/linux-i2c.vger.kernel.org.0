Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033F1470C76
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 22:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240192AbhLJV1V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 16:27:21 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:58864 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237368AbhLJV1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 16:27:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0FF3DCE2D41;
        Fri, 10 Dec 2021 21:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE7BC00446;
        Fri, 10 Dec 2021 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639171421;
        bh=WZhMzHgknQpWsqrRNERS1gjjZ0fPcQiMPzk5ltfw6kc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TlDxseGnBGuKdK+5tchCA7yu/kVuWetPW6/apm/qXwr6f9dbFpQq1jXk5ghwAa8qK
         fx6ht9/XzG9kFq/R4quwslmi2c81DEDz48Sp3uTUBOHnQnVedV8xEgAu0G8eAz7Wzp
         K+9iQEx9ZVdXxbMOU6aqxpBPBu7OBILsvwNP+lVNLDjRF8np4JX6eBHdh7d8jpzzax
         /XOVCdgoasqYkNZvnhD9KJdMWnhkGSqHrJCaKIS7ST3tkqR8mvxH2xzYUGcIfORDiQ
         L7FkGiL06ULu27og9Ai0zOAb8Z+N/+vuBUxQvIW4qudhlZ/NW0+lW+JUVv8FG4dYJi
         OeB0ga/43vtAA==
Date:   Fri, 10 Dec 2021 22:23:35 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     andy.shevchenko@gmail.com, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, thierry.reding@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] i2c: tegra: use i2c_timings for bus clock freq
Message-ID: <YbPFV39VU4YY9SOn@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1639138557-1709-1-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S5JuNTA1eC+dxV7V"
Content-Disposition: inline
In-Reply-To: <1639138557-1709-1-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--S5JuNTA1eC+dxV7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 05:45:57PM +0530, Akhil R wrote:
> Use i2c_timings struct and corresponding methods to get bus clock frequen=
cy
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Applied to for-next, thanks!


--S5JuNTA1eC+dxV7V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGzxVMACgkQFA3kzBSg
KbZebg//SU+X/Tm0ervkH0g5sxrsw9ac426lDyOrd0/0YbXjCiHaQZxi6HJMzRht
h6nEUbpTDnX5qgNZ/zJ79AYReqm8huhZzb6I0a3neNTlMTrJoUg1iykXGAO9QHGo
Hj9R7dwJpMJRHonGvOVqi9uPLpGxOMQyQuBS1kX4DxuEwRTjLiqhWKYzEn6nvVnY
Y65hmkT0NjpzmvFVx9fT7PFudSp5+0jyFIkj3AOi+p/N5WGr7EI+wLE9CwrLuIAa
vzEIlaPa6+43SDSGSrzjmACNFjodEgLNuhK8Aor4DUiMKRGC45Bj1qIN7fYRNPbU
wT2QQ8vHO2ooPVZWFdGJ4G8jjxzF4Q0dqNNuTXD6m3pZAELN/5vmnxyPVG0Tk0Q3
8hrfg+1uYXQuIdbfjduZNLSdXfHcT76NVrT+WftJMQmadt9AURZ9Olhjmx2uJHuW
QruqXLmM9iku3QFO74puRcWDNEDuQn2fGWzhhR7/zyt6MMS7Agd69O+nFHofbeE1
OMs9kigGD2fU8PlVQ+AzUJbiUvHCxdKd3zFbWpiHhDDTYooMlMCAv85RH44c7WBV
P9PDA4ArgughAcFS/F6PhVpuUcsUec6RpuU8UsUdfqSWdkUmdym21/GglwaxUVMw
eM8jTFJ6HSWeg3ePu/FEv/tFUsJiSpW1n8kgsR1lf3rhBWKg/pw=
=2KoO
-----END PGP SIGNATURE-----

--S5JuNTA1eC+dxV7V--
