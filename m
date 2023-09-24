Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917417ACBE4
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Sep 2023 22:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjIXUvv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Sep 2023 16:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjIXUvu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Sep 2023 16:51:50 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08255EE
        for <linux-i2c@vger.kernel.org>; Sun, 24 Sep 2023 13:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=rmBj
        8WzgZ1qY7XdqFTxxAvVk/6lNMe6UdmcFN+n1JgI=; b=NOclYpq9H+NZtYeLYITO
        W0SBHwoqdShHnQUKYbpLdCjouQcHceI8AP0YoHETkcp+cz78fpeNBhsQ9zXCsaLj
        no3t60+2ikBEeO/nroEW5tH1cEkW3LaQxa6pN5lnyR3yp0o3oaSyNDzoyIp37Nrz
        sziYDqTAblsKzqO8vtbK+17VliIVZugV+4SHsM1hVoAv/qXQg1YWHUwCevRWN5uS
        HBJm0OrFJev03nNVGHLsdn61fcPNvV12wvBAr4VwrnEBZVt3atLqxbKU6P5qNheG
        u+x4z0Sdx60VNU02+0Cawib45EZjlYOHFkSchzHNK6HlLt8NVxwp1ZZ/zLP4Uwqp
        +Q==
Received: (qmail 2104137 invoked from network); 24 Sep 2023 22:51:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2023 22:51:39 +0200
X-UD-Smtp-Session: l3s3148p1@D93qASEGWOMujntX
Date:   Sun, 24 Sep 2023 22:51:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: Annotate struct
 i2c_demux_pinctrl_priv with __counted_by
Message-ID: <ZRChVwlTcBIMGk95@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kees Cook <keescook@chromium.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230922174959.work.093-kees@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Yzf40OIfY1TWj451"
Content-Disposition: inline
In-Reply-To: <20230922174959.work.093-kees@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Yzf40OIfY1TWj451
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:49:59AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>=20
> As found with Coccinelle[1], add __counted_by for struct i2c_demux_pinctr=
l_priv.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>=20
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>=20
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Fixed a blank line and applied to for-next, thanks!


--Yzf40OIfY1TWj451
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUQoVMACgkQFA3kzBSg
KbYPXw/+OI9vKEMhaU1rrgG+7J5iC21kX3uFzSB+1HHmfaB5FRr6A8YO8XtPO6Dg
MRH7LculsUzt8aszMl12+x9DLiFUn2G5S2OEl/qlfc/SiCBQvNEYNyxBiwrpVlc5
vF710VZKczRmnWiUKjIJV1QiQjhm4O9iXeeZifaA0FHYH2CTcCZoy2wJoAnfjoGI
0xEQIwVggYx1SHABWTz3fdDDUiypE8CZh5HLTqokDOrLbLS0Kf24MYAJ42U9Bwj8
OfQj6SKwixKs49PKvdgpYb9BMcLruarU1q8/upOO/Iye+MykNKzBTq0yPoLe0VJS
EWijVeKAJTTsS8PZ65ILU4RAka/5gNS+AXpX45QrxChzjCVJF2lgyJWGach9jq7D
3AUAWq+BDgtQgvQHmXU4vTV6PcvR4KU3GfzO/cALPqHQex4ZVYfKLygY83c/ytDI
vxZOSW5Zu/msnPwgZD2wQ4BNpJbJceoaGqYCUBwlVAqCMEduCkKMpP0ijXPmWaT2
a6lTESy/75lQ2B1DS9BylcBdm4GqUesGAKQsbel253N/5EaW3H4W14N4OFrXM7gp
f+/el1VgrtZy7ufe95/4+L9V2pijzw9Ppo69eyXEJZjI9tMepvR0KsxM87doEy6f
ZERJuVj7YeWqlaqzFe43rrsylyNq7oVfZuNR/QJmVXup+5nIb7s=
=tbDm
-----END PGP SIGNATURE-----

--Yzf40OIfY1TWj451--
