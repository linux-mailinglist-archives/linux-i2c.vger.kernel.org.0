Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E3A52FC09
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 13:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243131AbiEULeJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 07:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354870AbiEULd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 07:33:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B044036140;
        Sat, 21 May 2022 04:33:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD22960C84;
        Sat, 21 May 2022 11:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83905C385A9;
        Sat, 21 May 2022 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653132826;
        bh=l9by86nw6iePCzOmDkZQU5SCVcvIjg3rIH78FcJrxnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vPBjUecgsVVV+Rur5PY4bm1PRiEojRK9gCAXChl0pEH0hJWeZmRyT3qqPCpz+F06W
         zatZylozBgQY8aDCI9OmrH6IhfKNry2gjURTt1yfKqaVGvmYiDQbt1/g3kCx/1l+UL
         DKryVlwuLKerKaa0GTpbevegruq4iHjs01lcyUwV7Jz2pqu0c9bzVmRdXGmwwJoRyU
         yzl4pVSKJOhlHR+W+GANr0K6QrL+gQHSY4w5jI18DjEpwadJHgJxCBqujzqmghupO2
         SzN6U+ywJBfMPyAVnmNw9kZ2Q24yLgWg+HhkDE6yrlDqrdEwJutbYxRVDPsbMBXrS5
         JRAeXkua22QSQ==
Date:   Sat, 21 May 2022 13:33:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        kernel-janitors@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: meson: fix typo in comment
Message-ID: <YojOFtmzkQ9IH8UE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Neil Armstrong <narmstrong@baylibre.com>,
        kernel-janitors@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220521111145.81697-53-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fYqSdqxjDeDE3M9G"
Content-Disposition: inline
In-Reply-To: <20220521111145.81697-53-Julia.Lawall@inria.fr>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fYqSdqxjDeDE3M9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 21, 2022 at 01:11:03PM +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20

Applied to for-next, thanks!


--fYqSdqxjDeDE3M9G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIzhYACgkQFA3kzBSg
KbZP+Q/+M2eKB9fBFm0ki/BdRKVvwXbqZBQHMvjPeORijOnWqLSUqY8b/bGmFxaP
Bzjii2CgLl059ir58BeYWUCawy9uRK3aeHONPD1ZtiN8XQRiJ3dAgHZSFUOYc6YX
pZwftv7y3c1XmSCZtsZy3liAwbKrk9RK2s8lLpEl3IrI1+Za3PpMX3jbO0WJILpl
LAD7X9dEsJ+HkjwvSs1trMwn3Xfun2wQBV84R/1ZqhrCxPnmroomfI3YJUrF6L78
yVvc4x/rJ0dLFKzy/FnHBu01ifUm3BwGxwWnntT3jOwfUufy4E65gsHiC+qf9xU6
q4XEqqZPC5lXyL5c0uelcQn9KxrNwHqoNkRR32xputrN5B4TPzDmaVUphg6XVTme
1v6ykpneJOkb6LYwHHx9mw1386C14hUQHH82ByFLMggVmbOOrXbYbqh3zuala8bN
X1sPNYJKSo6oyKiWYzIj3mODcftyqV+Dn9Rn1MpsFK1nzHu6rR6dT+XyKK6zOTa5
5oxp2Bd9qWSAZ/WH9N2LJm1qRJDX1Hk+6oG0cqbqkQSCFbqnIi6bEYnOKSstI06E
lEwCNheKDK6HpMAIkzIRWYbwqkkTVF2UDzOQSY7Ojhy9dGwzwbAlmuUk3ABn2Fbr
MywuhDhGO68vdD3e2tpgg7X9k5/qMHbXs+G16G4TPbvKDYCYQqM=
=YTwd
-----END PGP SIGNATURE-----

--fYqSdqxjDeDE3M9G--
