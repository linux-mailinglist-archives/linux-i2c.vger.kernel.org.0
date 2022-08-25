Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266455A0A85
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 09:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238314AbiHYHmm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 03:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237510AbiHYHmm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 03:42:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5A6A2631;
        Thu, 25 Aug 2022 00:42:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E33F4B81DF1;
        Thu, 25 Aug 2022 07:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCB1C433D6;
        Thu, 25 Aug 2022 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661413358;
        bh=M4NLnweQ1YO0LW8zxsidwuJ2fk8GHRwJAW3ZzBT6X3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LU0D9Jw9TIgaMHhrIPJjyWgknREgEMx/EkpkyYeY6MULuKk++EPYab5YKhzRWQ4Fv
         80TyLG/qe1jMrh6aGJK3XOTJ/0bvJrrwxiBzdPelhKS/95tEWK+/Xk32Z9N/CqUDnx
         tfTiE4StzhzXlTJoY7uDrWIn9gRSdGRoVRONGlAs3GH5/EqQVgtQr4s8rt8GgJ+2oO
         fvlEt+unVm0tpe2LyO58H1FAVtBE/5lzNFmNjVoLhA/T9psfrvZuYpi9hfMflKURg7
         gkQe5pC9tgy2sgJvsojhcFZRa9wCeqxerRbsQZJT+1oFT69axPxYo1oXNyTdWsJ13Z
         Odj2YO2albngQ==
Date:   Thu, 25 Aug 2022 09:42:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/3] docs: i2c: i2c-topology: fix incorrect heading
Message-ID: <Ywcn6stNFnz7haI3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
 <20220824083104.2267000-3-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f8Lepm0VlubYzzeD"
Content-Disposition: inline
In-Reply-To: <20220824083104.2267000-3-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f8Lepm0VlubYzzeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 10:31:03AM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> "Etc" here was never meant to be a heading, it became one while converting
> to ReST.
>=20
> It would be easy to just convert it to plain text, but rather remove it a=
nd
> add an introductory text before the list that conveys the same meaning but
> with a better reading flow.
>=20
> Fixes: ccf988b66d69 ("docs: i2c: convert to ReST and add to driver-api bo=
okset")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Peter Rosin <peda@axentia.se>
>=20

Applied to for-current, thanks!


--f8Lepm0VlubYzzeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMHJ+kACgkQFA3kzBSg
KbaHog/+NrNCYkaXZwV/Vn278s1fsS/HYyh6wSeTLdwMvryht+iaA/zXDnpVSuef
yUKd2ZyKSFQmubBtOQH3x7n1JsZviCQzCKg9EDxA38rOiDEo+R1wEjp+i1KHJ3gS
2uNb2jK4keFCzUpJ0blR5ZMpY6zMxlUHgOnFYJe1YLXuyJ/xnPCmD0CG+4Qm2iew
8Jfoc6Mzl0bYbHZ/RyziklKrhVyoqypli1SDWqY0Pg84p5VcqMXrQO7J5PYDjLOL
k9GZnbRJEqRjz0hBorhOcZVlGOTBepYKWObK0MpjgPSJld0iS7s4B+Emeonx1Rzt
tKqs6d/h4E+D+3BeT8MQhDM/P96o85A2UHiHq0gaAbCqgmfIVIJ6UIkVSODRArX8
peDAxo/FYjDpvSFy8sSuinhDxJLcTFdOkWJnFwkPXOj/tTLOWT6Lsc11BXAwGAjj
pdlTBD/EPH4s4K/Be3EwG5CBwGkodgCOzzqYc5J+O7MCFmTRk/+fa3X1WBbKpYvU
Q6LlP0/rl6MCky+uVoGBXZyT0cLd2S5d2U9wit4vGOHFPwvb/2v90mOCILg0gaO6
7DsfMEi1EHebpkNebmajTe/ZecozrS8YO5V/RUde0wlJqHKaZdrKPkvi20upcO53
A/H9nfWzXHrens1H7X8Mvt3wKRbBs1VtO+5ZgwI5K+/zISkCOF8=
=IJlc
-----END PGP SIGNATURE-----

--f8Lepm0VlubYzzeD--
