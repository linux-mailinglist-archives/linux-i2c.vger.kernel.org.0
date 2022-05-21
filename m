Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D0A52F93B
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236782AbiEUG1B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiEUG1B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:27:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4D9132A2A
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 23:27:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3699360ED5
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 06:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBD8C385A5;
        Sat, 21 May 2022 06:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653114419;
        bh=GSs+CT4S6eHEa35M+FhYSSmwHH7TsiTbGwwfv6j+88c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aGMtIPwY+d+31rmNmtecb4F1tkRCpzrS4+d4mDO8BspOU6CTZJighvQCthKPX87qJ
         UVFgquv9lGF3ubzpud67mzWc72riL3aC3pAfIy2SpMJ71Y34xj0T1czEW5gk7Erx/0
         xyiJcjg3DocXO1T4l6nK2HK/oluQzO9MjMzjm+Fn4cHubwOlOQ7r5DKGOSVzN6/g22
         5z4/EPMno0LfLwiLm1kEiEQYvsvX4YGFXu5ncTKX8G52b9e34K81BBEb6TK+0n4KtI
         SIsC9ymcosZd/qbOA9sOb+ke4uKOKBnag8TMWQRkMXUKmt+ypHKNOYvpFMgpsAzyiH
         0fK4layBg8hLw==
Date:   Sat, 21 May 2022 08:26:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-i2c@vger.kernel.org, gregory.clement@bootlin.com,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] i2c: mv64xxx: Remove shutdown method from driver
Message-ID: <YoiGLxhfgYxLURyt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Morgan <macroalpha82@gmail.com>, linux-i2c@vger.kernel.org,
        gregory.clement@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
References: <20220325180625.31414-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xMra8U078ZP1zSOP"
Content-Disposition: inline
In-Reply-To: <20220325180625.31414-1-macroalpha82@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xMra8U078ZP1zSOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 01:06:25PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> When I attempt to shut down (or reboot) my R8 based NTC CHIP with this
> i2c driver I get the following error: "i2c i2c-0: mv64xxx: I2C bus
> locked, block: 1, time_left: 0". Reboots are successful but shutdowns
> freeze. If I comment out the shutdown routine the device both reboots
> and shuts down successfully without receiving this error (however it
> does receive a warning of missing atomic_xfer).
>=20
> It appears that very few i2c drivers have a shutdown method, I assume
> because these devices are often used to communicate with PMICs (such
> as in my case with the R8 based NTC CHIP). I'm proposing we simply
> remove this method so long as it doesn't cause trouble for others
> downstream. I'll work on an atomic_xfer method and submit that in
> a different patch.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Gregory? Looks reasonable to me.


--xMra8U078ZP1zSOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIhiwACgkQFA3kzBSg
KbaWqQ//e+fwvYeaKYJ26QQgE6iA5tDOrPTkJz9ijeZCarjwaTa9ha/8dhvPAQde
hFjf0MkrLmfWRfoPmuZFkjxby8AukCWp5p309Xa9hwYZLc2NjdKJExqG8uYFP55M
tA4sKxrxSXxxNiMvsvdQQrM1Pwd+cffs8tTAtfUHDPRTr1aVm0ZPKsjVT//VPwBh
ZM4H0ySK7U3M4tcriAhP3ICurghGJxF8pM0Qi3IDv6xQ1PXGmIjLjYEiqse1hUdG
CbMgHL4Pr2fNgH26RVOBfkYbMs87l25wVif4iv2TjegLhv4SBsxiOVoKMMyIn9oA
oTIR2DVLiuXfi7LfyGCVaO6DValbKJFlnVYGRLT3yXtx23R7If8K7RfcRiN1/CC5
gkuBIkv0EjnN6YE0FUZjSFK0AvUL0OVFG69MAMwKW/donA0aymtB/sTdY5Rbvg7y
e+Z+LV8yudNrjQyP3XtwI3ul/bFsudXLIAWtoGRfY7QV/t4JpolSKPjLNk5OdBSI
BLat8oS+HKM/BStOtJAJ2ERpbtMwae0UgFGI0m4b8/ROq0UqXhRnHFxvJBFJBqLZ
Dsppdj8dXhYwidM08hxTJFQ7SuZuTW6padbUzj0y3HHKVkT8DP4tsTD5qSVvSMcp
veXmkzUS7/36ROFhuhQ78DlACAGjLRlxK/HbC44rXqWPkia23vE=
=bLgV
-----END PGP SIGNATURE-----

--xMra8U078ZP1zSOP--
