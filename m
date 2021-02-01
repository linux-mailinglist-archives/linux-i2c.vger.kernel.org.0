Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFBBC30B280
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 23:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBAWEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 17:04:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhBAWD4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 17:03:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A91364D92;
        Mon,  1 Feb 2021 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612216995;
        bh=SD5hcJPKXw5+XdYGFxyx1vpvAOsqU17t1KZiL1O3Ilc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mLitDEYNbSt+zZssJUpc+OtPhxKX9OO//VOAoHOi7r/1bG0eQtRjMlEGTlr/ujWJ7
         2YiPME/PTSLW92plKj3UIi9UfELFaS9DpWhbokXjzj0Xgd2fxxIfwNcpK1R151c2Vs
         uB/1K8NDKgfX6lLdmqsCAwl3/g4mjm5NFSCpiDDpbZr5fyDLctOrXuZ6tBmPo8YmqN
         SkMhWZcM0oObSLC5ybWXq8zDpjW1owaF9FRk33BPhHbz5D96xFwW9VoheMwqU7bq/o
         yxY3mVwlgg4fyKcfw/apBQ/9SMKjzoA/c/YW1GlL/i798HOOycRwUw77r617Bjzjut
         DKDQvGiP5iVzQ==
Date:   Mon, 1 Feb 2021 23:03:11 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Richard Neumann <mail@richard-neumann.de>
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, andriy.shevchenko@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: i2c-amd-mp2: Remove NIH logging functions
Message-ID: <20210201220311.GD24315@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Richard Neumann <mail@richard-neumann.de>, syniurge@gmail.com,
        nehal-bakulchandra.shah@amd.com, shyam-sundar.s-k@amd.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210201175138.8986-1-mail@richard-neumann.de>
 <20210201175138.8986-2-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <20210201175138.8986-2-mail@richard-neumann.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 06:51:37PM +0100, Richard Neumann wrote:
> Use pci_{info,warn,err,dbg} functions of the kernel's PCI API.
> Remove unnecessary ndev_pdev(), ndev_name() and ndev_dev() macros.
> While at it, remove useless __func__ from logging.
>=20
> Signed-off-by: Richard Neumann <mail@richard-neumann.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

$subject looked wrong to me so I changed it to "convert to PCI logging
functions". Applied to for-next, thanks!


--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAYep8ACgkQFA3kzBSg
KbZP6Q/+IdTaOU1Tino6fMC7XzPc6AuY7SouD4qGDUYIM2gXCSaNoz60MV9Zr93v
EP5d1rXn9EmDvF7e4hr9oPiP0lF2TGxgWrOiUXDjjt+zNLXz3uBUL3jdwmhxVvK2
yABZAXjcchAFjxqq6eGzXMvrrmmQlKNITrMTue5COx15hv+2ZSOQ3I1cL/VTjJ6q
lhNCEeQQaSGFnmIQr/Mpz2xdfz4VTTqBXi+7q1Yfi6jMfvO0++QeUdG8U9XoC/G2
/0n8FcdNERDO4AFTR0IAEuwKm2Ta5JycgU3NknP24SBVv/d4vo3JdzpTTW+fZ4R9
ZObGjLRCKdix1o0AvybuHLcck4zRGDV7ESiIaSLN+QrYBbpqf8jsBp9sL7VnJOiw
GVI3qSYK1CCFfsL5tvrxuRZ5/Wohdv1/OPwtK6rUV7zSVfox16g6L7fx4kO/chPs
zTbODDS+4oAnKx/m6efQam0COGs02s0H4TII99j4ge9qxVlrctIvukFf2gPl1p2+
jkWZfkxiUZrXejwYYys957CC9EGt1ecdVfiden0nHO44Bsp06/1EaDqngjhkGL3W
bHjF2Jpzp9WbAmxy1Qgq5KyNR0uFLNyMsKYAj0NrrbVoQSe1BzRrgLZDBZQMM32a
JaOisYxIeBy8NWlYm7fUpTivQFcZafxCkvsmVVPddC476jMQjps=
=L2gM
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
