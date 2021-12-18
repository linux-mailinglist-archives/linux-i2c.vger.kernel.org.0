Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4BF479A30
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 11:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhLRKRE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Dec 2021 05:17:04 -0500
Received: from sauhun.de ([88.99.104.3]:35612 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229779AbhLRKRE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Dec 2021 05:17:04 -0500
Received: from localhost (i5E860F57.versanet.de [94.134.15.87])
        by pokefinder.org (Postfix) with ESMTPSA id 0C7152C0095;
        Sat, 18 Dec 2021 11:17:01 +0100 (CET)
Date:   Sat, 18 Dec 2021 11:17:00 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
Message-ID: <Yb21HBSm4VVjy1cr@kunai>
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
 <20210917101416.20760-7-kewei.xu@mediatek.com>
 <YVf+83LdUEPjoLdI@kunai>
 <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
 <YWQYbaTIhud2QHNP@kunai>
 <YaTMQQhENmJAIUk4@kunai>
 <dfd50de5149a38ad1bc5faf9bb26a8a04be7d314.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yMbAyQku0qgAJOHf"
Content-Disposition: inline
In-Reply-To: <dfd50de5149a38ad1bc5faf9bb26a8a04be7d314.camel@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yMbAyQku0qgAJOHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kewei!

> I'm very sorry that I didn't reply to your information in time due
> to my many personal affairs.

No worries, there is no pressure from my side. I hope you are all well
now!

> We found that when the ac-timing calculation formula is updated, the
> new algorithm can make i2c ac-timing meet the spec and function
> normally. So we plan to replace this patch with a patch that updates
> the calculation formula.

Cool! I'm glad this is possible.

Looking forward to the new patch,

   Wolfram


--yMbAyQku0qgAJOHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9tRgACgkQFA3kzBSg
KbYLVg/+MYdXhcFoux7eY+v6Q/G7l/f9aprzW9913QcUcuTxfnR4LOB/Kc+ztvU2
p3oZDNTa3yR90gF9TvSLrEVa3bBOGk5lYFWmmh1BCIkeveRBn9hQStPvQkJAVesS
2xCF4rIsP6DaVoSnpoWSwSZl6DfmeJpXxpArf6XT1hu8FiSVbxD2ZqAezsjxeMNE
0kjFQvIgKuKxdsZylV6HDCw0qscL2usHm7pG4Nz8+yoB4Z75uUqkcXoEz/cliOG6
+RkWM0VnP3tX8UQhOlZTqnQZmLd5dep/gurBYnDood2p0/4urtlh8xAOczWbOXBl
wt2cDF/X/vWmRR/kp7CN9avJS3RTShotNkhbdwiSbQ4s8FvS55v9vQZ3TVwhH1GY
JGWwcAAqs3uLtxyuN5cea+RklEVVjAwcOftjWVSrdBVeUUSh3M+uAz6x8LyOyK9l
++WJPYa/xuIYvCg+WdLCnuYD9F78bbkej7MKMGn0PDo2L4cJ8LihHX1ewvROXsuv
oVUUc70IZ06el5nXWEVUd588JxKZjTe7EkO5n0d6EQhv8X6AwUZC4M6y5CaM6BHm
68cwkGHirGfU79Gm6mZ5ck3d7SSLrj+pSmiGfVVB+dvanV206PH03NjCppNR+z1m
85QVqu8ErV0T0OzaTZcg5ISHFyWIiuo3tN9DZOnQBsiWAbPoqcs=
=HuU7
-----END PGP SIGNATURE-----

--yMbAyQku0qgAJOHf--
