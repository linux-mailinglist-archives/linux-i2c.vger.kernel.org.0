Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D0672F8B1
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 11:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbjFNJI0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 05:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbjFNJIZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 05:08:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E375310C2
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 02:08:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 781F4637C8
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 09:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328BCC433C8;
        Wed, 14 Jun 2023 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686733703;
        bh=6xGp3R7uTVEyRz/Q0vj1zPY64sYwZfi6LVhMPmQkyHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AmjZ47TD8+HhHJPP7JS9YRNgkLXE3n9tf2ae/k0Blr2VAGU5iajQeAESOuVQUFPkY
         AQDKXr9Bgw95RUZQxB/gbmWhZyBP6Dn3I7jMWU5Wgn5ABrZwMHjqtE/1etI80XDnTp
         QaBHbKz7NNm2IX8JzSRAmX4m94bSS0gS2dcXSeI9AQjfXrKQ400k/evK76ZKAdOrVk
         QGzh2IJsMtLtRXk6bF75Ra5m1UhFlICNLFxHvECcmHd1SCpHX6NjFIcNbwe6NowGy3
         NoFiJZNc/XPjGHczbJe/xM4CRHz4jxZR3KEUJb491upHNP24XleLjQk3mpd0hhyB8n
         cx7XNCt5U2fjA==
Date:   Wed, 14 Jun 2023 11:08:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/3] i2c: busses: nomadik cleanups
Message-ID: <ZImDhA1Oxm3G77jf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20230611013701.1464025-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jkdKZfgdKHxhPqDA"
Content-Disposition: inline
In-Reply-To: <20230611013701.1464025-1-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jkdKZfgdKHxhPqDA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 03:36:58AM +0200, Andi Shyti wrote:
> Hi,
>=20
> while browing the i2c code I spotted the unused goto. The other
> two patches come naturally.
>=20
> Andi
>=20
> Andi Shyti (3):
>   i2c: busses: i2c-nomadik: Remove unnecessary goto label
>   i2c: busses: nomadik: Use devm_clk_get_enabled()
>   i2c: busses: nomadik: Use dev_err_probe() whenever possible
>=20

Applied to for-next, thanks!


--jkdKZfgdKHxhPqDA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJg38ACgkQFA3kzBSg
KbZnZg//Vh/TbQ0ojb2zezk3rnPRKdNw+BLeMRyimsjjTVOMCDLb7S8kWevEg8pR
2PuuACAkU3pFoVsXgnko6lTIOxMCw48lUC1mwG2Tk/WCZZXOVUpTvIVVhvvByAZo
4KZXF7QxUbI+MU0LREz2ixgniAt4oagqL6IHS5ykqt1iGerCPOiFdby57lsrQr5S
mUjrqT/F0aNz/3jA71NMaSfzHj3aSzgserZcI0/UMewPRJxXdZ+g6bv32Q6XuZho
+AoLXPRstegCVGWyNY0WiRNhr4u5Noxq0lGJvrsPzYi4ldV1M/E8pM8Jg3U1HwPv
E0lLWyjpM/w+1sJ2lua2DLJtMGpB1z0EKaC6NIZa7e2gc/40AEOMU8G1nYRk2SId
QTfsFJNmrMfsLJydu8JUMQJxWaX711+kE8oPL0iRKPDmPL151I06A+S/lsvOurjb
oY7gHe55TvNAbsieP3R58JxKwBI3Q2JUfLx5RMvgYUpR01WKfaCZJAVQqiHfzy+U
oDcGikvz7UwpHUY4EHqlVaer/W3PjCc82X+rqNaMyPdoKfbcylzexntvd6Sfya8X
tNiu3v8DFoXKjKRSfv9N2aAJLZVGbqMA1dPi1vQ0RUj6DzHVrq9ZwlYARJTjCvM4
M2mt3JQgJ0IG1LQAK5MK6FWlRl3BqjSA1t9KfdPeVnQpXUKfSiU=
=JMEZ
-----END PGP SIGNATURE-----

--jkdKZfgdKHxhPqDA--
