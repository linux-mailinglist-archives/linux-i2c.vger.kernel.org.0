Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA6D3B9D20
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 09:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhGBHzn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 03:55:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230023AbhGBHzm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 03:55:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F7CF613FC;
        Fri,  2 Jul 2021 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625212391;
        bh=zni3rapG4sTUHE5KRluuda3l4LzR8mdlFf/AW4q4gX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G1J2lAWRymMCPEXv2PtBh35jYdNb0iYmBe8ZrO2o6AEIhzxXQA0FVWU+aqLbJrJhZ
         UmU2x8FtYEQ7rkkWh2D7uWQwtp9UM2a37tWVLRMosUlMXVVpULQg0Tr84x3R6ThqfY
         q6B6/8Vhn3F63a6H8h0qgmy2rV/JBK6a4YfRLGSDUtR7QEYll7CvWNx3evFMzTUZHy
         j44p4bVuHuQGmlvcMT2PleWcFHFbyWGHtIkxZg9mtirl3o7e6gYVMCZSZxWWfWz5nx
         fhXBdxkbPSucoABAorRWT9P1u4EzAlCF/zS/KuYU0zjZF6B156T48KZrmZTqmBgU2L
         t0PtdPF7lUJtA==
Date:   Fri, 2 Jul 2021 09:53:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mpc: Restore reread of I2C status register
Message-ID: <YN7F5Kv6NbD/6GBK@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210702032724.4370-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hmLvyWhLalKJBbfH"
Content-Disposition: inline
In-Reply-To: <20210702032724.4370-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hmLvyWhLalKJBbfH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 03:27:24PM +1200, Chris Packham wrote:
> Prior to commit 1538d82f4647 ("i2c: mpc: Interrupt driven transfer") the
> old interrupt handler would reread MPC_I2C_SR after checking the CSR_MIF
> bit. When the driver was re-written this was removed as it seemed
> unnecessary. However as it turns out this is necessary for i2c devices
> which do clock stretching otherwise we end up thinking the bus is still
> busy when processing the interrupt.
>=20
> Fixes: 1538d82f4647 ("i2c: mpc: Interrupt driven transfer")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to for-current, thanks!


--hmLvyWhLalKJBbfH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDexd8ACgkQFA3kzBSg
KbYEqg//VIs9RClz6RTB43Y3a74uSUHoqtGL+YmqmOrBbJDa3P+3C8602odZ2nLg
/6vef5xRplUEpqNMjwQBP4QaR3UjH/bLCJyE7P89donoPtfU6UlA5GfJqi1dPBeR
YnY6/4XN004aC8aq0bNlx/tcFVWW9zNyHA6Z+T7kq+3Eh8nCfgIQ4OWYKNK/KKyk
HkDT8oX8l3gh4x/U19N+9gkgVbFuBDPl+yLsGQb2s5pkulvAFVZuZ9QiYm+AiuDA
V0d+EF59LWUtWYg3KNare5iGhfycHJzCsgWBJnbBFo4x7wnaprmdOZ307DLFvChQ
CLKOKltLq57oX4BfeAH7vg9rtj7XW7vI9Z31VxUFxDp1BB3+Zq5CG5rkQFvrIBmS
GYGaZ9hLjRFxGGKnEbMaU2MJAyM5s/6caRfeRwKjloTv90pE6beHB6RmV2y2Hscy
V7OJr+f4FQPowEma1qGfc2y9uH9e1s9b5d7ZKLWWpGt+Cz9Uj3aUQshYpDjB82Mj
zC18PoMRqK7CRJ+UZsJvWV7aKo2ySLf6m3w+IAdj5lkwzQTQDfjIWm/rghv/m83g
rywJf2pYsud5UynHLZ+3hlDnF5UB+kx1LVSxGnfu0F2A85wlw9XyZ1vvu0diIQ+Z
zQcMv3ETiQYrk8qsMfG42VcLDdt2mjlPBD53MIA4VetK28awsK8=
=+/Gr
-----END PGP SIGNATURE-----

--hmLvyWhLalKJBbfH--
