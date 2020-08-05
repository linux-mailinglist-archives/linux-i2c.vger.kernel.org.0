Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3423223C7F9
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgHEIlG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:41:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbgHEIlF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 04:41:05 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C403B21744;
        Wed,  5 Aug 2020 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596616865;
        bh=zYySd6XvoCKRv4SDeEL7K7ZJ5mGuugPdtHM4h7nd6EU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tFqSH5aV7w2H3jkGzXz/Om89ztTJ87spi1KM2Q9qU1ByZTD9gW8cgY2rUMYO6qhly
         mipAt/F5Cu6BQulosmAV7deBKZljR+L4puT0eb3EyK7RSWwkaOD1MeyTYv1fnYQ2ao
         mlUjQM8gR7++TyG6U/UGmJ8co9FiHUNB/Ks1JfUI=
Date:   Wed, 5 Aug 2020 10:41:03 +0200
From:   <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH 4/4] i2c: at91: Move to generic GPIO bus recovery
Message-ID: <20200805084103.GD1229@kunai>
Mail-Followup-To: <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
 <20200804095926.205643-5-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <20200804095926.205643-5-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2020 at 12:59:26PM +0300, Codrin Ciubotariu wrote:
> Make the Microchip at91 driver the first to use the generic GPIO bus
> recovery support from the I2C core and discard the driver implementation.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Applied to for-next, thanks!


--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qcJ8ACgkQFA3kzBSg
Kbb4Ww/8CYUaI2G0L1UaRzOs6sZRMSSxgHuIpUzXkRhAwfyBwCoe/4GEcccJnWYc
j7k+A+23lrLSUHKQS4vkMve01lm9GWTcW6Wdbi2PlfIkDS+02u0A4sFvihRF/tyN
ubAp2Hby7Px1bfCxtTLXbFkyq5lmda3Rbb4oNo9eNAlCgwQzROUFSQUgCgiqc+jK
kucUBj7z2xazt8eFixn/XCrrJTsrBmGiFeyPINGNK6KUrUJE8wVxVBYxXLl2Xpw3
c/Wdd/GF0X+A5OtpIggnmgvRtNsnNHNvi4vWzQyYVJ0JY/C8BwuBzc8AVecHEiGa
B6eaXlPTPh38gseN+NKSMuZf/0MZ7uQEGq4Iwx2bbreuGOJqwJns1CYa0d3fdB2L
flMeZypzM0QZkH9JgbeR58w8B1oI/4IgUrv8tTYMWJJWvqg+pJavIyNHR3IqW23T
vlSKvFhUK9gwN93HjSPQohX07V3/XfIibe4KGIt1Ui5olWpmLJfAOSvmeMFSsj3T
QgIzG8KvaGmYG9f2dJk1isww6uqoHPh5RcU2f0G0CKMeoQb78BjasYuEeVOzoPD8
/j/LS+V+j8+7Gd/5PFK2g2krMejtJTJwdQy3wAVN+9GptvtVvHJeJJ54+ovRLYSk
T988WCHVwtHO2FI4iZRdZVlekItXjw9K9PcvF1dITkL5h3kgfBM=
=6HiG
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
