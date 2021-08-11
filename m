Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1983E9283
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhHKNY5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:24:57 -0400
Received: from www.zeus03.de ([194.117.254.33]:36512 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231314AbhHKNY4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 09:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Zj+1hp8G47wXcFaRLnLZZMIt1eA/
        Sor/z4yyLAACU9I=; b=RYYd5QtmhyrS5bDH6n0hdXSeE3XyLSw6iM8zi/N29vRn
        cqRv57/ShQBL7b3c58wVftU6jrsrW7InE2O7C8RtPXo56UmE52tGu1CbvlqQjePs
        8IP3XnPKgQ+L165YgWthMf9fewjcwojwulIYp4/uz9LS3MZCVDLO+JyQBt1Jfyo=
Received: (qmail 2664420 invoked from network); 11 Aug 2021 15:24:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 15:24:29 +0200
X-UD-Smtp-Session: l3s3148p1@bmy8iUjJ8p0gARa4RTP4AfHKOCm/nqrR
Date:   Wed, 11 Aug 2021 15:24:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] i2c: imx: : use proper DMAENGINE API for termination
Message-ID: <YRPPjYkEI0g4YWe/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZoAMe4cW2ZV7lzg2"
Content-Disposition: inline
In-Reply-To: <20210623095942.3325-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZoAMe4cW2ZV7lzg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 11:59:36AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--ZoAMe4cW2ZV7lzg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmETz40ACgkQFA3kzBSg
KbZBrhAAjV73ShOFMZ09RASg8YUbYILEHkoz7ecY3jHH1jyaPqXqci8x8WJjQGAV
AvUn90uOnfnZyskENMj8TbRQQ5a08KlCtFnCwWNliLdpTeRAZZg14o9Kb6qqFZIu
KGPY5gfS39C5OkWrTHPV+taOCrm+GhBOLZ1HyI7wdo+/5lmpD7Q2Mttxen06jZSq
XPidQZbL6E3KUCCxsf+ud3Kv4PePD7G+muiTMWDa1tPFrPrflZJS9AbputZYEE1C
QAUc/ohwgxkFsa+gRaEZTJqoz7lTi7GDQvFoIOTrfSx2es57o+tYNBg/3XjybHXV
IrofkTL+B6uunrje/uERoSuNGy2rnxai0XbnCkTJbrqw8yuvFMkvUuSRuluvw2FR
2TeNzj2Ic1pUo162JVCyNycynbK+9HPjYv35gHcLQ8yEnRioGgXlxxhngb5Tp6Pv
vbKWajiqX6AYA3abORUjZi9BYEpQL0JD4g432zG6FElAsp0E/qqDiRmnlifYmruK
z6RubGJW1yYKsT6xaIlCcKSB4yOmGtBJhHEVphGHw6oO/FWs0mj4G2v9K66IlIJh
J6ws12K64Uoyr3laTAtEO58WMUun+fcL2uujTIU8D8rqK41Y4XIGpVp4VQaRQYNc
jCWmOTZMJzkt7HKAFaHzvgwk5iAF0tbV65BcxCKaa/sCJ2t08q0=
=oFg7
-----END PGP SIGNATURE-----

--ZoAMe4cW2ZV7lzg2--
