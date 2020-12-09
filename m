Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90CA2D4BE8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 21:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgLIUbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 15:31:11 -0500
Received: from www.zeus03.de ([194.117.254.33]:58646 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388540AbgLIUaz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 15:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=u2z400R8pY1xQzqzu92xvySPGOnt
        0dmG3UM3Eb+6PwM=; b=0fhxmhYERCqNfXWJ8p+6pj7rnsYve1u4dWllef6XQZjc
        ZElHuaR3UD22fnxzDpapaV6JG/cH+Xb/4bbANIYULv9roZQKjGedtP5qRtNtg2ih
        ytiKLTX+298l0MdypjHRBODwsignQRXNXAfNm9ZawJJWm0Za9oKGAfKDg0ITGPQ=
Received: (qmail 784576 invoked from network); 9 Dec 2020 21:30:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Dec 2020 21:30:12 +0100
X-UD-Smtp-Session: l3s3148p1@Stca7Q222OcgAwDPXwVOALKD11jTFrpG
Date:   Wed, 9 Dec 2020 21:30:11 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: sh_mobile: Mark adapter suspended during suspend
Message-ID: <20201209203011.GE3499@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20201013141201.28338-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ep0oHQY+/Gbo/zt0"
Content-Disposition: inline
In-Reply-To: <20201013141201.28338-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ep0oHQY+/Gbo/zt0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 04:12:01PM +0200, Geert Uytterhoeven wrote:
> When a driver tries to send an I2C message while the adapter is
> suspended, this typically fails with:
>=20
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>=20
> Avoid accessing the adapter while it is suspended by marking it
> suspended during suspend.  This allows the I2C core to catch this, and
> print a warning:
>=20
>     WARNING: CPU: 1 PID: 13 at drivers/i2c/i2c-core.h:54
> __i2c_transfer+0x4a4/0x4e4
>     i2c i2c-6: Transfer while suspended
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--ep0oHQY+/Gbo/zt0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RM9MACgkQFA3kzBSg
KbbOeQ//bUZtTqP1JwWvpwoy2UafHD5+g3obxDMjJM0Icc323RrvV9FjLneGYG0d
mP0aO9KEEFARLnnWPXfweo1+TOstoKrL9CThHWNIACLe4TnpAekBb1anR2NVzAtR
sLy1IaAtrPvf3uR1eHS6bxHX7FP0MtFKuCdaWEewPyXzDofDfIxF59epWvloiLVr
k6ZHmDGYUsCHLtP5Nw7jcPawwAVF91drWzBXjLZq3+gg755iPYEkyHqZGfCdZEdD
1VXUSUwzv+l4Z1pcmJwD1EuC3Wuwwc7VN4NabNjtl3EIewHFIL4BnGdGEAv2HF7E
e5gPOgzN/Oh4HeV2qnBrCw9QRxh0u53sd2Ejx1Ew331hTJEF1Se/J7kjo30ALuWp
Bn2bfJtYG2AUaOP1dcbnlLMyTJFCt5VaMb/n0YfjAxHmd6ceMJh5vNnXj6Ah/4bT
WPmf/pK5NTkAkEkWkSUPENYc0QATwSwj6a8J8FGv5EwqyN53J6gCpYE5cDLBk2in
lrvyOTz8Xvs1AI97X6qihct2JR8BeRaDigDqT4CS1/fFCQiMvu4rMP9UK9oZf9/S
NmIUuW1IRjiX3MD2G6p+ClcwTuTaUB9McxgGmTXRSw10P69zSIMhbtjFgFNVuNXj
9QmNibY6MpvK9U2yRYzgIxi5xU5HcbFZfMIM2gd7C2hl5o1OrA8=
=aFWS
-----END PGP SIGNATURE-----

--ep0oHQY+/Gbo/zt0--
