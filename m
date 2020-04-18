Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7434A1AF52D
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 23:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgDRVjP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 17:39:15 -0400
Received: from sauhun.de ([88.99.104.3]:50662 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726734AbgDRVjP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Apr 2020 17:39:15 -0400
Received: from localhost (p5486CFBC.dip0.t-ipconnect.de [84.134.207.188])
        by pokefinder.org (Postfix) with ESMTPSA id 823D32C1FB0;
        Sat, 18 Apr 2020 23:39:13 +0200 (CEST)
Date:   Sat, 18 Apr 2020 23:39:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: Re: [PATCH v7 1/3] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20200418213913.GB1293@ninjato>
References: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 10:33:00AM +0200, Loic Poulain wrote:
> This commit adds I2C bus support for the Camera Control Interface
> (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> controller supports two masters and they are registered to the core.
>=20
> CCI versions supported in the driver are msm8916, msm8996 and sdm845.
>=20
> This is a rework of the patch posted by Vinod:
> https://patchwork.kernel.org/patch/10569961/
>=20
> With additional fixes + most of the comments addressed.
>=20
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Tested-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Removed the err msg after platform_get_irq and applied to for-next,
thanks!


--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6bc4AACgkQFA3kzBSg
KbZY2g/+J0ZRDTzEmCu65Ti6BU2LVqIPVbx6Ekmz1GNjffpCiCeJtIl701C8xUOv
QKtJg27QjkjpSyVObdcZ3/uEOwvbi5vkfSDp4KrKpJ/XIQwQ0vrTAQQujzR3NJuM
OUP6hRtCYpi5NXmiUwZd/CPf9qpWCPscEql+68zK8kB5R/VbcXU0DSbd7gg6extI
c2XYeIzS3NGWf43Qxb5ZFEwJan1qNqEAVALctryfYLutjZOcJ8iRbeK9kb6EcfsF
vO/JOtm3SQ9cvDLSZ5aPE9pDzucRUJ80DzPeRgLVKvgYZUKTCPQuuHNZwJuRZ3zR
J9OX0eTa/VS7vFtaZimLWQzQtO7ZuPO1xzGq/zivShyfok2E/qNho/Ww4d/0eXzL
kZ7Lg+H/Bg79dGSDfPokwFNHdlA0MmnOzGzDmW83RHFDrnYACdZSDVlqYFAP1Ud3
wpC5Eox3XCYfRiyLxNW6qI0sRbmdFDY8MQsC1VfDvyAGgWDIwEcdhNRUvN5NPb8U
KG48++YoyfZqSs3VrsGONPqnv5eTD9frIRS2ynm7HPkPs1Fs3QWLMs9G9oecYNbV
+Kj8qvn6FXsLI/hlopq0QAsLLRMOCEPLHDRjH4WrQA7fjrq5BNq3xJWECCrUxuai
oeI4H1vs32MbvkOTm7c16wrYhSq8KiVn07zuGYzMI07yWRp01jA=
=DrVC
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
