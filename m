Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC3E6AA4E7
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbfIENnl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:43:41 -0400
Received: from sauhun.de ([88.99.104.3]:57322 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbfIENnl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 09:43:41 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 881712C00C0;
        Thu,  5 Sep 2019 15:43:38 +0200 (CEST)
Date:   Thu, 5 Sep 2019 15:43:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Provide an option to disable DMA
 processing
Message-ID: <20190905134338.GF1157@kunai>
References: <20190905075213.13260-1-lee.jones@linaro.org>
 <20190905075213.13260-2-lee.jones@linaro.org>
 <20190905091800.GD1157@kunai>
 <20190905092816.GD26880@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline
In-Reply-To: <20190905092816.GD26880@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 10:28:16AM +0100, Lee Jones wrote:
> On Thu, 05 Sep 2019, Wolfram Sang wrote:
>=20
> >=20
> > > Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
> >=20
> > Are you sure? From visual inspection, I don't see a correlation between
> > this commit and the fix here.
>=20
> This patch should have been part of the commit, or at the very least,
> part of the set, alluded to above.  Unfortunately, I was carrying
> Bjorn's hack which simply returned early from geni_se_rx_dma_prep()
> with an error, so it masked the issue.

I still don't see why this basic ACPI enabling code (not touching DMA
but only clocks and pinctrl) causes and additional handling for DMA. Am
I overlooking something obvious?


--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xEQoACgkQFA3kzBSg
KbaP5RAAtJRsAeX9DwqHu6OlUfWtnxeVIUmEceiWZ/k1Ad04csZDAuSKX/zEIIUH
STPHQiXh5QrNJSnU5Wwxu3GmIqY5xO71X2fHKQn+z9hyi6AKrNdxMnTKz9Sq/vlV
sl7qnk8IwyFEVlx6jFF10jw0ca50yv8IT4ErQAC+gUgAeF85T8tlxx66S3943qKe
8Tz9J2dazk4Okf3NZHEm7h/V6WnmxDulwocq+gkm28jfBiusxexwoxiBy83eAYe5
MbCbGD5eYesY24ZE4iJy/lCVspwe0Bgzj+DuBz0x+nwKf59vhQkjx0bV3UuaFH1/
8VgnDGl4ocIdi9kJYRpHmVaKnrr9CcvWssm7YwmTzg7L2Zq2rwRcr+hi4sM+02Qn
9Ki81OVixSgU2b8e+sbhQSh74JIAr6fiVFBBOluaT1SAkYclAzZbMETeCuDHowDB
Sm2tjXkspsahkMM/+Um+X8rQ3xcULWYAckxwlpJPgdVXBOqOHH4fWQfuCvjo+W/p
45UiRjFQQJzDAzzvjQT6cywv+nVxO3so5i3LH2QxdU+teccqtgjkbVJny9G1VdUc
e8JBMtake7qqFdgImuTCOhbqu+9ACQmeKpYVVNSepxX25JMoxr9iDZy1i0W5+pQe
N5vhQJRs0+i0X1IMG6jSuvmffuJJNIF6hI4rmRkg9//l5eHVlAo=
=Fazi
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
