Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E64639446D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbhE1Otz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:49:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235094AbhE1Oty (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 10:49:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4D4E61358;
        Fri, 28 May 2021 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622213299;
        bh=SwJdgNshNRZPwIkxK9rFKXFmAidu4YGKQaA5HIZ4jhw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mDlFcysdjUl6jtKNuJYRayL0fV/sxbR6XS1S84DUq0kPkv9yIooHLIrpeTlbw9L95
         DIlGEUvDrb8Hv2LfGtcgXHj+G1qxA3rwaR41X61qgNLHQ68JV3v47qyItRPfVuJgwd
         1TwGrcbQ4qD+2wMtLh66v4UEdVrHOyN6yDbs0SijVuitbJ8rnf6mYZ6LGOj3b60yBA
         Xkt8SCmDEsvtsFvtZwIn/uNmXUF1WhbLeTMbkN+gaBxwS87JBMtEBcqhGnNfUfheSQ
         ATgyfpN4El9zaE7eGZqr33L6vgLpXpVItqDDiH9DdJB3iWfg3xbNsttsh7489iTXX4
         owIPgNKMAHlKg==
Date:   Fri, 28 May 2021 16:48:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: adjust to removing i2c designware platform
 data
Message-ID: <YLECsC9y8ici47Ln@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
 <CAHp75Vfv0FQGXrmpDveOf-cBahoDK3uSPHjPU2RNh6mhFxN7vQ@mail.gmail.com>
 <YLD/ZQiX5VhpWJg7@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pDHXYKl0a1W6Q66S"
Content-Disposition: inline
In-Reply-To: <YLD/ZQiX5VhpWJg7@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pDHXYKl0a1W6Q66S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Remove the file entry to this removed file as well.
> >=20
> > Oops, I was under the impression I grepped all occurrences, but I have =
not.
> >=20
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >=20
> > Thanks for the catch!
>=20
> Wolfram, isn't it forgotten somehow?

I can pick it. I refrained from doing so because Lukas explicitly asked
Lee to pick it.


--pDHXYKl0a1W6Q66S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxAqsACgkQFA3kzBSg
Kbaa7RAAmRo/0qxgHI44lfwfEMDBQuKDf26iLB2BBAjE+DWLEOVGlIUfRPjWfvK3
YeWquhl7nrL+gWbVLWqCs0U9pPOMP0jvEt8RIj9JuxUINSe/Zdk1+x+BZWCroQYi
00auiTA4qEniT1oG4PNeb99qKM0uLsb9ZtsJQp+n3QNrxuPX2Lsh4pqNFwhW5KY/
zxumLelM0GziggP734cMWZc1qWfpSeKJpLecC5j4F20FTITogeNQ67CGbSibYSp5
9tt7jVTQD4Q7AsnuGNZGg9H9lrGAj0dQqtbl0mcBgZDFl4ddnBgVSGH+pgMXS74E
3jwJ4NzVwBcg1CYXjnUJhLj8NAxfmPBvu6ouYwmhCabf0CRf096Ihg9tCgpvul6l
ea9LYfiDdX5vYaFl8ANlurlKb03tCUjB6jvZW/onZYXpuLIs+UW9pvPfnPJfW6bz
sVTMqfCray0AleSmGVjNWwY7LIHDgQyFf9oQO0xQ9jJB9bU0piJFyWdcYOJLBtEi
OwcymTfrRw3K09j01tZHBlqWA1bdde0sq48OXGUsh3EkFmbmW25jLCGLWk/m87Mp
IorZxSzPTWkhp7X41pg7HONoq6Qp9k2wm8yZ8GaEcvcDglCTZMtxKbUyS5J8rLNR
Ekjqu0I521h3mUJaJfHB9IyNdZQDeWzJ9BcfkaZ1bvRxb+mN/cE=
=q2jn
-----END PGP SIGNATURE-----

--pDHXYKl0a1W6Q66S--
