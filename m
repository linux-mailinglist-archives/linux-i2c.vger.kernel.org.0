Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177F4146431
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 10:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAWJNf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 04:13:35 -0500
Received: from sauhun.de ([88.99.104.3]:51024 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAWJNf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 04:13:35 -0500
Received: from localhost (p54B335E9.dip0.t-ipconnect.de [84.179.53.233])
        by pokefinder.org (Postfix) with ESMTPSA id 219732C084D;
        Thu, 23 Jan 2020 10:13:33 +0100 (CET)
Date:   Thu, 23 Jan 2020 10:13:32 +0100
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
Message-ID: <20200123091332.GC1105@ninjato>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
 <1578384779-15487-2-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <1578384779-15487-2-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kVXhAStRUZ/+rrGn
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

Looks good. Let's discuss this one question of patch 1 and we are good
to go!


--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4pY7wACgkQFA3kzBSg
KbbvYhAAmjiDzasn0PDpK65/wMOnzkWYqdzFwh1bqfUK552YcJ0lkmQSNEVJQrkW
myLYK9FMub2vahd1vJLev1Wncl8v9yP6uckZyZkhtnshpyKwR1vPC7YuekA7qC+T
xuw+yKLtrECDcYqPbIrKk/KcTCkBDjNW111vJxKTkteOjnF/hZCEKjJrJ3eQz9tH
HoDEm0Issq4KZDjDHpDw3dQhXkYRfMwKQir3V/RFnAGufUtTr3aW9POipDiDu3W2
pmYwOkNq8LlIDMntuOhNXeUQg6TUTA8BOzmAbbQeoBMvktlATfJY6aahOpuydkbt
uncCCGVV1esQI6zo1gGcChwvP4h+XynXJvTiXy/DjckpI1ubrGpFR5MKWCM/ZrRR
/dyHzvFKtIYXmOj2Qm/Up4nmjuOBSlhhRB1UhgaB4N3j8UJgRniHjVUpx4f1FbmD
V1D8GzyyDtMZhlhw5+wm+wI4WxnzvWNEe1e2i6ED1cQYnzxPXS0zsJFvwFSJONAt
xMYSqPZq6f5dr5PO3SifbcoS7lrF8v2K1Av67V7/nvIkahlZfZxRjHAgaVBqj1zW
86+Ur8gVcsf/BNS2FdZSS/kKq5LBFFKM28Qth/BPhow4/5wSeYHpKV7/hr60wQeO
dMnAljdZdonS88DTyVHC/aarLq7pDWEZt6pQ/CUQKoJW7v7mhgk=
=yZ3g
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
