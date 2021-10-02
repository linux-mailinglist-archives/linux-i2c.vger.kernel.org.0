Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0045241FA20
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 08:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhJBGlw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 02:41:52 -0400
Received: from sauhun.de ([88.99.104.3]:35054 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232400AbhJBGlv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 02:41:51 -0400
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
        by pokefinder.org (Postfix) with ESMTPSA id 25C7A2C01D8;
        Sat,  2 Oct 2021 08:40:05 +0200 (CEST)
Date:   Sat, 2 Oct 2021 08:40:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 5/7] i2c: mediatek: Add OFFSET_EXT_CONF setting back
Message-ID: <YVf+xNG8yXRJNmA0@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
        yuhan.wei@mediatek.com
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-6-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bdPPXQ8lIS5bCvDz"
Content-Disposition: inline
In-Reply-To: <20210917101416.20760-6-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bdPPXQ8lIS5bCvDz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 06:14:14PM +0800, Kewei Xu wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), we miss setting OFFSET_EXT_CONF register if
> i2c->dev_comp->timing_adjust is false, now add it back.
>=20
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--bdPPXQ8lIS5bCvDz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/sQACgkQFA3kzBSg
KbbapRAAlO5F/fxxo9sQZIVaAXMTDPcHsKC2xquAN7db153EjC/0gPCSu0ZHIRr0
wPZ3vEYifZ5ZM3rvDpqTlkCMKFJ1EAsF9Iz4V26teKhROMTLHMBXIExKsn77uK91
gRGudtWd3K6fZsXCQRmTRUWcW1L6eIgcVoKsi4XqAp7iuwoOa8RhQWo5Q1hR5fds
6rAyHQmE3i4v3Cv21ObmeZMhjaRIsSt6IfhrmCQijUcIGQXwdsTA37CcIAX/eldf
lM9w0tUFxhXrGZLefbGXTX6QHA1bCpVZpwBWTx76as2A81inuyq68JG64URpNEIj
U2klXv1DWa/KMOwbR4URVK+pEpLpGCrHgR2JjX1SQDeqHck5SkHbQCUl64ZKPoVT
06Q2DT9wohf9sdqV8lhtG0w9qjGOm0+BLptE4O7MMxxi8GGWrl67SReALY9IHwX5
1fjRTJqKWP+XiYtvPIWDElMLrhatcgTnRliKCIQLwqQrQaW+J92v9GCRe1kGa2Zc
vECvAtf3HGsmOiH7ioX2gdTfKybpl0FqBjJ3wut0PPaZFcefn/3hf4BPGLX7s7op
PeajqF9UVcJZWRsyMyuqKNLC5KbbgIoUzq3QBOZ0B5X8RMlKHJiX8O/B13Dy9JsI
1FQPCX11MVtxL3YG1npu+jklofnJ9QJ4GkwCgRTSqr2FVVfunfw=
=/rCL
-----END PGP SIGNATURE-----

--bdPPXQ8lIS5bCvDz--
