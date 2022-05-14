Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60238527161
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 15:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbiENNmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 09:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbiENNmR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 09:42:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAB31D0C8;
        Sat, 14 May 2022 06:42:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 838E860EA8;
        Sat, 14 May 2022 13:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257E9C340EE;
        Sat, 14 May 2022 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652535735;
        bh=lc8FNAHPs8PxV63QLAnbUlmnFyHQVfR9JmDEpWwz4lI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T/iMzL+CCIm9x7+Jl4noxSph+mudNjl8X2sOVQkvn5FyBHl96k51cU66l5vpRLnIU
         UeXp7rlbynzHSGZZcTyIh7D68IvTdOcCELtP7okrfGpAfTTZV2+PLqB/bHIvoz9r6j
         4WppvK1cWa2QxbpLtKDKxStnqEQ0DtLPq/cWjw8lfIU/f9SoUarB0mAjtmI0mZ1TRY
         Cm5EWCHLiQLH46AlJ1ZhSlNgixjQ4tfsAj17pqAJK/tm/nx2CY3sqlhNeTIDJqTsV5
         AkF19anc9HKM2siOhJT2yYPj4QAAxbMRUazRnC10fdvQ9TIbWf81zm2jWoGTJ1gSeg
         T4ds3E7wT+Zrw==
Date:   Sat, 14 May 2022 15:42:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Walle <michael@walle.cc>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: at91: Initialize dma_buf in at91_twi_xfer()
Message-ID: <Yn+xsNqFyRMTu+5X@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Walle <michael@walle.cc>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20220505152738.1440249-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VjAemlvi6p7tG2no"
Content-Disposition: inline
In-Reply-To: <20220505152738.1440249-1-nathan@kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VjAemlvi6p7tG2no
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2022 at 08:27:38AM -0700, Nathan Chancellor wrote:
> Clang warns:
>=20
>   drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma_buf'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
>           if (dev->use_dma) {
>               ^~~~~~~~~~~~
>   drivers/i2c/busses/i2c-at91-master.c:717:27: note: uninitialized use oc=
curs here
>           i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
>                                    ^~~~~~~
>=20
> Initialize dma_buf to NULL, as i2c_put_dma_safe_msg_buf() is a no-op
> when the first argument is NULL, which will work for the !dev->use_dma
> case.
>=20
> Fixes: 03fbb903c8bf ("i2c: at91: use dma safe buffers")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1629
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied to for-next, thanks!


--VjAemlvi6p7tG2no
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/sawACgkQFA3kzBSg
KbaJ9xAAkyq+RHZZN08/YGayyvwrJU1NXYylBVY92QwWcNK4qyUjdNLIz2YJn4kC
SPBPTdyWbeG46f609FHc8aCAJE8P695jSZh9yOPQZ1HUZWx2MXsraYXcGtdAzwKv
Qwt3O7Mal47TcqyI5iwWcsKlsKKiQCjN7QeQ7EiTBTrVB3DL/K6E+5urM1ew837c
6Eht4geOYLc/GMc9usSaG4SDXXnEBsFMvzIa9qCImZ6NBeZmeD3fCZA6ylw2ztlr
Fd8/nx4tVigiE8TGxcZiduBt4BuYbAUMOUeOHcNAkMNu1HdzkA05UXGbRvkW+0yT
jGg32HRrEWr45OVmAX2jCpKAW8hC8rFbtR5DPwMW/1ZmShkq0w+3BV3AmsFpu44P
gssSPLLktq+n8rRT/ze7Zht80LebklQ3mI57+kP2/ZjnyGHyMLmXY8GSCUEv5+AZ
FPeUMOcbi8CqZDnIOmRk7RN7uX7p1BJotYOh2pHnFEvpIB8coVTd1yn6SV/+mIqi
j5bW2CzRRZg1MBUDI+LGyczHDH47mUOtYjEVKRMNdiVwmNcSsO7QneGoJo+MUr7z
RRX0kOy3JAp6VuPhmDY/fK22+q1qZQeCWaBFldsSYDTWz1fFxwqWUOEV020DS20v
1zhMYk9WipGr7ymzVgTGG7s/5IMXs6qdlG3+7lAciaOPU8RRaHc=
=GQAz
-----END PGP SIGNATURE-----

--VjAemlvi6p7tG2no--
