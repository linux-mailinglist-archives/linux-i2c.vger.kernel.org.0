Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB39E2A54C8
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 22:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389134AbgKCVOX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 16:14:23 -0500
Received: from sauhun.de ([88.99.104.3]:40538 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389131AbgKCVNQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 16:13:16 -0500
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
        by pokefinder.org (Postfix) with ESMTPSA id 4BCBD2C0561;
        Tue,  3 Nov 2020 22:13:13 +0100 (CET)
Date:   Tue, 3 Nov 2020 22:13:12 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: move dma reset before i2c reset
Message-ID: <20201103211312.GG1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
        matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
References: <1604059081-28197-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Content-Disposition: inline
In-Reply-To: <1604059081-28197-1-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 07:58:01PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> The i2c driver default do dma reset after i2c reset, but sometimes
> i2c reset will trigger dma tx2rx, then apdma write data to dram
> which has been i2c_put_dma_safe_msg_buf(kfree). Move dma reset
> before i2c reset in mtk_i2c_init_hw to fix it.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hx+gACgkQFA3kzBSg
KbYX6Q//ZGVdd7tkdj2nWfdk4zLv7XxhsnNc0yRj5kGzxUJKvKNkQhYfnhhxFMX7
HPEU0NIyBcT0NniiLqHhqAvAe91PNdUt2rlaD8zoWJkm22nBHH06IO1XBLglK6Ok
9mQWJ/h4E9SZVA7pPoOKQE8XDdD4Th767jmIDQ16xvo/YyAWu0yxwMep5ausuIHr
RT2MmJisrXYHXXMDCVBkgBrD2UWR8XjNVrjap0aMfvdEb5N35BxsEB4BO3472XKI
Ex00+kTjc+mFbwOtMTxtjVnOqW9fqqYu7indYah0mqDX5W8XUK/Ztuqi1qnQ7FBE
4X3DXxmZYGBgMBYfU4oQYQJDbCu/+X7hljgmvZ+uobhnEMIBIcRZ1qgNIGG3/my5
9Xdzvc6fKdfZefYc2cUFoJ7EpLgY+KJP/oKEhYQ43y0ORN0ZWdO2eMH2GUOJdhhd
9YH1lPPnZQcvCkt14U5FYyDCT2ZnbgTcZFo9TgLctlNqdm2o7xTYokbwmbooBx1m
scA3peUJ+OyjQJrIX/b1+I1uYdh2v1Z/WRnIEIt2fdf+cBJGUEOC6VAP5v5FRO2M
Is7BlkZnyuLXMyIz3wHYng/ivGqE2SPrO/JYk3rR2O8w+8dn/2HWOsZsyydyKa/l
GPuN3WQru6TiDeD7lYTjRqRjl9jGzkSETQFO9jtdiTy3Wu+4uBk=
=YC2K
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--
