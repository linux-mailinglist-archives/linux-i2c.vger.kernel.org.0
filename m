Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D102CC100
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730498AbgLBPg0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:36:26 -0500
Received: from sauhun.de ([88.99.104.3]:39870 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728502AbgLBPg0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:36:26 -0500
Received: from localhost (p54b3307e.dip0.t-ipconnect.de [84.179.48.126])
        by pokefinder.org (Postfix) with ESMTPSA id E36432C048D;
        Wed,  2 Dec 2020 16:35:43 +0100 (CET)
Date:   Wed, 2 Dec 2020 16:35:43 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
Message-ID: <20201202153543.GG874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
        matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
Content-Disposition: inline
In-Reply-To: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> Some i2c device driver indirectly uses I2C driver when it is now
> being suspended. The i2c devices driver is suspended during the
> NOIRQ phase and this cannot be changed due to other dependencies.
> Therefore, we also need to move the suspend handling for the I2C
> controller driver to the NOIRQ phase as well.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Is this a bugfix and should go into 5.10? Or can it wait for 5.11?

Thanks,

   Wolfram


--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HtEsACgkQFA3kzBSg
KbYskhAAtZFZ7ZH5z0Kt+bbVGxsk8eRbGrFiFXfHq1nNVMmoNdIV/B1lbO5M0OyX
Qd4iL1aJ9fgM9I5A8BWKMKTjcYPBCipSoItIoqe9LXsurw7Tzm7zuGHHKrbuzmOb
7qONskLtS4Hxl6Eiv47FsWnkSZkJkrfqFmQ/M/xrF1JwAxZu70k7EEbDYQw4JEgT
8t2Vgf3lXLVMrJnjAIhFM91bD8cSbgp5EuKsZUnI7qlj2kL30Gu5dk62oRtsXd4Q
xhlvJzpoGrpuGtV4odMJJ5nLuK345sMLW1qYroEX/HiOmbzC8dwZsHAQK5Vwqs+n
78ZYPpVlc4vAjT1dG9ImYsJ0DB2TAr/jTQWSvsoygz1ot24Lgl1uHE2hf3ja7rRz
Jm9tLBcItIftWZPrazk2V7Pz12GxOhLnX3AnPLlcdyhukZIKbPHez8eROI0DF/D2
udORtMdlb/xPHxXEEGVIhablxpsSMfhiFMqDLTUajCijSDpnKQeeiHy8YPSm2N2c
4xWmt2cDGWuQmiXLdULZV/MN/SGb3nyz/frz0/FOXZzHp+ishjOhtoXRukTRJ5Cb
03aLh5+yjdINxX8NhDXoGvaiR0PFVXbwc5FsSPhry/5emOonR8m7+59scOYF1aJG
UjJDUQL+pvxZliBkC+GJ1FsZ/zh7nXKWDesG+Q5EvfFbizaidbY=
=8g9O
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--
