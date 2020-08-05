Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A88923C850
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgHEI4i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:56:38 -0400
Received: from sauhun.de ([88.99.104.3]:49022 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgHEI4h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 04:56:37 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id C67C62C0829;
        Wed,  5 Aug 2020 10:56:34 +0200 (CEST)
Date:   Wed, 5 Aug 2020 10:56:34 +0200
From:   <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        <qiangming.xia@mediatek.com>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] i2c: mediatek: Add access to more than 8GB dram
 in i2c driver
Message-ID: <20200805085634.GF1229@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <qiangming.xia@mediatek.com>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
 <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
 <25ff4899-5e7d-f6e5-599c-4bf368a731e1@gmail.com>
 <1596010499.4371.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline
In-Reply-To: <1596010499.4371.3.camel@mhfsdcap03>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > -static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
> > > -{
> > > -	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;
> >=20
> > I think you missed my comment in the last version:
> > I2C_DMA_4G_MODE is no longer needed, you can delete it.
> >=20
> > Regards,
> > Matthias
> >=20
>=20
> Sorry for missing that comment, I will remove it.
> Thank you for your comments and reminders.

If you send it real soon, I can still include it for 5.9.

(and please guys, shorten mails to the relevant parts)


--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qdEIACgkQFA3kzBSg
Kba7Cg/+JUqvW+SS4lYtyhkAsyAQbKl2kRygi8PEJ7f9Ag9VkjtcvgcxHaycRiOO
VXEr7OeKRzQpj0RSYLJXuEDfakHyorDNRDZGPBdLMrMsFh+xhuONqsv7chAQ8mhB
ZqAJpEgVbUTlJKL3Jee2uAI69e5l2Gn3lz40zBKVeCwVM6HaNNzgxdJ+saDA/PjM
p9ITszYHi4/DkA2KqeKFAW/NkQ/u1hPPqmPVmTgvj1Ez03w73rKEEUIyIF6URwOU
jVazs7geKM/IaxxH+Zz8qwRy2t2AmqxAHKwM4WN+XT/nbSPAH6Zg98xLkTS3wi7k
T3shPDV/R6al8+aths8ph0rf3ejNRoXTKx3FZzzfK9o5G/jmZqc4jz7PLgLxaTd0
+dcM46y/L30W0JfPJOKFswvycaOn8Z5/p/UAPzO8OF5hpG8r+6Ti3Qrp/lUULvP2
cs6g5Loma47PFGrSM4VZqldJq3YUHLZOLF4Jh6H4b8ydigBXHrTdLGNlMm3dco8y
3f/kg4ax5CwOrYy/bx+m8s9ZCdaEmGWcm/IIvrpMK2kKzBBOt8/Kkd3sG7kcGnwN
zXHfJvpW/ognlMwSbfqO8SopyqtOHpmOnJDioNfgyzL7fO/OMjtKnnuw2kGz+5HL
nRFdfSmAyrR3us3/xAH0VuKnGlSuEm/B8x7oxrhh6byZYsBQRFE=
=xphH
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
