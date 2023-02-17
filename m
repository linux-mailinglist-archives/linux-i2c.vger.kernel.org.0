Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0D769B4EB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjBQVm2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjBQVm1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:42:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E369B60F8B
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 13:42:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F0F362026
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 21:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58391C433D2;
        Fri, 17 Feb 2023 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670136;
        bh=uo4r/iPvf2n/QcCreBpwamfDS4tXUnMr+3jRQdNg1zY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jN2tPrAopLEwYHIVumuXeoQ7q4LRGO0XlVkyKCPlEgsaDrhc1BdIfRfQ3zm32H9q4
         564mQh6yBG1tnMrR61a9DVAbU07qlbCkgJ6zH9C/5+oZ0T0f1/K6Pa6gu/aT5NUS+9
         V7dK21jOomcMDnh4F7UwEceq4oxifCnl6DSHs0+MlxhJTOs/xklBdmTPZk6j1Puewj
         +V/ubh2Pt5zO/Ja/AK56eBIjyYGiV/5ap28sO6+SgW0Oq3j8ZF9NNchrSFPosl4357
         rii1U+q0R+I8c3lY4VbEg0XrrgjeMxfORZWlMTKz7Ehwq8D3zMT4DFUXDFTcxiuUvE
         hF+CyOLpfEwfg==
Date:   Fri, 17 Feb 2023 22:42:13 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 6/6] i2c: i801: Call i801_check_post() from
 i801_access()
Message-ID: <Y+/0tSCdo3eBCxOD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20230216170830.206f0bb9@endymion.delvare>
 <20230216171533.350188d7@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zd6lidVkCVuZcWiy"
Content-Disposition: inline
In-Reply-To: <20230216171533.350188d7@endymion.delvare>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zd6lidVkCVuZcWiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 05:15:33PM +0100, Jean Delvare wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Avoid code duplication by calling i801_check_post() from i801_access().
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--zd6lidVkCVuZcWiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9LUACgkQFA3kzBSg
KbZOJg//T+tO/CMrABBHa2/pGWV8u4R+mEyK+5JmpYCTLs2v7NKiMoEVRoO/iYoN
rDhg7ynanI0bMRcwG1ZDk8BrIjnvR3vsmod9Y7FLe5IdqU3MY+hHlXYo242Soxex
/E54d+5As+NcWtJ8ctsm3QSAz7H3II4NgozJ/o4wAK9nl6iwBIFxCGoK8v3P+YUW
VQJActnAWRjp//2UmJHo4cUVPalZw+2U14fIg2i22etiViCLjRbKVQ/YvAM8eTxj
2JNWiUbr5xp4t4EK76eiNxR/WWWLp1lJGmfrnxic4uNwnNBE9b3ErdIbnodlVHbX
bh3DgXqkIOwIjuuIXqRZ9OqyHbjKSm3FvJiKHSMr2hyTRiboA/2Tmxof0HJ2bhxI
BA3/6rL2LMTuoQJFL11t5MjSFFthVXMdc0H2pzOnvdZvmvsb5ccIP0ZqRAp0l/3W
b9NFhb8A7O84/I2Nx00aG8L5Op++3QvYRJcOrLD7oqRiC0OloNVdO2dorTAGR2Bi
hjm2g48g8ykqGGktdZFk3dGlW+XuzuCCmbWDK+97FnIJu78AMaA6601XzsHuOsfZ
3NIQbqdUEDgA0v98t0PUfoL6ocL00kLizDhjhceGib7E915ObrciGUnjmAJc0cw3
PxbEbz9h6vm9MN2SKowHFwIm7j4uRlpZ2w4IjpeTKDSfwbrURlI=
=laxq
-----END PGP SIGNATURE-----

--zd6lidVkCVuZcWiy--
