Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F21428AE6
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 12:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235863AbhJKKm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 06:42:57 -0400
Received: from sauhun.de ([88.99.104.3]:53402 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235868AbhJKKm4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 06:42:56 -0400
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
        by pokefinder.org (Postfix) with ESMTPSA id A69DB2C00A6;
        Mon, 11 Oct 2021 12:40:53 +0200 (CEST)
Date:   Mon, 11 Oct 2021 12:40:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v8 1/5] i2c: mediatek: Reset the handshake signal between
 i2c and dma
Message-ID: <YWQUtUALm+p32bui@kunai>
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
 <20211010070516.26763-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6TggNdb/jhd7lklB"
Content-Disposition: inline
In-Reply-To: <20211010070516.26763-2-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6TggNdb/jhd7lklB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2021 at 03:05:12PM +0800, Kewei Xu wrote:
> Due to changes in the hardware design of the handshaking signal
> between i2c and dma, it is necessary to reset the handshaking
> signal before each transfer to ensure that the multi-msgs can
> be transferred correctly.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--6TggNdb/jhd7lklB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkFLUACgkQFA3kzBSg
KbZ0nQ//fejqkK4MR8ztJDpUH+a24oeWRNYjKA1JUibK8o7Vc6HBcI9j2Jxpsnoc
k+YN4CvmIqcONm/SXoTBrNCcXoHN0Tj+uPrh2ATTSltyghL4qn/eAkaU4imbBTxA
NdG5GsCJS8aTpE2iPls8VQd6AY5Bk4DJFXax/XqIY3GcBWz4Bv6FEt0AZnj6h4DL
m1eF+T+YI1Hme2dWljv1hMRR+AIC7OUp3CZFkBDjrZD2Xqp3akDv05LkSONlbSrt
FqXW8UoudEZ67ERKwHKyfngARylCTTiJkpJiDxQw1EiKFQ2yzGPiJ8rhMgHa3fKy
D5YSBcotOroR31RcFAzVG6icOECh8D834YA4sms0hE3ew5p/akMAdBI3nCM6Oq34
F0/NU+MDliYoGJM1noSyfVM3ppIzO6CFyAW7xtVMvANruqIkBgeNMDzmALf1y+pq
s8T/f7mr/Hth6PEDEosPV74+CDVm4X0Sh+5DZ6W1fNDHMhVIWYmBArflGp9s27gX
4WTsyCW0YPmdzCvYIrhYEk3hkGCjfrJiayy+2ukbRm07r88J6+hO0lA/mGs+GQLo
Y4lpxLr66NgnVg7n4r0r6sYz7azDU43k8Du/eWeZeS7rtNpTAv79yqe73dkkRT2l
2qvr7xq5QbT6PiM9mneMbQ9zShkzC3MBP8cUEZmKsgI0D6gm3Rs=
=VPLH
-----END PGP SIGNATURE-----

--6TggNdb/jhd7lklB--
