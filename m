Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7734B23D3AA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 23:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgHEVmv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 17:42:51 -0400
Received: from sauhun.de ([88.99.104.3]:47296 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgHEVmv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 17:42:51 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id BF3252C0829;
        Wed,  5 Aug 2020 23:42:47 +0200 (CEST)
Date:   Wed, 5 Aug 2020 23:42:42 +0200
From:   <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v3 0/4] add i2c support for mt8192
Message-ID: <20200805214242.GA2182@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
References: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 06:52:18PM +0800, Qii Wang wrote:
> This series are based on 5.8-rc1 and we provide four i2c patches
> to support mt8192 SoC.
>=20
> Main changes compared to v2:
> --delete unused I2C_DMA_4G_MODE
>=20
> Main changes compared to v1:
> --modify the commit with access more than 8GB dram
> --add Reviewed-by and Acked-by from Yingjoe, Matthias and Rob
>=20
> Qii Wang (4):
>   i2c: mediatek: Add apdma sync in i2c driver
>   i2c: mediatek: Add access to more than 8GB dram in i2c driver
>   dt-bindings: i2c: update bindings for MT8192 SoC
>   i2c: mediatek: Add i2c compatible for MediaTek MT8192
>=20
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  1 +

Applied to for-next, thanks!

Sidenote: I get these warnings when compiling the driver:

drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_low_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_high_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_su_sta_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'max_hd_dat_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_su_dat_ns' not described in 'i2c_spec_values'

Is someone interested to fix these?


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8rJ84ACgkQFA3kzBSg
KbaEHA/+KvbFEMpITq+MxiNEPFj85gdA4wGXCkfrVZ0ucfvHnQU7S+zzRFIOIRui
TJYm+r6YkaNts1hpKSV2h6mP2W9KjtwfywdFXdQiGYR+n5UD60xt86xISYDAsjja
rOjncjqqIqL2mDgWSUc7lZ8GV/XxJBRgRn6uPcsGuejwHWtJEWn9r0sd4YqveK8B
jwvxACdtCONziOz/YOETM7mcCB3aKvFA9gmF+Kq5UI2k6U4HzZmHRnEIC+nwmlex
kQoLGct58EzbksSOwqyf0wQLDAKdvbRR+0OHfnXB1c+hf7SSRScdtU1UD5KqZrFo
sZea8kaMC9BGAUhimBp3SBkSdWm+w1vlK5L/iLdUaKH4GMZbvMcjn4INEOlvcPvt
ylpjhlmsHebQ1sbMnrS4PtRbswT7bRIQh0af+Ei8W3YMwG/K0BoMs7VDbAzGDe5k
VWZXSAG+F+3Zi58x7gCiYShLm0tdxdIm9oUuRc0ottyXFHXoZQTLESxpQkMgcShE
n1+HbCzOzvUTgHuzOOxpxcKx6FM+Og+b6vGQIt9nyUQJZ/HaMAmFXBsGemvuXmhh
k7rTAxmflWpS/iG7i70rZhiek0vEYpMHzF2o4tFHVO0/c2zslDX+eK7ks8/HEZPv
LbTGwQerJ/ZPksOcAaYjB/kQjB7NPJUQ6VbHUxAluYC/mTRD0aM=
=1eF5
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
