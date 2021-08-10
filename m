Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7D93E84F7
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 23:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbhHJVJe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 17:09:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:36864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229582AbhHJVJd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 17:09:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A55C160F55;
        Tue, 10 Aug 2021 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628629751;
        bh=N+y0Ib3nB0HIOVlUv1cNjmOALpuYktMVSuK4FCr+TFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SdPv7xnpU/amHpU4nx0K1W+22Jh042xkVEUQtzCNvvizK/Zcsb2Xox3jl7tLDGfDa
         2WqBv5i8wqHqv1azoWhd6YhkUGCUj6cN288/8dSRiUvGvSw3iB+dAnxbNzZ+9VEbkB
         As8ekGisX+jBnKehC2N67u1a2Q11iGx8TTBdKoiuNpyMP6gQzdKzNwFZfscybVLBQQ
         WpMKsxYkPt2cYYr+bt2Mf/ykFNFhbvEZLh2Z7/TQfd60+WMYcFlmLsdtzN4dCULcGi
         96IMn9NeD9HsGVQUtNyRHNP5/O1VtO4cvWil3LA5NtyF42bSemA3OC3sfW0q9kRX5t
         RT1/UgUAZoF/A==
Date:   Tue, 10 Aug 2021 23:09:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     codrin.ciubotariu@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: at91: remove #define CONFIG_PM
Message-ID: <YRLq9ClCMZlApNqr@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        codrin.ciubotariu@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210705121516.622326-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yMdhhDsa+5QlKnsv"
Content-Disposition: inline
In-Reply-To: <20210705121516.622326-1-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yMdhhDsa+5QlKnsv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 03:15:16PM +0300, Claudiu Beznea wrote:
> Remove #define CONFIG_PM and use __maybe_unused for PM functions and
> pm_ptr() for PM ops.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Applied to for-next, thanks!


--yMdhhDsa+5QlKnsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES6vQACgkQFA3kzBSg
KbaUCg//a2wHKLl0xDRcJB2lIIRRoz9h9yZymQd0SRR/KnPfV4c7NyC6u1q8PYCu
26ZueLJNrkZScENDmxH3NWDDE7zin24FTBRn63GbxwI5w6eHjHhsezJiMEVULqL1
bZSfB4oUuiJqd/32AuKJJ2e2ug1X8qSaZA0QPu/AWyLb7v/cq27cOrOI2zj89cNm
PsAijmiCrl6hfg03suCAZA+dqLHd+TMwDWKRHitDYbYeUwp4h44OAd1gYjAaC6R6
LtaFN1S8y8kp1CYkbB7k+O4K1I40rZKoWqOL+o5A8s71vV5RTpwIU2H+yhWT2N8E
SQwutt4Buyj6hMdKhcpIgHTbnluGNlJ9mmYdG8MAg6PGoyrL9xaZe/Rw0t+J6bSG
59/fK2B+CwZSA8UpeAN9MiDDG4ZhXgaNtMc83sRMWdR71Ns1K+WXxlLMPLi5bXYQ
ucxNuGkjKJocRRTz3WQUDwQSROKm1QmILOFhzsDZP1y5gfRie++yPUr0/pqL1YPR
zBVz420zDxNkpJrkOusknGdd0zEN8r94I8Iyph9ixRgPyqD57YOwh6aD/fWIpksM
Rzi5E7ZJLmulvcn+bEFvJi7vYcT6udmziUueklc8lMdfeoKA3zZ5c45Sj5VYXd4B
UUNusyAawGPdBkdBecCJm/EtmV2W2eJK8zTOGcrsvhKO/EtcrjU=
=YqL6
-----END PGP SIGNATURE-----

--yMdhhDsa+5QlKnsv--
