Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6C123C7F1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgHEIke (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:40:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgHEIkd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 04:40:33 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 558FA21744;
        Wed,  5 Aug 2020 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596616832;
        bh=1I8PoQzOBFsAKCKx7INAo0QiWfPvyGc/mgQySNIEmgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mHYzd6XSFOg6CcROMgT6Taq9U6v+sgJoBI+jd3kfkB4vMn2GMbb+jbf6ZWe+oY1/G
         8VCIxk+1A2N/MuVUk5Pb1uKm9EXyRpz3GPEbyBC8tquasHyC/+bM+TVbFMLhNWGB7x
         qIAe2E4CPqnRttwexbvAjKSGvxP4Kaz0gbdzryZs=
Date:   Wed, 5 Aug 2020 10:40:30 +0200
From:   <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH 3/4] i2c: core: treat EPROBE_DEFER when acquiring SCL/SDA
 GPIOs
Message-ID: <20200805084030.GC1229@kunai>
Mail-Followup-To: <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
 <20200804095926.205643-4-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline
In-Reply-To: <20200804095926.205643-4-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2020 at 12:59:25PM +0300, Codrin Ciubotariu wrote:
> Even if I2C bus GPIO recovery is optional, devm_gpiod_get() can return
> -EPROBE_DEFER, so we should at least treat that. This ends up with
> i2c_register_adapter() to be able to return -EPROBE_DEFER.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Applied to for-next, thanks!


--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qcH4ACgkQFA3kzBSg
KbZU5g//UDBqMpzb9kiNknhGEQk4H9HZ8SGNMcSwcBydPHu0bC2RrVvcCU0ptkRM
Puzhx6CBQmEaZybmM1NCuNLJ6gUoCkYnjYKv7d0T+kxmPjPe5zcHFblTr8ZYt/xf
qEUrKotUTSyivKaEURBOVzKAKHAH4xZ6r4tTXQByLvsnT6TiNDchoA23DH+itk79
afZRWpnWRooEAKYtV3jCW6z4YzXuLGQQnkYBfZTITW9lTlXkLEXXgKj9i9FUrpug
YsfKvVMsHa49b1mc87sb0GPKaFfLzd1Fdqq70YeOQcdTySsmdvaxoJUhioMZMBue
3a4eg6B1pKQUmZOxbv6Jbk4LmF+n1t0K5pR+j7k1F47P+6XyMzFN6DE+Wf2uUqDf
hpveby+d2KtxhstPWFVqXJ2ufUV61+Puj3AF16E5T5txx1tnTjFXjNBa146EZNWX
JIKfovIqWfEZrIxiPkbzvdCToFw6BwAIbRJ2N6MnlhJ/gKET36lwva1jPy6Mc5X0
rqJjPWCTnoJTasiSUEKhMVAP32efOsGbjMbnlSSHJ7JCEOxY8ix+Y9DnuQHom8eO
Yvm6n7HlYIxVwLHLMLGNpTPakade65dXs/fjYkDQXIx8YFDQnNzDzo97cHcT24Dz
CrceL+pP8OIau1IcSr+iBqgOTye/3FKd3UjbHVOb/gcRfVFvxrU=
=yo/Y
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
