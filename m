Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D96E428AE9
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 12:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235956AbhJKKnG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 06:43:06 -0400
Received: from sauhun.de ([88.99.104.3]:53416 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235868AbhJKKnE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 06:43:04 -0400
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
        by pokefinder.org (Postfix) with ESMTPSA id 47DA82C00A6;
        Mon, 11 Oct 2021 12:41:01 +0200 (CEST)
Date:   Mon, 11 Oct 2021 12:41:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v8 2/5] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
Message-ID: <YWQUvV2papMMoMlM@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
        yuhan.wei@mediatek.com
References: <20211010070516.26763-1-kewei.xu@mediatek.com>
 <20211010070516.26763-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JtSQ7rtXR1c2yVew"
Content-Disposition: inline
In-Reply-To: <20211010070516.26763-3-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JtSQ7rtXR1c2yVew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2021 at 03:05:13PM +0800, Kewei Xu wrote:
> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--JtSQ7rtXR1c2yVew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkFLwACgkQFA3kzBSg
KbaUeQ//VSuKXbSjtpnmqhB/rNYBemDzI/uIR1UVNHnMegYbHmnxIsjnYKTDcJpA
xYsVjufqGagxzSPSED6xQ6tcIVl/I6NJ/D5XOZyVSYHOaXF6Y0OgfxlFXcrokLL+
UWblDSIAcoxOqnIcKv5CFUvpfocIO8pQeHNFD+v+bn1is/dNxzCmuKOF70tsT0Qu
hMNRUV1C/sVULBd9Kl5JBdBQxRSeTEnhYpx3X1WBOe6xlptSh26j2VlaUEl0E2C2
L6erBq6K9MQoYDX7Zolyt0759HxNJjRH4bJxZQ2xMTDO29u3c6/a2DjPGKQ/p31c
P+viAE53Csz6ooV6krMfR+hYSa6uEvG1SZ4l+6buUHTJ8tSSPpU7srNISofHgSzO
a+VPrnNOI8RuxP/XKWNO13pPsc9+pULXXUOOi4Ozt+0y0Swql+Cdkvx+HNZ8TXIF
eIaYJLMTuebxNjWMcJuX6wvT8L2UwLhpAo3XY93a+FJgUCdfPzCFd9uxHfWYX1Ad
B8oLzJQw/XsVHOF/97fm64ODVBy8ndQyIy6yPSBBdsZ1a9Sn5SgDjehHunJP5b4B
jDCdB0EBeA7R0bp58UCROkxcE17JMTfe+kVM6KPMw/RD2Sv/VG6wTawUl8+cax44
LlUQssHqGedkJsg4DHMFpF7L/U+knIq6iqtmzd9/fscD50y5zEY=
=pHeR
-----END PGP SIGNATURE-----

--JtSQ7rtXR1c2yVew--
