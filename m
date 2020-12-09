Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693322D4BB0
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 21:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732959AbgLIUYe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 15:24:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:36670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387544AbgLIUY2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 15:24:28 -0500
Date:   Wed, 9 Dec 2020 21:23:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607545427;
        bh=Kizcyjwn9H/24P1nPu65kFtaf/oYsckg1+W7ag2YmCM=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=AOMrCxC1eHDVN+qmxrfNgjSmBZITb2c0+7EBTD7Mq0YGUmvcCtfnx5DRLH9wEtN/q
         KNCIWX17TwuuB9g1HvO/GgXHaA0gam+2yf64Tp5ofJlpSHpVkwmdQrqj6IFwr7Tusd
         vi8H3a34hKY16Z8hzfcxp4vaABLBIYQ/JWcwIkhsrRLNmK8pSm0HLiUnxXJPjLqTLJ
         H+InYWffxNqiesqoRItql33WjOlkmw11FGmjDs7EG1pmjgNJBI810kQrZm6Zz25Y7p
         5zPMx2GZ1+B/rc3RENCrG3LRtej86bGSinXnamqUEKt/wSh3PawQ5EnPmLzVd+8HP7
         LfN6Mm+qJ7kQw==
From:   Wolfram Sang <wsa@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 12/18] i2c: owl: Add compatible for the Actions Semi
 S500 I2C controller
Message-ID: <20201209202344.GC3499@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <7622fae80d12d7f423fc25190159af494c359200.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline
In-Reply-To: <7622fae80d12d7f423fc25190159af494c359200.1605823502.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 01:56:06AM +0200, Cristian Ciocaltea wrote:
> Add S500 variant to the list of devices supported by the Actions Semi
> Owl I2C driver.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Applied to for-next, thanks!


--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RMlAACgkQFA3kzBSg
Kba8MA//ZxwL5ZtaM8ANFzw8HReUj4Aafx2SwGWsa0ZoKVqlQG6rfI0mFP65wXzQ
OVT1sNs5d1Ah1AG7mBR0tfC8p5bHdrlmRUI028dqbqih+fsEBUvUpvyGcMOsQPk+
caXUDOpiUaaD6nXJ9GzIXB9XF+vwDZAYiIcndyN1+DNdyRHP3dHbfTCeBBEAk+Qv
UBT6pgxT02yCZfY0C53bhKsUIs5hmKGzpzCjDXRABJZXYzDc2OrJaURoUzaAPyAD
tny8LPjR58XgiUGDCmk31LPS9k9ecq0M/0mpd4p23Y40R7dVM5LUViM0yQoTp46S
qJiIW6sxBa2eVfqxecN7scxT2NoPf1X7/Pjzln1Y9vRQqbhZvHuVrncBcqTF/4Tg
+eszAVcoWoqhW+05ch7ZoaDcqqyR9TxPQ2f0Erj4+75Gx3/I4Mo1GUhEgwS7gEG5
b2fHzHgPX8OoeHlOSTlfZj0B4dpoKdTQJEonvKX6aUuStneBcveLv6K4qYDKjS2O
ptR3BiN2nTmkuWiqhpJOUF8LUdXVmclvQ9kMTbhqQ9exuSUe6GTmXoXNz551dRU7
jzGp3wcDi9dYqGyuy/lz2W5qYYjlyEt+CBqUgheBWsHU1TulZzjARocyzS7n/TQJ
fJt2sFiCu1Hv4QgLERdfFKxcdSgEsKYmL5SuO+atA7oeL6j13pA=
=E6fB
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
