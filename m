Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755004610B2
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 10:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242654AbhK2JDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 04:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237704AbhK2JBP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 04:01:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D093DC0613FB;
        Mon, 29 Nov 2021 00:46:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E4396121C;
        Mon, 29 Nov 2021 08:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2523EC53FAD;
        Mon, 29 Nov 2021 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638175606;
        bh=oaLcDR+6x2GaOYtTmlKovn8ka1IF1mNadAa/b6xBwck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pg7ZEiGG4J5cFQgcqe6beVg4tjKtyzfpJ+htRrxFTjSijtioif8Dg/tPOGgHU7Msk
         Q19ml6+MomEAXzIODPSPIWb1zoNoAX19UP2bd1rL+ZnzPYyQavsUmZOfURVc3UhHDN
         snOOXQ3fCC1L6pGxH2xRN8mWlPd71GPnK6e3nQHSqrrYQySduzwa/HTbA0CZmfoiZv
         vV0R0jFaK/J95RXMTTETTdM5oIOk3s7D8RfhP/w/p/g0ksj0M3FZiGKGbYn9zyOr1q
         5wjV9DRAWnR/GS/qBUVO7MfRiX1XxiGzQUrsh5M/0mRaXYpZlZlOrTzh2KEcUrmvCu
         ny64YgQN6h8eg==
Date:   Mon, 29 Nov 2021 09:46:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     andy.shevchenko@gmail.com, christian.koenig@amd.com,
        digetx@gmail.com, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v4] i2c: tegra: Add the ACPI support
Message-ID: <YaSTcx7sZfn0cZ4i@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, digetx@gmail.com,
        dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iDFdsTcaXlfLI7aZ"
Content-Disposition: inline
In-Reply-To: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iDFdsTcaXlfLI7aZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 10:23:44PM +0530, Akhil R wrote:
> Add support for the ACPI based device registration so that the driver
> can be also enabled through ACPI table.
>=20
> This does not include the ACPI support for Tegra VI and DVC I2C.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Applied to for-next, thanks!


--iDFdsTcaXlfLI7aZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkk3MACgkQFA3kzBSg
KbbDPg//YV1hcN80cjWSN7APDde7BabZiypwDgo8ZFZOkOsbZ2VOzZXpgyn42+4y
3TyxXQDyO3xpqfsC0AaYnK/cGc1QqJC9xAKE4VeogWXC1yw9zPs1/UptGtvEPjAV
wPR3TsJxNZYlEAfXkTlI5iFQh85893vXGxX+5t9XnXjLSWqawgF97UPcohaliALQ
mtZhFbXEXccJujSSXUkmBZeSYi1YV8N23HO6kx7YjQ+DxgAjCdPXxLlHOSBhg9fe
7nWlRC/+uUZr7hdkrD/jqi3wzXkHaiWKb0slAqmZdunzFvFpocDgIPaBazBhsbln
Pu5RFoFpdZKqp+lP2c7RsnjU5SU9ptWxMy6HZKq6sdjNrNPAC9U8vZdVlax7kar2
oxbhZ685bIQVtk9ep+X49eo15JN1xm+grQcTmvPpNr9mVBOEyItviBqD53kyCfFa
P2RTudptER0hoN5gVG8m5c04qFeLQfR49kLI02zLmsyQJZE/AEkvMYiy8G/ETOei
eOkD1A11JUgkDG3ZzkqODI2MLkhyGwHi4DyA60Xw3FX6kktcJqrAK4RT+1Cn+4fk
Jb+Bb7PTLV0osT6H0XSGXv55Zbt9A9F5mvnQAKpnvk+vmhbmUGcS4yPnLWKi41s+
qdute+3i7oHiAjXQfcPJ0eWVRPO5GzVwUE+MF3B4XHxg5jL0OYM=
=PuO7
-----END PGP SIGNATURE-----

--iDFdsTcaXlfLI7aZ--
