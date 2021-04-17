Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190A336322A
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 22:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236987AbhDQUHl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 16:07:41 -0400
Received: from sauhun.de ([88.99.104.3]:38796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbhDQUHg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Apr 2021 16:07:36 -0400
Received: from localhost (p5486c83a.dip0.t-ipconnect.de [84.134.200.58])
        by pokefinder.org (Postfix) with ESMTPSA id 32CA02C0ABE;
        Sat, 17 Apr 2021 22:07:08 +0200 (CEST)
Date:   Sat, 17 Apr 2021 22:07:06 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [PATCH 2/3] i2c: mediatek: Fix wrong dma sync flag
Message-ID: <20210417200706.GC9996@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
 <1618642012-10444-3-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline
In-Reply-To: <1618642012-10444-3-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 02:46:51PM +0800, Qii Wang wrote:
> The right flag is apdma_sync when apdma remove hand-shake signel.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Added:

Fixes: 05f6f7271a38 ("i2c: mediatek: Fix apdma and i2c hand-shake timeout")

and applied to for-next, thanks!


--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7P+oACgkQFA3kzBSg
KbZqjg//cH+CGtuV2QWgvjioNhD3zT66r+Dzln08mKxYwpj/4klFp/hMNOSBAZDR
3C40kFyRzfHDxTVtAaVXRye0NhBBxdLi2pbLCpdj+P2G+i9Xd3Buw3zb3Ln29goF
B67rM4+geHeQ4rx8tBFiV/i8YpT5Ps+GbUTX5tjcjLKJShviTUrdf1q+xWxxTtQT
Zn9ZnYctLaqC+UdKfPnZ2vZodDRz+8RGORnyHZVR8TqB2bgbR/tgjkYeehKnqTYH
FzFguRPreMqJZZG5nLy+meQQbGRPN3JPc70cEdHuF/PLIw0s3WuGSTtuuAWFO21C
abx0Dt3Ehy6Q8zKGdO7dm5ulH9APgV6X5Uuy2RMuBnh6GggaD/b9/ZCm25I/b9eh
pT0yS/sWi5Vv1FdR+EQDmRbUc6PjNXnnUlczcdLU9XaApkBmYD9YJDmIQqbwRKW9
vmrxxrqTPXYNkbEagE79yUkXHGK9vww+VGt+zrsRWObEDvxoQWYVoDbdm1LtYUFn
JsRAU83gr6WB5m3yNSjEfCQNCMHQADbFvVtDwnoSxV522dlrIIU5qi11brC5lws5
484tpaNiL0LBYnFPMfw2mp4A59h9ZzGf4bDO5wRdy/qZz7u7g1zarS4XyZHczbI4
x7JuHSjw882zizBuvSM8oAExNnRul7W/qhsjbxuy5abVQ4AoPB4=
=Mcoq
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
