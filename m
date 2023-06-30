Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93EE7443C3
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 23:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjF3VHJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Jun 2023 17:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjF3VHJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jun 2023 17:07:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487BB3AAF;
        Fri, 30 Jun 2023 14:07:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9DA061808;
        Fri, 30 Jun 2023 21:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9576C433C8;
        Fri, 30 Jun 2023 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688159227;
        bh=hYpTEHMq6y6J6BenMyXuV1x1KGnn5tFTZrm73RQZ4aU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AzzeprbLoRBnHWrjJgRKbrUVVtaz33A2ZhsLuQyXKqDmyQOvljcBt3DAhrDflzwp0
         bJ6XivbLjc+Oa+fochTe2RWbZMh8PKRIo7wkZFbYVC92qiFcoydLXV0oRqY0qsf0ew
         krnGRlpTeLDYFh8Km+lfBZGqKGVXNTBrldkarnpOuZTFXuCa2TMACzq5cMsCzGiuJ+
         cx9UhgS3LZHH5XGzDBm3DkrcwpM0106BaZdjTK4dSm1kDvRBqMv03DMHRbb2zzbVcI
         JAvG3NWomezqtyWEWd3P9qU/XECzKAVDm9grLS9Z3HvKE2759v596WuvTaktksVK+z
         c3vJSzj2MV8Hw==
Date:   Fri, 30 Jun 2023 23:06:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linus.walleij@linaro.org, Andi Shyti <andi.shyti@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: busses: i2c-nomadik: Remove a useless call in the
 remove function
Message-ID: <ZJ9D6mP+gqQahEVq@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linus.walleij@linaro.org, Andi Shyti <andi.shyti@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <4f4c2c5c20b61c4bb28cb3e9ab4640534dd2adec.1629530169.git.christophe.jaillet@wanadoo.fr>
 <8ac04af8-eff8-bfe1-647a-2d04f5739702@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2SKYA9MrhLMabYkk"
Content-Disposition: inline
In-Reply-To: <8ac04af8-eff8-bfe1-647a-2d04f5739702@wanadoo.fr>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2SKYA9MrhLMabYkk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 10:10:40PM +0200, Christophe JAILLET wrote:
> Hi,
>=20
> "drivers/i2c/busses/i2c-nomadik.c" just got some loved, so I was wondering
> if the below patch could be reviewed.
>=20
> It does not apply anymore because of the recent change, but the explanati=
on
> in the commit message and the proposed change still make sense to me.
>=20
> If it looks valid, I could send a V2.
>=20
> So any feedback would be appreciated.

Sure, go ahead!


--2SKYA9MrhLMabYkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSfQ+cACgkQFA3kzBSg
KbZFWQ//fBMB4Z1V98HOgBgCUVd0VuuXt9kxzZvljp7zwhLujA/JQ/2q41iQZ5og
VBI7V7gjuMjAYLRPwgQAtW3JObcIQ9BEenHv2DGGQX/xEDsmGvhyWVwnW4Oyl8mb
RBz8OMdleU/p641cbrZJa0RNbbONIjsx+G1KI8nvm0cyah2Fc+ITJAyc4MDY++/7
EtOjYWnbZJRsWX9FC2fEWqvNFTmI1EV8d5Z5ODf3dMK+fTlgs0yohf0JHa00IUpb
Jc5REW6JcVvPLppS7jXyurDD3ZxdkM7RxWyZcM9hPrGvs4gtI+VC0sFfugPI3z6F
09t6+1kBZuLGszIMQo89WeWqWUldFmYprY8bmdTdisf2AwZmdu1cogsaZrjOpA3H
2FDNT7iRs/AGSidJnTgUkeAhpDHODyXVBgnv5cbA4zubWYnMKVRVVWhiO/88PUpM
vXhnmkF4l6lOmtT9Q+XAJahmeW8S//AkMtW5DCdjgu+ruHv5vdD0BzYYWdDLiDrW
NsM6Cv2BSW+V9a3rWViM3vg9dHsUt9Vx9pI6TmeLC73DZFdM1LgpGAX/VTLWZYke
ToE1ngerg8X8OgoXeS3kSOkGH/byHxlWTI0qIv4j+3JcctQQUorW8TI2+kQu0eZc
0ncdZ4MFI0X9Lsky6S0b7/Gr/up+noH3P58q716HOlEIYjKrnDk=
=P9oA
-----END PGP SIGNATURE-----

--2SKYA9MrhLMabYkk--
