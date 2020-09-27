Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BFB27A233
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 20:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgI0SBu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 14:01:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:35078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgI0SBu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 14:01:50 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51E3B23A03;
        Sun, 27 Sep 2020 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601229709;
        bh=3nCNdDMo6Pk4f96hKVPUizFi9AR+hwbmcspnlaj7VSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UWBcK2CAEcSFMMMVfPqoVzcBxcbh3Bx7I/kIXa619eKnHh9CLhLckDeJSHrPiFESp
         BdXfFwo2fd9ci7TZa4ErNeTMNHmtblkGLZ+BaVvzlQ9DjEvvPUN6cskByUBtApoXZ2
         KMS81qA5Snj+/Bjfo46dqsrmg3XGqA8KDD7vAJmo=
Date:   Sun, 27 Sep 2020 20:01:47 +0200
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
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: imx-lpi2c: Add properties and
 use unevaluatedProperties
Message-ID: <20200927180147.GB19475@kunai>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 09:13:18PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so
> describe all typical properties, reference generic i2c schema and use
> unevaluatedProperties to fix dtbs_check warnings like:
>=20
>   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: i2c@5a800000:
>     'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'power-doma=
ins' do not match any of the regexes: 'pinctrl-[0-9]+'
>=20
>   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: i2c@5a80=
0000:
>     'touchscreen@2c' does not match any of the regexes: 'pinctrl-[0-9]+'
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20

Applied to for-next, thanks!


--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w04sACgkQFA3kzBSg
KbZx+w/+NB2EOdSpTFOlTOrBCxyKPrKL/PJO07Y9QrhssIQ31OsW35xjjUEYVSKS
F10lVwk3xXKLCFzo1OSJGS2lxkWu/LeBw6MMRQATEjrQj4a8Sbz/iDt0clL7E1SF
xrz+ydphoQLh6hkQAmpJZDu+8mWEE6XuftWsMfjm7PtMkXxKtrv2bFZiY3cFAqRN
6ZIY2AIdO774QckL04nK98rBOJXiNPOfrLRijxBQdjo7rUwSRm73+bHQecWZ48GR
zroYcjuwixJyT3C5Sf+ceR0pFHmNbAFc5S2UUGjwGcTlAXtNmM46xS/DgYUaxWm3
W0A9ln1SZiL4gOD6/KAgGMx08D3qzjssFTxFbwn7PIHSMEmty7LciTzx6FAmEw9x
+wmlqmeDsqfsqoaIKp0W9YGRNEnsDJ3kWapnbQHIEX+s3MPxBUpCKJlgK9pGmK0C
O5EQqtaKT74VeoVoNv5uo96r1WmOEIUlI75bWowqqNq13ltf62V+k9bpMF0ENyiO
OBXW/cv2ydJchtaAPx7swixtTXz7ifdXHUTPvP8qn58aY9+2dwgpN4/DpSPdFgme
7zhXmvlrUzwSGM98EAisjJmRgfE+61RxuMDTNQ4rl3rCyg8aNVPuIFbdG7H2gqIs
9WdShHKpeyNfC8QsqnLkg4Xo1WAvkzYuLOayYHrcw9Jt8xJhycE=
=EYMW
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
