Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EA14A031C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbiA1VqG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:46:06 -0500
Received: from sauhun.de ([88.99.104.3]:33192 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232469AbiA1VqF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 16:46:05 -0500
Received: from localhost (dslb-188-106-017-011.188.106.pools.vodafone-ip.de [188.106.17.11])
        by pokefinder.org (Postfix) with ESMTPSA id 9106F2C00F2;
        Fri, 28 Jan 2022 22:46:03 +0100 (CET)
Date:   Fri, 28 Jan 2022 22:46:03 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        ryan-jh.yu@mediatek.com
Subject: Re: [v2 0/2] add i2c support for mt8186
Message-ID: <YfRkG7KdAMD7FiuY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
        yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sHAE60AwDaFT+Vqy"
Content-Disposition: inline
In-Reply-To: <20220125110413.18988-1-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sHAE60AwDaFT+Vqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2022 at 07:04:11PM +0800, Kewei Xu wrote:
> V1:
> Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
> MT8186 doesn't need handshake signal with apdma.

A description of what has changed in v2 would have been helpful. Please
add it next time.


--sHAE60AwDaFT+Vqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0ZBsACgkQFA3kzBSg
Kbbf4g/7BQVdLzkvxnFsEfe5rqHggfv5NbODVx9dkMCR7vfI5dH+1Y70TaLqY8vN
dAT78k9YEjqCkrjSyINiBE1b6uSb8a2dG/TATE9eEh4hrYr+wvNpQvXkksMsvkc/
zXtJjBiTz2+WJKunQrsLy9gZ1mQCWRZRgm9HV5VgFB/LZUPzFzCVc+T8Dxc5Z4vB
D00whWHSvwf+jMDeVn1fT2g58/AqvctlHx4yIfWwSeXfqLjRzVs/RKTvlgcChbqs
1cz/vobVqop/n7znN1pneVZ3EPOcfVHsgU8jCCSiayipfcZ06lkuHU0O83oMSB+c
t4/6yCoicHkxiq68WFOHm2OjvXWi1NIxmgFNBKViM8NfOHnvIxRNis0p1YthE81V
RWIwcH3FbGSD4DapnqZ3Qbyfhsmg3TzezSAdsRHglN6rOcLdHKBe+fsjwh84rYA+
19nIPRxIbaahod8uqCUkyy5o/NXXUl2v5BsQb0QzMmiHAi+PkjW/Tv5fUVpVGgVK
h7fdYd0pCxLIo9eO6Al1aOGetWnYhM+X6fZr1VgYxx0KnOmcSyfTuZml5HNmrRiV
u7LgP4kO8FXJdDWlmBpXLJkzFaEZiEqiMun84ndf5WYaK6TjcK7hQDCvJfI0dIcI
NXbi7iFb7pR+KTsI/eSmxR5buFVX22EthbAUiOfaSBRctl0atQo=
=Fbzb
-----END PGP SIGNATURE-----

--sHAE60AwDaFT+Vqy--
