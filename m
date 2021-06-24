Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EECB3B3779
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 21:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhFXUBN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 16:01:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:41750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232554AbhFXUBM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Jun 2021 16:01:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7ABE613B3;
        Thu, 24 Jun 2021 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624564733;
        bh=fiS4onLy74TZFhJjBt1SUXmu1BzjLf+B0VLAgfbZnlM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RLop2xxIAYpwLqQvdjg05VjLbfHz/U0kTTIak+DtduLg57CdnOWA9+MBuE7NwciQH
         9L5GUhmEDy1ELiHSkYDWnLCOJ8izr9v4tIuauTo2W+INXVhXoPEzDqb+D2FtEqG5Iz
         AH6o16psRLhswTT5utlq/zzb/p1WfDC42nu802eATFUuxR0m07119zytuyzXosT0UH
         G0X/KvFYJ2NLcvLElkf2Bi7ASvuIrckEXnJeEJQ+8+QSvTMh21fnDCnP8sH7yMguXA
         Alc/nLVHYgLnYJ+mrX6TqFm0Jdat+zR6BujP+98E5WLUntsL0HviLBS0gfTJGZR8hq
         6llo6wRH6/jsQ==
Date:   Thu, 24 Jun 2021 21:58:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Kwon Tae-young <tykwon@m2i.co.kr>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c/imx: Fix some checkpatch warnings
Message-ID: <YNTj+OIox6X2gjpQ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Kwon Tae-young <tykwon@m2i.co.kr>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623083643.395-1-tykwon@m2i.co.kr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xKVUc1DBTSjJTp3T"
Content-Disposition: inline
In-Reply-To: <20210623083643.395-1-tykwon@m2i.co.kr>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xKVUc1DBTSjJTp3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 05:36:43PM +0900, Kwon Tae-young wrote:
> Fix the following warnings reported by checkpatch::
> drivers/i2c/busses/i2c-imx.c:173: WARNING: Prefer 'unsigned int' to bare =
use of 'unsigned'
> drivers/i2c/busses/i2c-imx.c:175: WARNING: Prefer 'unsigned int' to bare =
use of 'unsigned'
> drivers/i2c/busses/i2c-imx.c:176: WARNING: Prefer 'unsigned int' to bare =
use of 'unsigned'
> drivers/i2c/busses/i2c-imx.c:177: WARNING: Prefer 'unsigned int' to bare =
use of 'unsigned'
> drivers/i2c/busses/i2c-imx.c:455: WARNING: Unnecessary ftrace-like loggin=
g - prefer using ftrace
> drivers/i2c/busses/i2c-imx.c:602: WARNING: Unnecessary ftrace-like loggin=
g - prefer using ftrace
> drivers/i2c/busses/i2c-imx.c:638: WARNING: Unnecessary ftrace-like loggin=
g - prefer using ftrace
> drivers/i2c/busses/i2c-imx.c:1170: WARNING: Unnecessary ftrace-like loggi=
ng - prefer using ftrace
> drivers/i2c/busses/i2c-imx.c:1374: WARNING: Unnecessary ftrace-like loggi=
ng - prefer using ftrace
> drivers/i2c/busses/i2c-imx.c:1398: WARNING: Prefer strscpy over strlcpy -=
 see: https://lore.kernel.org/r/CAHk-=3DwgfRnXz0W3D37d01q3JFkr_i_uTL=3DV6A6=
G1oUZcprmknw@mail.gmail.com/
>=20
> Signed-off-by: Kwon Tae-young <tykwon@m2i.co.kr>

Applied to for-next, thanks!


--xKVUc1DBTSjJTp3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDU4/cACgkQFA3kzBSg
KbaMsRAAjjoZ0oTZauLvAtVL+zarVERUz4QDv8gPOQuhLVMJrdiIL4ajPoL4XXgU
s8sHXpLWRL/a+q4f0Dx301UGRviu+/zH3qhoCTlzLRlP4+367QsGmGUlIxqR1nIQ
Mml+qqxx0R2i9ziW12n3jBB4JJU6Rk1jZSIJ+FrRHmPSusqsW/G8uGoUDjW2EPuP
AUN8QuYDFlZCfjV8TLxCxMHoKKUpGKAohWgp85YqgHDaQPkEztHRiB0HU2hi6IjD
K1ORqKKtP8WypgFeq5EMemTAheSs8XkKAlPGtqt4d1e2+i+IQdRW3qspujHkSKNj
7AJavB3N03EnOhgl6d8aGWT9xC6EOFVUfmAIxlyIbtszZAeARmdyM7X5T9z++8hR
3StM5DY9Ww31N8D73ta8A9IGahXN5sGcsBkR0HDF4ku8PKQm9JD8DjBPGEltJ0RJ
6AjQSTW9ShvsbFtXgwoX8W3EUg4AojdIHh4Qimmgj6/vVZH9OGkry0YKQAjn/6BF
03yDHf7xjPxL0H+no2kdRLLzuebr2BRKJk73wwvfcfpg7qL5v5GZG6RL+59pcmW6
pcgcIwNgaqG+ifXvp6vmjpVNELmjGhPMXPl3tHu0YCj2NtUicIndwmoXK2pHchrs
mWLpq3NtfGM77Wr1D8RIC9lrNCxBvjAc2SQlGDnqzGeVlr8FftI=
=0Xo2
-----END PGP SIGNATURE-----

--xKVUc1DBTSjJTp3T--
