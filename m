Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8712C390A05
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 21:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhEYTzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 15:55:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232970AbhEYTzc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 15:55:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D2ED6124C;
        Tue, 25 May 2021 19:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621972442;
        bh=t14QEyABKq/zZGTByNLce4SMsRjYOXpYyP1Q+wEP5/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uyur4GF54f32odFQaFHlZ6KDMDPTmQWdBIaxMZ47ZMnx+RUfa73Eyqm2ojeouFkWS
         bnlJAI/C7aK4ug0y1F54LhprLSQ6fUN/Yc01L3pBIcpfI1rtr/ir7U6JWVy69CC6ki
         iVMw3L4kThsatp0DJnEk6pSa3aSWhTheP1uC/gAB4R8PAYCKXSkwN7bQCQbKQdJ7A7
         RFjIWs37T7sdIbsuJ+HcE5TNErWYUBdtZVC2E/k6UziNZk5G8tEBmzZPjd8Km+srdz
         URQzOYZcJpEVYw3B2468Ch+hRgbGVnnsd6Zv4Rd9US0rbdDAgKedY+y/YIbd4YEoqU
         K/6R9BD26X7Ww==
Date:   Tue, 25 May 2021 21:53:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v4 2/2] i2c: stm32f7: add SMBus-Alert support
Message-ID: <YK1V13YcZZnnyAPF@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
 <1620220479-2647-3-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MSiyfM2VW1p0450H"
Content-Disposition: inline
In-Reply-To: <1620220479-2647-3-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MSiyfM2VW1p0450H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 03:14:39PM +0200, Alain Volmat wrote:
> Add support for the SMBus-Alert protocol to the STM32F7 that has
> dedicated control and status logic.
>=20
> If SMBus-Alert is used, the SMBALERT# pin must be configured as alternate
> function for I2C Alert.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--MSiyfM2VW1p0450H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtVdcACgkQFA3kzBSg
KbYEiw/+JhJHZ4ZfSzLSrsAk5zvjs4Hh/DUGlBX1E5J4JmLbjcMzTrLVbH+sPF/R
eOQxmufvZAsV8h1KX7TeB1WoGdAjP6R/lOWjPyHls6BjLSHYRJxQSNvoCgXgi/zo
Eyf9Od2FQ7xc9XxtchvuEo+6ggzKJMLb6qnHs8ewq48Z+Iji+hsxyO/lUlEVRk66
xNmyBb9KU3BY4GZs58ItZc0j1Ch4ki4pa9HoSA+E9gWRdo+0k/sM6fxHP3cEHgel
2TY0sH5y9MxWr4J8WGoBC89JR26IiVzFv9M9bxOiNupPL0vWGSnVSa9FuZIV17vL
mPVNwe3/YShpyUE3DEhZU+hOK59QJq4hs8D0fBg/tQFQzsUjhP+ZOfGPvISugMhC
AkWpHPL1km5Wf93lmcE6AvxvhZfV+WRwZZsjSOxxy1IGrJEyL/nvgBA26kfR1AN3
93UeW3HdIyXvYy1IMh6Yaf5Lsp+UfBVEUE/A0HYvXFjBAMKeR0eFUHWAdEfypOVx
F6vmC2Im8OYvYB2WsTlnKpwBnp3GUT55JVxiEcHI/5E6pFG9uFc+WS+EIwdvVfGK
tHX/KikaQ4C02m+xYMhGaFCByLfAfMv3sGQlDEyszx7MI3CQFF3icCVusmCro7/X
dlVdIX8eq5Rx3bCAredY55DJMDaQEbTQzUiCkAbNoL7ig8Q+NCk=
=Yvx5
-----END PGP SIGNATURE-----

--MSiyfM2VW1p0450H--
