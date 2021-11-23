Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39294459E97
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 09:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhKWIze (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 03:55:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:52520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229721AbhKWIzd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 03:55:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 588C460FC3;
        Tue, 23 Nov 2021 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637657546;
        bh=T1Wu1HaiPk9IdEr03zo3RO4DOreDPwvBeTvHQ1EkLBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r2rd/M1ezUu0nUITmFLDdiVBweV+4CLPWrG+R6f6KVdNM+zJ94Ok0OBuun0sltQzl
         AG49PR1Y/Xk6XLHT15Mq8HALSXsxWv7AUW4XHN6L3bxWXfWcUQYGmXU71V9T7+efh/
         8J7FCF64xGmZQe2mxd4/IKt6l9mxjEGL/sCTPG3imWfcTluOaOKH4BFf2UHenS1CYv
         MV7t3txxcAQiSAoNi/sQnX+5Vc++ttUkLtMjU+tKSRUrqtYse5jjx1ItrH2IIk7pQM
         AgPVM/2TwBpXSgeJITGCojzo//QUrsJfOtw1TuPeVkUZ/A+yPSfqR/LbAejJWcO0EI
         yB9PEDhKN+Hhw==
Date:   Tue, 23 Nov 2021 09:52:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QM
 compatible matching
Message-ID: <YZyrxvzRUk3jPMnn@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>, Rob Herring <robh@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-2-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BTP02E+ulndgBnjX"
Content-Disposition: inline
In-Reply-To: <1636566415-22750-2-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BTP02E+ulndgBnjX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 07:46:44PM +0200, Abel Vesa wrote:
> The i.MX 8QM DTS files use two compatibles, so update the binding to fix
> dtbs_check warnings like:
>=20
>   arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml: i2c@5a800000:
>     compatible: ['fsl,imx8qm-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Applied to for-next, thanks!


--BTP02E+ulndgBnjX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcq8YACgkQFA3kzBSg
KbZvFg/9ExrQHMe1OfU+rbUE7wWiNgJzLodPu1nWHSWQbWkWgaCFDcqFhUDbsXkK
bGxb7f9/Z8jbJHzlYrlP0tWBwF6LlUkR5XLYmYKvP5WoWp+jufmnZvgYy8ELXMTF
AbN7gStiC3bS/0lHOgykW3i9uZy7Arpl3lhG4AHBUBp1tw0I3uO9QXLUb7x5Xza7
cvprVyewQyfddKJprv0bg4LE3XnhyHzPZsYXBtSVYb4QgH38C56xyLD8vKCSbWBA
ZrS0Mhvfve1r18zZzo8XY/A8nKxzUFiex1UbkmBxI/c39xHz84VWv47b5ocx/6Ws
n+iWKFJZlVOfjDnBNe+4v1a8QahhlUE5piIahrF1xJyB6rcNtxsQ2BA30VBXYNs0
A0rs6niUK0RhoSzqjS/TLJ7AK5lOypZg+4rCbEB6hPjIKj49ZF+2UcVDR9/RkD9u
5EbcB3Zr9i0GOuU9eyrOWaSkntD2lZA8NhjhFAx1BeAAExUFDbudpIEAlLipdiLE
Npy5tShxgUKFk4Imz1KAuCpot3+U+Iee9Mq1vcg1IoQgcuOEO3vD3HQ1YFjHgN3C
8hFX4t37r/sHlBHV8UUmOh31NufimYvi0gtOv2JHbUiOZeUWGygAxGu3RyEEsT3s
+V4isn9hx4x/7HKu9l4lO6HnSBS3B5mGAZxf7Tm5oRKg07HIHgs=
=EjAu
-----END PGP SIGNATURE-----

--BTP02E+ulndgBnjX--
