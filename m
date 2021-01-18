Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355FD2F9F18
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 13:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389648AbhARMHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 07:07:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:45286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389047AbhARMHR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 07:07:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C933222BB;
        Mon, 18 Jan 2021 12:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610971596;
        bh=q/FYT+FiLtSjL+KOgS20Z7N04SjGI/P+GlPMtd2nG60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XFh0dYiGpx4oVbGvJ+staJ5LrwgAf5GdKJDUFEjr5UDoxNnGQBI8y8J8NlsPIufoO
         M6q1bBYN2LC5/GD6yVc681THbRJs0DoxBjd/Njx/vV4N1MidSMwgT4x+Cx4UaHMx0U
         iZLUKrXKNgLVV4Zg0WdTUyFWfhvA+OWu4kGLmWEkvSuDUT2vSBrToEL+k/NpcEG7hp
         W9yM1oYm1p2zy5KlUxDxHKikDgScSt86a27jsK0/fb2aLOYhE6mU+lpaFlfV9UZkgj
         CjRUGr4mF8pKErGOTyGEW8Sko6KzP134rX2uR5rKKvIlhLw0pTAr85K4TgB2cikoRc
         yO/Ye2ELoD7MQ==
Date:   Mon, 18 Jan 2021 12:05:58 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 18/21] dt-bindings: allwinner: Add H616 compatible
 strings
Message-ID: <20210118120558.GD4455@sirena.org.uk>
References: <20210118020848.11721-1-andre.przywara@arm.com>
 <20210118020848.11721-19-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Content-Disposition: inline
In-Reply-To: <20210118020848.11721-19-andre.przywara@arm.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 02:08:45AM +0000, Andre Przywara wrote:
> Add simple "allwinner,sun50i-h616-xxx" compatible names to existing
> bindings, and pair them with an existing fallback compatible string,
> as the devices are compatible.
> This covers I2C, infrared, RTC and SPI.
>=20
> Use enums to group all compatible devices together.

Please submit normal, per subsystem patches for things like this.

--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFeaUACgkQJNaLcl1U
h9A+Fwf+LAkNmQitmzhglYIYHsNeibirBy6k8yPJ2w1+MZulWEhOeDJvaqgbS3ct
4Q3qFxVZGkgzzsypXzU0iEB03Vzxy33H6J3QPfNqMhNQPQOZOXQho3xTuKgar9P+
qQEQDJFYL1qpMKz3+CqO4SQotdjIFEJYNd/O44cnTCU98AnHARvi32ajvs7+VzNu
HHKAsqKmQT4a4nPA31joiWxp2XAC7rA1q+KZ7iL5rWIKuJkp4pfkXK58QiBegXhz
CCCrggzrjimyFakw4WA6IWyTF2pE6maY0UyLrP9n6AHPC/DDIvalzos5xjC7KWj8
KsITNqrGnlImwAjQ5fSm/X1uTyqipw==
=MpJn
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--
