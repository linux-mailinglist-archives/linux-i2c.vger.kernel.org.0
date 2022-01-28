Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4294A0323
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351605AbiA1Vqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:46:52 -0500
Received: from sauhun.de ([88.99.104.3]:33238 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351620AbiA1Vqv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 16:46:51 -0500
Received: from localhost (dslb-188-106-017-011.188.106.pools.vodafone-ip.de [188.106.17.11])
        by pokefinder.org (Postfix) with ESMTPSA id D2CC42C019A;
        Fri, 28 Jan 2022 22:46:49 +0100 (CET)
Date:   Fri, 28 Jan 2022 22:46:49 +0100
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
Subject: Re: [v2 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8186
Message-ID: <YfRkSWXZjMipeY9t@shikoro>
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
 <20220125110413.18988-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iDYL83PzqLRC0DKr"
Content-Disposition: inline
In-Reply-To: <20220125110413.18988-3-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iDYL83PzqLRC0DKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 07:04:13PM +0800, Kewei Xu wrote:
> Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
> MT8186 doesn't need handshake signal witch apdma.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks!


--iDYL83PzqLRC0DKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0ZEkACgkQFA3kzBSg
KbZ6jA//Wu7tH7rEW6TSr2vfsy1JdHoT27T3MVU0rEMAxMywWekdsb1CihQb4MLn
VuoX1vaPNiGibnJJJj3WPn/ooY7qabnpBQ6vjyJVjy2wOUMezyHYhIl6Cn7IYAL+
yzUBekC+drFxIbEumek5WFH8gV5HXM9nhmm1FUXQN5r//Eu/uva6NPm/FB62jh74
VxQ8SsNrp/SWYtUarBO8bsthzEdBHhtRLygZ+nJVyahAhZ4Ozm69sEKn9lxRgAVl
E8WWAj8qh5QY1kY0dBU54dNJGiuZH45IlC6DxMJyoWE287xpSbXQeDhbdvmXCxSt
1B9WtFi4/7l8fEzrnYbSGj+QA3H8qX5ajpTXNlu5IKJJnJckDEEUH8DchyvXVQMJ
IpxfhPfm/KZEq/hw/mEm3JyqFwxng10t5394Y2zihbNNo/Iq2WaOp9RjF+Wt9VNT
EsIxoK/duKC/nIfmxKDK0WiFql/W35uZuWAeCVsTe3Nh2HnpzLiGbLeKFnI0mItK
+k5v8nE8+vkpsBY1z5fG0cyKzceeey34unoQ71cSw/sQdyneaZSAw+01ilgRvqjY
Tg/vv6iUdhE0yMA+xG2rRIwvHe0XWpj1/HBIHBJ5ytwBXNshsyJnpfsRjD/GpcgP
H+oFRoOX04AgRuJ5eCh/dI9hK/+dwGbYBUXamX+1Zutn9wXqqNc=
=7JnB
-----END PGP SIGNATURE-----

--iDYL83PzqLRC0DKr--
