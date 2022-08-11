Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8287E58FC5C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbiHKMeQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiHKMeO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:34:14 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29562120BF;
        Thu, 11 Aug 2022 05:34:11 -0700 (PDT)
Received: from localhost (dynamic-046-114-180-205.46.114.pool.telefonica.de [46.114.180.205])
        by pokefinder.org (Postfix) with ESMTPSA id A2272A42806;
        Thu, 11 Aug 2022 14:34:09 +0200 (CEST)
Date:   Thu, 11 Aug 2022 14:34:08 +0200
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
Subject: Re: [PATCH v5 1/2] dt-bindngs: i2c: update bindings for mt8188 soc
Message-ID: <YvT3QLUy8uAhXL9H@shikoro>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oJ0A9glfvOseagF4"
Content-Disposition: inline
In-Reply-To: <20220806100249.12375-1-kewei.xu@mediatek.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oJ0A9glfvOseagF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 06, 2022 at 06:02:48PM +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
>=20
> Add a DT binding documentation for the mt8188 soc.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to for-current, thanks!


--oJ0A9glfvOseagF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL09zsACgkQFA3kzBSg
KbYntQ//eg9wrHGBn57xXarTYXfwt20eCl5kw8+z+tbQgnnzmjLf6PQgtJO/Vr+9
z1rXnMu+SUy7rFPhYt5IG5Ph6a+yI3cin2Pmv14xSxC2lWaTJQol3SK1YGxKgzqd
vAsiBoxGupNteESyHKsk0NLYuzuzC2XrMFnfrFFAnnSPEpZRnRfzYrkHOf8oJbbI
Z5Zw+ge3FR9z1Qnv+Q2lhWnCechxttWzoCgSNyBOBJmTh/gevjLz/3XFIxcaaXAZ
UAYSE0vC9uu5zHSle1DMpu+ORNmaUv+cFvmn9gFHhe0Un8SM6EB3vxTQ0mynT9wm
uJy99KBBWHSGBle7pQSFV5WMSX7pNjf5YizEHm/9glpTy8fop1LZxgBXYz33IOgE
4518LARC7XnN+qD1rCjR71h05YLlEFa6VW3Y3Ej24qw5zo7U4U2aWKhutswYJpZ7
857LkJCsz49OZCe3n3qvhpyelajT13jgHPACYaV/9BiiwUFShotOnzbYuEqL40e9
+OEdftfIYX6CJ0Fi+ry3Fm9+smN9Y8txx7dmdsjnYiws+MIkHwR2PTiG/gFt8GYc
OJPnAK53fGHOlgDF4Zdt4NFijhihnOKSt4LstygrHUsHBwJyYUQF9RhCikGdgwVc
JusHQKkZZt1Gohi3sCYaCo+6a108mlQwMgOAslJxK7Et//JM1V8=
=+seE
-----END PGP SIGNATURE-----

--oJ0A9glfvOseagF4--
