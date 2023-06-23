Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B706473B2B3
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 10:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjFWI0o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 04:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjFWI0n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 04:26:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEED8B7;
        Fri, 23 Jun 2023 01:26:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 749F2619AF;
        Fri, 23 Jun 2023 08:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB19C433C8;
        Fri, 23 Jun 2023 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687508801;
        bh=0wiIuVOmBhGJ/Evx/QIj+PL9Nj6dRvreJuGrO3uvLnY=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=JaFjPhdtJk0NkgqH+4ezebgB+yanE00Xdha+bkTqsSXXUFP8iEl/qvXKKW8Am4LLZ
         loJOxPPuEYFRcawVloDXWANoORDw3/muBsdeMXKfd98WfSzAtHhIU67rdHBj9KGRZr
         lqtEjx0MLhj2hKNaHBu98j3HAkGw2pacTF8qAfRA61mUWxwGmMzOIJETMqfKdIt8xR
         Cq6JSFjreNR0nSL6Zdm4qJkrg6HLKVQIeUB/l7EM+KykKC1UdmqgYIqLN6w+va7xiM
         fevWkHY+JMLOwcAEzAzbOpNw8onUWFzLJqA0w+cPsp4w8345TO39xhsu+WxP97i3tK
         kDzLK1MQi3mtw==
Date:   Fri, 23 Jun 2023 10:26:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wang Zhang <silver_code@hust.edu.cn>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andreas Larsson <andreas@gaisler.com>,
        hust-os-kernel-patches@googlegroups.com,
        Peter Korsgaard <jacmet@sunsite.dk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: ocores: use devm_ managed clks
Message-ID: <ZJVXPcZCgmMZrytW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wang Zhang <silver_code@hust.edu.cn>,
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        Andreas Larsson <andreas@gaisler.com>,
        hust-os-kernel-patches@googlegroups.com,
        Peter Korsgaard <jacmet@sunsite.dk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b5c00122-0fe0-4020-9036-e4cc37d1b51a@lunn.ch>
 <20230526070534.76112-1-silver_code@hust.edu.cn>
 <ZJVWQIZRb49mhofo@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3Im7Ut1E8eeNeOxR"
Content-Disposition: inline
In-Reply-To: <ZJVWQIZRb49mhofo@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3Im7Ut1E8eeNeOxR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Applied to for-next with Andrew's Rev-by from v3 added, thanks!

And I needed to rebase it to i2c/for-mergewindow because of the
remove-callback rework.


--3Im7Ut1E8eeNeOxR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVVz0ACgkQFA3kzBSg
KbbM4w/+PjQ1YBPhsay0oLgmHhWh3Ojw42X2RIdi4n5m4twyiukAECsoEnn/7N+b
lthApI5EGIyQ5r3UxesjJU4ZZhzJJ4g78ABnScdoZlvEgBCtqfCvwpVgKGvDB0s/
8eZbYfnZDieZyijW6j6f9nFMdNGyxZLnmmPpROifhyp6kWmUipGs8oDH1b0gldn4
9RTj8Zf+vdBFlJtPN0tPSpWEtiU0WDgj6uhXMKd3oxbxBnIN9puItxvYW08DaU1F
psjPcAlZ2KnCtmhVGkW4TT4pCqkQ0GrGELOXTVZcO0+tuCZVoIIKxBAl4T+eJI6N
M4FMBzA8nzhbwRk/Lud8KWHhohfJqLrRSGq+Eua8dJ+zN7NTkveE6sEQto4k+YYl
Y3FXV92XtqqmK+5vJCsA9X5mlpeaHa7r7Gdwxnr1tcpFk/ZniP47Jh03uwqtRI9u
PfHNC28U8f7gOxGhegGZgCZxe0sJ9236VjlvJfePxS8Kz0+HGIp5AUDWuVEC8dMc
dCmhMIerEXC2cK8yOozdx2WsyRI/D9phjbCMi8P7P2l3LkUql5PwTbxXyNce4o6a
6qiKw2MJ3FxTQH3uSqMAMQPSyOvGh4+J2Eg3DkC0wTZwQ0fNGg5+ocvKL5pLfpUA
clm2rhGWY41+o9ljA6FvcJgUFtMdJV4NA1lrqzELsyP+kfdM3jk=
=qZNk
-----END PGP SIGNATURE-----

--3Im7Ut1E8eeNeOxR--
