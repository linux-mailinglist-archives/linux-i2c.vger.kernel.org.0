Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF9D14663D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 12:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgAWK7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 05:59:36 -0500
Received: from sauhun.de ([88.99.104.3]:52104 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728921AbgAWK7K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 05:59:10 -0500
Received: from localhost (p54B335E9.dip0.t-ipconnect.de [84.179.53.233])
        by pokefinder.org (Postfix) with ESMTPSA id C8C832C00DA;
        Thu, 23 Jan 2020 11:59:08 +0100 (CET)
Date:   Thu, 23 Jan 2020 11:59:08 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Message-ID: <20200123105908.GE1105@ninjato>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline
In-Reply-To: <1578384779-15487-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 09:12:58AM +0100, Krzysztof Kozlowski wrote:
> Some of the I2C bus drivers can be compile tested to increase build
> coverage.  This requires also:
> 1. Adding dependencies on COMMON_CLK for BCM2835 and Meson I2C
>    controllers,
> 2. Adding 'if' conditional to 'default y' so they will not get enabled
>    by default on all other architectures,
> 3. Limiting few compile test options to supported architectures (which
>    provide the readsX()/writesX() primitives).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20

Applied to for-next with the zx chunk removed, thanks!


--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4pfHgACgkQFA3kzBSg
KbYnrg/9HyJVjx09jFKG5CydmnTSMXzOKZ7M9Ck+0pdZwsLKttoMrJjFabpiqykr
A7AOaTgkaQQLK79xHuVHwu5bYCzwVtRBElFNQzwYyFmeIfAd2Cf2LoMBzOC0T7DP
/nMkU+2PEmeTSZtDuBLLNrckEpw0gcbaXZhLrWIcXaZHpglbonZxa/2DJSEfpLj2
Z5rpZ17O4X20GEjJ6cunddM7mmNFmoB6I/kYsaOsOmrR0xCXVV+j+IPArvvCj0hQ
8+LNK/KredOVKemDkXjdYPUXry3l56jTCbiOHumuKCKFL/+bskmvjVhmg7mMaCHd
fHi3n2/UQFxTinDSWQjQTcd85HQkQIuIK0FAqRhAP3illfHaEZ/Vmt0Yh5+dnutu
RUkzlrx17lbmOjChb5SJ1Sc7AbJiXT4N/6q3ZmaJv+S+Aa3imwcXmJIDtFzVJd3T
Q/7noIG4fWOfp+d8ajt3lTJSq0r6eWZjMSAU/gxmG3RYZNikLTpNFcn4gBIIRfzK
Um1pj+g6leb7Wp2wOS/ONBMdDkLCRgBv9nhhlvQgPfR8me2iJh9ndJFFRWFWxzQc
v8hEuez1m9rPVG77Kg7CTdIUJcxzjziEP8kTmtlfXB0nfbhG7+XWUsIYeCPnJFqs
je7itrWyURZUNEZePmRyCRAu2EAwxTy+BIYg68e0WuwfN/CNpXY=
=RIMX
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
