Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8ADA6BD984
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjCPTsM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjCPTsH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:48:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C158A5C;
        Thu, 16 Mar 2023 12:47:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 821BBB82290;
        Thu, 16 Mar 2023 19:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F35BC433EF;
        Thu, 16 Mar 2023 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678996077;
        bh=8W3IwN8EenViN4W/t3m59X+ooVq1N+zOGb9cUveFWKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a3QIl5fXuBp0SHKhfUnTW2g5FYgbX5o7FELjw8j0/BW/S9o6lsytm3bdOfwQ4XWF/
         DuuTsmo5yFqSvyyUKT40lB6U/r1fexzy3u3cxa/1dyr9jl1UdbER/n890vuF2DgrlS
         THGHbvr1XT6wQFYliqbH/F6YasGasw8wT77Euj857l2UFwXzn5orA60TDsZdZmLJYG
         kPbRben1dfXx9fGcbVYPcNunPvfYOT7RoPDOwFKlylxc3BPz6JIHniuhgj0jSyC44a
         I+GIUYC6p6lu2qXf8jQAISRH+OqxdFGJ9S20ICdQ/ivV7Yf/fFYo/GwiAWPqabCiLf
         1JGzooRKefkcA==
Date:   Thu, 16 Mar 2023 20:47:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH] i2c: mxs: ensure that DMA buffers are safe for DMA
Message-ID: <ZBNyaVI9ZdvPGPz6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@ew.tq-group.com
References: <20230213152550.1776352-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fb+F598rO9ebdXgY"
Content-Disposition: inline
In-Reply-To: <20230213152550.1776352-1-matthias.schiffer@ew.tq-group.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fb+F598rO9ebdXgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 04:25:50PM +0100, Matthias Schiffer wrote:
> We found that after commit 9c46929e7989
> ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems"), the
> PCF85063 RTC driver stopped working on i.MX28 due to regmap_bulk_read()
> reading bogus data into a stack buffer. This is caused by the i2c-mxs
> driver using DMA transfers even for messages without the I2C_M_DMA_SAFE
> flag, and the aforementioned commit enabling vmapped stacks.
>=20
> As the MXS I2C controller requires DMA for reads of >4 bytes, DMA can't be
> disabled, so the issue is fixed by using i2c_get_dma_safe_msg_buf() to
> create a bounce buffer when needed.
>=20
> Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor=
 systems")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Applied to for-current, thanks!


--fb+F598rO9ebdXgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTcmkACgkQFA3kzBSg
KbZqEBAAsP6Y2+sGLHfPpub5mRN4L9VRjpU4KdSfzctW87L1WMbp7nKFvMqJuADL
e9/lS6kxdfQi71eAo/y5Gb9hMtn65yIIH3g8dV/AXLIfTBuUmoAsPrt8c5it57yR
5MU73H+xQpqjTrsX9GiJh1E9srzP/SRglCoVSGAMihoBmze7P8rNX2Z30Jau2Qso
bGNtrZi4RJ6q2BxO4Ox6wrSrwNqkqRQwpKFLyNhljroXc9YpG5pXtDKpqKqtsona
VKeDp9Gp1eEr1LuU7Tz1xK7W+xslnwKVKGg1F/Grs6vO6OdUWKp79CnLvJwvna/+
RWiPegZR2Y33mwr/3NHcBqgBzeRgjyssuxQO49OAhamMlvyERLxgYdCib4SkgXpP
ARs/76kU6E01eK9YX1BWlg8jfkbfcX2e6Lx8/JC+Awc9Fac0Vw2R6BbjgSwnn1UO
2iyWN/uYsAXSUyDMdok3hWmPngDAqGNH3kdm9IpcpaV0RNj9qjUhZ2zB9/FFZEBD
w5uLOSehxoM4s1/qub2b/YHQohlCwEAHik1MM8nLnT0338SzHtSIww1tZQrtIGr6
LAYlXisHsSDTC0Ax9leI2ZBv7sc5kqptrLH7GMS3AmAJf9U4F1RjaivyPaCdusG9
VRmFFhEaWaENAVJPwVWEcKuQhsVfyhk6AMth5JxkY5bQhKAuyho=
=zIJu
-----END PGP SIGNATURE-----

--fb+F598rO9ebdXgY--
