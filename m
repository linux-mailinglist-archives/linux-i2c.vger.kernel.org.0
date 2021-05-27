Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EED63936FD
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbhE0UWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:22:13 -0400
Received: from sauhun.de ([88.99.104.3]:33242 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235508AbhE0UWN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:22:13 -0400
X-Greylist: delayed 456 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 May 2021 16:22:12 EDT
Received: from localhost (p5486cb85.dip0.t-ipconnect.de [84.134.203.133])
        by pokefinder.org (Postfix) with ESMTPSA id DB29E2C05E0;
        Thu, 27 May 2021 22:14:56 +0200 (CEST)
Date:   Thu, 27 May 2021 22:14:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat
 brfore reset
Message-ID: <YK/9wMhoACc0beN/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
        matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
References: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I0LEN5JYjbsQxSJJ"
Content-Disposition: inline
In-Reply-To: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--I0LEN5JYjbsQxSJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 08:04:04PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> The i2c controller driver do dma reset after transfer timeout,
> but sometimes dma reset will trigger an unexpected DMA_ERR irq.
> It will cause the i2c controller to continuously send interrupts
> to the system and cause soft lock-up. So we need to disable i2c
> start_en and clear intr_stat to stop i2c controller before dma
> reset when transfer timeout.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Is there a suitable Fixes tag for this?


--I0LEN5JYjbsQxSJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/cAACgkQFA3kzBSg
KbYFkA/8C40P82jqIEVljzAwazQ69azdDrsZ15whJ7MYNsuDsA2AZEDMn2LbI1KV
OgpanxfkKMY2q+3c6A6A8gJcKSGNFZMPLynIAUTNNS7bZH0WVe/O2IPCXEuWZE7P
jBFC7BOkSCMGpmbAwB2FnjGS3ns711st4VhMKRKEINvtFyXx5KyyBRLUxh3YnL6w
y4zj/i/dpvD4Hpppwam1xCKdJIKFscSr3GQsd2i58/ulSaHuC+e+mVI0O7M229vy
vRy9NSSM6p1kmzFsRrjBdsg1iqD5Jl+UazqDWpbHlqKw8/Q1EKVpjVibHrArNyZM
I4GwQDOkMqUmvse+YUe2WQKawH9r57Il0MnQTE02DmJcv9wzHJOYLwwEQXhyIuUM
7QrZ0CTsPeifWGbOinagLO3omauXAxGs4TocEIaOsyJKR+nrAsSCyB7azNsyILjr
SswVSmcASpGBzbu30ezENrDlZCTsho+e7Elj8slCD7i0M1ZGCaLVNSmH+n94RInD
qO1Ybpd0UxRrzMngUawMQxkzD5T9iGXrz/hzukm1C7jFP46Fqpe0j0T+vHZpF4D5
PgyE/aPc04h4wS5l0Mzlu0LTNPg1nc1sIqa8rQYZPejGSwkHqa1ekc8h50tRVkBW
E1gSM4n4akF814nH4JuJgnPG7lFmX5VhYEOd2wxoD9QH+DUXt34=
=AaA0
-----END PGP SIGNATURE-----

--I0LEN5JYjbsQxSJJ--
