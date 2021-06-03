Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E317B39ABCC
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 22:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhFCUbS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 16:31:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFCUbR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 16:31:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E826610A8;
        Thu,  3 Jun 2021 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622752172;
        bh=sGq6oKPms0kNvmxNCOxFbzMFtDrdcpap7CSC86qsXjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a5oXb7mX6JHtqA2/XlXVpNClLuOvlNa+QCPsDXLyukBVDlS/682k8sC3+ulBz3gRz
         XBqecb3JPzqHCEg92q+XbORuU4J2IZEoK/jXz1ML6ilJNYauNfbCRKrxeP6fADAakY
         H6GfidBzWEmOZr5JaggVGASUSCcudoM5fLJ10E7hKqOcPFYhmYGhRkcgEdd/pOGOjy
         b0PEzPrxk5VJQYyedyu5gsjVYerD3+DUrWDQWlawdP5kGNaMD7BaCZrh+XPw+OpK6F
         eTcxxtM4FZPjvNea9UP5TvOLPtaAEE935X6B46Crc4xyabLXv25KNVauRpVTX8tfmw
         5T2AugxDHIvig==
Date:   Thu, 3 Jun 2021 22:29:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/16] i2c: busses: i2c-mxs: Demote barely half complete
 kernel-doc header
Message-ID: <YLk7qcWTZnQmLGkW@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-10-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6g+7uqXUeTsn23FL"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-10-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6g+7uqXUeTsn23FL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:58PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'timing0' not described in 'mxs_i2c_dev'
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'timing1' not described in 'mxs_i2c_dev'
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'timing2' not described in 'mxs_i2c_dev'
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'dmach' not described in 'mxs_i2c_dev'
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'pio_data' not described in 'mxs_i2c_dev'
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'addr_data' not described in 'mxs_i2c_dev'
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'sg_io' not described in 'mxs_i2c_dev'
>  drivers/i2c/busses/i2c-mxs.c:131: warning: Function parameter or member =
'dma_read' not described in 'mxs_i2c_dev'

Disabling kernel-doc works around, does not really fix, or?


--6g+7uqXUeTsn23FL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC5O6kACgkQFA3kzBSg
Kba+oRAAgn6zXi7ble+SalVCB6J3uzAkonp8GMoF4fc8TxMBZIDhLEGIqJLvYZA4
Od7iJgHnBT+7ldaJlwfDWtasSvUZCrsjjFWBpRhtoLuCbyqlHO3tOyyUIOKKFvOZ
OZUnQsAu0CGi1IxPzmlTvj6wUIzzkwd+HdaZyVKe3uMMoDHMUXpMG/r6hNKtyOCm
HHa87HeM6sIX5ZWY+O7lsv+J+KwGcmGNg/LitlgD3lsSMihyUsWnErH1DrwPOPqd
krmTufn0qSA4LPXm7dwL1buq/Or/tMxV+skW7T9lW2/ZEWO6xk/EvfBZ1Hw3qORY
+N5QzivDNgqHQIPl/vWWAF6+Q5NwipdZMxmPN237iQEcR7sfJDhyIClB5RGU9sMr
SyT/zZOqjIJH+iZDwm29dlpYW4hTpTQOdpv3dG1XcPTXTn4QRlJ4HB7qwwrJPu3k
2bo1hBmFac7Y6daENJoL7XfGSLvyv8iL20KrxTeJ5ksWJmvLzsIV17nb/1lCR6e2
mP0l0/vijk3Gz261pms8B7++aZrdMR8moqX0WwPcEpIHiG2wByRzOo7hyd0r9e9i
B1hk+eDDhh/+BjwUalsr4ydtTu32Va4ayC9is+YRwnmoCAGDMn+mRbSm4duTmjM/
bAPTS06DecWtMoWzBR/+LgcBA6reEsCG7NOdGTl0aQgtHDLrgqU=
=vqpJ
-----END PGP SIGNATURE-----

--6g+7uqXUeTsn23FL--
