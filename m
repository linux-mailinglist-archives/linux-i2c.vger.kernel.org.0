Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34DCE146625
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 11:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgAWK7T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 05:59:19 -0500
Received: from sauhun.de ([88.99.104.3]:52126 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729094AbgAWK7O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 05:59:14 -0500
Received: from localhost (p54B335E9.dip0.t-ipconnect.de [84.179.53.233])
        by pokefinder.org (Postfix) with ESMTPSA id C070C2C084A;
        Thu, 23 Jan 2020 11:59:12 +0100 (CET)
Date:   Thu, 23 Jan 2020 11:59:12 +0100
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
Subject: Re: [PATCH v2 2/2] i2c: exynos: Update Kconfig documentation
Message-ID: <20200123105912.GF1105@ninjato>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
 <1578384779-15487-2-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline
In-Reply-To: <1578384779-15487-2-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 09:12:59AM +0100, Krzysztof Kozlowski wrote:
> Update the help text to reflect current support devices:
> 1. The Exynos high speed I2C driver supports Exynos5 (ARMv7), Exynos5433
>    and Exynos7 (both ARMv8) SoCs,
> 2. The S3C I2C driver supports S3C, S5Pv210 and Exynos{3,4,5} SoCs.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20

Applied to for-next, thanks!


--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4pfIAACgkQFA3kzBSg
KbbrcA//Tms/+ltBFvXpVJ3+fW0prOmA4azr0VsupDhuUL+TRYlw9eOQrGOwdJrN
mXGiFIesmGw1uWs/c0OPEaYIFL96C75XvPd8DY5VBr2+HIESpAN+4VgGsG2Z1hh1
n84Dzmul4cQsh4qTzYPjjIaYYOW17ZiQXmr7Si3oygqOFHGnr41lUwKTsKbJFLKV
h7wY1+7bP8KyaThxFTUMYeKBPsGV+hrhiBhUk1RyrcuNQZCdDNN+cGh2PYpY9N36
KoBJ19u0l6h8+FL4iSLS4Oby3h9TL/1EqweiPlsHctVnMcvdeyHjtB9NNUX48SqY
spkG0lMJl4O8YsK1maNlDpEEHu/mWApdh3vQSbWiDzwlBb58Saqr1SBVklwj922Z
QgpYvZl0yQE2XWaP/ikuV6N8ey/JiKPdU5jrMKuCpZpiCKCNqMyCfC5WWIlUr8FM
dxZyQ8bMrzgCCZY9/LwkIOnKLYrQY4yb/wgto2Os8aTQvg2V0dZuOUYoiJp2c/Dq
W+pke8DJiOJqfAY4fPuFSl+jjPC9JlyLFuKacKDKqpKm/mJ/i0J6sNbC57jwESys
gAUrmpGmZEYgyT1Ep8xInZA/2LDZuE6JTfSuLO8vawRrKhb21JXaT9Ehkwk2R8BP
bQnvmVUDg3nlmoMpY21DFeAzppz7p9UFA0RvPqBSOd6c3u6sZaY=
=PVpe
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
