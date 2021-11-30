Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33022464057
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 22:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344132AbhK3Vko (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 16:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344057AbhK3Vkn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 16:40:43 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E46C061574;
        Tue, 30 Nov 2021 13:37:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0C689CE1C5E;
        Tue, 30 Nov 2021 21:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0C6C53FC7;
        Tue, 30 Nov 2021 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638308240;
        bh=2LSlkcK5qJnlXtsBWdEyilArV2GlaA8dV4lZT+DRMyQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SbvR54O/ALPMkpKKObmAEX4T/Um4E3iESIWFdwF9hztOtEHukwwlz3Vq/2nLXovy9
         InYeG1dn/AxGIrLK83kuZeipJm4EtsMf1TaijLvYOIY/jz6TDys+ZhObd2pxQMkE2B
         4lp2NMCJM7XFQwA0zs2ISutUtK82jM9DaL8W4V6Ww5okv1pEQ1bLcrTYO37YAJC29F
         k0JzDETl+9mdZrQv9DxGbaHuMTARh8r5ophv78SmKZ+hW4LznUlXCZpD9YDC9EUvx7
         lQv+XdFe7KMlxS3YPvdl8AiqvIGTDOdXfuPAWWcfxt6RKQwzXt9C+ACBfw6S7TDg40
         xoY1/bbzcNlQQ==
Date:   Tue, 30 Nov 2021 22:37:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Ondrej Jirman <megous@megous.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] i2c: rk3x: Handle a spurious start completion
 interrupt flag
Message-ID: <YaaZjVGtmA5NQVwh@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ondrej Jirman <megous@megous.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210924111528.2924251-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sOF2f5PSKqkWs/pK"
Content-Disposition: inline
In-Reply-To: <20210924111528.2924251-1-megous@megous.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sOF2f5PSKqkWs/pK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2021 at 01:15:27PM +0200, Ondrej Jirman wrote:
> In a typical read transfer, start completion flag is being set after
> read finishes (notice ipd bit 4 being set):
>=20
> trasnfer poll=3D0
> i2c start
> rk3x-i2c fdd40000.i2c: IRQ: state 1, ipd: 10
> i2c read
> rk3x-i2c fdd40000.i2c: IRQ: state 2, ipd: 1b
> i2c stop
> rk3x-i2c fdd40000.i2c: IRQ: state 4, ipd: 33
>=20
> This causes I2C transfer being aborted in polled mode from a stop complet=
ion
> handler:
>=20
> trasnfer poll=3D1
> i2c start
> rk3x-i2c fdd40000.i2c: IRQ: state 1, ipd: 10
> i2c read
> rk3x-i2c fdd40000.i2c: IRQ: state 2, ipd: 0
> rk3x-i2c fdd40000.i2c: IRQ: state 2, ipd: 1b
> i2c stop
> rk3x-i2c fdd40000.i2c: IRQ: state 4, ipd: 13
> i2c stop
> rk3x-i2c fdd40000.i2c: unexpected irq in STOP: 0x10
>=20
> Clearing the START flag after read fixes the issue without any obvious
> side effects.
>=20
> This issue was dicovered on RK3566 when adding support for powering
> off the RK817 PMIC.
>=20
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Applied to for-current, thanks!


--sOF2f5PSKqkWs/pK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGmmY0ACgkQFA3kzBSg
KbZ64xAAhAMsGHyf1dbaH7r+Iv6SZBb652herH6rb0o8011mc8qs0+rIIRSzqZdI
94wDHAFN8jTGT8j1hWRO64BbUttlcdAJIki9RGbZtvb/++cUBRpNAxaTdeOQ/9jO
Sy4s1iEvVWpmFcbOJJ2rx4ItSJURgGu6ILN65ws2HNeaKVrNj15wvyUoYLcK1U+V
9DbwKCF+KQ9OB997fRfLBK7N+7hfSqOCZzLxTdEHBvB7wRNLxwDHDRRD0ensJVSW
B23WJW0D4B78TLFLa5+uEV9pCbuGogweDPJF62ydxu07brmscwAfdepk+IvQxYmV
Q1VwulhMPrQSEmNTdu1cAJkHIneNulO9PmGJ8vtJ4V9wztR+1N+8mEzVj/WRo7a8
1pRq1xGy/YzwH5o8kfDNY6cjdEP6vKOEBFzGQI6D92bJHmhFSb7qpNTuzrzFvzQq
yV9U8m7/JcLhA4mWsYI69702L5rGdKP8wgMp+VJD9iDWlpBO91d0PC1+3R4ewf92
eRR20tnEbDGab8N1uOlAW3YZiCOZ9/I503/DWQHhQZBtmKmBy6aJ7S6wY4bVgAhU
l6f87740Jo7C8lMuxSkYftV6EqWwBZugpXyDw3nPXja2nRp5r2xh4yNrsPhkdFh6
LufjqDUZBHiVF5AOUZW+3Nx9GWNliWUdEf2b5RMtASK8F37F9Ks=
=NDfr
-----END PGP SIGNATURE-----

--sOF2f5PSKqkWs/pK--
