Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E0723C925
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgHEJ3Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:29:25 -0400
Received: from www.zeus03.de ([194.117.254.33]:33090 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728045AbgHEJ2p (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ReDQTRbquzPkYiC23U/tmRuZTyBU
        I27uSILaz4Gm+Jk=; b=NHHoJmt/weHT6991tnk0RDzeftxJIHEww8hOuE1hC7FA
        KHLQDcB/j/LgxLgcBpbZlRuhx8srm0jZlmHD/W5yfJygQH1GedOs9uyUuEYpuqkj
        6QfC7Ly3X96AdL6HaOEAksZLC7HUaiS7lhqjEhuD4Bxlsv2L1IPMMrtMYiKUT4M=
Received: (qmail 2984317 invoked from network); 5 Aug 2020 11:28:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2020 11:28:42 +0200
X-UD-Smtp-Session: l3s3148p1@0FNq/x2sSOpQT+F6
Date:   Wed, 5 Aug 2020 11:28:42 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: nvidia-gpu: Use put_unaligned_be24()
Message-ID: <20200805092842.GL1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, linux-i2c@vger.kernel.org
References: <20200716145319.53773-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oOpJzULQ70+PGW7h"
Content-Disposition: inline
In-Reply-To: <20200716145319.53773-1-andriy.shevchenko@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oOpJzULQ70+PGW7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 05:53:19PM +0300, Andy Shevchenko wrote:
> This makes the driver code slightly easier to read.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Ajay, any comments?

>  drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c=
-nvidia-gpu.c
> index f480105000b8..f9a69b109e5c 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -125,8 +125,7 @@ static int gpu_i2c_read(struct gpu_i2c_dev *i2cd, u8 =
*data, u16 len)
>  		put_unaligned_be16(val, data);
>  		break;
>  	case 3:
> -		put_unaligned_be16(val >> 8, data);
> -		data[2] =3D val;
> +		put_unaligned_be24(val, data);
>  		break;
>  	case 4:
>  		put_unaligned_be32(val, data);
> --=20
> 2.27.0
>=20

--oOpJzULQ70+PGW7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qe8oACgkQFA3kzBSg
KbYmNg//S7Du+s9lTpUMFPI18FTeJx/+YLIqCXx22/i2ecAwrDI2ZhWNXvFNiY0x
kRouMrXxFSWOSwIDwkycdhMb0ocJqxzrH2Tml0736YY/quHCDKEVBD+HR+ZY2upV
Zv5/jOrOEv0aU+8VruEHhkDDXESpQPjlO6WSLwb6T34AvV4VBMIgQw4Buubz2k2d
qZP9o0WpLhnE+H4DLaEi4b+0+k9DBxsSD0uzdC2KbiPQJawdqgMW/WHBtSn8TKv4
JY+rll1hoNnhXGhORiOVVYsn9oUX2YhLCV7plxwmVIPJ8s1RFlvH7xTm8/BIToPw
VpDz7K6ArXSxV8Erb6qoJMY/s2h4qcBLltctaj3+SGrUUH1NX85ByEQzcCngXeQU
sVaDkexH1VEj3YybYgCb5j12PlwQuCuh5Oz/mSxjq/XheyeBKrOPVEzL/auk4osR
cFnydIQiaxSJOAoN5aLC/+DXyZqdWS6jvrIME1pb1MJSZ5//JfWTZrNf5hI+8URa
GTBD1YrMX/QT4Ikl1/5KR5jPP1SDoK79W4Dc1eS7WCbGE9NDdwZ1yxTfnVQecWcE
PXn/KfWBRlZLUB/bkkSv0JS+53RWsFjwack6ZBxUGdSqaWQjyhpKS2PYnpHf37Bc
VPWZx6mCSkzvIWCkqWV5Ea/kNXGj/Inf3QhBAHZ7ClrJbX3VNYA=
=x0r5
-----END PGP SIGNATURE-----

--oOpJzULQ70+PGW7h--
