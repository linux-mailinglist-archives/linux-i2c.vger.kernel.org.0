Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9587552FC1D
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 13:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiEULl2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 07:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346175AbiEULkz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 07:40:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F616435;
        Sat, 21 May 2022 04:40:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 73EE360A53;
        Sat, 21 May 2022 11:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7C3C385A9;
        Sat, 21 May 2022 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653133253;
        bh=br7kBF3LZEoabw517fvvKU3Zigr3DJ2nYLOCAMFm2CI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ngCO3MDqn3pcWZj5kU+ilygr//lAD8bTGePhNYVi7Fap7f4LSjPglPgBhuuz2AOWa
         EMsA5q4aAJ5hBCoZeqGEsBLm1U+/aiJLpakqbpZxSkIbxiMc4Q5sFG53dj3Xw5o7g2
         7ixQCraYRGMGkf6EsSK/0x1Ozr3zqhYCQ2g55lHHSX7pb2fkAc3lCRq1E4EGCmGLgz
         JDAGlfCi18yssbMl1FIBZQfrHCljiW61y4C5+HkHAcG5pgxda2YD2cxOLf6A5UfXlG
         6w3J+Kc3soWNA1bREQB+GHNL+s1UAsIkpqnz0+uUm7riK1+DbrG3wEZG6g19z7vmyH
         ObU3T4ire+EBQ==
Date:   Sat, 21 May 2022 13:40:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Piyush Malgujar <pmalgujar@marvell.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sgarapati@marvell.com, sbalcerak@marvell.com, cchavva@marvell.com
Subject: Re: [PATCH 3/3] drivers: i2c: thunderx: Allow driver to work with
 ACPI defined TWSI controllers
Message-ID: <YojPwe9I8sJJ32Vh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, sgarapati@marvell.com,
        sbalcerak@marvell.com, cchavva@marvell.com
References: <20220511133659.29176-1-pmalgujar@marvell.com>
 <20220511133659.29176-4-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7F5fw/5hwePLzRSd"
Content-Disposition: inline
In-Reply-To: <20220511133659.29176-4-pmalgujar@marvell.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7F5fw/5hwePLzRSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 06:36:59AM -0700, Piyush Malgujar wrote:
> Due to i2c->adap.dev.fwnode not being set, ACPI_COMPANION() wasn't proper=
ly
> found for TWSI controllers.
>=20
> Signed-off-by: Szymon Balcerak <sbalcerak@marvell.com>
> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>

Applied to for-current, thanks!


--7F5fw/5hwePLzRSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIz8EACgkQFA3kzBSg
KbYtqA//edK3A+8jUoEzJdVF1PGKPlmMikB3gCMrf5lWtwSVsJWQdQFc8Uv/JhcX
z7tMCv+dpR39VFepzRt7g4C8iYqZOUACLvR9qGx6G1Aage3Kw9pcvcGKtOKhO4dP
A7I0rUWvKhh12m1rrGwZ3HDckSKLOgvybwvCWLZHfSJncRU8sylA6ecGGyGapV4L
Kk2XV57JHYIPbNQTSeYA59Fp1M1qAifGXNDVcVp6HK/sD3ylvb6HPUt22TfL4//v
DZt1xkH1p9uHhiu1e3V0JRlYwu5vn66I6373X93LbyqDx2ORNQ80X/4xPBvdNql2
oebTOd30U9l9x5+/pJCqm7vJ6UAj4uy5Gi6N8lzrsBni0DqGk3+t6SJQbxF0Qx62
NpaiuMtJxqdBZZfEF5asg+6K2A5ioItdiNm2+j923obs/k3CgAug4n1kd6cvcoXo
UVH1LhjIh6jWaq8YR63V46SPh5m40eabhsQcb4i4jEgVHrymRKoNVAfPMyMl4kUf
qyG7XtksAFTEKTXyJdiaARqdZqW01ZzmYHZQwHU7bKdLa5lCqCL6S00ecuO36jFI
wXfUOqGFaGQpgsyVWNaVnQZgHm2+dUBYLxyEysgbZ0s0ekvz2UisYiR10EypMVlD
l4XC70rHAhn2pOplZnsMryqL+MtuszzWfKOVP8IPRkiI+wK15hc=
=jAfK
-----END PGP SIGNATURE-----

--7F5fw/5hwePLzRSd--
