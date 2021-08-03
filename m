Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A394B3DF69B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 22:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhHCUtZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 16:49:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:33770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231519AbhHCUtW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Aug 2021 16:49:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86EFD60EE7;
        Tue,  3 Aug 2021 20:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628023751;
        bh=KLGGzLOD3Np9VfR+5Y8F+AzhsIE4DQ6jDoU+vHFfdp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=db1fNMDeV8zb07KGh7nKlFdW5oe0Bv5vJSlHIhqzbpVAa9iaU9dIR59GdySTngk5J
         85Ns1xkIuFG//n12vekPJreXvM57gRlAxlVykSu+onWHGQlm80DDs688+mb0Xye2Wk
         mdnuiwg6jz6IO/c62dKRO7cjLC6+rqydd183vMpBqLRqdQ1Cr4cGMHcAUcPtf7UYkx
         UHX2h/B6l/ZSTXeUKq4a9WyFj3z2wltHccfJQxyHDPc3vlnivlCZrXGlv/j0ulrIzz
         jlVX1EhQS3/Eauk9uftIZIbpaUVZdY03K7oqdhKqXFrrkxJH00WlM2DGka+Oah0XMt
         0njvm7IgaDGaw==
Date:   Tue, 3 Aug 2021 22:49:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: highlander: add IRQ check
Message-ID: <YQmrv+0K3vqFuVG8@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org
References: <4be958f5-3e6c-e536-9d51-1de8664ccaaa@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/3MMq3k5gRV9mM1G"
Content-Disposition: inline
In-Reply-To: <4be958f5-3e6c-e536-9d51-1de8664ccaaa@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/3MMq3k5gRV9mM1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2021 at 10:13:45PM +0300, Sergey Shtylyov wrote:
> The driver is written as if platform_get_irq() returns 0 on errors (while
> actually it returns a negative error code), blithely passing these error
> codes to request_irq() (which takes *unsigned* IRQ #) -- which fails with
> -EINVAL. Add the necessary error check to the pre-existing *if* statement
> forcing the driver into the polling mode...
>=20
> Fixes: 4ad48e6ab18c ("i2c: Renesas Highlander FPGA SMBus support")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20

Applied to for-next, thanks!


--/3MMq3k5gRV9mM1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEJq7oACgkQFA3kzBSg
KbYMKw//WEkAHET2ZRtZvS5bktZkYNWmc1dZs/kCMw0U+uUj3vSiQtjN57EUvDTs
i7aAQpH2GlJJgkPQrzHdU979T6C4xm8/h048WE/jO5ziAPcEYpcEzQhwY4E81KWF
ECeqIgI4jtnlFWVnwRAD30saso0qpc6TRnP4cLdk36O5l/DwUOoG9R94a9NoTdey
yGSJ5jioJGI+JfvzsxJRpzQi7tumaeMyfJIy/+fFxPE3uQEw9VkfEpExHI8W0XsN
OukOsPqefmuIf9tSrP3XXOS0UB9J+RDoNjglwPsNGqgcIAostTtuio4nG+urR4EQ
R4x8MGLqT9Z1PndVHhgQNzMMo3dzuaFookoda5OcY6hi0LwB14fkqxLJaoB2wX+P
mI3RWEeV7CEFpwbjVqwQgByr/9gt4TfdoaVMcJhtD7E9sC2bVNGu+bCzYPi96GSm
7/TJ9AS0xTFuL9FeaGXXByJUcBzmvGVTKKSWs54CEplAgf4jIQy+bHmXPhVIZi4V
/rmMFLiK2xc3Cjg6kkMci7uoMSJydTHRqWSoBuk+s7sSbGKS9GMJriEmofoG9FmQ
SV/I1DmDZMkKvhuXpVmHEh0A53CU6kusSNbPfxu4p2/jyuaC/+rWfXxhGjxP62nP
vUHUdyHMT5OlozLchF+e0YxaJaIkBPnP7Iihh7ZZtuGvZp3WY84=
=vzh3
-----END PGP SIGNATURE-----

--/3MMq3k5gRV9mM1G--
