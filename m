Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4743E58FC5E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbiHKMeZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiHKMeT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:34:19 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D00566B640;
        Thu, 11 Aug 2022 05:34:18 -0700 (PDT)
Received: from localhost (dynamic-046-114-180-205.46.114.pool.telefonica.de [46.114.180.205])
        by pokefinder.org (Postfix) with ESMTPSA id 896FEA42807;
        Thu, 11 Aug 2022 14:34:16 +0200 (CEST)
Date:   Thu, 11 Aug 2022 14:34:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     kewei.xu@mediatek.com
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        ryan-jh.yu@mediatek.com, david-yh.chiu@mediatek.com
Subject: Re: [PATCH v5 2/2] i2c: mediatek: add i2c compatible for MT8188
Message-ID: <YvT3R81eivQy5hec@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, kewei.xu@mediatek.com,
        matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        ryan-jh.yu@mediatek.com, david-yh.chiu@mediatek.com
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
 <20220806100249.12375-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vZzt3QRaHY7bPIUb"
Content-Disposition: inline
In-Reply-To: <20220806100249.12375-2-kewei.xu@mediatek.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vZzt3QRaHY7bPIUb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 06, 2022 at 06:02:49PM +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
>=20
> Add i2c compatible for MT8188 and added mt_i2c_regs_v3[], since
> MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied to for-current, thanks!


--vZzt3QRaHY7bPIUb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL090cACgkQFA3kzBSg
Kbbmwg//RlfI5YLoh9bZ0auBIbMQVv8PJ3mY0Zy6fEhhUr7L8JXGUkYuIqlj+Ce9
bgrO5gfIbKCptseQBJTzfeKAHeAfP403xc5fs0p6MxBTsxIlmnJiOYdJa1/w2gW6
ef8dlsWVz0vy4IzApsCqKMQmzRnpS3JWe6t6yPlGvLCNP/7Jg28AsL5BJ7xcWBII
mOd4ltxQKNzNKr+JOQP72bOhTJ8QvpDkQWXYIHzo7JDX7xcEArKI8rdLeQtzaMK0
Tgbu9Vh8A456ieBhJOTppR6MnhPfAJHTPAnaT/DRc0uiXmlFBZSYHxMNjxGxIm7w
VhATBi5TXC/YOHuoGrCPs2unNza7mhaS7lLyb7hloWyiqKe4LQ3Q03ACtZly4TeI
hu3n/K+U/W18yFJmCS/pioHl0HUNk3b8BiRQZsZbR7tKvP1RKLJrP9eAEv/poygp
JPe6oD4Zb2Z7rY2WpakHtBsEZDJPye4GtfC9DpQV9Zxo8f4ca//cCZj6gJvhG6CZ
2MmbIpD+ZMhkLtcxy+/yKrMraAtZJ47G4AHM78/JqvzsLf0iD5qTktGomBTsX6y+
thefaLUDG40BbRQerko6p41PG4+JbJGTzmQ3QhIkoBhs1vF+RtwrgajyvwZdSRzB
5/bSw8OpHEqorF/u2lSnuVP23IRILQFNx/2oYqMGaaj+SYXOFek=
=r+cJ
-----END PGP SIGNATURE-----

--vZzt3QRaHY7bPIUb--
