Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA59D393E7E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbhE1IPK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:15:10 -0400
Received: from sauhun.de ([88.99.104.3]:39784 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236038AbhE1IPJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 04:15:09 -0400
Received: from localhost (p5486cda0.dip0.t-ipconnect.de [84.134.205.160])
        by pokefinder.org (Postfix) with ESMTPSA id 65EA72C0537;
        Fri, 28 May 2021 10:13:32 +0200 (CEST)
Date:   Fri, 28 May 2021 10:13:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat
 brfore reset
Message-ID: <YLCmLNDUqe/AiQ+I@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
 <YK/9wMhoACc0beN/@kunai>
 <1622165863.15667.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OJPvFYrtr07vTo0J"
Content-Disposition: inline
In-Reply-To: <1622165863.15667.3.camel@mhfsdcap03>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OJPvFYrtr07vTo0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 09:37:43AM +0800, Qii Wang wrote:
> On Thu, 2021-05-27 at 22:14 +0200, Wolfram Sang wrote:
> > On Thu, May 27, 2021 at 08:04:04PM +0800, qii.wang@mediatek.com wrote:
> > > From: Qii Wang <qii.wang@mediatek.com>
> > >=20
> > > The i2c controller driver do dma reset after transfer timeout,
> > > but sometimes dma reset will trigger an unexpected DMA_ERR irq.
> > > It will cause the i2c controller to continuously send interrupts
> > > to the system and cause soft lock-up. So we need to disable i2c
> > > start_en and clear intr_stat to stop i2c controller before dma
> > > reset when transfer timeout.
> > >=20
> > > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> >=20
> > Is there a suitable Fixes tag for this?
> >=20
>=20
> Can you help to add the following tag, thanks
> Fixes: aafced673c06("i2c: mediatek: move dma reset before i2c reset")

Added this tag and applied to for-current, thanks!


--OJPvFYrtr07vTo0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwpisACgkQFA3kzBSg
Kbb03RAApmrkJIj//VaDqHQN7GyWM+5ruaKD22kJSm4fL8ozUu28fCSIk3ni1aK0
Pn2mXRSzGWzBWXFIaHEPISfaQSYYaeoGD5sgJJMcf/y6weyLlgn4SeIASsY+ijkY
rIfV1uqyzBUdUjAKXD9MfS/2VpNB5aj/5NXvqBv/wiKbjFRGZfIQ8JDv3oHViSmM
Fom+2RtQSbrZlO6eRafzIcfRUzDsFNL3umd4bG+35FQ+WVvRUzOKlKVRRECmj8aE
lpTNsaFTYfkr9L287bZxnOVb2bikxw6PnFQ842U3g9UZnM1IlVCUZws7V1tOVnFm
LpPvzevBtJ+sD248PRhpq6HT1ZtZC6fD6Ngi36aScsk1KbaGktomG+Av7VvN4fgA
/k2KiDJ2hH5g1XfeVvtxr6exyiDKVJDuDv4jgDobsDNlZdP1G+gum1mp4R5CjC5V
N8mr0dvc1YzZWHsSS/JAI6coKMqnO4E16NuVLHuTc10a+sfE4aXsYoKppsSZQHBA
ptvEQSc/WWCKG9lskmCuwdFd8DSywnk+1HPCZw4WfppDX40USMSSmKsZUCjG5Tz/
PFz6vy4qYZB0aYDAkuA2fhkZZD4VgwWBy08xbubSSGmePWGwvRsHdYRq0OyClA/R
6HfLbcT5Ch3IflK03jUJYNEyisJsIPVp4qB1BocG6jmoeXha9Qc=
=sw0e
-----END PGP SIGNATURE-----

--OJPvFYrtr07vTo0J--
