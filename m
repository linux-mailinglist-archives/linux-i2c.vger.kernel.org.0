Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14C341FA12
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 08:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbhJBGaI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 02:30:08 -0400
Received: from sauhun.de ([88.99.104.3]:34908 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232082AbhJBGaH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 02:30:07 -0400
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
        by pokefinder.org (Postfix) with ESMTPSA id EFF282C01D8;
        Sat,  2 Oct 2021 08:28:19 +0200 (CEST)
Date:   Sat, 2 Oct 2021 08:28:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v7 1/7] i2c: mediatek: fixing the incorrect register
 offset
Message-ID: <YVf8AH4rnV5jaweB@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
        yuhan.wei@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fNKO1T4RlkFDC+j"
Content-Disposition: inline
In-Reply-To: <20210917101416.20760-2-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2fNKO1T4RlkFDC+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 06:14:10PM +0800, Kewei Xu wrote:
> The reason for the modification here is that the previous
> offset information is incorrect, OFFSET_DEBUGSTAT =3D 0xE4 is
> the correct value.
>=20
> Fixes: 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--2fNKO1T4RlkFDC+j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX+/wACgkQFA3kzBSg
KbY7/BAAqT8oWhkKTTEZIwjngOiYXNrMHlU599Dodhf11fePoYwE0YIEyMPDvds+
d11jk5pP5CQY9/UrB/Z8ySwQi5kvmUXXmB0n9APhBEwd95ViWY2YDUSk6k6BEoh2
HeN5pLqfVfXBt+yViatvUPfa9o5sB8SFqGVrKmI4HueEzNvYrdbJO3Ga9snoRPBE
Hd4L3ZflHcF78pvYnx8D4MfNcaRksUYf8oapDyk52lmm8bLRi+1NXIKjGLZnOOXJ
CMkJy80ZbdHgOFu0ZsEDa7MEXfK/kWvkTLld90Kkskf3ope1uKSPL3MS4Ycb3mTA
zvM+aNXza6UU5IzQJK60ThBFkcdpGt42u5hQ7Jtoi6388SGFEoKS/9EHmtCkmyJI
2B/K7LTjza4FsxxabiTJwcq7YSu/O+yMTVkTNCR2aiISYtSSnetuH7Y174qmVN0J
SNFKNT8PL+zBRmtL+Y+Nyb1KbzvjI4aEth8kn85e3N9UymP8dQ9RwhLNhjyzGqTQ
asTTIJ6H4vSh47y63EBtDtfugLXa88YhJR/9jUNY2rjq/RVWXmrsVezzqfndXpNi
s3wAqkfzWSk/UdtqczoTNU4R7YsOb2FcGDpkVPP6oehBBvw+TuK2BH6TKWyDicCZ
yOMacsLapc10ikwATJRPr4GA0i+7l40FIB/wN/TQ7tP+KYxbRw4=
=9lUR
-----END PGP SIGNATURE-----

--2fNKO1T4RlkFDC+j--
