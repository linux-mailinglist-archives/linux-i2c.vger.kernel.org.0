Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593264D6989
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiCKUi3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiCKUi2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:38:28 -0500
Received: from pokefinder.org (sauhun.de [88.99.104.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 224311D2B61;
        Fri, 11 Mar 2022 12:37:23 -0800 (PST)
Received: from localhost (i5E861B4A.versanet.de [94.134.27.74])
        by pokefinder.org (Postfix) with ESMTPSA id B77CD2C007C;
        Fri, 11 Mar 2022 21:37:21 +0100 (CET)
Date:   Fri, 11 Mar 2022 21:37:20 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: update bindings for MT8168 SoC
Message-ID: <YiuzAJW6wp5FM1kU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
        yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZOhpGpznujtjvgC1"
Content-Disposition: inline
In-Reply-To: <20220307033649.11564-2-kewei.xu@mediatek.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZOhpGpznujtjvgC1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 11:36:48AM +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8168 soc.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks!


--ZOhpGpznujtjvgC1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrswAACgkQFA3kzBSg
KbZ30Q//dOWbpz8BmJ0OA6br6Fvjoj/q5NY3fYUt7B6BPGqkP9zOPKtZTOkP5s1p
aK1ityZxejamdR+6DPTXzpJIf1xQG+aM/l50R5MUwedvvwaTikFiG2Up8nkkn8fH
ni9dRoqj95SGVlz0BFWvRZJMbzioGkf3A3HsGZ7gvGCfsBDyj9g6wyIyTkZ/mq8V
FYhrD5euM+VYXJ36tss4nVDJbzfoDHdvqY1Q6hBLB7dC0iLmFkTmdvWgDhyceBtC
Ijq64aCujO4ZXE66VuZy0pPJV9slTmoPNpRgwDr+jasc4qeBH84ROOpvJEu44Q/j
rMArOOEt3E8WJfBPHZS7Yrgcziz682A/YJybquJJCFd00J/apP9TS/8ngWo/xkSr
271G3QoUmtMY7NBR0B3M8BX0mf+pC2yTB2fc7GGqy3uePMXb9AAEoIfBqSz27FKQ
l7K9gAMpXqhnC9i4FtZ7RznodwWDFWe/Be5K6+Psh6LKSZcGuEtjsRFcbyeJL2ZC
omllvzpGpO8WiordArphPXCW1Le64jQLwuWoKHmexsPKv7XvNsSEqBVG9vFmFQkI
diK5CQzBoMOy23pVfLuLjkotMZuAZUrz+nWyRZTk56T/sW+c38mWvEcfLscb89lZ
XzQQcG47eQVIsoLMNTmHjA7py9vs4hgnmDnOdAK2cbG0A9V7eK4=
=lRaC
-----END PGP SIGNATURE-----

--ZOhpGpznujtjvgC1--
