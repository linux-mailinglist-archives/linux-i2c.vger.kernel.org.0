Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256D035742B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 20:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbhDGSXp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 14:23:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:33514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232236AbhDGSXn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 14:23:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DAD761132;
        Wed,  7 Apr 2021 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617819814;
        bh=fMjL6hXJEewn/XcB3Z+x9/7LZK70MuI+vodu2d+wPBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=soWQEiyYqie7YItlQFAIE3vaSoySAtuFu38CO2CMo5u30NaDcnRc21Fx9rkcZo1TE
         AuZ26H7cBLcXLuGkiDVepUUH7t6rVOURktWg4NUy4ZP9H1iHTdbGRcLLyJRUVFumh+
         dcteb8t7Cbd2OoETl1V96CevaumwmMxCR4TBPzSe+ixPZ3uqSFOW2UNVi6keqvp4PG
         jYcFpxcuVfFFvhJG3rSjASz/iJx7Ny0CFJP3rgROWGnxPJQTflEuPJGISLZq2vDJBK
         6abAc8OAyn5KXI2fyTrI45tVOPphoO8yQln1kmyHgr3+fYVf/4Uh1dvqJViqqzo5mO
         K/qo1F8+fj1+g==
Date:   Wed, 7 Apr 2021 20:23:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] i2c: imx: drop me as maintainer of binding docs
Message-ID: <20210407182330.GB1614@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20210329192409.7313-1-wsa@kernel.org>
 <20210407181804.GA3993883@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <20210407181804.GA3993883@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Either revert or add me if you can't find an i.MX person that cares.

Ok, I'll add you then and send out the patch in a few minutes.

> This would have been checked mostly automatically had this been sent to=
=20
> the DT list.

I am sorry, I will make sure to add DT list next time.

Thanks for the pointer and for stepping up.


--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBt+KIACgkQFA3kzBSg
KbZIRg/+PG4zSn1lBpE0sezrYMLroAdDjGqw+NkOEbfA1/pfxnWIIsVerUgdabgj
4ykM4bq7BD7B/wczVKFA2+e/wolpawGG3xOuK79Pe9Nou+3Tve03lGQIamaLmBQi
ULlHP1rwzgsccwuUWWErIibSCQHfELUSEZP7QPqSOwIS17VkoMjey9le2E95aOD3
IsZmlb34qyPZE0lUHwwJdLiF8gUMfeQXkd34qUUlyZCNM6Dc/6UMCUO5sFlq3b03
Lk6wh25Ls3EJGt7tyuJ1Otvmpd6zRdueZIx60ecf80+0ga1EWyb7KsXpaO7X8UlC
5muQFp3gsJt1m6T8TIXAyXaT1xEeoHuNW9hQZ0saNVvMhFUo4gGCr17jjBfJoPSb
Vx/IJearaHg0r4rWjYIRU4bAVm6x+dNV7ZBNXTh0XX9NfPVq63WyKPdCzK97lwN4
XAi3du1HkQsJGHcKb8pD6rxUc+v35hx1nIQEFvB1AgXPlIU0ANR0rb6Y1HDfzUSH
uCx7l08MWl9joIarz5smz+FhNTAdb0Q7A9Go3wW4hz48+9XwvXtHUKuNzcktcXg/
m/A47XS3EiRIiXRyp8wdFpR0f96iNVyCmHjn+vG0tO0XJJggImp7WgzKFEREQjeV
7ofjUIXskdULjBg2fz4m2z3EJesmHKGn0Qxi9PzPc4litzDyTwc=
=bbRu
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
