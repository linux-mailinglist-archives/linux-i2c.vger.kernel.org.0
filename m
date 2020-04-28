Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B431BCF76
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 00:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgD1WJG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 18:09:06 -0400
Received: from sauhun.de ([88.99.104.3]:47642 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726286AbgD1WJG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Apr 2020 18:09:06 -0400
Received: from localhost (p5486CA03.dip0.t-ipconnect.de [84.134.202.3])
        by pokefinder.org (Postfix) with ESMTPSA id 52F2A2C0710;
        Wed, 29 Apr 2020 00:09:04 +0200 (CEST)
Date:   Wed, 29 Apr 2020 00:09:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] i2c: brcmstb: properly check NACK condition
Message-ID: <20200428220904.GB7698@kunai>
References: <20200426081211.10876-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline
In-Reply-To: <20200426081211.10876-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2020 at 10:12:10AM +0200, Wolfram Sang wrote:
> From: Wolfram Sang <wsa@the-dreams.de>
>=20
> cppcheck rightfully complains about:
>=20
> drivers/i2c/busses/i2c-brcmstb.c:319:7: warning: Condition 'CMD_RD' is al=
ways true [knownConditionTrueFalse]
> drivers/i2c/busses/i2c-brcmstb.c:319:17: warning: Condition 'CMD_WR' is a=
lways false [knownConditionTrueFalse]
>  if ((CMD_RD || CMD_WR) &&
>=20
> Compare the values to the 'cmd' variable.
>=20
> Fixes: dd1aa2524bc5 ("i2c: brcmstb: Add Broadcom settop SoC i2c controlle=
r driver")
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Applied to for-current, thanks!


--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6oqX8ACgkQFA3kzBSg
KbYq7Q/7Br16/++9ebjOhm70GQ8PM9ZFe3yeQh+WXJPb+pwCvOvnwRnFg+dn6Kg3
RPpLJF1PDwS+HJsLrKZGqRyLhtuWY2N2WTbN04SoQaxC71+T7Nv/R63U0m9FpaKM
U0PmwmOZ2KL8+1/HmzhlCdD8tnbI8udU3FbPEjdgo4DM7fWy2kAy8Ar1AlLfECJr
sIBSpKw5+0pYAJA1MaFMHMbXZpl01qPEsEpMVgbalXifBxZs/+nZJmRSGQny8Euv
IxcdCovHhLGfSewgOGB/jQRZo4GzcyZr+2jnyA3wsiDvCip+z/RUzgpPHPjvVJ8i
qo65Ep++nU2yTgxS+QCb+iPsEYm0B+cD7xnd+Up/XPi6OZseCKjwLBSbruR7v5JF
m38GSUvBQxapp6FBL2L8E5K8X3jLDAeSdwQ6vH86fardMbh1plXXiR9SRhVLJXpw
FKo7QWMHEnTTqZ8xmGv2KFcTR8ZCFgDFAMx8nZ2UBCEbT4GSD8AD1spd4wWpJCob
rLbXuvKbmniIrYYoHDFfTL7NhP5y1akeka/h97KF7n9NwSV81KsnmXysOoT3EPBn
R49VS65VjGdieBHrJI9BBfU0hLtcKDYsI0KUA/cyINqz403XSThLtGA5RJM3fHPJ
3mCvMgj+wiLa8kS8p4VUCAzi6Zj1a5VvQEDgV7QpgUgOUBf5Kis=
=GdAJ
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
