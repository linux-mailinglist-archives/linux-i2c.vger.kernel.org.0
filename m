Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA81C363228
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 22:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbhDQUHW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 16:07:22 -0400
Received: from sauhun.de ([88.99.104.3]:38770 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbhDQUHW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Apr 2021 16:07:22 -0400
Received: from localhost (p5486c83a.dip0.t-ipconnect.de [84.134.200.58])
        by pokefinder.org (Postfix) with ESMTPSA id C437D2C04D8;
        Sat, 17 Apr 2021 22:06:53 +0200 (CEST)
Date:   Sat, 17 Apr 2021 22:06:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [PATCH 1/3] i2c: mediatek: Fix send master code at more than 1MHz
Message-ID: <20210417200651.GB9996@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
 <1618642012-10444-2-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <1618642012-10444-2-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 02:46:50PM +0800, Qii Wang wrote:
> There are some omissions in the previous patch about replacing
> I2C_MAX_FAST_MODE__FREQ with I2C_MAX_FAST_MODE_PLUS_FREQ and
> need to fix it.
>=20
> Fixes: b44658e755b5("i2c: mediatek: Send i2c master code at more than 1MH=
z")
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7P9sACgkQFA3kzBSg
KbYszg//Ys8QY2ABRS7HhCXmy+h1BQOnBbmvO2Sk+srldLlKEV3XxiGXAMFKxDUK
alfu0bBeTL//v7gGJoHeoDQefjTfpje/mGgRrROCiInSE4gcVPohw5gdr4WdwNKs
FcUH3HldvjVETlXkTYT0lDitFmfFgcY34HvwXxZoG2fPGhNtmxNCOyCE+0P5/dvK
RX9KCDyPqh5nRRuTx3akh4xRUYBaGZ2T2sRgHmxFdPRLXAePtP2PBBXonAOzCFhD
8G2OmCqwjt9Iytem2z3BvBbPAt1mYqTtoHlZPr5PRwxJtp+aGoHhg3J/6TTBrCM1
P0tyMTGPIwwgvu9NnfM9zOIiWW5dmvsM9hPsLirwKM87Hf5qp25ZIHA2bWrS8M/U
Fwwo1mZjmpcaTIn1MRoa0JDX7MDiKwIpWgF2yFUHyelnzdyIf+bLifQCjRPRGBqF
wsOR/t1Rf0JnoQguoWcQLqqvt0KtwSZZGZUaM1a2Mpz/wi5QRzwvhJsZ2ZfqBcvt
rg+9XtmgmpEhe99e+ElwAbsqFgpXB5VGDvmI3+F+61OGF8vh/P1CrN/Vhgpl8qy9
FtAQmBFDW3LpFBKyrsRp8cZ/Ht1RyesGksRM08bX410LF0AUEQ+csEKQVm9rHr0d
zD5toVtXz/KkWW2OFS1/LZDLvrDvM/3cdFosBDTsNqqcbb4Q70o=
=2+Jz
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
