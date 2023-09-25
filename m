Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CD27AD01A
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 08:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjIYGYA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 02:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbjIYGXm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 02:23:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF84CF5
        for <linux-i2c@vger.kernel.org>; Sun, 24 Sep 2023 23:23:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29461C433C7;
        Mon, 25 Sep 2023 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695622982;
        bh=MwmT2fX9UNla0DaVqFUwO6hKbHVG2ebu6uptnPPaZvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cB0zs/WBCtlyEipdbtJ7zg36rUvGdJJQh5jGJiN6p7Kbg/GNr2IwBX02rapopFHoO
         hky+ouYASW/2sYAw4OUYQGCUs3svAmqbdfyrp+RzeUhdjE0oBLu8bx83dt9NvFF+nN
         7/c63uSYoFEzgPPiAABRE7m5+J8eG4UfgPcwLe+YHR4okxn/fOteUZHfI6S7fljgRd
         pp50nf5ewn+0pTTvjWurWOq1JKeD4i1XqGNKRT1AyRhxRVj8L4trgnY6vlAHEGTQlm
         IghRntm1QfUhwsiLpSPYut/wQeXmTXtxzj8c0EfG/Brj7+qqApTWuo/LQ2ACyK/Cou
         n2Qa4TiGWMpfQ==
Date:   Mon, 25 Sep 2023 08:22:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: Avoid potential false error message in
 i2c_mux_add_adapter
Message-ID: <ZREnQgin9z2uvvLW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e4aa66a4-898c-4583-adf8-3f934f0893d4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="81q2tDF0awcltqdQ"
Content-Disposition: inline
In-Reply-To: <e4aa66a4-898c-4583-adf8-3f934f0893d4@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--81q2tDF0awcltqdQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 11:54:06PM +0200, Heiner Kallweit wrote:
> I2C_CLASS_DEPRECATED is a flag and not an actual class.
> There's nothing speaking against both, parent and child, having
> I2C_CLASS_DEPRECATED set. Therefore exclude it from the check.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-current, thanks!


--81q2tDF0awcltqdQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmURJ0IACgkQFA3kzBSg
KbYUiQ/zB5lHQ92svYR36+NEHNMH1z0o+XpCpWfOHW/tLv4ccbFreQeatgSEdEZL
bdJPESyRLW30OuDToZrb38hPGPZPP2GHpRjyqaCTa7dRWqOEW9O+bzUgMMRFd21V
g323EWJhhzXpIEV/mugSqTYDGH35XMW/vCMNWroz03zsWxBBYsosej8X+Xet1U80
7OBHeBZOk1iyO42Ne750eG3H551zDff5Rwvzs7ZOMCCR2ILbbs37rn8xB20LDVAc
6PIxiTfh5j1+ElYqC33T2CHvUAwF26fu/Nf3INzag7MDxadQ+eZgmFY9wpX3sict
j/RcnkoRwaRcYi3xE/OM1JWfqw0Ai5harzSPODIGMEKRzPQik5qDWlxixY+mK+MT
Kps53H0xkhwpSqVK+N4rdZNzAK+4MS6fshMcnuyI2PN5MGvotRnziHDRLEtSOoLt
+wYrQwacDdqaQMJ0Xsu0eyRjemIw5r742ur2kaQqpbca+yr3P7Q2Kf1eLHz2T4x4
pf9jtDh6Y/5T63numZJW7Ql66ZzBvPCx3ADE9fqgJAhOQsfNj1SvD+tp9QU2/Rdd
yGYyO4KnwPrGQ/je9lU6Jez1hGzVPa6gW4oAcrFr3NrehbcZOYkzAnxq/TI+aEQQ
WY15s6NHz1LrHTjMy21kjgE2kd+KiUThqQ7keCdLgQpNnT1thA==
=/YPk
-----END PGP SIGNATURE-----

--81q2tDF0awcltqdQ--
