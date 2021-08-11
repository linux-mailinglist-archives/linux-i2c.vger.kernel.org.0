Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735303E9286
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhHKNZD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:25:03 -0400
Received: from www.zeus03.de ([194.117.254.33]:36566 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231736AbhHKNZB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 09:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=o8uc/wWIPl7wncxfKWOdcQRmxxrT
        BbIDeumShWt/QYE=; b=ZX5AbM0GldaiZpJOuoF7mf+5yypoGVyCKo+98w8/mWx0
        uFM2PPgovrUYdAbSEuCdeq5aln8cqReZva3vQp6B2MAzvILRFWyjF1NuY5qEgFs5
        s6bZJIw9hW41yfwBfiaZhXDyZ+P42J3BZBRtu4yWfzqCgWxwBImXlBxJTiKcxzo=
Received: (qmail 2664511 invoked from network); 11 Aug 2021 15:24:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 15:24:34 +0200
X-UD-Smtp-Session: l3s3148p1@bAELikjJ9J0gARa4RTP4AfHKOCm/nqrR
Date:   Wed, 11 Aug 2021 15:24:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] i2c: mxs: : use proper DMAENGINE API for termination
Message-ID: <YRPPkVBcDKeCEP41@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XiQpmZO14D1S3OAc"
Content-Disposition: inline
In-Reply-To: <20210623095942.3325-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XiQpmZO14D1S3OAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 11:59:37AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--XiQpmZO14D1S3OAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmETz5EACgkQFA3kzBSg
KbYj0g//SbHIawAyww+5Fi+B7wHfaOJtIAKB8PIB7osTOpNRURvivDGML4iiZiBX
jsDYK5zdHKT2S9TzECLPc0eWyhjMr4NBMuxupc9btcNJbvgjYnBASexj6SW7SlNh
t8uy5pGrLgzpklIow1AVJ+jNY3P2LTxICshE51oSM7SwgjSux1khyTprpaI37ASX
ICXJy36noLv95qPnFjdMS5WCXtHAHR09y/3z1diNwclguACs8NNSoeUfJUb0X+Qp
YK4OhwkX2p5OliysNql/phtDfJADY7Lr+YYV4cGifymWykMp2UPbLc5FyfbRdFz9
0Om5zLzLPvIeH8aflmkSj99snP7i7OO0D+NII+4ai2omJ5Y77rbdgO7Jxqk4UO67
0JG451evSkaBz6aZyEQTMvUFq6SsB7FRxBEla9VOGoinb6l2L8O0LwirSn7sd46g
N0cOcYkABoa5bXnSVaLgkL4Bsm867hSVclUtWsiivxvX4v3pQd7FLr6Hd7rT5tF+
QdYJRfuZxQkCPCDVkQpnE1TtaDSwxCEybvZU5HMzorDkyo7Mib8hp5ol1tcK149q
dYEkseZOCkAXM1sR39hTe8E5aH9PIZXrweGblhbG+NBgIN8ga4MLur/wAeRuALG2
7KPMBZ+lDKoFjvnmQGsDnHFN6Npb50gNBnm4rnr5vcHbQuuwMcE=
=fIzC
-----END PGP SIGNATURE-----

--XiQpmZO14D1S3OAc--
