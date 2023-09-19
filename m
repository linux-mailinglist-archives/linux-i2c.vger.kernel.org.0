Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEEF7A6691
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 16:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbjISOYx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 10:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbjISOYx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 10:24:53 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D4883
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=EubW
        S+Az+1c1mC6kOxBsnH4IjbNGO0/EEAfzWGkW3DY=; b=ORcPI9CP7exyOxu1b3XB
        +DSGTPc4FOZB03yZWtRdQ1t+lNfFHdWR80D/pQfQpzyR8eBgJVKU8QpO5cuyP7oB
        dNcaPOnuQVMzweATTNQt1n4TrSc2FIfm8/6QUnSH/rWcYviwNTcvmTBtjvOtpmwA
        RnwYW54IUqSinctbn6uJ3Uegv2mT3t5S9J1pXsUnixjaOWV01HiaxYM1onk+R1zZ
        /91Q6bsyq9wugtgQwx2x5psKcEK8te2+kQfqS185cuYB87K53gN6Kib94RfMNls7
        os+ea5/OK1a5he+PntXf3t3/lNYCEd8h0UZ9qdjeZxexvpUyhihdJw8uCdqK/HaT
        Jg==
Received: (qmail 241157 invoked from network); 19 Sep 2023 16:24:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2023 16:24:42 +0200
X-UD-Smtp-Session: l3s3148p1@v1UJBbcF1RQucrQg
Date:   Tue, 19 Sep 2023 16:24:41 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: rcar: introduce Gen4 devices
Message-ID: <ZQmvKT3ikaE4+rVh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
 <20230913203242.31505-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWZLk2YFKMSQ_ZZ+XaAgQL0ySsyMLumxbyoW7uys13MSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mR7cKpsG0TR4ceal"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZLk2YFKMSQ_ZZ+XaAgQL0ySsyMLumxbyoW7uys13MSA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mR7cKpsG0TR4ceal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       /* S4 has no FM+ bit */
> > +       { .compatible =3D "renesas,i2c-r8a779f0", .data =3D (void *)I2C=
_RCAR_GEN3 },
>=20
> I think the S4 exception belongs in the next patch, adding FM+ support.

Fine with me.


--mR7cKpsG0TR4ceal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJryUACgkQFA3kzBSg
Kbb2BRAAkfoL9t+KmqLpJafRbprdSDxr/Uhu7CRm+GKsL4cpxNnOpYfFnvm3aEga
tyuk0aGaBHg+w77S5WBpxzueWElHdct6Smsw3mn8AqdeemA6TNs+gs2T3f+thY1H
p34Dmqd9Js1QBaqMLM4ejHnfamnQSwt0Yr8KBa+fVM+dspZxd07VcHjIYQ1xNJHA
K4PpVmgyqp+YPBvemFZxUEr7nu+nKd31Z/AsBbSoGSNPw1WwxHIl1UJ684N/GTI7
9rowAzNqXFODnOWmRcDGPdDnnxUBV6/xpPznqNr3nVhi0BwPHFCMgErUTWvzIf60
LVdXPl3eP0Ia42lCexhkl4i9m6NLw1hKr/LbNFGrv8iYRtIbsGIL+/wlpVldlb8/
7OcDIPNlf+mqNgK+IkGjwGtn/qYFihKXtuq9aeAyClsaD2VQik8OYZ7Ar4SeG5g4
icaIY5HsWmzn6I7CJusI8jkSHS6DGcySy3BZLI99o6ZVZdIwMTU2WNisXBwbVmlS
KCvQRHTloj0EbYv2Cf2cMwaKZ+B9v1e4ODiufbDcGYtxfbGVOVSmXKjhx0eH5zVB
GmmLry7qoIOKfnpzRKrv5qV6bzkApb8515yQtaLOmhQ6tbTNwFxzNw+uvAUDqR4j
cRxv+5IzqP4xBeLXkpLP9IEyMukjLkmCca8ih5cwwmsmFWPD8MA=
=OQh6
-----END PGP SIGNATURE-----

--mR7cKpsG0TR4ceal--
