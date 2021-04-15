Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E0D361350
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 22:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbhDOUJ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 16:09:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235282AbhDOUJz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 16:09:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB98D610E6;
        Thu, 15 Apr 2021 20:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618517372;
        bh=e/gUe1PEZqxNuH4A9nYQSWV6y+9lQUySaH6Y23bYtsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Prw2VaGCHfswogZ4rloufawxncBWtI4QapaNxpB2ED/ASQndB91uazK1r1fNEqJZ7
         y9bA3LJEzocNY0vo5/GJxPN9pVh51gQRFIjIwFslctf5XaLjSVDocsbLM7aCvjo6cw
         3kKet9oy6dYFtuu9ARHRndZZT9Yi3hJw05oXItg5yLhkdg7T36pbg/5tgXDckn58rW
         Lmj4+r5/7Re9sMS3Pw31fWFpLZlF1gkmQo9dGFA5arpOmDgA2aV2oKR5G4AwuTxAiU
         k6wa8i+CH9U87j/3s0mN7HEPpUeB+g1NuFOZaR9f5GbRBkEfzhLYq2BkotDXcL9j6+
         89kIIScG12Hig==
Date:   Thu, 15 Apr 2021 22:09:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] i2c: mpc: Refactor to improve responsiveness
Message-ID: <20210415200928.GC2360@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
In-Reply-To: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 10:33:19AM +1200, Chris Packham wrote:
> I've tested on T2081 and P2041 based systems with a number of i2c and smb=
us
> devices.
>=20
> I've included some clean ups provided by Andy Shevchenko to make applying=
 the
> series easier.

Applied to for-next, thanks!


--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4nXgACgkQFA3kzBSg
KbbpuA/9GUAKGAr4Saj1JcWgv1ni/f/nIeao+b/K2FFb6IcNRkIwICYHKQHdNDg0
SaZVmR5fFDMuje0qfqWjFYAvbyQL1hKFC5KSjF4emi/jdQwY+L2CXegTGju371Rf
KkczdWXRIv9+x6JO5rn+KXyvvbg8L0eTg1UwggoBVdLCVi5FcppAYNgUNptWH/5L
C6rxzi3sq7pjHv+8r6EiWXGHG/s4apALrrn+hgeda4ki8fXdttnWz8ze9D1XCsg0
Iyv8BYaDU5CPQC9v0D663Kd1GUneMdzBXVFTJQG8a9YPkt2qe3y3qCyFvguatxxG
NBY5MN+NDE5gGkQRnAs44NAprP6dmTdRqFG/j0VuvKiQwJwRmsZAJeJ1C7ZaqIeP
ZEQpQcTFh+unJQHKjjxJQ1WJNgdHOiEHcSdkY7kWpha3k+Ez7L3F8LHi0AsbhbtY
KiIrhu8s3fL75P6LHokmLR97+291Mc6nmYuke9Xkp7x8gbaJJYHbDhxqRxODVxcq
btyzN8OqMAKF0PX3nOdY2oKeWVjXFNwZfcxDIZJE/iikkyQ2ieBgTMhAiOPMh6uR
CaXgMzVXYRLYopvmqUCEyJbS73DUoT1YR2O+sRu/Vv9CpHB0u0umJHX7qnjPPk+d
XBwLMT5uG9cLqMK13qf1HCwe9Y/aY1rnHVre+8PAmPEB8yxl8DY=
=YiHi
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
