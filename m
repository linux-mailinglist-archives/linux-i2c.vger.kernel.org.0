Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1DE6050BF
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 21:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbiJSTve (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 15:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbiJSTvd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 15:51:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECCE1929BF;
        Wed, 19 Oct 2022 12:51:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91F4AB81E85;
        Wed, 19 Oct 2022 19:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37B8C433D6;
        Wed, 19 Oct 2022 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666209090;
        bh=nEONL3f1YNaNp6j8F8aQyxhIZfpq41ZM1w95IPM11fA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uSUMFdX6//ICy4zLfVlIEtb3kuCHitk6XxEcNGoYJxSV+N545pkFW8AQqncdpWJGz
         V6h4jdm49LU9jha0kPQIBr5SP87t10bzIKLFdfHzxBG/JcJL7zIni8D69P0GQoc37D
         n3udDIOLu4MoUSUqItgYA+/HzC5AGsXbs0GVm8/rVWm8ywybL+M+7eTygUbd7kHYzG
         JifoAoQ0Bp/VPXF1CSeFqfqn9+asfFroo6c/iolqzVGZOmE4BuL+H6TcwKXb/KSp/C
         De3xtJtx9L9rb32eUpTwmm1U17HTwU4NjohDVs194zfqOvJR6IPh860UMh5uFuMN/c
         KdnwOo8OSt2Ug==
Date:   Wed, 19 Oct 2022 21:51:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jiangshan Yi <13667453960@163.com>
Cc:     vadimp@nvidia.com, michaelsh@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] i2c: mlxcpld: fix spelling typo in comment
Message-ID: <Y1BVPnreFgF1l+6Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jiangshan Yi <13667453960@163.com>, vadimp@nvidia.com,
        michaelsh@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
References: <20221009071923.2637423-1-13667453960@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="23oWKoDK54ISFeU4"
Content-Disposition: inline
In-Reply-To: <20221009071923.2637423-1-13667453960@163.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--23oWKoDK54ISFeU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 03:19:23PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
>=20
> Fix spelling typo in comment.
>=20
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>

Applied to for-current, thanks!


--23oWKoDK54ISFeU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQVT4ACgkQFA3kzBSg
KbbdDQ/+Mci//Y1ue69DyF0+xeJFG+kCkzBbrqGXY4aHjdWBDyG3Vy15dii3op12
ZfMgyZNZyLVirZIv8LH6pZUoSiggwNpM+/TS0MRgX1u4I+GrpjWf4R9FvYCinoDX
HaBZtqd4GyZHC0scSr52FNZp5fjB+pGvkMSBKmvVtmUFU/AmEkPs3tijV/f4zqrg
GNslOT3zCpJrogv/VbJx8DnVhAyC8Tj9pJzo/s2YRFVC8unwCXX3TbaeTmCXxwDM
cYmEXWAgzbcia3nn7LLezV+Xuz0F5bHqofyX1DZhfkiejgtWPTrzmLUxKtf/h7z1
JFE5K13OvwzzKZuC6uQW45C0tpl077GJ+CZL47PjnQoctAsiivAW8/9IiOVuY3og
xXTQzzan71GPlhPZZtWHQH4q4cZbN3DYKgo++PrY+/v5qOYmgR0HJibEi6mCyRZa
dG4tT+8q0DyGUOgPrakcY2ZtTEzIXbs6oWUqarseJ2Veq6uKpebJOxsSnlv8bnmm
kSOxJksv3vtqEsziR77msy4uPorQnkOi3n71MbGGLjEiKOD3YfmxEMpFgtsJ/Xt/
ImOPLZxEg4Q00Hkp0ktMZ7eY8fNbymQgCFQ1da/0aGT5T/jADpfrfx+T/wxpM4ic
nG+d0zwErktcUgUHNZQ6RFYFBwALine4NqkibkO0pHGISV1TVZk=
=T4du
-----END PGP SIGNATURE-----

--23oWKoDK54ISFeU4--
