Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FC527A236
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 20:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgI0SB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 14:01:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0SB7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 14:01:59 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52936208FE;
        Sun, 27 Sep 2020 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601229718;
        bh=gKjI0SpOMNbKmsoq2MeAhIXV7EHwHDDAcmXZpwiWIBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E+DMBFlEMKx73NJXhHGRPLja7Wc1aZg87H8ZctlIovQVHz+Z0Sppepg+EtK51cdi/
         m1QSklQmNyITcbXkcMGsf/D/DMgx+ZGS2lMNJ5u7qrNdnhzIelYYBLkBQhfAd0gFun
         mnID3Gf4mO3eMi1dkQ5XzLMXqd+IwnsjPcS4uQjU=
Date:   Sun, 27 Sep 2020 20:01:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QXP
 compatible matching
Message-ID: <20200927180156.GC19475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200917191321.28741-1-krzk@kernel.org>
 <20200917191321.28741-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-2-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 09:13:19PM +0200, Krzysztof Kozlowski wrote:
> The i.MX 8QXP DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
>=20
>   arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: i2c@5a820000:
>     compatible: ['fsl,imx8qxp-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w05QACgkQFA3kzBSg
Kba7Vw/+K1RmQtJNvcs0+LTGCjo0ce/WmtSpBdDjEfo2NDjvfkN3mGglOmtkD8ql
FVmla7JxrFW+FxD4WI48ghxggK66K17ysDW9d2pLa1xJ0g06zBqyUvqgLnLoR2Is
dmjGRz8TSMK3zhU6hIBT9tcNNsJKzKEYqhGrCdUvG/yvT0CAw1bNcF1IJr/iW+TJ
RrXD5BKrOe6dBGcBmb5I2aj0JoXTuD5lEHtuZYBSYdxY7DRrs+11fQkpvawoeoCg
kLl/BLg2HxFLqxjijSbcgppwGjjvDtI9B6fNz4Xec74Xvu6DjyL5xONMFg3e/I23
TcQuH4vTOkA2KREPkbfrtuF1UWvqseEUx6LbGCCBHaREQaMJtkAiv7j9xWyOTIgE
BU6GXKD8ELlkkiReV1lii7then4hWM9ziQd7gDC1XOIKIMakpIEu8UXTAGAbNePd
2l7817TxaPiC5HtoobQaQZ8IFE99h8uooE+zrPKv3U4sMZX54C9+o/rESmq+l7uy
tHSLiJkIxId4Fd7kMy5odWtRWFsKuV9vtPCsyXVi4RWYdunyXeGgEg6n6rF7vGsW
5KnHYr+lCmNWKj3TuWFEJ/UtEf2+gfGc032KPhg8ZjM0WiJ3J2jJas+OMlsyed5e
/VZ6hNnFfFFYiVou07bCE8EVEl6+M9BcIEAcid25fzWfN96y+4w=
=n0LM
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
