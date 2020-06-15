Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7062B1F9859
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 15:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730088AbgFONYE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 09:24:04 -0400
Received: from sauhun.de ([88.99.104.3]:38016 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730058AbgFONYD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 09:24:03 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id ACD7C2C1F6B;
        Mon, 15 Jun 2020 15:24:01 +0200 (CEST)
Date:   Mon, 15 Jun 2020 15:24:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: Re: [PATCH v7 1/3] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20200615132401.GF4423@kunai>
References: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
 <20200418213913.GB1293@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline
In-Reply-To: <20200418213913.GB1293@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2020 at 11:39:13PM +0200, Wolfram Sang wrote:
> On Tue, Apr 07, 2020 at 10:33:00AM +0200, Loic Poulain wrote:
> > This commit adds I2C bus support for the Camera Control Interface
> > (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> > controller supports two masters and they are registered to the core.
> >=20
> > CCI versions supported in the driver are msm8916, msm8996 and sdm845.
> >=20
> > This is a rework of the patch posted by Vinod:
> > https://patchwork.kernel.org/patch/10569961/
> >=20
> > With additional fixes + most of the comments addressed.
> >=20
> > Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Tested-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>=20
> Removed the err msg after platform_get_irq and applied to for-next,
> thanks!

BTW is one of the authors interested in being the maintainer for this
driver? If so, a patch adding that to MAINTAINERS would be much
appreciated!


--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7ndm0ACgkQFA3kzBSg
KbYBHg//V9/dBjvEQyUt6uzn3OIya7fvhzjAj5erN43CB1T7cu3rec1chbFbl+KP
m6La8joTJhuO7hacitxZ+l4FwFPmABFjPRiHoEfGxaZMKBHeaBabRYNNc0FhmYy6
OBDR/IEaqWLAo9XL0cL+9ObzDlPZkJ7uhjj3l25Go/0gtaCeI8BM9eARutLE5Fp3
IlD5eeNXmg7Ul6l9HXCQ2DiqyxGcnlFg5T5fNiBzKsK+DOSkLKbxaATsa4rwbbYN
SS9GnlXaukwZPfUkliSvZrkRUWPl65hWAdxzKM99pYXNRjQaOv9zpnQS0Xybileb
yc/qP40KPd0Idr+KarPdNuQDudbugCI9qHI+6qnDwd5k+MVpTWE12U6yjq8G+OIW
FT5ci/nkBIWg4ysxf4YaIOWc+WM88U/QsSSZ37PUhXcaS3M9X0gq/rblP8lNTI/m
cHpGzPUjf09OzS73stv3fFZHJ9mkLdsGeIq4C1s82bckyJ0hhn1E8eNV3EPAeUpm
COeZAsQBswpA25kKRdq4BNJASx/e4pLEZRE534TGjAXvf1Rz5d3cEFCdzcrvXCNR
Oaru+SwXgraF0fsFtIHiGxa2jzIgS1sHiSiDgtUYtSWsPvkaTNgdua7jN2T+qVa5
dApjCANy3CmuOJfUCwoY3UbYHOcYUJ4v+8iKY6lXx54A7tJyd38=
=hSzi
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
