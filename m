Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB8E1E8BAE
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 01:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgE2XDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 19:03:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:54230 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgE2XDE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 May 2020 19:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=M6Xmy7VEop7xbEB/j1i2UlxAFThr
        d+scyFq2haNJy/4=; b=oxbqyj3S5a0FZ8DRW3YnnyEeHc7jvKP5j79uziKU6k7V
        ndGtI/dNtUPrS0aJDCVvch74Tggqae1I/FyXd0aYZ5gOuW1VsNzNCcAzTpeUsgco
        p87U8KpibIrlodAK27cLzUST9/THwOLuV4LZYWLFzt8LfPoHxNiXkWT3thpqOKs=
Received: (qmail 4070136 invoked from network); 30 May 2020 01:03:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 May 2020 01:03:02 +0200
X-UD-Smtp-Session: l3s3148p1@3DFxctGmgocgAwDPXwezAO76a1FOKXJM
Date:   Sat, 30 May 2020 01:02:52 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Subject: Re: [PATCH] i2c: add 'single-master' property to generic bindings
Message-ID: <20200529230252.GA4798@kunai>
References: <20200527113039.5380-1-wsa+renesas@sang-engineering.com>
 <20200529220228.GA3052199@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20200529220228.GA3052199@bogus>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

thanks for the review!

> Could you just have different timeouts for clearing stalled bus. You=20
> know quickly if 'single-master' is set, but have to wait longer if not?

Timeouts are a difficult topic with I2C; there is no timeout defined.
However, if you want to start communictaing and don't have a 'bus idle'
condition, then the new property makes a difference. With
"single-master", we know the bus is stalled. With "multi-master" it
could be another master communicating.

> Note that we need to add a bunch of these properties to dt-schema=20
> i2c-controller.yaml. I hadn't done that because I want to dual license=20
> in the process, but lots of folks have touched i2c.txt IIRC.

What is your motivation for dual licensing?

All the best,

   Wolfram


--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7RlJgACgkQFA3kzBSg
KbZnpBAAo9lcFk2VuZPC7KmjjcbidfWBD+LlhTSmF01RAmljKNei+gepgB4ViFbI
7hjudNqsAhRuNZx3LgYIQ+SuEa1w3KWbX5sn1fuoDJmRtM4G2Jlp5ZN4gEKE+18+
DYPSe3ZYE+VbSZPdMrrtC1kLi7cdT1t0coprJ3qt2C1QEVX6xbX+SlAcrRHF+got
UcChLnmpMfvXIXQR8gvmxDiefZQ0QjYw4NrybilWyRiSdaIwa9GaK5F17zgOK107
tx1/HPZvQ+FOs36m0wtinPrg9fAZCxOUluyJ4J6XxFnoDduxDGegSh53PCsy/5Nw
5kSgGW8U1jFMwkplKR8IshKQ+tSRTon2vI1NHALZB5j+zLakcgWNsQbJygdy2AQV
LGYZ5x9M09mhC/n1b0l78QQYOVSPa7bcFVxSRwQpLDeSLPRVE24MOsJJXGwd5gGW
KLdwo+SaOgb+rDVeaOTXeXAhMDs0UfycFSpMC0yheqg6xEoPen2glsAyBB6ZNELp
r8rHXOvW1OXkKZ+iL5EoJb3WHI4IzmX5KdpM4rxyumppMF5iDW/PoWTNNDn+oE7G
xb1NHCjgHvhQqPyVl7CI12HgU1uqPWI/2O+28Iz5jCHs/1PsRSDT0vPMul1mrLxj
j1p8B9jSin1rt+JoacUlubOLHGx6eBitk4AZ2CgnZgfCk5kS+90=
=+qV3
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
