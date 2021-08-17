Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4143EF297
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 21:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhHQTT0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 15:19:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:59754 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232560AbhHQTTZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 15:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=/aB9UcRE0xbSGZHvwWL6knc/HMwV
        yCnR6lMxHCqob6E=; b=QRIcAy8r31gEgoCNPfYKwofztBQ3PQMtTdyotCxNQX/y
        m2StNAS4cukMqmZrf521iA+lvqpU+Z8Fja2jtNbrFaVWA7ksgpFUTjrH1wvTLMGY
        GYz3IInOQG2w/blF4PgJ2fYVuDkplnRegwECcBqW+EfGJY9mQJjvJnUeRqp6pJo=
Received: (qmail 440148 invoked from network); 17 Aug 2021 21:18:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Aug 2021 21:18:50 +0200
X-UD-Smtp-Session: l3s3148p1@j/XbL8bJcr0gAwDPXwvcAP/VyhUm9O2C
Date:   Tue, 17 Aug 2021 21:18:46 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-i2c@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove dead PMC MSP TWI/SMBus/I2C driver
Message-ID: <YRwLlixqfmSpfkHu@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-i2c@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210817071126.8096-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DLo/ViROfErRTOk2"
Content-Disposition: inline
In-Reply-To: <20210817071126.8096-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DLo/ViROfErRTOk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 09:11:26AM +0200, Lukas Bulwahn wrote:
> Commit 1b00767fd8e1 ("MIPS: Remove PMC MSP71xx platform") removes the
> config PMC_MSP in ./arch/mips/Kconfig.
>=20
> Hence, since then, the corresponding PMC MSP TWI/SMBus/I2C driver is
> dead code. Remove this dead driver.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Wolfram, please pick this minor non-urgent clean-up patch.

With pleasure! Applied to for-next, thanks Lukas!


--DLo/ViROfErRTOk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcC5MACgkQFA3kzBSg
Kba0dA/7BCrPXz4DeCI+tF2El9apJj05+JpYKMEYGKcIDHUGVs8GE+CAvHarO4vU
2Uq1Q4L7e3/nTTxr+AoxzivTmTungZrK+m04/YI2K/h3sdnaxVsZISliTvA6pWzG
5UoBEg41KS8hZdRkQpiuduVFbwY8HMKhMHiYDFsG1NV/AArbDB/TMbmCsoSuiGvs
n+p8g3nDohx71c2ozOOIeYv8fl02d9pBdSlQhW2CDuZSu14o9Ll/jvcXEpvw8pUJ
kK/P9HsFRv6vtQ6bgsAEhlTEnvVjg/WJI3qgMfBevHisxzRGuOgos/1BXaCruC1h
4tESk/xVeig3ujLu+n30cmvtIVgjcgUVMnSK2yyvUXW+pKDPO046/MCyGup/zGu3
7NKJsu6LJPDE2nmvcNMUs5RK6AjFUzYzlhggNidWoc8FKMv/WEUVticklhdafj/3
RtAbtynOCl1kCrDX1RjPQEBwV4yIFPyyeWmNwfuNQyOSH8ZvWHkBhsnz2EkfCtPw
ue2tLiMVvVJbdpV6uqIF9BzNTrff1j0OoeYsOmZa3SHcX4fRni+CTUIw8Q3RnGFI
iKoSHlZtjRbGfBoGsUleLF8wmzqeUEgQcn3GjWOt84FBgBAtFFnmw8S+Byj8mSY6
Zlsn4NZOTniW6wH5DbdKkvrpSp+Xo3iJHSV5YkAzym8opwOK4S4=
=WI0P
-----END PGP SIGNATURE-----

--DLo/ViROfErRTOk2--
